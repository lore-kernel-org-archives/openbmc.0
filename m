Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 76E9F1A000C
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 21:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=J8TBXpBb; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id DEA6E6E072;
 Tue, 16 Feb 2016 02:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=pO1bIcrY79xScV7M/VeLp
 wFDifo=; b=J8TBXpBbBFd3mElM+DEthVm+ouPbuI/Vy1noS3nH5ABrD1PhegMb5
 M6m2OGp3YviPEwJGbUS4wFyCGCaWaN7AP/pmii0ClDsAud58g0nggMbMS+uCmOBc
 2yQDvkTFGj93mj31pjX0wuB4tPZThXL9kjTp6vpyoAubyNBYpJKDUY=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id CC47C6E06C;
 Tue, 16 Feb 2016 02:50:27 -0800 (PST)
Message-ID: <1455619823.3022.25.camel@aj.id.au>
Subject: Re: [PATCH 1/3] timers: Add ASPEED AST2400 timer device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, 
 openbmc@lists.ozlabs.org
Date: Tue, 16 Feb 2016 21:20:23 +1030
In-Reply-To: <56BC9B91.1090806@fr.ibm.com>
References: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
 <1454478393-11973-2-git-send-email-andrew@aj.id.au>
 <56BC9B91.1090806@fr.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L1ldZwgVpDGRKtC2ta7c"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2016 10:50:33 -0000


--=-L1ldZwgVpDGRKtC2ta7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi C=C3=A9dric,

Thanks for reviewing the changes!

On Thu, 2016-02-11 at 15:32 +0100, C=C3=A9dric Le Goater wrote:
> Hello Andrew,
>=20
> Some comments below.=20
>=20
> On 02/03/2016 06:46 AM, Andrew Jeffery wrote:
> > Implement basic AST2400 timer functionality: Timers can be configured,
> > enabled, reset and disabled.
> >=20
> > A number of hardware features are not implemented:
> >=20
> > * Clock selection (internal vs external)
> > * Timer Overflow interrupts
> > * Clock value matching
> > * Pulse generation
> >=20
> > The implementation is enough to boot the Linux kernel configured with
> > aspeed_defconfig.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/timer/Makefile.objs          |   1 +
> >  hw/timer/aspeed_timer.c         | 301 ++++++++++++++++++++++++++++++++=
++++++++
> >  include/hw/timer/aspeed_timer.h |  52 +++++++
> >  3 files changed, 354 insertions(+)
> >  create mode 100644 hw/timer/aspeed_timer.c
> >  create mode 100644 include/hw/timer/aspeed_timer.h
> >=20
> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> > index 133bd0d..c22ccf3 100644
> > --- a/hw/timer/Makefile.objs
> > +++ b/hw/timer/Makefile.objs
> > @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o
> >  common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
> >  common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
> >  common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
> > +common-obj-y +=3D aspeed_timer.o
>=20
> Don't we have a config option for ASPEED ? It would look better.

I had fixed this up in the last patch, but I've now introduced the
config option in this first patch and used through the remaining two.

>  =20
> >  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
> >  obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > new file mode 100644
> > index 0000000..88b5cef
> > --- /dev/null
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -0,0 +1,301 @@
> > +/*
> > + *  ASPEED AST2400 Timer
> > + *
> > + *  Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + *  Copyright (C) 2015 IBM Corp.
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy
> > + *  it under the terms of the GNU General Public License as published =
by
> > + *  the Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License =
along
> > + *  with this program; if not, write to the Free Software Foundation, =
Inc.,
> > + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > + */
> > +
> > +#include=20
> > +#include=20
> > +#include "hw/sysbus.h"
> > +#include "qemu/timer.h"
> > +#include "qemu-common.h"
> > +#include "hw/ptimer.h"
> > +#include "qemu/main-loop.h"
> > +#include "hw/timer/aspeed_timer.h"
> > +
> > +#define TIMER_NUM_TIMERS 8
> > +#define TIMER_NUM_REGS 4
> > +
> > +#define TIMER_CTRL 0
> > +#define TIMER_CTRL2 1
> > +#define TIMER_CTRL_BITS 4
> > +
> > +#ifdef DEBUG
> > +# define DPRINTF(format, ...) fprintf(stderr, format , ## __VA_ARGS__)
> > +#else
> > +# define DPRINTF(format, ...) do { } while (0)
> > +#endif
>=20
> We should use trace events instead of printfs.

