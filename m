Return-Path: <andrew@aj.id.au>
Received: from homiemail-a18.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQkyv6sVJzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 11:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=QHknww0f; 
 dkim-atps=neutral
Received: from homiemail-a18.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTP id DDE7A25006C;
 Thu,  9 Jun 2016 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=JJyfR3z7aAlxMNbtL4Oo0
 qb/2vE=; b=QHknww0fLCmcT8kF8yOjhuQOuqEQ8msfmNR3kq9V+96vQtf6V+z4W
 UlQQ3I5JXh3woxFd85O7bt0jQXerTNdCb0F5TLzilRcuYCbqseefDAHMv3tVtdzf
 Otp1ImEpBXbfAZQFiDKr+iQdRC+LDTaJl7npA64NQwVfBRbXrQeEhE=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPSA id B60DD25006B;
 Thu,  9 Jun 2016 18:26:11 -0700 (PDT)
Message-ID: <1465521962.16048.194.camel@aj.id.au>
Subject: Re: [PATCH qemu 1/2] hw/misc: Add a model for the ASPEED System
 Control Unit
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2016 10:56:02 +0930
In-Reply-To: <57595312.5@kaod.org>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
 <1465460046-7692-2-git-send-email-andrew@aj.id.au> <57595312.5@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2234qU8YhubCMWaKnFPZ"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 01:26:16 -0000


