Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9MW66qkLzDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 12:05:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6E2C4161EAB;
 Sun,  8 Oct 2017 21:05:49 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v4 28/31] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
Date: Sun, 8 Oct 2017 21:05:49 -0400
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D069C32-9D7D-4D20-938A-AB9FF92E4ABC@fuzziesquirrel.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 01:05:55 -0000


> On Oct 5, 2017, at 10:05 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Need some data to indicate to clients and the rest of the driver when
> the device is being removed, so add a cancel boolean. Fix up both the
> probe and remove functions to properly handle failures and prevent
> deadlocks.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> drivers/fsi/occ.c | 71 =
+++++++++++++++++++++++++++++++++++++++----------------
> 1 file changed, 50 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index bd0ad98..ec42fc0 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -46,6 +46,7 @@ struct occ {
> 	spinlock_t list_lock;		/* lock access to the xfrs list =
*/
> 	struct mutex occ_lock;		/* lock access to the hardware =
*/
> 	struct work_struct work;
> +	bool cancel;
> };
>=20
> #define to_occ(x)	container_of((x), struct occ, mdev)
> @@ -117,12 +118,15 @@ struct occ_client {
>=20
> static DEFINE_IDA(occ_ida);
>=20
> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
> {
> 	int empty;
> 	struct occ_client *client =3D to_client(xfr);
> 	struct occ *occ =3D client->occ;
>=20
> +	if (occ->cancel)
> +		return -ECANCELED;

Can we have ENODEV here?  That seems to be typical for this scenario and
ECANCELED seems to be for canceled AIO operations.

> +
> 	spin_lock_irq(&occ->list_lock);
>=20
> 	empty =3D list_empty(&occ->xfrs);
> @@ -132,6 +136,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
>=20
> 	if (empty)
> 		queue_work(occ_wq, &occ->work);
> +
> +	return 0;
> }
>=20
> static struct occ_client *occ_open_common(struct occ *occ, unsigned =
long flags)
> @@ -166,10 +172,10 @@ static int occ_open(struct inode *inode, struct =
file *file)
> 	return 0;
> }
>=20
> -static inline bool occ_read_ready(struct occ_xfr *xfr)
> +static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ =
*occ)
> {
> 	return test_bit(XFR_COMPLETE, &xfr->flags) ||
> -		test_bit(XFR_CANCELED, &xfr->flags);
> +		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
> }
>=20
> static ssize_t occ_read_common(struct occ_client *client, char __user =
*ubuf,
> @@ -178,6 +184,7 @@ static ssize_t occ_read_common(struct occ_client =
*client, char __user *ubuf,
> 	int rc;
> 	size_t bytes;
> 	struct occ_xfr *xfr;
> +	struct occ *occ;
>=20
> 	if (!client)
> 		return -ENODEV;
> @@ -186,6 +193,7 @@ static ssize_t occ_read_common(struct occ_client =
*client, char __user *ubuf,
> 		return -EINVAL;
>=20
> 	xfr =3D &client->xfr;
> +	occ =3D client->occ;
>=20
> 	spin_lock_irq(&client->lock);
>=20
> @@ -212,7 +220,7 @@ static ssize_t occ_read_common(struct occ_client =
*client, char __user *ubuf,
> 		spin_unlock_irq(&client->lock);
>=20
> 		rc =3D wait_event_interruptible(client->wait,
> -					      occ_read_ready(xfr));
> +					      occ_read_ready(xfr, occ));
>=20
> 		spin_lock_irq(&client->lock);
>=20
> @@ -285,7 +293,7 @@ static ssize_t occ_write_common(struct occ_client =
*client,
>=20
> 	spin_lock_irq(&client->lock);
>=20
> -	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> +	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> 		rc =3D -EBUSY;
> 		goto done;
> 	}
> @@ -323,8 +331,11 @@ static ssize_t occ_write_common(struct occ_client =
*client,
> 	xfr->cmd_data_length =3D data_length + 6;
> 	client->read_offset =3D 0;
>=20
> -	occ_enqueue_xfr(xfr);
> +	rc =3D occ_enqueue_xfr(xfr);
> +	if (rc)
> +		goto done;
>=20
> +	set_bit(CLIENT_XFR_PENDING, &client->flags);
> 	rc =3D len;
>=20
> done:
> @@ -602,6 +613,9 @@ static void occ_worker(struct work_struct *work)
> 	struct device *sbefifo =3D occ->sbefifo;
>=20
> again:
> +	if (occ->cancel)
> +		return;
> +
> 	spin_lock_irq(&occ->list_lock);
>=20
> 	xfr =3D list_first_entry_or_null(&occ->xfrs, struct occ_xfr, =
link);
> @@ -762,23 +776,13 @@ static int occ_probe(struct platform_device =
*pdev)
> 			if (occ->idx < 0)
> 				occ->idx =3D ida_simple_get(&occ_ida, 1, =
INT_MAX,
> 							  GFP_KERNEL);
> -		} else
> +		} else {
> 			occ->idx =3D ida_simple_get(&occ_ida, 1, =
INT_MAX,
> 						  GFP_KERNEL);
> -
> -		/* create platform devs for dts child nodes (hwmon, etc) =
*/
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), =
"occ%d-dev%d",
> -				 occ->idx, child_idx++);
> -			child =3D of_platform_device_create(np, =
child_name, dev);
> -			if (!child)
> -				dev_warn(dev,
> -					 "failed to create child node =
dev\n");
> 		}
> -	} else
> +	} else {
> 		occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX, =
GFP_KERNEL);
> -
> -	platform_set_drvdata(pdev, occ);
> +	}
>=20
> 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
> 	occ->mdev.fops =3D &occ_fops;
> @@ -788,20 +792,45 @@ static int occ_probe(struct platform_device =
*pdev)
>=20
> 	rc =3D misc_register(&occ->mdev);
> 	if (rc) {
> -		dev_err(dev, "failed to register miscdevice\n");
> +		dev_err(dev, "failed to register miscdevice: %d\n", rc);
> +		ida_simple_remove(&occ_ida, occ->idx);
> 		return rc;
> 	}
>=20
> +	/* create platform devs for dts child nodes (hwmon, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> +			 occ->idx, child_idx++);
> +		child =3D of_platform_device_create(np, child_name, =
dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child node =
dev\n");
> +	}
> +
> +	platform_set_drvdata(pdev, occ);
> +
> 	return 0;
> }
>=20
> static int occ_remove(struct platform_device *pdev)
> {
> 	struct occ *occ =3D platform_get_drvdata(pdev);
> +	struct occ_xfr *xfr;
> +	struct occ_client *client;
> +
> +	occ->cancel =3D true;
> +
> +	spin_lock_irq(&occ->list_lock);
> +	list_for_each_entry(xfr, &occ->xfrs, link) {
> +		client =3D to_client(xfr);
> +		wake_up_all(&client->wait);
> +	}
> +	spin_unlock_irq(&occ->list_lock);
>=20
> -	flush_work(&occ->work);
> 	misc_deregister(&occ->mdev);
> 	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
> +
> +	cancel_work_sync(&occ->work);
> +
> 	ida_simple_remove(&occ_ida, occ->idx);
>=20
> 	return 0;
> --=20
> 1.8.3.1
