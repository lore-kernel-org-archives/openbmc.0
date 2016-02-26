Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 089331A0008
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 14:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=pXNFcKdp; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 0878B76C06B;
 Thu, 25 Feb 2016 19:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=6sMVxt9lEWPD6etDOTxta
 QD9uIk=; b=pXNFcKdpi9aH8+xFw/TMZzxsbB5GIGLlLkALCNT7d+hf9DZ5Zb59E
 1tUjKFePFmos+PA61OzguGmi5wSDLd6qaWK62PdJ5nUlDJXM4FTqDyH6QGbRH4h4
 INGKN12QJF4VY+qu2rfFBIZR5elGW1Dxpggbum5Ln2kORIn+/Y8EqA=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id D5B5376C069;
 Thu, 25 Feb 2016 19:14:28 -0800 (PST)
Message-ID: <1456456460.27420.147.camel@aj.id.au>
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer
 device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org,
 qemu-arm <qemu-arm@nongnu.org>
Date: Fri, 26 Feb 2016 13:44:20 +1030
In-Reply-To: <CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-2-git-send-email-andrew@aj.id.au>
 <CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vEPADAHkMGaXwArn9YCS"
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
X-List-Received-Date: Fri, 26 Feb 2016 03:14:33 -0000


--=-vEPADAHkMGaXwArn9YCS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, 2016-02-25 at 16:11 +0000, Peter Maydell wrote:
> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Implement basic AST2400 timer functionality: Timers can be configured,
> > enabled, reset and disabled.
> >=20
> > A number of hardware features are not implemented:
> >=20
> > * Timer Overflow interrupts
> > * Clock value matching
> > * Pulse generation
> >=20
> > The implementation is enough to boot the Linux kernel configured with
> > aspeed_defconfig.
>=20
> Thanks; this mostly looks in reasonable shape; I have some comments below=
.
>=20
> Do we have a datasheet for this chip ?

Unfortunately I don't know of a publicly available datasheet. What's the be=
st way to proceed in this case?