--=-2234qU8YhubCMWaKnFPZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-09 at 13:29 +0200, C=C3=A9dric Le Goater wrote:
> On 06/09/2016 10:14 AM, Andrew Jeffery wrote:
> >=20
> > The SCU is a collection of chip-level control registers that manage the
> > various functions supported by the AST2400. Typically the bits control
> > interactions with clocks, external hardware or reset behaviour, and we
> > can largly take a hands-off approach to reads and writes.
> >=20
> > Firmware makes heavy use of the state to determine how to boot, but the
> > reset values vary from SoC to SoC. Object properties are exposed so
> > that the integrating SoC model can configure the appropriate reset
> > values.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0hw/misc/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0hw/misc/aspeed_scu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 295 +++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/hw/misc/aspeed_scu.h | 105 +++++++++++++++
> > =C2=A0trace-events=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A03 +
> > =C2=A04 files changed, 404 insertions(+)
> > =C2=A0create mode 100644 hw/misc/aspeed_scu.c
> > =C2=A0create mode 100644 include/hw/misc/aspeed_scu.h
> >=20
> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> > index bc0dd2cc7567..4895e950b377 100644
> > --- a/hw/misc/Makefile.objs
> > +++ b/hw/misc/Makefile.objs
> > @@ -51,3 +51,4 @@ obj-$(CONFIG_MIPS_ITU) +=3D mips_itu.o
> > =C2=A0obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
> > =C2=A0obj-$(CONFIG_EDU) +=3D edu.o
> > =C2=A0obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
> > +obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
> > diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> > new file mode 100644
> > index 000000000000..ae5a4c590bb6
> > --- /dev/null
> > +++ b/hw/misc/aspeed_scu.c
> > @@ -0,0 +1,295 @@
> > +/*
> > + * ASPEED System Control Unit
> > + *
> > + * Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.=C2=A0=C2=A0=
See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include=20
> > +#include "hw/misc/aspeed_scu.h"
> > +#include "hw/qdev-properties.h"
> > +#include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "qemu/bitops.h"
> > +#include "trace.h"
> > +
> > +#define SCU_KEY 0x1688A8A8
> > +#define SCU_IO_REGION_SIZE 0x20000
> > +
> > +#define TO_REG(o) ((o) >> 2)
> > +#define TO_REG_ID(o) [TO_REG(o)] =3D stringify(o)
> > +
> > +static const char *aspeed_scu_reg_ids[ASPEED_SCU_NR_REGS] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PROT_KEY),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CLK_SEL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CLK_STOP_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_FREQ_CNTR_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_FREQ_CNTR_EVAL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_IRQ_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_D2PLL_PARAM),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_MPLL_PARAM),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_HPLL_PARAM),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_FREQ_CNTR_RANGE),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_MISC_CTRL1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PCI_CTRL1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PCI_CTRL2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PCI_CTRL3),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SOC_SCRATCH1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SOC_SCRATCH2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_MAC_CLK_DELAY),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_MISC_CTRL2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH3),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH6),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH7),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_VGA_SCRATCH8),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_HW_STRAP1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_RNG_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_RNG_DATA),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_REV_ID),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL3),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL6),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_WDT_RST_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL7),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL8),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PINMUX_CTRL9),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_WAKEUP_EN),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_WAKEUP_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_HW_STRAP2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_FREE_CNTR4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_FREE_CNTR4_EXT),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG3),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_CPU2_CACHE_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_UART_HPLL_CLK),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_PCIE_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_BMC_MMIO_CTRL),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_MAILBOX_DECODE_BASE),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_BMC_REV_ID),
> > +=C2=A0=C2=A0=C2=A0=C2=A0TO_REG_ID(ASPEED_SCU_BMC_DEV_ID),
> > +};
> I would start with a smaller set that we know uboot and the kernel use,
> this is minor.

Given that I provided all the defines for register offsets, I figured I
should provide all the property IDs. As it's done now, I don't see any
benefit to removing it. Other than to change the approach, which is
discussed below.

>=20
> >=20
> > +void aspeed_scu_configure_reset(AspeedSCUState *scu,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const AspeedSCUResetCf=
g vals[], int n, Error **errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < n; i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *name =3D a=
speed_scu_reg_ids[TO_REG(vals[i].offset)];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (name) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0object_property_set_int(OBJECT(scu), vals[i].val, name, errp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0if (*errp) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +}
> > +
> > +static void aspeed_scu_get_reset(Object *obj, Visitor *v, const char *=
name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *opaque, Error **=
errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSCUState *s =3D ASPEED_SCU(obj);
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t value;
> > +=C2=A0=C2=A0=C2=A0=C2=A0int offset, reg;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (sscanf(name, "0x%x", &offset) !=3D 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_setg(errp, "Erro=
r reading %s", name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> I thought the name of the property was "ASPEED_SCU_PROT_KEY" according to=
 the=C2=A0
> object_property_add() below ?=C2=A0

Right. This was the slightly abusive bit. Partly inspired by your
tmp421 patch, the register of interest is derived from the property
name. In fact, here, the property name is simply the string
representation of the hexadecimal offset (via stringify() in the
TO_REG_ID() macro). This is mostly hidden by the aspeed_scu_reg_ids
lookup, which avoids dynamic conversion between integers and strings
(sprintf, asprintf and such).

I'm not at all confident this will be swallowed by upstream, which was
another reason for sending here first :)

So, is there a better approach? object_property_*()s all seemed to
require const char *s. We could just not use properties and assign to
the array member directly, as the AspeedSCUState type isn't opaque in
ast2400.c, but from a quick survey it seemed object_property_*() was
the way to go.

>=20
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0reg =3D TO_REG(offset);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (reg > ASPEED_SCU_NR_REGS) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_setg(errp, "Inva=
lid register ID: %s", name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0value =3D s->reset[reg];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0visit_type_uint32(v, name, &value, errp);
> > +}
> > +
> > +static void aspeed_scu_set_reset(Object *obj, Visitor *v, const char *=
name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *opaque, Error **=
errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSCUState *s =3D ASPEED_SCU(obj);
> > +=C2=A0=C2=A0=C2=A0=C2=A0Error *local_err =3D NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t value;
> > +=C2=A0=C2=A0=C2=A0=C2=A0int offset, reg;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0visit_type_uint32(v, name, &value, &local_err)=
;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (local_err) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, =
local_err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0if (sscanf(name, "0x%x", &offset) !=3D 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_setg(errp, "Erro=
r reading %s", name);
> > +=C2=A0=C2=A0=C2=A0=C2=A0}
> same comment.

Same as above

>=20
> The rest looks fine.
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Cheers,

Andrew
--=-2234qU8YhubCMWaKnFPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXWhcqAAoJEJ0dnzgO5LT5nBEP/3NZl6YJfog+Hc77w+RpsYpH
ck1ydLIcl8ipxIV/F8xYeX0xCLK14T7X9YUYvPDTrhpTIUonziV83K8wUsDfB5U0
bWO/d2tWfayEfHYUxPjYR/yVeDA+WfYhxurpz4J5/o5d1G3hMC5LWYfysn302HFT
C2Ikhpw5Q4+56keUOofXq0NIjwlWIiguBdBMCkDT0w80C9Yw67/yZ/kVaDlsKH5c
E1ktbJsG9NE12qpuD32op5jYZ662+pwjYdS2Aug7QSVbllLcdMG7DY1zw+R9mBA9
dD9XvXJAd/7l11NwMlo1QMNmiW9/FG6Ngm0ynSN5HfPzX59zYx/DbKLqdCqtv4Ut
niaebzMQnab3S7Il+KsJMJv+zgzmYx2HUf5gvc2h3bCj94lFxWb6s5pnMBq94bJM
S8OycrW/9gkcZphJlOSG2wteFTCxf93mKcR1j7nf5dEugiVHrHpKEC+OdoP9UKby
YaUdzEakD9kSnP4ECm4QAVLtXdN9JtWT+/ffc0xRGTybUJGvJSVrcJ+p2hu+3Q6d
LdmrD0aN6/CHwXtCbYQxK3iAWEpEpRcNz/lJnqlDPGHu04Yu6ejpOyrO3VFIN60g
H/lJqpBeX7EaKkmvWyGHTg2yO5uQs06vWlyAif7pJU4inEWIjjF1ToABDoyTmGbu
2Y2UEBJb4LTJYDNELhYN
=7ZPU
-----END PGP SIGNATURE-----

--=-2234qU8YhubCMWaKnFPZ--