Done - hopefully tastefully!

>=20
> > +static void aspeed_timer_update(AspeedTimer *t)
> > +{
> > +    if (t->enabled) {
> > +        qemu_irq_raise(t->irq);
> > +    } else {
> > +        qemu_irq_lower(t->irq);
> > +    }
> > +}
> > +
> > +static void aspeed_timer_tick(void *opaque)
> > +{
> > +    AspeedTimer *t =3D opaque;
> > +
> > +    aspeed_timer_update(t);
> > +}
> > +
> > +#define L_OFFSET_TO_TIMER(o) (o / (TIMER_NUM_REGS * sizeof(uint32_t)))
> > +#define H_OFFSET_TO_TIMER(o) (L_OFFSET_TO_TIMER((o) - 0x40) + 4)
> > +#define OFFSET_TO_REG(o) ((o / sizeof(uint32_t)) % TIMER_NUM_REGS)
>=20
> These defines looks complex to me. See a proposal below.

Agree - done.

>=20
> > +static uint64_t aspeed_timer_get_value(AspeedTimerState *s, int timer,=
 int reg)
> > +{
> > +    if (timer > TIMER_NUM_TIMERS) {
> > +        qemu_log_mask(LOG_UNIMP, "Programming error, unknown timer: %d=
\n",
> > +                      timer);
> > +        return 0;
> > +    }
>=20
> I am not sure we need this test. It would mean we got something wrong=20
> in aspeed_timer_read() which can not happen with the arithmetic we are=
=20
> doing.=20

Yes, it was a bit defensive. Removed.

>=20
> > +    switch (reg) {
> > +    case 0: /* Status */
> > +        return ptimer_get_count(s->timers[timer].timer);
> > +    case 1: /* Reload */
> > +        return s->timers[timer].reload;
> > +    case 2: /* First match */
> > +    case 3: /* Second match */
> > +        return s->timers[timer].match[reg - 2];
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %=
d\n",
> > +                      reg);
> > +        break;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigne=
d size)
> > +{
>=20
> If we define :
>=20
> 	> int reg =3D (offset & 0xf) / 4;
>=20
> then we can use it below :
>=20
> > +    AspeedTimerState *s =3D opaque;
> > +    switch (offset) {
> > +    case 0x30: /* Control Register */
> > +        return s->control[TIMER_CTRL];
> > +    case 0x34: /* Control Register 2 */
> > +        return s->control[TIMER_CTRL2];
> > +    case 0x00 ... 0x2c: /* Timers 1 - 4 */
> > +        return aspeed_timer_get_value(s, L_OFFSET_TO_TIMER(offset),
> > +                                      OFFSET_TO_REG(offset));
>=20
>            return aspeed_timer_get_value(s, (offset >> 4) + 1, reg);

I don't think the '+ 1' is right here - the value is used to index into
an array so needs to be from 0.

>=20
> > +    case 0x40 ... 0x8c: /* Timers 5 - 8 */
> > +        return aspeed_timer_get_value(s, H_OFFSET_TO_TIMER(offset),
> > +                                      OFFSET_TO_REG(offset));
>=20
>            return aspeed_timer_get_value(s, (offset >> 4), reg);
> I believe this is correct and does the same ?=20

Sort of, similar to above - the control registers are placed in the
middle of two sets of four timer register sets (of four registers).
There are only two control registers, followed by 2x32bits of undefined
space, followed by the remaining four timer register sets. As such I've
used '(offset >> 4) - 1' to account for the four non-timer registers.=20

>=20
> > +    /* Illegal */
> > +    case 0x38:
> > +    case 0x3C:
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %x\n", __func__=
,
> > +                      (int)offset);
> > +        break;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static void aspeed_timer_set_value(AspeedTimerState *s, int timer, int=
 reg,
> > +                                   uint32_t value)
> > +{
> > +    AspeedTimer *t;
> > +
> > +    if (timer > TIMER_NUM_TIMERS) {
> > +        qemu_log_mask(LOG_UNIMP, "Programming error, unknown timer: %d=
\n",
> > +                      timer);
> > +        return;
> > +    }
> > +    t =3D &s->timers[timer];
> > +    switch (reg) {
> > +    case 0: /* Status */
> > +        ptimer_get_count(t->timer);
> > +        break;
> > +    case 1: /* Reload */
> > +        t->reload =3D value;
> > +        ptimer_set_limit(t->timer, value, 1);
> > +        break;
> > +    case 2: /* First match */
> > +    case 3: /* Second match */
> > +        /* Nothing is done to make matching work, we just record the v=
alue */
> > +        t->match[reg - 2] =3D value;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %=
d\n",
> > +                      reg);
> > +        break;
> > +    }
> > +}
> > +
> > +static void aspeed_timer_set_ctrl(AspeedTimerState *s, uint32_t new)
> > +{
> > +    int i;
> > +    uint32_t changed =3D s->control[TIMER_CTRL] ^ new;
> > +
> > +    while (32 > (i =3D ctz32(changed))) {
> > +        int timer, op;
> > +        bool set;
> > +        AspeedTimer *t;
> > +
> > +        timer =3D i / TIMER_CTRL_BITS;
> > +        assert(timer < TIMER_NUM_TIMERS);
> > +        t =3D &s->timers[timer];
> > +        op =3D i % TIMER_CTRL_BITS;
> > +        set =3D new & (1U << i);
> > +        switch (op) {
> > +        case 0: /* Timer Enable */
> > +            if (set) {
> > +                ptimer_run(t->timer, 0);
> > +                DPRINTF("Timer %d (%p) running\n", timer, t->timer);
> > +            } else {
> > +                DPRINTF("Stopping timer %d\n", timer);
> > +                ptimer_stop(t->timer);
> > +                ptimer_set_limit(t->timer, t->reload, 1);
> > +            }
> > +            t->enabled =3D set;
> > +            break;
> > +        case 1: /* Clock Selection */
> > +            if (set) {
> > +                DPRINTF("External clock\n");
> > +            } else {
> > +                DPRINTF("Internal clock\n");
> > +            }
>=20
> if we are interested with these debug messages, may be we could use a=20
> global trace event for the routine aspeed_timer_set_ctrl() and remove=20
> all the DPRINTF()

Done

>=20
> > +            break;
> > +        case 2: /* Overflow Interrupt */
> > +            if (set) {
> > +                DPRINTF("Overflow interrupt enabled\n");
> > +            } else {
> > +                DPRINTF("Overflow interrupt disabled\n");
> > +            }
> > +            break;
> > +        case 3: /* Pulse Generation and Output Enable */
> > +            if (timer < 4) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                              "Timer %d does not support pulse mode\n"=
, timer);
> > +            } else if (set) {
> > +                DPRINTF("Pulse enabled\n");
> > +            } else {
> > +                DPRINTF("Pulse disabled\n");
> > +            }
> > +            break;
> > +        default:
> > +            qemu_log_mask(LOG_UNIMP, "Programming error, unexpected op=
: %d\n",
> > +                          op);
> > +            break;
> > +        }
> > +        changed &=3D ~(1U << i);
> > +    }
> > +    s->control[TIMER_CTRL] =3D new;
> > +}
> > +
> > +static void aspeed_timer_set_ctrl2(AspeedTimerState *s, uint32_t value=
)
> > +{
> > +    DPRINTF("value=3D0x%" PRIx32 "\n", value);
> > +}
> > +
> > +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t v=
alue,
> > +                               unsigned size)
> > +{
> > +    AspeedTimerState *s =3D opaque;
> > +    uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
> > +
> > +    if (size !=3D sizeof(uint32_t)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "Unexpected register write size=
: %d\n",
> > +                      size);
> > +        return;
> > +    }
>=20
> This should be caught by the MemoryRegionOps ops if you define :
>=20
> 	> .min_access_size =3D 4,
>         .max_access_size =3D 4,

