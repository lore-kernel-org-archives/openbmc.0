Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t94Wy0FyxzDvNS
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:49:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RTAHHNnC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IHN/y7aE"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 82337205D2;
 Thu,  3 Nov 2016 21:49:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 21:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=GdEXb6sxqCUpp5ZYndeftDVjVzM=; b=RTAHHN
 nCLMpzjmVZGcB1v75trUDJyIx5gMet0HqT43VuxWquJtEU3loNjXQumwZQGj39ed
 JlPZic9eW2KGlx6B2hn6fyAOEA4vlvRBX9KuIAjDAFXXL/8VkIb58erTrbvfqRA0
 PvDoJjxzPeqWMzcaHyrjyxahH55+XRhJkoCs0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=GdEXb6sxqCUpp5
 ZYndeftDVjVzM=; b=IHN/y7aEkP8K4SLG4Hso4yDesJ0NBzELEiAjg6xZDSlaLu
 PJUjEp4HuTN9DPt7Nts1kYv6edfeaBd6idRoVSB2PBBRMn+XQJJ3VIMaprvn27I7
 aEgfjSPb717C1bqToUdRdhEb7xwcYtLKzrJNsuRIcNmFDeVe8PNGl5o0kRj1A=
X-ME-Sender: <xms:K-kbWMDFSDuZfk-Y3BufkDosY6yYXHBkGnoRIndBb3DaXitX9sOYHQ>
X-Sasl-enc: dEgzfFnGFrFmwXO1Pu9t9B0+MI4jbBTPnhQcfe0oXqdj 1478224169
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE98ECC083;
 Thu,  3 Nov 2016 21:49:24 -0400 (EDT)
Message-ID: <1478224157.27396.49.camel@aj.id.au>
Subject: Re: [PATCH qemu] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 04 Nov 2016 12:19:17 +1030
In-Reply-To: <bc8975a5-ad34-636d-7c29-ecd4c0a4aea3@kaod.org>
References: <1478150842-5636-1-git-send-email-andrew@aj.id.au>
 <bc8975a5-ad34-636d-7c29-ecd4c0a4aea3@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YRfxTdoEYa7rgOVYzPO0"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 01:49:34 -0000


--=-YRfxTdoEYa7rgOVYzPO0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-11-03 at 09:02 +0100, C=C3=A9dric Le Goater wrote:
> On 11/03/2016 06:27 AM, Andrew Jeffery wrote:
> >=20
> > The implementation was incorrectly scaling the reload value by
> > nanoseconds per second. In reality the span represented by the reload
> > value is determined by the selected clock, either APB or 1MHz.
> >=20
> > Test the selected clock and apply the appropriate scaling, then convert=
 to
> > nanoseconds for the timer infrastructure. Note that the APB rate is har=
d-coded
> > and reflects the value used by the timer controller, and isn't necessar=
ily an
> > accurate representation of the clock configuration programmed in the SC=
U.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ah ! reboot works ! thanks for taking some time to fix this.
>=20
> >=20
> > ---
> >=20
> > I'm hesitant to send this upstream as I don't like the idea of hardcodi=
ng the
> > clock rates in the way that we have (i.e. the timer as well). I think w=
e should
> > rework the timer and the watchdog to derive their clocks from the SCU, =
but
> > that's more work than I'm willing to put in to get reboots working.
> I agree that we should start being more precise in our models and use SCU
> when needed. See below for a first try=C2=A0
>=20
> Cheers,
>=20
> C.
>=20
>=20
>=20
> wdt: aspeed: use scu to get clock freq
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=A02 ++
> =C2=A0hw/misc/aspeed_scu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A012 ++++++++++++
> =C2=A0hw/watchdog/wdt_aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A017 +++++++++++++++--
> =C2=A0include/hw/misc/aspeed_scu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A0=C2=A01 +
> =C2=A0include/hw/watchdog/wdt_aspeed.h |=C2=A0=C2=A0=C2=A0=C2=A02 ++
> =C2=A05 files changed, 32 insertions(+), 2 deletions(-)
>=20
> Index: qemu-aspeed.git/hw/arm/aspeed_soc.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/hw/arm/aspeed_soc.c
> +++ qemu-aspeed.git/hw/arm/aspeed_soc.c

!

