Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="afoDfZRH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pvIMJ5CP"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7YRK3GqZzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:26:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EA1C620D6C;
 Thu,  5 Oct 2017 22:26:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OnSJFwb9bTzg0Qeayl3BtEK6uENgt3i1t1t+3FM0+
 Bg=; b=afoDfZRHLK/G1SUzkDBxL+evS5LitF7tmumyY87KQ8tt0IfBA29q3/6Y3
 5lCZzZC5KOLk5Cul79NDGXWMjgJF4AtJ4D72vS8VAbq//6KVxBAEaSzC6eywDk32
 678YUia9DbWMRXXU+8yg7I6zA1z/ufd0bmTn03Ff+7bo94kPwtGPp+NmH0kAW6tO
 O9QieN4Levjrqhd5OKBfpzDN+gWt5fIrYy2NKS4gJ1jPzD4rEhvEl+6cs6are/I1
 5eDxL8Mo+a+i3FzGVC52dkvmMs3s6wXiJX6hiwT3jJpRat8CJpBxuTkrzTW3LrB1
 o0guP3vjpZtkvPRaOextldp3YFCHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OnSJFwb9bTzg0Qeayl
 3BtEK6uENgt3i1t1t+3FM0+Bg=; b=pvIMJ5CP23npt5WGCJobA5We2NCgPon7nu
 VPSnrTLd4wV9ScbxIqs8qo7X5EjEU88/Qv6V68LEY8qNa9I2RphVinmkZJtlU3+3
 SRLfR/GQfQkDRUBhViA9131XzJuUYU5R1pX7ap5nWfgFkzItOCcbgZl+/hw50KjS
 rlaSZK0JUflDKf/cMEfSuI9SlqhF/JBOI3llgZvM6D+Db2IWW3q7zfn42er/jqR2
 +0f7HPCxdbzE6HQNA8PBjwKbkIIoIdFMRq2bnoBnIW54wOaHm92JCt5D5Hu+qgp9
 2UhUmpHEZp+ORtI5mF3jr6+K3gs6v+fIXHgdwfxuro+r7uFYQgEQ==
X-ME-Sender: <xms:yunWWQ4-6DAd5vIdNE_3gyZKSSGlni-AdT-0YzF1nQrzKp2H3q328g>
X-Sasl-enc: HAbR/8x0nbLjmbTtrbKmweJJr2rCb/Fkiyqr04KPLLCV 1507256778
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id F31187E954;
 Thu,  5 Oct 2017 22:26:16 -0400 (EDT)
Message-ID: <1507256772.5452.138.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 31/31] drivers: hwmon: occ: Cancel occ
 operations in remove()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:56:12 +1030
In-Reply-To: <1507255553-13301-32-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-32-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WqCX1iMheQx+fxToC9zf"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:26:22 -0000


--=-WqCX1iMheQx+fxToC9zf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Prevent hanging forever waiting for OCC ops to complete.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/p9_sbe.c | 35 ++++++++++++++++++++++++++++-------
> =C2=A01 file changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index c7e0d9c..9842e0d 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -14,37 +14,54 @@
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

Can you please explain=C2=A0the semantics of this lock in a comment or in
the commit message? Who should hold it, when and why, and in what order
with respect to other locks if applicable?

We've discussed it in private previously but I admit the details have
escaped me, and the way it gets used in this patch looks pretty
strange.

Andrew


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
> +	if (p9_sbe_occ->sbe)
> +		p9_sbe_occ->client =3D occ_drv_open(p9_sbe_occ->sbe,
> 0);
> +	spin_unlock_irq(&p9_sbe_occ->lock);
> +
> +	if (!p9_sbe_occ->client) {
> =C2=A0		rc =3D -ENODEV;
> =C2=A0		goto assign;
> =C2=A0	}
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
> @@ -72,7 +89,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8
> *cmd)
> =C2=A0	goto done;
> =C2=A0
> =C2=A0err:
> -	occ_drv_release(client);
> +	p9_sbe_occ_close_client(p9_sbe_occ);
> =C2=A0	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
> =C2=A0assign:
> =C2=A0	error =3D rc;
> @@ -132,6 +149,7 @@ static int p9_sbe_occ_probe(struct
> platform_device *pdev)
> =C2=A0	p9_sbe_occ->sbe =3D pdev->dev.parent;
> =C2=A0
> =C2=A0	occ =3D &p9_sbe_occ->occ;
> +	spin_lock_init(&p9_sbe_occ->lock);
> =C2=A0	occ->bus_dev =3D &pdev->dev;
> =C2=A0	occ->groups[0] =3D &occ->group;
> =C2=A0	occ->poll_cmd_data =3D 0x20;
> @@ -152,7 +170,10 @@ static int p9_sbe_occ_probe(struct
> platform_device *pdev)
> =C2=A0static int p9_sbe_occ_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct occ *occ =3D platform_get_drvdata(pdev);
> +	struct p9_sbe_occ *p9_sbe_occ =3D to_p9_sbe_occ(occ);
> =C2=A0
> +	p9_sbe_occ->sbe =3D NULL;
> +	p9_sbe_occ_close_client(p9_sbe_occ);
> =C2=A0	occ_remove_status_attrs(occ);
> =C2=A0
> =C2=A0	atomic_dec(&occ_num_occs);
--=-WqCX1iMheQx+fxToC9zf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1unFAAoJEJ0dnzgO5LT5280QAKxQ38LQ0LEcusgx4+SXq0YK
LqwLnfsZXmIFVcit77SyPjn6l/Wp7/8f/k5IBfeZtY5phTDSWAOzbnngNYVRHAqN
ZOzCH1yFJdcD7gCLcHPwibGyz9k2zjLOtZLHUBC4oEFlNTzVdPX3eeBqAw3fxE3S
3LjBsXIPFpZpTBAywb2hum/GEVu15zGqpUw8Pl8A4q1mcDmTA973sqiJNUQwEJm+
KkEX5XcL+QGaPCpiUGW9z5uk7dCeIz2O1Wo+mjZvw1zxS/bDm4bSbs6K1kigzgk2
JtdIvuFQwihZbJARDD2799c8JF6N/WrquZ4aaTRdNwYnA/9es7pqGCzB/SMXA+t4
WadROVP7G1D6jamo7pTeuh1dYVopxE1vH6FKIgJ1KeF8Cjc8y5QQ0VTiVn8YZD83
6LftW8gQ75rNG+LiXb/CFNqkbBlXCVFmkPonCB/DWfxvJ/kIt+KNID9tk9/EGQkQ
LnzNvhW6W/ZEtAwlq7eV54QfDB6LXlsrTBRYtR2V7P5mZchgKk7e3bcWO6PE/jk/
RONxfNHFchdcZ9lf/msA1uvXDcJvi54lSEij4HH6IkhoZv9E75kWo5jrLNECoL+q
DXC06UTpwAh4+rLJwpmWz2izDgAPF0WBixMNzHfaFoyyYFkxUZqg58dKIA16WlBr
baFtHtCbDO7vXNreEBGk
=qUWR
-----END PGP SIGNATURE-----

--=-WqCX1iMheQx+fxToC9zf--
