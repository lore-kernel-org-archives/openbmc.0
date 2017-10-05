Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BKqKc9u1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IxK38E/1"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TgD2y02zDqks
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:36:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 25D0B20C37;
 Thu,  5 Oct 2017 19:36:22 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=JQiuch6z49gfMNFn2jg4e/dMjo38C3XJyDDq3Tsw3
 OE=; b=BKqKc9u1E8XSIvsCRC2A2EjVXgccPM28FON/FXFLsvbT3fchtzmOKR/W0
 ph9a+mu2cwbpZqXPvmsl4/G+6kziDze4IB6q3qo0mx8b08Q5ZIsnAew1S8fqC99f
 CeaFm+wJ8F6/A+xIsEQ1lD5l8E5/PoHHjPmoBgPeMXwj+NZ/cKS0Oh8AiFHryI3l
 Fv2hzLb0Act8Zb/y2GneFUsbxBDSibIpQYa95NxGyG/WM8ziglySKnBEXqyqMip+
 O1h8KaQ2YIw5xnd7Wiu4m1pzYZyYvB1L8pYLX6S4etEJgkUdTsM6A0hKivBAvUK9
 9C+NNqvcOlyl5t+CfsjhtVp933yqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JQiuch6z49gfMNFn2j
 g4e/dMjo38C3XJyDDq3Tsw3OE=; b=IxK38E/1xD/75XsUUXuzAthW1PovvX3cGc
 GmCFt4zaBW333Dh5to4kQ7ha1JJ0RAJeBrc+iW4qE863j3ROcFbpYAoSF2W5x8eL
 6zEpdpSh4kP5iidZ0qRE8irV+Y0/UrreswxHT5pmQk5ycWDcekZNoKmU6b1SOVLc
 40Cm4hjLpZryROr+/osvf0pPM5qF3BkDhP6NFwk9+4n9g7JPoAYM+bwp8gLXFCMP
 w1dp3dFY2BvomM1lrXMPmB6g7xCqU2dpxelDjKEfD6URZo4ofk1lnxCy61NrAflE
 bRkwkSZp7oanmx2B0sg553gdC6Ah0jM42INaopkm6pr1Oha0obIg==
X-ME-Sender: <xms:9sHWWUTFj3ec2NIKwqA2Z_L1lLqbqJdD5m-YmO0uGM9s5-N0Ahy1Fw>
X-Sasl-enc: HMwq9yOOsG8EjqVogrh0qUirfE5BilswiFn3WH1zILJc 1507246581
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19C3B7F9D2;
 Thu,  5 Oct 2017 19:36:19 -0400 (EDT)
Message-ID: <1507246576.5452.120.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 28/31] drivers: fsi: occ: Add cancel
 to remove() and fix probe()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 10:06:16 +1030
In-Reply-To: <1507231464-13635-29-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-29-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-piNuok+OI3YTHHBumPbx"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:36:25 -0000


--=-piNuok+OI3YTHHBumPbx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
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
> index 8555e99..1770823 100644
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

I don't think this test is helpful, in that it's racy. What if remove() get=
s
called immediately after the thread calling into open() has passed the test=
?

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
> @@ -310,8 +322,11 @@ static ssize_t occ_write_common(struct occ_client *c=
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
> @@ -583,6 +598,9 @@ static void occ_worker(struct work_struct *work)
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
> @@ -676,12 +694,17 @@ static void occ_worker(struct work_struct *work)
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
> @@ -752,23 +775,13 @@ static int occ_probe(struct platform_device *pdev)
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
> @@ -778,20 +791,45 @@ static int occ_probe(struct platform_device *pdev)
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
> +		wake_up_all(&client->wait);
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
--=-piNuok+OI3YTHHBumPbx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1sHwAAoJEJ0dnzgO5LT5IYwP/RbpAG9XpFi/QeSJR0ERK+lR
8hvBn6leygYjGOWmEZoPr0G8CrFiaSdN90nS0jYrzZURB/AfwNSTpEiiD5fmju9O
CitR5VFTfxAKsRpdGEsc7iIy50CVmFrMSVu3tqRX2rRU1WHQkiiYqVHjqVyxw+bQ
KuX2SyFeO7NtTXObQ0PgsM8JTHFGd/GW4TbQXCV6KuZOEQzc1Y99ErgDRY2kGf6p
F0DminI6Y9Kr1EbnsFDnn5uuAcQ7IA7AlItAbT9Cp4+QaDjzdcy4mKC/VHZFDLY5
nqTq1bhhmGzbVgCnnUPMoU4rt1vCVEQ2oEnFMCDQy3Wxg+ZvkR873gPSR0bui3O6
LNXqmHxb4VuKqZ9iqlRt9ICnoRB6bBht+20HJF6BhqkKnuSUNtji8wS2WJfTjylP
gmZ/H+BRwJWvUrabAY6pVDqKUR5/oAsVDPZIaGFrG8vZOQxOZtrYCf4jyfCtdmiq
CfBSv+1IYxKVtHH6Dt+Px/dYoH5Z8oUB/Ce6T1VDdcDcuK9eRwf7oGofnxZIUQ27
n/PjjyYib2DscPCLsMUnxls9Lxphd/nPcscyRDJkL3xvBi4v2Q8MRy4Ahix9iv7s
2J6o5tGYFeLV0DD/b907S3AAN82qiSVSS6cMjsSMbg5te3uZnN3+lGLBir3HNxKi
Wc0IisiQh9dOkhfmV/Cm
=MoOG
-----END PGP SIGNATURE-----

--=-piNuok+OI3YTHHBumPbx--
