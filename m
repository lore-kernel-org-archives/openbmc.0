Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRrB40BrTzDrPL
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:25:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SxUltLt+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DlIBa5JT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED85A2093F;
 Sun, 27 Nov 2016 21:25:13 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=0H81RELu0Xj6G/H5PlE5XY+5RL8=; b=SxUltL
 t+9A7acvpLPl3CzzL1R00RJhXghTY5VPaNEAV4bBFQVFNF7My1PopV4J7ODfwFz0
 6oY8Q1s6bYUuLuejILBLIrtAW0vwBzUHD5sB7jEJnnWegPQ3NoqxUrJdHJXAUxzh
 0dGLZZeyU8sb/jWBSESfCJwnpcmKgRlOYMbNs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=0H81RELu0Xj6G/
 H5PlE5XY+5RL8=; b=DlIBa5JT370Zf5ucDo0wt/B7PMmbzxxHZckOoLBseF+Jl9
 mN6+brluhdJ8qui9I7CCbSndzpzhtHGCLCiQzcxbxb/2PeGc+15r0uJGwQAabqMz
 mhNylXyqHGkyFoSd7gOxcicPT9G2CCjTeikli+tFUar5881kNeYFg4E3yUmuI=
X-ME-Sender: <xms:iZU7WF-NItDrwlShqX6mL9lo_QeadhbxrccaGQbuPE5NNguFQoNGoA>
X-Sasl-enc: +1hMLFEDFgCYNOYfdTvA8Yck9exQPNqmRRsac2TCq1vW 1480299913
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B3AF24312;
 Sun, 27 Nov 2016 21:25:12 -0500 (EST)
Message-ID: <1480299908.2503.81.camel@aj.id.au>
Subject: Re: [PATCH qemu 36/38] ast2400: add a FTGMAC100 nic
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:55:08 +1030
In-Reply-To: <1479478938-13267-37-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-37-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ETlfqBHNhUFCqmmM5mEf"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 02:25:16 -0000


--=-ETlfqBHNhUFCqmmM5mEf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:22 +0100, C=C3=A9dric Le Goater wrote:
> Only the first nic, but the second shouldn't be too complex to add if
> needed.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 21 +++++++++++++++++++++
> =C2=A0include/hw/arm/aspeed_soc.h |=C2=A0=C2=A02 ++
> =C2=A02 files changed, 23 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 06c1f03555b1..f3c41509a4ea 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -19,6 +19,7 @@
> =C2=A0#include "hw/char/serial.h"
> =C2=A0#include "qemu/log.h"
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> +#include "net/net.h"
> =C2=A0
> =C2=A0#define ASPEED_SOC_UART_5_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x00184000
> =C2=A0#define ASPEED_SOC_IOMEM_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x00200000
> @@ -33,6 +34,8 @@
> =C2=A0#define ASPEED_SOC_TIMER_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E782000
> =C2=A0#define ASPEED_SOC_WDT_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E785000
> =C2=A0#define ASPEED_SOC_I2C_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E78A000
> +#define ASPEED_SOC_ETH1_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E660000
> +#define ASPEED_SOC_ETH2_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E680000
> =C2=A0
> =C2=A0static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
> =C2=A0static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39,=
 };
> @@ -175,6 +178,10 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->wdt), sysbus=
_get_default());
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_const_link(OBJECT(&s->w=
dt), "scu", OBJECT(&s->scu),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->ftgmac100, sizeof(s->ftgma=
c100), TYPE_FTGMAC100);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "ftgmac100", OBJE=
CT(&s->ftgmac100), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbu=
s_get_default());
> =C2=A0}
> =C2=A0
> =C2=A0static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
> @@ -344,6 +351,20 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,=
 ASPEED_SOC_WDT_BASE);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Net */
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_nic_properties(DEVICE(&s->ftgmac100), &=
nd_table[0]);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "aspeed", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->ftgmac100), =
true, "realized",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0&local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0=
, ASPEED_SOC_ETH1_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100)=
, 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_get_=
gpio_in(DEVICE(&s->vic), 2));
> =C2=A0}
> =C2=A0
> =C2=A0static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index dbec0c159885..1fd0dc690be1 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -20,6 +20,7 @@
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> =C2=A0#include "hw/ssi/aspeed_smc.h"
> =C2=A0#include "hw/watchdog/wdt_aspeed.h"
> +#include "hw/net/ftgmac100.h"
> =C2=A0
> =C2=A0#define ASPEED_SPIS_NUM=C2=A0=C2=A02
> =C2=A0
> @@ -39,6 +40,7 @@ typedef struct AspeedSoCState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi[ASPEED_SPIS_NUM];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState sdmc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedWDTState wdt;
> +=C2=A0=C2=A0=C2=A0=C2=A0Ftgmac100State ftgmac100;
> =C2=A0} AspeedSoCState;
> =C2=A0
> =C2=A0#define TYPE_ASPEED_SOC "aspeed-soc"
--=-ETlfqBHNhUFCqmmM5mEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5WEAAoJEJ0dnzgO5LT5NtEP/1J4REWaREaM5ua1oDHMjr3c
d4qidi+/R0eAJvQFsnCa3PK0jhJQMsLHeKx+pAkE3vkQvxaewnF8HDC2JudkIqT4
+jT9XhyRJBDtGdH8UIQcC66f6M9675G1ojGwUl/CiL04eW/4od0FC/80MzJRAkaq
kgjo4Y8d8SeOwbG2Tzz1D79ezU2L/DtZHlAq4tpFwwG4+gININDNj/OUdWT6i3/X
EiibWO4SS4kjrvZO442szCm7FrEW+XdQnuEJFL3GL2lRO2x4eBhD88XZdR7RYVbS
gE21jJ46i8kt8BDxxjeGoGzBSj2Hipakv33zKscR49KJt+F/592UtxcpKH7ScnyA
Xpkk7Rx0OhmqUj8fT1OZJ0A88ucYAzcb5Av5Rl8BjPatjU2eZiS/sRg9L+fTp2Lg
sSu9VRiHufK/dcIuAiBEIpErTublP7SvwGeEtp9nimpsyI4EKFzu/GW95LUK3D0B
sdIO+c0oRznXq7Ptr0fCLL7bQIOUYA0IHzdSKAqVxcxw+hIYM+4Gu11omxEwTtj1
t72siyMZMmSNbToFS4jLi7uSesU/Tz8wIuFCKxSZzy/NwAO5/Vex9uhMI4W5gWIC
ma29ew/iVb/Ri8oPaE41FrbsMS+yxXNJrrBXNoHDeqe6zcNkfT815MOJfb8nnH9u
GRcwNpADQKMYmvjxYCxh
=MKn0
-----END PGP SIGNATURE-----

--=-ETlfqBHNhUFCqmmM5mEf--
