Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uQxJ+Vdy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DjdNkJOR"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6w2V6mT2zDqpD
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 12:21:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9765F20F51;
 Wed,  4 Oct 2017 21:21:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 21:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NRkh1IBh1VydV6udiDeAOauOVEVlcqYVy8mc8Wy27
 gs=; b=uQxJ+VdytbF45tMoiqJ/t3ZKZcOsE9YWd6DTNdq/qygCjV+4O0+YOy56M
 gUW7QZnfYk7nerFYJXhvjptuwdaSkDa/2ZrDMeAkQA0YHf06f/3rv1XS51eBNCyE
 xs8XicTddqoLr8l6coxstpiH1RBmRjv9BGO35JxvwarRvTZZ+CJcCSUNUJZ9TzVZ
 meV51wEarwgSJHo8NB09X1NfXmpenIPuM8w79J6BIksrUKA+nK0mHWioRApTc1QU
 2DVv6Gb6c8Kmc/tTp7CNZQpDB+lAhogGyJlrDluzp5/i3YYOo4f5XR4DKI4GmXFA
 6SH3Qg0gPHi1762CtZJ2Fgo4XMzDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NRkh1IBh1VydV6udiD
 eAOauOVEVlcqYVy8mc8Wy27gs=; b=DjdNkJOR98gURu2wI0L3Qyw1vFojfk2pWI
 FEvlB/UXUMVUnP4jcCMUUc04wDqPsnXkpxwXgDUUrS/+KT8w8uFLgwz7jXP8c6OA
 zKxVRJSOuljZYndrqHW5OIsNGRzLuCTDl+qZRf96YPdgtMx6sLmwIzMfqsMTbvdu
 WHVgnoW5Oop08Z2GBMAUynE8HKh4yrLGgOCg4uuWLtt/31qHI/b2vb2gOtjaly2u
 2JR0Rn7C0TrmrG4zVZ4UBTmwgQYIcWn7SVW+s652XrlEc7Z5udjIPXCnX6Q6pnWp
 +wiI6cytA+09eRfxw8IvbpbkOR5m6+hDV4M9NJqDskK+zwRT47xg==
X-ME-Sender: <xms:AInVWSdT7h3L2_KFNFHYRfcpGjBH3oa-gga6v_9tSdzPVRUXaKoWwQ>
X-Sasl-enc: 4Ac+qXxVGdcRvbUM8tq5zmJYWXFK9/55p6DuNPeiXRQy 1507166463
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AB9D24009;
 Wed,  4 Oct 2017 21:21:02 -0400 (EDT)
Message-ID: <1507166457.5452.56.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 9/9] drivers: hwmon: occ: Cancel occ
 operations in remove()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:50:57 +1030
In-Reply-To: <1506724868-13010-10-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-10-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BCj8xzpu/tPcBwQykJH3"
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
X-List-Received-Date: Thu, 05 Oct 2017 01:21:07 -0000