>=20
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  default-configs/arm-softmmu.mak |   2 +
> >  hw/timer/Makefile.objs          |   2 +
> >  hw/timer/aspeed_timer.c         | 313 ++++++++++++++++++++++++++++++++=
++++++++
> >  include/hw/timer/aspeed_timer.h |  55 +++++++
> >  trace-events                    |   9 ++
> >  5 files changed, 381 insertions(+)
> >  create mode 100644 hw/timer/aspeed_timer.c
> >  create mode 100644 include/hw/timer/aspeed_timer.h
> >=20
> > diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> > index a9f82a1..4072174 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -110,3 +110,5 @@ CONFIG_IOH3420=3Dy
> >  CONFIG_I82801B11=3Dy
> >  CONFIG_ACPI=3Dy
> >  CONFIG_SMBIOS=3Dy
> > +
> > +CONFIG_ASPEED_SOC=3Dy
> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> > index 133bd0d..f6f7351 100644
> > --- a/hw/timer/Makefile.objs
> > +++ b/hw/timer/Makefile.objs
> > @@ -33,3 +33,5 @@ obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> >  obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
> >=20
> >  common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
> > +
> > +common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > new file mode 100644
> > index 0000000..0359528
> > --- /dev/null
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -0,0 +1,313 @@
> > +/*
> > + *  ASPEED AST2400 Timer
> > + *
> > + *  Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + *  Copyright (C) 2015, 2016 IBM Corp.
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
> > +#include "trace.h"
>=20
> All source files need to #include "qemu/osdep.h" as their first
> include. That then means you don't need to include assert.h or
> stdio.h yourself.
>=20
> What do we need from qemu/main-loop.h?

I'm using it for qemu_bh_new() which is required by ptimer, who registers t=
he aspeed_timer_tick() callback into the main loop timer handling. I think =
this callback has a poorly chosen name - it's probably better called aspeed=
_timer_expire(), which I'll fix. ptimer seemed like a logical choice for im=
plementing the functionality to me, so main-loop.h is required?

> > +#define TIMER_NR_REGS 4
> > +
> > +#define TIMER_CTRL_BITS 4
> > +
> > +#define TIMER_CLOCK_USE_EXT true
> > +#define TIMER_CLOCK_EXT_HZ 1000000
> > +#define TIMER_CLOCK_USE_APB false
> > +#define TIMER_CLOCK_APB_HZ 24000000
> > +
> > +#define TIMER_CTRL_OP_ENABLE 0
> > +#define TIMER_CTRL_OP_CLOCK_SELECT 1
> > +#define TIMER_CTRL_OP_OVERFLOW_INTERRUPT 2
> > +#define TIMER_CTRL_OP_PULSE_ENABLE 3
> > +
> > +#define TIMER_REG_STATUS 0
> > +#define TIMER_REG_RELOAD 1
> > +#define TIMER_REG_MATCH_FIRST 2
> > +#define TIMER_REG_MATCH_SECOND 3
> > +
> > +static inline bool timer_can_pulse(AspeedTimer *t)
> > +{
> > +    return t->id >=3D 4;
> > +}
> > +
> > +static void aspeed_timer_irq_update(AspeedTimer *t)
> > +{
> > +    qemu_set_irq(t->irq, t->enabled);
>=20
> Surely the timer doesn't assert its IRQ line all
> the time it's enabled? This doesn't look like the right condition.

So I think this is correct despite how it looks. There's some cruft from mo=
delling the implementation off of another timer that's probably obscuring t=
hings, which should be fixed. aspeed_timer_irq_update() is only called from=
 aspeed_timer_tick(), so I'll just merge the two. Then by renaming aspeed_t=
imer_tick() to aspeed_timer_expire() as mentioned above, this won't look so=
 strange? I've read through the timer handling code (the processing loop in=
 timerlist_run_timers()) and my understanding is it has the behaviour we wa=
nt - callback on expiry, not on ticks - which is not how it reads as above.

>=20
> > +}
> > +
> > +static void aspeed_timer_tick(void *opaque)
> > +{
> > +    AspeedTimer *t =3D opaque;
> > +
> > +    aspeed_timer_irq_update(t);
> > +}
> > +
> > +static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
> > +{
> > +    uint64_t value;
> > +
> > +    switch (reg) {
> > +    case TIMER_REG_STATUS:
> > +        value =3D ptimer_get_count(t->timer);
> > +        break;
> > +    case TIMER_REG_RELOAD:
> > +        value =3D t->reload;
> > +        break;
> > +    case TIMER_REG_MATCH_FIRST:
> > +    case TIMER_REG_MATCH_SECOND:
> > +        value =3D t->match[reg - 2];
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %=
d\n",
> > +                      reg);
> > +        value =3D 0;
> > +        break;
> > +    }
> > +    return value;
> > +}
> > +
> > +static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigne=
d size)
> > +{
> > +    AspeedTimerState *s =3D opaque;
> > +    const int reg =3D (offset & 0xf) / 4;
> > +    uint64_t value;
> > +
> > +    switch (offset) {
> > +    case 0x30: /* Control Register */
> > +        value =3D s->ctrl;
> > +        break;
> > +    case 0x34: /* Control Register 2 */
> > +        value =3D s->ctrl2;
> > +        break;
> > +    case 0x00 ... 0x2c: /* Timers 1 - 4 */
> > +        value =3D aspeed_timer_get_value(&s->timers[(offset >> 4)], re=
g);
> > +        break;
> > +    case 0x40 ... 0x8c: /* Timers 5 - 8 */
> > +        value =3D aspeed_timer_get_value(&s->timers[(offset >> 4) - 1]=
, reg);
> > +        break;
> > +    /* Illegal */
> > +    case 0x38:
> > +    case 0x3C:
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRI=
x "\n",
> > +                __func__, offset);
> > +        value =3D 0;
> > +        break;
> > +    }
> > +    trace_aspeed_timer_read(offset, size, value);
> > +    return value;
> > +}
> > +
> > +static void aspeed_timer_set_value(AspeedTimerState *s, int timer, int=
 reg,
> > +                                   uint32_t value)
> > +{
> > +    AspeedTimer *t;
> > +
> > +    assert(timer >=3D 0 && timer < ASPEED_TIMER_NR_TIMERS &&
> > +            "Programming error: Unexpected timer index");
> > +    trace_aspeed_timer_set_value(timer, reg, value);
> > +    t =3D &s->timers[timer];
> > +    switch (reg) {
> > +    case TIMER_REG_STATUS:
> > +        if (t->enabled) {
> > +            ptimer_set_count(t->timer, value);
> > +        }
> > +        break;
> > +    case TIMER_REG_RELOAD:
> > +        t->reload =3D value;
> > +        ptimer_set_limit(t->timer, value, 1);
> > +        break;
> > +    case TIMER_REG_MATCH_FIRST:
> > +    case TIMER_REG_MATCH_SECOND:
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
> > +static void aspeed_timer_ctrl_op(AspeedTimer *t, int op, bool set)
> > +{
> > +    switch (op) {
> > +    case TIMER_CTRL_OP_ENABLE:
> > +        trace_aspeed_timer_ctrl_op_timer_enable(t->id, set);
> > +        if (set) {
> > +            ptimer_run(t->timer, 0);
> > +        } else {
> > +            ptimer_stop(t->timer);
> > +            ptimer_set_limit(t->timer, t->reload, 1);
> > +        }
> > +        t->enabled =3D set;
>=20
> Is this enabled bit really separate state within the h/w from
> the bit in the control register? Storing the same state twice
> in different places in the qemu device state struct is usually
> a bad idea if you can avoid it.

I didn't like it either, and it likely is redundant as you point out. I was=
 more concentrating on why ptimer didn't seem to expose this state and prob=
ably overlooked what I already had, somehow.

>=20
> > +        break;
> > +    case TIMER_CTRL_OP_CLOCK_SELECT:
> > +        trace_aspeed_timer_ctrl_op_clock_select(t->id, set);
> > +        if (set) {
> > +            ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
> > +        } else {
> > +            ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
> > +        }
> > +        break;
> > +    case TIMER_CTRL_OP_OVERFLOW_INTERRUPT:
> > +        trace_aspeed_timer_ctrl_op_overflow_interrupt(t->id, set);
> > +        break;
> > +    case TIMER_CTRL_OP_PULSE_ENABLE:
> > +        if (timer_can_pulse(t)) {
> > +            trace_aspeed_timer_ctrl_op_pulse_enable(t->id, set);
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                    "Timer does not support pulse mode\n");
> > +        }
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "Programming error, unexpected op: %d=
\n",
> > +                op);
> > +        break;
> > +    }
> > +}
> > +
> > +static void aspeed_timer_set_ctrl(AspeedTimerState *s, uint32_t new)
> > +{
> > +    int i;
> > +    uint32_t changed =3D s->ctrl ^ new;
> > +
> > +    while (32 > (i =3D ctz32(changed))) {
> > +        int timer, op;
> > +        bool set;
> > +        AspeedTimer *t;
> > +
> > +        timer =3D i / TIMER_CTRL_BITS;
> > +        assert(timer < ASPEED_TIMER_NR_TIMERS);
> > +        t =3D &s->timers[timer];
> > +        op =3D i % TIMER_CTRL_BITS;
> > +        set =3D new & (1U << i);
> > +        aspeed_timer_ctrl_op(t, op, set);
> > +        changed &=3D ~(1U << i);
> > +    }
>=20
> This is effectively processing the bits in order from
> low to high (and doing the loop-through-bits in a confusing
> to read way as well).

Just how the condition is expressed, or more? The condition can be simplifi=
ed to while(changed), which I've done locally.

 That doesn't seem right to me --
> if the guest does one write to say "enable timer with this clock"
> then you want to first pick the right clock and then enable
> the timer, not enable the timer first and then change the
> frequency. (Conversely if the guest writes to disable the timer
> you want to disable it first and then reconfigure it.)

Fair point! I'll have a play with reworking it.

>=20
> > +    s->ctrl =3D new;
> > +}
> > +
> > +static void aspeed_timer_set_ctrl2(AspeedTimerState *s, uint32_t value=
)
> > +{
> > +    trace_aspeed_timer_set_ctrl2(value);
> > +}
> > +
> > +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t v=
alue,
> > +                               unsigned size)
> > +{
> > +    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
> > +    const int reg =3D (offset & 0xf) / 4;
> > +    AspeedTimerState *s =3D opaque;
> > +
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
> > +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
> > +        break;
> > +    case 0x40 ... 0x8c:
> > +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, =
tv);
> > +        break;
> > +    /* Illegal */
> > +    case 0x38:
> > +    case 0x3C:
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRI=
x "\n",
> > +                __func__, offset);
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_timer_ops =3D {
> > +    .read =3D aspeed_timer_read,
> > +    .write =3D aspeed_timer_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +    .valid.min_access_size =3D 4,
> > +    .valid.max_access_size =3D 4,
> > +    .valid.unaligned =3D false,
> > +};
> > +
> > +static void aspeed_timer_init(AspeedTimer *t, uint8_t id, bool ext_clo=
ck)
>=20
> You should call this aspeed_init_one_timer() or something,
> because with this function name it looks like it ought to
> be the instance_init function for the class.