Oh, right. I based the code off of another timer implementation, so
didn't look in enough detail at MemoryRegionOps.

Done.

I also explicitly set '.unaligned =3D false' for clarity.

>=20
> > +    switch (offset) {
> > +    /* Control Registers */
> > +    case 0x30:
> > +        aspeed_timer_set_ctrl(s, tv);
> > +        break;
> > +    case 0x34:
> > +        aspeed_timer_set_ctrl2(s, tv);
> > +        break;
> > +    /* Timer Registers */
> > +    case 0x00 ... 0x2c:
> > +        aspeed_timer_set_value(s, L_OFFSET_TO_TIMER(offset),
> > +                               OFFSET_TO_REG(offset), tv);
>=20
> same remark than for the read.
>=20
> > +        break;
> > +    case 0x40 ... 0x8c:
> > +        aspeed_timer_set_value(s, H_OFFSET_TO_TIMER(offset),
> > +                               OFFSET_TO_REG(offset), tv);
> > +        break;
> > +    /* Illegal */
> > +    case 0x38:
> > +    case 0x3C:
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %" HWADDR_PRIx =
"\n",
> > +                __func__, offset);
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_timer_ops =3D {
> > +    .read =3D aspeed_timer_read,
> > +    .write =3D aspeed_timer_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static void aspeed_timer_init(AspeedTimer *t, uint32_t freq)
> > +{
> > +    QEMUBH *bh;
> > +
> > +    bh =3D qemu_bh_new(aspeed_timer_tick, t);
> > +    assert(bh);
> > +    t->timer =3D ptimer_init(bh);
> > +    assert(t->timer);
> > +    ptimer_set_freq(t->timer, freq);
> > +}
> > +
> > +static void aspeed_timers_realize(DeviceState *dev, Error **errp)
> > +{
> > +    int i;
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +    AspeedTimerState *s =3D ASPEED_TIMER(dev);
> > +
> > +    /* Hard-code the APB 24MHz clock rate for the moment */
> > +    for (i =3D 0; i < TIMER_NUM_TIMERS; i++) {
>=20
> we could use ARRAY_SIZE() instead of TIMER_NUM_TIMERS

Turns out I had second define already in the header, and forgot about
it. I've switched to the original (in the header) since I don't want to
eliminate it. Maybe ARRAY_SIZE() is more correct though? The values
should never be different.

>=20
> > +        aspeed_timer_init(&s->timers[i], 24000000);
>=20
> The freq can be changed with the control register 1. May be we could=20
> have a freq attribute to  struct AspeedTimer to begin with ?=20

So freq can either be 24MHz (APB) or 1MHz (external). Given it's not an
arbitrary choice I've now properly handled the clock source selection
in the control reg, and pushed the configuration into ptimer. That way
we don't have to maintain a (redundant) freq member. This lead to a bit
of refactoring, hopefully the outcome is acceptable!

>=20
> > +        sysbus_init_irq(sbd, &s->timers[i].irq);
> > +    }
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_timer_ops, s,
> > +                          TYPE_ASPEED_TIMER, 0x1000);
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +}
> > +
> > +static void timer_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D aspeed_timers_realize;
> > +    dc->desc =3D "ASPEED Timer";
> > +}
> > +
> > +static const TypeInfo aspeed_timer_info =3D {
> > +    .name =3D TYPE_ASPEED_TIMER,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedTimerState),
> > +    .class_init =3D timer_class_init,
> > +};
> > +
> > +static void aspeed_timer_register_types(void)
> > +{
> > +    type_register_static(&aspeed_timer_info);
> > +}
> > +
> > +type_init(aspeed_timer_register_types);
> > diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_=
timer.h
> > new file mode 100644
> > index 0000000..d6e0efc
> > --- /dev/null
> > +++ b/include/hw/timer/aspeed_timer.h
> > @@ -0,0 +1,52 @@
> > +/*
> > + *  ASPEED AST2400 Timer
> > + *
> > + *  Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + *  Copyright (C) 2016 IBM Corp.
> > + *
> > + *  This program is free software; you can redistribute it and/or modi=
fy
> > + *  it under the terms of the GNU General Public License as published =
by
> > + *  the Free Software Foundation; either version 2 of the License, or
> > + *  (at your option) any later version.
> > + *
> > + *  This program is distributed in the hope that it will be useful,
> > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *  GNU General Public License for more details.
> > + *
> > + *  You should have received a copy of the GNU General Public License =
along
> > + *  with this program; if not, write to the Free Software Foundation, =
Inc.,
> > + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > + */
> > +#ifndef ASPEED_TIMER_H
> > +#define ASPEED_TIMER_H
> > +
> > +#include "hw/ptimer.h"
> > +
> > +#define ASPEED_TIMER(obj) \
> > +    OBJECT_CHECK(AspeedTimerState, (obj), TYPE_ASPEED_TIMER);
> > +#define TYPE_ASPEED_TIMER "aspeed.timer"
> > +#define TIMER_BASE 0x1E782000
>=20
> I think this address define should be in ast2400.c