--=-BCj8xzpu/tPcBwQykJH3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Prevent hanging forever waiting for OCC ops to complete.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/p9_sbe.c | 33 ++++++++++++++++++++++++++-------
> =C2=A01 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index c7e0d9c..ffd6829 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -14,37 +14,53 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/occ.h>
> =C2=A0#include <linux/sched.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/workqueue.h>
> =C2=A0
> =C2=A0struct p9_sbe_occ {
> =C2=A0	struct occ occ;
> =C2=A0	struct device *sbe;
> +	struct occ_client *client;
> +	spinlock_t lock;
> =C2=A0};
> =C2=A0
> =C2=A0#define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ,
> occ)
> =C2=A0
> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
> +{
> +	struct occ_client *tmp_client;
> +
> +	spin_lock_irq(&occ->lock);
> +	tmp_client =3D occ->client;
> +	occ->client =3D NULL;
> +	occ_drv_release(tmp_client);
> +	spin_unlock_irq(&occ->lock);
> +}
> +
> =C2=A0static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> =C2=A0{
> =C2=A0	int rc, error;
> -	struct occ_client *client;
> =C2=A0	struct occ_response *resp =3D &occ->resp;
> =C2=A0	struct p9_sbe_occ *p9_sbe_occ =3D to_p9_sbe_occ(occ);
> =C2=A0
> -	client =3D occ_drv_open(p9_sbe_occ->sbe, 0);
> -	if (!client) {
> +	spin_lock_irq(&p9_sbe_occ->lock);

I think we should be using spin_lock_irqsave(), otherwise
spin_unlock_irq() will unconditionally re-enable interrupts.

> +	p9_sbe_occ->client =3D occ_drv_open(p9_sbe_occ->sbe, 0);
> +	if (!p9_sbe_occ->client) {
> =C2=A0		rc =3D -ENODEV;
> +		spin_unlock_irq(&p9_sbe_occ->lock);
> =C2=A0		goto assign;
> =C2=A0	}
> +	spin_unlock_irq(&p9_sbe_occ->lock);

Rather than this dance with locking, you can do:

    spin_lock_irqsave(&p9_sbe_occ->lock, flags);
    p9_sbe_occ->client =3D occ_drv_open(p9_sbe_occ->sbe, 0);
spin_unlock_irqrestore(&p9_sbe_occ->lock, flags);
if (!p9_sbe_occ->client) {
        ...
}

Please take a look at the rest of the code for this pattern as well.

> =C2=A0
> -	rc =3D occ_drv_write(client, (const char *)&cmd[1], 7);
> +	rc =3D occ_drv_write(p9_sbe_occ->client, (const char
> *)&cmd[1], 7);
> =C2=A0	if (rc < 0)
> =C2=A0		goto err;
> =C2=A0
> -	rc =3D occ_drv_read(client, (char *)resp, sizeof(*resp));
> +	rc =3D occ_drv_read(p9_sbe_occ->client, (char *)resp,
> sizeof(*resp));
> =C2=A0	if (rc < 0)
> =C2=A0		goto err;
> =C2=A0
> -	occ_drv_release(client);
> +	p9_sbe_occ_close_client(p9_sbe_occ);
> =C2=A0
> =C2=A0	switch (resp->return_status) {
> =C2=A0	case RESP_RETURN_CMD_IN_PRG:
> @@ -72,7 +88,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8
> *cmd)
> =C2=A0	goto done;
> =C2=A0
> =C2=A0err:
> -	occ_drv_release(client);
> +	p9_sbe_occ_close_client(p9_sbe_occ);
> =C2=A0	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
> =C2=A0assign:
> =C2=A0	error =3D rc;
> @@ -132,6 +148,7 @@ static int p9_sbe_occ_probe(struct
> platform_device *pdev)
> =C2=A0	p9_sbe_occ->sbe =3D pdev->dev.parent;
> =C2=A0
> =C2=A0	occ =3D &p9_sbe_occ->occ;
> +	spin_lock_init(&p9_sbe_occ->lock);
> =C2=A0	occ->bus_dev =3D &pdev->dev;
> =C2=A0	occ->groups[0] =3D &occ->group;
> =C2=A0	occ->poll_cmd_data =3D 0x20;
> @@ -152,7 +169,9 @@ static int p9_sbe_occ_probe(struct
> platform_device *pdev)
> =C2=A0static int p9_sbe_occ_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct occ *occ =3D platform_get_drvdata(pdev);
> +	struct p9_sbe_occ *p9_sbe_occ =3D to_p9_sbe_occ(occ);
> =C2=A0
> +	p9_sbe_occ_close_client(p9_sbe_occ);
> =C2=A0	occ_remove_status_attrs(occ);

Shouldn't we be removing the status attributes before releasing the occ
to prevent use-after-free or useless calls into read/write? This seems
racy.

Andrew

> =C2=A0
> =C2=A0	atomic_dec(&occ_num_occs);
--=-BCj8xzpu/tPcBwQykJH3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1Yj5AAoJEJ0dnzgO5LT5dw8QALli7FGlRdOX24N5tMhU4iVc
a/L+RxQPBagBqLsuC3Tj7jKy5yyLiiv34s/ucRaIV+duZCuFeXCanYrJvZ6xUp31
uC4ysBcssfIqRtXVVhgAc9GH81pztpwKMpa7W5eVrNrq9dlSN10j80r3nyjzQeZS
RKFAYa1YCPriX8pD2v8rMMP4Ao0FujotcszhHJvS71DzSfgh9woGCVCQEzVOfAKA
2C+B7ovCBEX2ZA6ldPc8cA3FpMKOpVx1YTuN/uwRHTyX3F3BfJ9M7gYgnOB6JV0i
XI9gwGL9G5cciprJBSycEYqsfaXR6uhxsEFuwxLKjWtiTkJY8u6bfPwcFAuGUd87
45u4D9sgGgCh3cgV1i82sLCg+Ayrwpy5+hY1oedxz5wKdvVcc8eV3G11E/tz3xYZ
IQMBA/xNmJ/kefLnbFehL947FKBuuO/+dmvGKkpj9zJaL55JMUETCA2Cz1rLTDTd
lo2LqMqZeEcMOt4nNkSrPoS7axwNXU4PpTp32tBzi8Qy5FEdIs7AHCgD42zIExnz
dmoceCqI9nJWKSHPndzkDEmJRfkzQzgyc+m+xIvmxU6kucKU4Yj+qTMuXjH+ZFA0
8KlKOWs+pokulEaU4JW+Ugbae03PImxrlM3pgT0RPJoMaaplW/ezPnmYVsTwB7LZ
/pZMmxxgF6cRlpaqr5vr
=Qzoz
-----END PGP SIGNATURE-----

--=-BCj8xzpu/tPcBwQykJH3--