I wasn't satisfied with the naming here either, so thanks for the suggestio=
n.

>=20
> > +{
> > +    QEMUBH *bh;
> > +
> > +    t->id =3D id;
> > +    bh =3D qemu_bh_new(aspeed_timer_tick, t);
> > +    assert(bh);
> > +    t->timer =3D ptimer_init(bh);
> > +    assert(t->timer);
> > +    aspeed_timer_ctrl_op(t, TIMER_CTRL_OP_CLOCK_SELECT, ext_clock);
> > +}
> > +
> > +static void aspeed_timers_realize(DeviceState *dev, Error **errp)
>=20
> Stray 's' in function name.

Yep, will fix.

>=20
> > +{
> > +    int i;
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +    AspeedTimerState *s =3D ASPEED_TIMER(dev);
> > +    uint32_t clock_mask =3D 0;
> > +
> > +    for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
> > +        aspeed_timer_init(&s->timers[i], i, TIMER_CLOCK_USE_APB);
> > +        clock_mask |=3D (1 << (1 + i * TIMER_CTRL_BITS));
> > +        sysbus_init_irq(sbd, &s->timers[i].irq);
> > +    }
> > +    /* Ensure control reg has timers configured with APB clock selecte=
d */
> > +    s->ctrl &=3D ~clock_mask;
>=20
> Reset of register values should go in your device's reset
> function (which you need to implement and register as dc->reset).

