Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MvLeAk3B"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Bkh5OsRs"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6vkz5ZCKzDqrP
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 12:07:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ABD5A20AEB;
 Wed,  4 Oct 2017 21:07:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 21:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=IhUBpuuQfolQvw6I+DBe/f0kF4gWfQic9LAL5ACc2
 34=; b=MvLeAk3Bb7Bm8UYxHoMhLwDCcZRoJ5YL29d8l5yb4RmnRRlhn84yxeQ5n
 ICZDLBo4YX1YN8QcIc0TKRSZ/3bxvpzKPIuZSCrAocjDrndfhzkaTkIucBvp1oql
 g+0HMbjUFDyCsF2QsCRtF409mZqNSubmhLlszVoZK/DctKM3y+n7jIqExfuhUv4C
 1/s0nOIGRQpza04VjNCIiN32/BSOimPKCNqjDUlGrTdhRhHM10g9ZKEiefbmjgLo
 b+cQ7XR4w8cEzyY9uA9Yz4xJD6U/k+ppuw2aXEUE3hS4frE+6lc4qwDVBMHRJgz6
 FjR9oY6VGiOvQIRKEE661hejX6ndg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=IhUBpuuQfolQvw6I+D
 Be/f0kF4gWfQic9LAL5ACc234=; b=Bkh5OsRsdYa12yYi4yaYQP9u+QQinoQ8WD
 lLcwlGkYYcn6EswQHfgvMpA24JCvOXvQYouDtzHEVS/1FksCSK3k6fUoOhl1U24W
 JtUQ+PCMBOU+VwsONkwg9wti/1DKLQmX1yCIvVM50lu2hlbrAtTN0oq8xAxFUpij
 t+X6R5JcaZ0jnrBzsQEp7NECh+aTe5JSvW3QCxgt6VMspvlTFFfaFOu2xJH8Evjz
 bQjK0OTsRKCglcUS/3iwPFC3IqJ5+dGWIq736FCDsJFuB5ybPMuc99nxd5j8WGRq
 zek1PtB4fEoeZzBIil/KchBWvv1ewMAVtkvMeLThUL/rjg2wW4uQ==
X-ME-Sender: <xms:2YXVWYKQ3VAvKub-jZ5YSJQIbR8WJG0Z5AZNJGGqeLzHjrsljpX4VQ>
X-Sasl-enc: ahFgvfLb21mvdT5OcltUAcgOkUMOEKJ0jeLA0//iVFqU 1507165656
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92BBF24570;
 Wed,  4 Oct 2017 21:07:34 -0400 (EDT)
Message-ID: <1507165650.5452.49.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 6/9] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:37:30 +1030
In-Reply-To: <1506724868-13010-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-7-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-z+z93dhpuCgm/3nIRy4Y"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 05 Oct 2017 01:07:40 -0000