> @@ -144,6 +144,8 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->wdt, sizeof(s->wdt), =
TYPE_ASPEED_WDT);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "wdt", OBJEC=
T(&s->wdt), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->wdt), sysbus=
_get_default());
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_const_link(OBJECT(&s->wdt), =
"scu", OBJECT(&s->scu),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL);
> =C2=A0}
> =C2=A0
> =C2=A0static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> Index: qemu-aspeed.git/hw/misc/aspeed_scu.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/hw/misc/aspeed_scu.c
> +++ qemu-aspeed.git/hw/misc/aspeed_scu.c
> @@ -266,6 +266,18 @@ bool is_supported_silicon_rev(uint32_t s
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> =C2=A0}
> =C2=A0
> +#define ASPEED_PLL_25MHZ=C2=A0=C2=A0=C2=A0=C2=A025000000
> +#define ASPEED_PLL_24MHZ=C2=A0=C2=A0=C2=A0=C2=A024000000
> +#define ASPEED_PLL_12MHZ=C2=A0=C2=A0=C2=A0=C2=A012000000
> +
> +uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0if (scu->hw_strap1 & AST2400_CLK_25M_IN)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ASPEED_PLL_25MHZ;
> +=C2=A0=C2=A0=C2=A0=C2=A0else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ASPEED_PLL_24MHZ;
> +}
> +
> =C2=A0static void aspeed_scu_realize(DeviceState *dev, Error **errp)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> Index: qemu-aspeed.git/hw/watchdog/wdt_aspeed.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/hw/watchdog/wdt_aspeed.c
> +++ qemu-aspeed.git/hw/watchdog/wdt_aspeed.c
> @@ -7,10 +7,12 @@
> =C2=A0
> =C2=A0#include "qemu/osdep.h"
> =C2=A0#include "qemu/log.h"
> +#include "qapi/error.h"
> =C2=A0#include "sysemu/watchdog.h"
> =C2=A0#include "hw/sysbus.h"
> =C2=A0#include "qemu/timer.h"
> =C2=A0#include "hw/watchdog/wdt_aspeed.h"
> +#include "hw/misc/aspeed_scu.h"
> =C2=A0
> =C2=A0#define WDT_IO_REGION_SIZE 0x1000
> =C2=A0
> @@ -87,7 +89,7 @@ static void aspeed_wdt_write(void *opaqu
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (pclk) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload =3D muldiv64(s->reg_reload_value, NANO=
SECONDS_PER_SECOND,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PCL=
K_HZ) ;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->=
pclk_freq) ;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0} else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload =3D s->reg_reload_value * 1000;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0}
> @@ -104,7 +106,7 @@ static void aspeed_wdt_write(void *opaqu
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (pclk) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload =3D muldiv64(s->reg_reload_value, NANO=
SECONDS_PER_SECOND,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PCL=
K_HZ) ;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->=
pclk_freq) ;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0} else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reload =3D s->reg_reload_value * 1000;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0}
> @@ -183,10 +185,21 @@ static void aspeed_wdt_realize(DeviceSta
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedWDTState *s =3D ASPEED_WDT(dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0Object *obj;
> +=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUA=
L, aspeed_wdt_timer_expired,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dev);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0obj =3D object_property_get_link(OBJECT(dev), "s=
cu", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!obj) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_setg(errp, "%s: re=
quired link 'scu' not found: %s",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__func__, error_get_pretty(err));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0s->pclk_freq =3D aspeed_scu_get_clk(ASPEED_SCU(o=
bj));
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->iomem, OBJECT(s),=
 &aspeed_wdt_ops, s,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->iomem);
> Index: qemu-aspeed.git/include/hw/misc/aspeed_scu.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/include/hw/misc/aspeed_scu.h
> +++ qemu-aspeed.git/include/hw/misc/aspeed_scu.h
> @@ -36,6 +36,7 @@ typedef struct AspeedSCUState {
> =C2=A0#define AST2500_A1_SILICON_REV=C2=A0=C2=A0=C2=A00x04010303U
> =C2=A0
> =C2=A0extern bool is_supported_silicon_rev(uint32_t silicon_rev);
> +extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
> =C2=A0
> =C2=A0/*
> =C2=A0 * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
> Index: qemu-aspeed.git/include/hw/watchdog/wdt_aspeed.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-aspeed.git.orig/include/hw/watchdog/wdt_aspeed.h
> +++ qemu-aspeed.git/include/hw/watchdog/wdt_aspeed.h
> @@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t reg_reload_value;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t reg_restart;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t reg_ctrl;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t pclk_freq;
> =C2=A0} AspeedWDTState;
> =C2=A0
> =C2=A0#endif=C2=A0=C2=A0/* ASPEED_WDT_H */
>=20
>=20

I think we need a bit more magic in hw/arm/aspeed.c to create the SCU
link, but other than that it seems reasonable to me. A while back this
was sent to the list:

https://lists.nongnu.org/archive/html/qemu-devel/2016-10/msg00867.html

But I don't think it ever got applied. Otherwise we could be
implementing the above in terms of struct qemu_clk.

Finally I think if we're going to do something like what you've got
above we should fix the timer as well. Should I add the timer work to
my list? Do we want to gate this reboot fix on preparing timer patches?

Cheers,

Andrew

--=-YRfxTdoEYa7rgOVYzPO0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG+kdAAoJEJ0dnzgO5LT5zUYP/RLxNAysXm15QVjtlFbv9zCB
cCg3l0HJzygjKLvvrETvI6GNIyuCLOKKzNT//tJSxbbfync8K+yQ7GTr3qz+12ol
akwig8cA1LL/XZBRqdkg53kR6QDG8uSVgoLGKpmP2TCnd/gH6RsK6DMiBALsyYCF
QLOlTPi9w7H/yx8VidQkOaEGLDZh4Hdq0Be0eeH0BAPdQcyEItOekqxVUdlsTfBJ
K9Pz5lM7qE2+k6t5rr3A6GmGptCeGWRKyHROyueN787auBHgpGwOpZUsDq8r8uC3
UdVPgwaGgsSsUC23ktVV5q1SNlXQo1tAJMmahEvHHwQBbimJ6pisRtvThfjk2AmG
nRZFkYs0FEsINPabpGmbKr6svhSH0aAOJ0c1cyE/KFC/zwArnl26e8HLQYyscn61
feBKERYZ8AY2bALmZmC/uOUMqD5mwWrIGx+RZvd+LmUEz9YNwqrqQYZux6unbjls
+2lLBIcpYQZJEzP+u32NRxvt88G7kaC+IvCohF0PCpVz2zv/+QFsWpv5Ib/XI0xy
AHt+BNwjJ8ilqlRd9fC8fc7g9rofwG536gpnXEVo9hSafg3tsitoOCqktoNS0Ui3
FyCHzSZTlu3Cy9GSxNjOLwI2872uBsD22ZoI4S6m4Q2VWP6xPbyteNJLQFNNKteQ
9zfKdRDg20KkMho4yk1F
=D/f4
-----END PGP SIGNATURE-----

--=-YRfxTdoEYa7rgOVYzPO0--