Good point, I'll move it.

>=20
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
>=20
> You should implement a VMState struct for device migration,
> and wire it up here via dc->vmsd.

I'll look into it. I started experimenting with a VMState struct early on i=
n the implementation but threw it away as it wasn't my primary focus at the=
 time.=20

>=20
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
>=20
> Usual convention is to omit the ';' on type_init() etc, though as usual
> there is some code in the tree that doesn't do so.

Okay, I wasn't aware of that. I'll remove it.

Thanks,

Andrew

>=20
> thanks
> -- PMM

--=-vEPADAHkMGaXwArn9YCS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWz8MMAAoJEJ0dnzgO5LT5CxYP/Rv65X8YJdbwXE/rJa4vXUyr
8T5/cnmQ5MzC4DUadJ6ZSOh+MWkYJqj1IoX2gXlPD5u5X3Cw9Z8AXBziWpE2Z1pk
od8U5DQeGfjfXwxDQJuIrWrHPCZ21IqD+P+iN6080sbU/ULCFCryT1OPd6N0UCy5
JZi8WyhU+vh+GRtJUw7hX9AP61FI+HilE+fJECPoJLyu0MlgsMXDq+q6dEnYiXSa
bDn+OQzCW1l6aVjgp1Sq0VFf4L6O8p6FiFGxgEtbtwmIQ2Act22s+IFD/X4gp99j
TloeCl/Pqx4D+CPWj7M8jJRtM2wxg+fzyAaiWR74T1Itc94apGJy0DZYZusyJtpP
zj4UhV34/lCLLkOAn+3DHAI/vYyZDrVNIP53oIwNW2sCwvVaQagUyYzjLKCWmMg3
+gpzIPNo1pcqmeBpZtd7/QfSPnlh0drM5+wC0ttdHmguqlkxZKSZ92fcV2xhBypx
ln7wmQU4qjO9n6YyK7FjjljI2VjIb6Sd/2uJ2M761AgrUQRe/ir5PVCh+n/h/Ma7
cqrSJ4j/wZgthE9VZuYBd6M+4uDhqXl1IVG/D/ZbOBPeWhPkx0PqgsGROin64IQs
FPIQK3wIuP7W2dYDjlkIcBic496AJ+iHQCX2xKcZCE0Y9m76aQvdhy10sv0gCmgf
F74ZE3fvsYiEr1Q8U4NE
=N000
-----END PGP SIGNATURE-----

--=-vEPADAHkMGaXwArn9YCS--
