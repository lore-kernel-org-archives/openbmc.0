Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AL71F6Nu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DSXs10pD"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7YDQ2qjbzDqlT
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:16:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 41D5220A70;
 Thu,  5 Oct 2017 22:16:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=PZDehTA1nHhQwf1TkW3Vffcpj8/lDt3emOq3m8e2U
 +s=; b=AL71F6NuoRHSYDo7Ayx183/xJKDtqRG6e54v+ETvOPKkvyNtE3ND5XpDC
 68LoY58SRdsePIQk/LDQO18uw0tcrv3g2+LVHETAhdV90rkNMCwAjN8XKGbHVofW
 DE3jsSBQBL/j3TXAaeGHMQMrvlw8yPce6Go4ZwfpxPTtgdtmNBw7xsqOfkr+9/Yz
 bVoRojoiFA6Q5pxF8SJNe79DZCSYh1WPb8SfbKqpssgiwEL6/imTV5vdpofVPqiH
 ey5j5KoU8kLFgylJDfIRuO5RlC7jpNAtVhrguKkIXb38Z6aPSm6PubWd2D5J+TfM
 M+rszd3V+bWqmixSJ+5BgmwbtTJfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=PZDehTA1nHhQwf1TkW
 3Vffcpj8/lDt3emOq3m8e2U+s=; b=DSXs10pDr0t/sBqRrXYyRnkjiWzsALWzOS
 fQ7jLmjlp4KsvcE9Q3jW4+ASKNUOLICZ8wz2CxI2fcb2jjx7zrCgcVOHPwCJjiYF
 OvIw3yeBHjbOnEXylxEOBK9YoNRP1BuiFl0eO+JflXQaYlpGmv9DQvakHwBqCeZB
 9TztBQXkI++JuwX/5dwP5ijUKP9ytnYTKtmaE4OHMzMCbO3ng93JO4Y7PeaTPEAx
 /LtY4Ibh6tHP8+eHbMXx+bw1H/nXN/nO4jFAPR//uNmVxyfYGKXrcjffchTvq1n5
 ndHTwyGJSNZu+R6U9QTLBbueDpiS4f8Gw524XeXISopwn+Q26UKw==
X-ME-Sender: <xms:lOfWWVRyP2-ceNF6rlOfnI7kw6AcWtQd03JqytHgUV6yCyaAPRZXYw>
X-Sasl-enc: oxh93NH+lgWHbkYrHZq5/SQYrDFOgnYqvIWKCuz8Bg3N 1507256211
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31EF17E954;
 Thu,  5 Oct 2017 22:16:49 -0400 (EDT)
Message-ID: <1507256206.5452.134.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 28/31] drivers: fsi: occ: Add cancel
 to remove() and fix probe()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:46:46 +1030
In-Reply-To: <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Q3RyVgAYbjTi5goZ4TrC"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:16:54 -0000


--=-Q3RyVgAYbjTi5goZ4TrC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Need some data to indicate to clients and the rest of the driver when
> the device is being removed, so add a cancel boolean. Fix up both the
> probe and remove functions to properly handle failures and prevent
> deadlocks.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 71 +++++++++++++++++++++++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 50 insertions(+), 21 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index bd0ad98..ec42fc0 100644
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
> @@ -132,6 +136,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0	if (empty)
> =C2=A0		queue_work(occ_wq, &occ->work);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> @@ -166,10 +172,10 @@ static int occ_open(struct inode *inode, struct fil=
e *file)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static inline bool occ_read_ready(struct occ_xfr *xfr)
> +static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ *occ)
> =C2=A0{
> =C2=A0	return test_bit(XFR_COMPLETE, &xfr->flags) ||
> -		test_bit(XFR_CANCELED, &xfr->flags);
> +		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t occ_read_common(struct occ_client *client, char __us=
er *ubuf,
> @@ -178,6 +184,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0	int rc;
> =C2=A0	size_t bytes;
> =C2=A0	struct occ_xfr *xfr;
> +	struct occ *occ;
> =C2=A0
> =C2=A0	if (!client)
> =C2=A0		return -ENODEV;
> @@ -186,6 +193,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	xfr =3D &client->xfr;
> +	occ =3D client->occ;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> @@ -212,7 +220,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ_read_ready(xfr));
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ_read_ready(xfr, occ));
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -285,7 +293,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> -	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> +	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> =C2=A0	}
> @@ -323,8 +331,11 @@ static ssize_t occ_write_common(struct occ_client *c=
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
> @@ -602,6 +613,9 @@ static void occ_worker(struct work_struct *work)
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
> @@ -762,23 +776,13 @@ static int occ_probe(struct platform_device *pdev)
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
> @@ -788,20 +792,45 @@ static int occ_probe(struct platform_device *pdev)
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
--=-Q3RyVgAYbjTi5goZ4TrC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1ueOAAoJEJ0dnzgO5LT5X5IP/R4rq68Gm8GOTyUa3HjBZy81
XxJTuor9FQZHAorT5mjU3HKOql84KSnxB52oQuJXdnHBvyDjT4kyAvd2A2vH8e/h
17ArBDUTZBpIs2iNJH/w4xoYQoU2PaFt6UWzMOHea8TKATu3fqL9PWzIuxQww0Ki
CA4NaiFkglICGcR4rSv4PIgmIgxduqYVkScXY6ob8mIpu0eB1fxdo8MkzeO+bDzc
sC9oKhZgmZFsoQNP37q6bR50CySGEjDlcPaeQ0u3dUfHvA2fzDFTlXAi9ZwtriGF
6bS+mTgZ3babT7hxgmHfg7zQM/HdTakAUNnYrX6tyj0/nTTLMuFVcOv7L66qdzVT
GCHAKyeXwsQlYv7l2qXsOdStGXb/gOnn7YCIw3KQyUGSKjdP5YCZeWz9AzpOht28
e1dCMD8r7crLl9WzUTOq8CMpPYdg2iUh90j5kjmFsEAbNxr9j62imoGevCpNQKdr
3dDCSg/p25b95Ejyt+3ltdG7s4XDrMRX4jdrccexJ/9isWGJgUWbF7eU2cLiU537
DBGzCepSPu9NiOlWTMRpkcpgZup2FfcCY8AUDAr6UsXClnRTKQT00TTpZGXSZszd
mNOsubC7jhDh/1D51b9Hj9GElzKZXouFpGTDnI5ILeqAi/WxxgEcy49TQji3EOPO
Y1nphEWgo29E338WU3J/
=BZ3S
-----END PGP SIGNATURE-----

--=-Q3RyVgAYbjTi5goZ4TrC--