--=-z+z93dhpuCgm/3nIRy4Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Need some data to indicate to clients and the rest of the driver when
> the device is being removed, so add a cancel boolean. Fix up both the
> probe and remove functions to properly handle failures and prevent
> deadlocks.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 86 +++++++++++++++++++++++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 62 insertions(+), 24 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index a554550..550ae11 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -46,6 +46,7 @@ struct occ {
> =C2=A0	spinlock_t list_lock;		/* lock access to the xfrs list */
> =C2=A0	struct mutex occ_lock;		/* lock access to the hardware */
> =C2=A0	struct work_struct work;
> +	bool cancel;
> =C2=A0};
> =C2=A0
> =C2=A0#define to_occ(x)	container_of((x), struct occ, mdev)
> @@ -117,12 +118,15 @@ struct occ_client {
> =C2=A0
> =C2=A0static DEFINE_IDA(occ_ida);
> =C2=A0
> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0{
> =C2=A0	int empty;
> =C2=A0	struct occ_client *client =3D to_client(xfr);
> =C2=A0	struct occ *occ =3D client->occ;
> =C2=A0
> +	if (occ->cancel)
> +		return -ECANCELED;
> +
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> =C2=A0	empty =3D list_empty(&occ->xfrs);
> @@ -132,14 +136,20 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0	if (empty)
> =C2=A0		queue_work(occ_wq, &occ->work);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> -	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> +	struct occ_client *client;
> +
> +	if (occ->cancel)
> +		return ERR_PTR(-ECANCELED);
> =C2=A0
> +	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0	if (!client)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	client->occ =3D occ;
> =C2=A0	spin_lock_init(&client->lock);
> @@ -158,8 +168,8 @@ static int occ_open(struct inode *inode, struct file =
*file)
> =C2=A0	struct occ *occ =3D to_occ(mdev);
> =C2=A0
> =C2=A0	client =3D occ_open_common(occ, file->f_flags);
> -	if (!client)
> -		return -ENOMEM;
> +	if (IS_ERR(client))
> +		return PTR_ERR(client);
> =C2=A0
> =C2=A0	file->private_data =3D client;
> =C2=A0
> @@ -172,6 +182,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0	int rc;
> =C2=A0	size_t bytes;
> =C2=A0	struct occ_xfr *xfr =3D &client->xfr;
> +	struct occ *occ =3D client->occ;
> =C2=A0
> =C2=A0	if (len > OCC_SRAM_BYTES)
> =C2=A0		return -EINVAL;
> @@ -204,7 +215,8 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_COMPLETE,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_CANCELED,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags));
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->cancel);
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -272,7 +284,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> -	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> +	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> =C2=A0	}
> @@ -309,8 +321,11 @@ static ssize_t occ_write_common(struct occ_client *c=
lient,
> =C2=A0	xfr->cmd_data_length =3D data_length + 6;
> =C2=A0	client->read_offset =3D 0;
> =C2=A0
> -	occ_enqueue_xfr(xfr);
> +	rc =3D occ_enqueue_xfr(xfr);
> +	if (rc)
> +		goto done;
> =C2=A0
> +	set_bit(CLIENT_XFR_PENDING, &client->flags);
> =C2=A0	rc =3D len;
> =C2=A0
> =C2=A0done:
> @@ -579,6 +594,9 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	struct device *sbefifo =3D occ->sbefifo;
> =C2=A0
> =C2=A0again:
> +	if (occ->cancel)
> +		return;
> +
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> =C2=A0	xfr =3D list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link)=
;
> @@ -672,12 +690,17 @@ static void occ_worker(struct work_struct *work)
> =C2=A0
> =C2=A0struct occ_client *occ_drv_open(struct device *dev, unsigned long f=
lags)
> =C2=A0{
> +	struct occ_client *client;
> =C2=A0	struct occ *occ =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	if (!occ)
> =C2=A0		return NULL;
> =C2=A0
> -	return occ_open_common(occ, flags);
> +	client =3D occ_open_common(occ, flags);
> +	if (IS_ERR(client))
> +		return NULL;
> +
> +	return client;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(occ_drv_open);
> =C2=A0
> @@ -748,23 +771,13 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0			if (occ->idx < 0)
> =C2=A0				occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX,
> =C2=A0							=C2=A0=C2=A0GFP_KERNEL);
> -		} else
> +		} else {
> =C2=A0			occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX,
> =C2=A0						=C2=A0=C2=A0GFP_KERNEL);
> -
> -		/* create platform devs for dts child nodes (hwmon, etc) */
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> -				=C2=A0occ->idx, child_idx++);
> -			child =3D of_platform_device_create(np, child_name, dev);
> -			if (!child)
> -				dev_warn(dev,
> -					=C2=A0"failed to create child node dev\n");
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
> -
> -	platform_set_drvdata(pdev, occ);
> +	}
> =C2=A0
> =C2=A0	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
> =C2=A0	occ->mdev.fops =3D &occ_fops;
> @@ -774,20 +787,45 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	rc =3D misc_register(&occ->mdev);
> =C2=A0	if (rc) {
> -		dev_err(dev, "failed to register miscdevice\n");
> +		dev_err(dev, "failed to register miscdevice: %d\n", rc);
> +		ida_simple_remove(&occ_ida, occ->idx);
> =C2=A0		return rc;
> =C2=A0	}
> =C2=A0
> +	/* create platform devs for dts child nodes (hwmon, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> +			=C2=A0occ->idx, child_idx++);
> +		child =3D of_platform_device_create(np, child_name, dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child node dev\n");
> +	}
> +
> +	platform_set_drvdata(pdev, occ);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct occ *occ =3D platform_get_drvdata(pdev);
> +	struct occ_xfr *xfr;
> +	struct occ_client *client;
> +
> +	occ->cancel =3D true;
> +
> +	spin_lock_irq(&occ->list_lock);
> +	list_for_each_entry(xfr, &occ->xfrs, link) {
> +		client =3D to_client(xfr);
> +		wake_up_interruptible(&client->wait);

Again, would go for just wake_up() here, and maybe wake_up_all()?

Andrew

> +	}
> +	spin_unlock_irq(&occ->list_lock);
> =C2=A0
> -	flush_work(&occ->work);
> =C2=A0	misc_deregister(&occ->mdev);
> =C2=A0	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
> +
> +	cancel_work_sync(&occ->work);
> +
> =C2=A0	ida_simple_remove(&occ_ida, occ->idx);
> =C2=A0
> =C2=A0	return 0;
--=-z+z93dhpuCgm/3nIRy4Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1YXSAAoJEJ0dnzgO5LT5WUkP/1wkwMO1esCHcCi0qvn/rYyT
7lCJjiVtZr9qzC2npMM2yPP2pWZYWknKqJF+eCoAtpLTQGTqMyBBQB+PlMVbOsC7
6mLX5V8E5EnAFomYM2fdDjxq2EexYdgPveiDaDMRq7tHfHWjYmV6Q8+DB+X3FluU
QAVZOJjxxTvORjNp21O02czd3/dLHoPqjcV+XsXaYNfFRkWcc9aMvFzdpwY7Zosm
8Is0UtiUaVKIHx45SOOuJGVhL1ItRc2kwwqzBtqjuGnlEpEWc3zJjbKyY5mg9WdW
UbekSRhMvU3kMcrpVjDzAkdv0PSTcIIB9gubnroZaPpQCc5jTgEhINzMf5Cif3r0
TxK2QN4y9ThzcKkmoW16woPxD8tOICDwTUHTGhynzNzJn+gvOuwv5DjNSsrS36u6
hmvdMLw53QA33NEzuuJOJe3HspqtL2MCDiUZWK6O/1jNU9a8viFVCxN5QsoONc21
aYwwkS5VYEW/ERtelyJ2kwymwoxyA0Kj3Eqcf+v33e2WDF9h6FW8rzsHxNrfFTl4
D2WWoJrBLXPx5ffGnuH5oKV0s5JWujathI5NbqNudr9LiE3U2E+3uXbJIzylnDPv
yxa9Llfpq3hMTmfsUwQR9dTMftRxFfz+sgseSX0wOELV4Zwn1qHV5AGr7RQuC0zZ
6n59JWv87tfjt9mGmDlc
=j65t
-----END PGP SIGNATURE-----

--=-z+z93dhpuCgm/3nIRy4Y--