Done

>=20
> > +#define TIMER_NR_TIMERS 8
>=20
> May be use a ASPEED_ prefix to protect the namespace.
>=20
> #define ASPEED_TIMER_NR_TIMERS 8

Done

> > +
> > +typedef struct AspeedTimer {
> > +    ptimer_state *timer;
> > +    uint32_t reload;
> > +    uint32_t match[2];
> > +    qemu_irq irq;
> > +    bool enabled;
>=20
> freq ? just to say we might need to take it into account ?=20

Yep, see comment above.

Andrew

>=20
> C.
> =20
> > +} AspeedTimer;
> > +
> > +typedef struct AspeedTimerState {
> > +    /* < private > */
> > +    SysBusDevice parent;
> > +
> > +    /* < public > */
> > +    MemoryRegion iomem;
> > +    AspeedTimer timers[TIMER_NR_TIMERS];
> > +    uint32_t control[2];
> > +    qemu_irq irq;
> > +} AspeedTimerState;
> > +
> > +#endif /* ASPEED_TIMER_H */
> >=20
>=20
--=-L1ldZwgVpDGRKtC2ta7c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWwv7vAAoJEJ0dnzgO5LT56+4QALSZmVbQ8e9QqQZu8hSdIdHf
iKuXHIwjFoH31VYw0vdPvS0BHieGasmzFLj7QioxfZn7k649hjqAiDQquqP8TNkd
UzsImWrOrn7MJdcd9sfZySf7xPKrVBbv9mXJTYsmjNrVd4pnQQlU9VTjiZsQpH1b
aGOlweXIHOpKhBHBwS/Pa/DVA3Rzk6ARWdeP+GvECUB5Uu8eUfFOeeQrC7oh4CJv
Iy2VohYKkSy4DD4kaK9K2iwJ7XuXyCl0EN4pkq+32HvFP4VXdDBHMgBcC90CbWjU
iw4ssGcW2g0SMLli+vz943kLCP5DY8ZAGtHLx0kZOH9xsrzBjBuqFSuy1qix+IZ0
LON6dJ3bVAt1t9mjGr7DCYVSa9PnJTGFow/qd4jbsbEHQ/CuwNGKurJoSPSTi3Lq
Z7w0IrbtEECVALHSRkKH17ckpr6+rcLuneAwW8Tbs+gx2nVfsvadxBjpQbuhm+W3
9/6kHfMiYlx+EV9u4DFs+VUTbb3XtG44ThlbedTqA9aGnmEn3PXte2ZCKo8n0qCi
rHdxWYbbl9UpDbARAGrmAhKRDw5wM3TU2Ym/zjzAn6Ch+KOV6OyGsIyEHs07Ygwj
j1Bw+uWh+93cGjxYCU9a2KsQmB9XKlEvufKHFsR8GhHVXYrjLgjCmBtMocLtegKh
lKOVRwwLRH4aT56yZCag
=qpZZ
-----END PGP SIGNATURE-----

--=-L1ldZwgVpDGRKtC2ta7c--
