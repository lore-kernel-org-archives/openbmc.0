Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 250AB1A0BA8
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 12:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=lHLIhTdM; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id DFB1B117E06A;
 Tue,  1 Mar 2016 17:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=fPruWAC0Ku3uXkHalYXrO
 KUWY8o=; b=lHLIhTdMXtMOyttmrQyDmznn9uNK6aeShPLryvoQAVERHwq1Wv/It
 9LfJmu7EJwyZH0JNLA3bDu7bOKDqc8bw/QhzT1sRZxSDc3aaqIvs22pJ8psiAIco
 SRrlNwSYF613isaP39xsdD/D1GAhaZOnHR51/MaFKbEByUhzX/5Odg=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 9A8EA117E065;
 Tue,  1 Mar 2016 17:09:52 -0800 (PST)
Message-ID: <1456880983.32556.41.camel@aj.id.au>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Peter Maydell <peter.maydell@linaro.org>
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>
Date: Wed, 02 Mar 2016 11:39:43 +1030
In-Reply-To: <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
 <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-I6Ju+7/KZL5DMH3qtbOv"
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
X-List-Received-Date: Wed, 02 Mar 2016 01:09:57 -0000


--=-I6Ju+7/KZL5DMH3qtbOv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,
 =20
On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Implement a minimal ASPEED AVIC device model, enough to boot a Linux
> > kernel configured with aspeed_defconfig. The VIC implements the 'new'
> > register set and expects this to be reflected in the device tree.
>=20
> What do we mean by "new" here? Were there multiple revisions of
> this hardware?

Yes, I'll try rework the commit message to clear this up.

>=20
> > The implementation is a little awkward as the hardware uses 32bit
> > registers to manage 51 IRQs, and makes use of low and high registers fo=
r
> > each conceptual register. The model's implementation uses 64bit data
> > types to store the register values but must cope with access offset val=
ues
> > in multiples of 4 passed to the callbacks. As such the read() and
> > write() implementations process the provided offset to understand
> > whether the access is requesting the lower or upper 32bits of the 64bit
> > quantity.

FWIW I've moved this to a comment in the source as suggested in an off
-list review by Alexey Kardashevskiy.

> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  hw/intc/Makefile.objs        |   1 +
> >  hw/intc/aspeed_vic.c         | 256 +++++++++++++++++++++++++++++++++++=
++++++++
> >  include/hw/intc/aspeed_vic.h |  40 +++++++
> >  trace-events                 |   9 ++
> >  4 files changed, 306 insertions(+)
> >  create mode 100644 hw/intc/aspeed_vic.c
> >  create mode 100644 include/hw/intc/aspeed_vic.h
> >=20
> > diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> > index 6a13a39..0e47f0f 100644
> > --- a/hw/intc/Makefile.objs
> > +++ b/hw/intc/Makefile.objs
> > @@ -31,3 +31,4 @@ obj-$(CONFIG_XICS_KVM) +=3D xics_kvm.o
> >  obj-$(CONFIG_ALLWINNER_A10_PIC) +=3D allwinner-a10-pic.o
> >  obj-$(CONFIG_S390_FLIC) +=3D s390_flic.o
> >  obj-$(CONFIG_S390_FLIC_KVM) +=3D s390_flic_kvm.o
> > +obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_vic.o
> > diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
> > new file mode 100644
> > index 0000000..c000936
> > --- /dev/null
> > +++ b/hw/intc/aspeed_vic.c
> > @@ -0,0 +1,256 @@
> > +/*
> > + * ASPEED Interrupt Controller (New)
> > + *
> > + * Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + * Copyright 2015, 2016 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + *
> > + * Based off of the i.MX31 Vectored Interrupt Controller
> > + *
> > + * Note that this device model does not implement the legacy register =
space.
> > + * The assumption is that the device base address is exposed such that=
 all
> > + * offsets are calculated relative to the address of the first "new" r=
egister.
>=20
> Is there real hardware that doesn't implement the legacy register
> space?

I don't immediately know the answer, but both the AST2400 and AST2500
retain the legacy register set (in addition to providing the new set).

>  Should we be at least implementing it enough to do a
> LOG_UNIMP log of the fact we don't implement it?

Yeah that sounds useful, I'll look into it.

>=20
> > + */
> > +#include=20
>=20
> Missing newline before #include. As with the other file, include
> qemu/osdep.h first. (If you rebase on current master you'll find you
> get compile errors otherwise.)
> > +#include "hw/intc/aspeed_vic.h"
> > +#include "trace.h"
> > +
> > +#define AVIC_L_MASK 0xFFFFFFFF
>=20
> This needs a 'U' suffix or at least one of the compilers we build
> with will complain.

Okay. Out of interest, what compiler will complain?

>=20
> > +#define AVIC_H_MASK 0x00007FFF
> > +#define AVIC_INT_EVENT_W_MASK (UINT64_C(0x78000) << 32)
>=20
> We generally use the ULL suffix rather than UINT64_C().

Okay.


> > +
> > +static void aspeed_vic_update(AspeedVICState *s)
> > +{
> > +    int i;
> > +    uint64_t new =3D (s->edge_status & s->int_enable);
> > +    uint64_t flags;
> > +
> > +    flags =3D new & s->int_select;
> > +    qemu_set_irq(s->fiq, !!flags);
> > +    trace_aspeed_vic_update_fiq(!!flags);
> > +
> > +    flags =3D new & ~s->int_select;
> > +    if (!flags) {
> > +        qemu_set_irq(s->irq, !!flags);
> > +        trace_aspeed_vic_update_all_fiq();
> > +        return;
> > +    }
> > +
> > +    for (i =3D 0; i < ASPEED_VIC_NR_IRQS; i++) {
> > +        if (flags & (UINT64_C(1) << i)) {
> > +            qemu_set_irq(s->irq, 1);
> > +            trace_aspeed_vic_update_i(i);
> > +            return;
> > +        }
> > +    }
> > +
> > +    qemu_set_irq(s->irq, 0);
>=20
> I don't understand why you've written the FIQ setting code
> in one (fairly straightforward) way, but the IRQ setting
> code in a completely different way with an unnecessary loop
> and a lot of redundant code.

Good point - I've changed to the fairly-straightfoward way for both. As
a justification I started with the i.MX31 VIC update implementation and
removed the intmask feature (as my reading of the datahsheet doesn't
show an equivalent, just provides the ability to mask specific
interrupts), and left the rest alone. I should have reasoned about it a
bit further.


> > +    trace_aspeed_vic_update_none();
> > +}
> > +
> > +static void aspeed_vic_set_irq(void *opaque, int irq, int level)
> > +{
> > +    AspeedVICState *s =3D (AspeedVICState *)opaque;
> > +    if (irq > ASPEED_VIC_NR_IRQS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "Out-of-range interrupt number:=
 %d\n",
> > +                      irq);
> > +        return;
> > +    }
> > +
> > +    if (level) {
> > +        s->edge_status |=3D (UINT64_C(1) << irq);
> > +    } else {
> > +        s->edge_status &=3D ~(UINT64_C(1) << irq);
> > +    }
>=20
> You can do this in one line with
>    s->edge_status =3D deposit64(s->edge_status, irq, 1, level);

Okay.

>=20
> Why is the field called "edge status" when the code here appears
> to be treating it as a line level? Are we missing edge-detect-and-latch
> logic ?

Agh, yep, this is an abuse of the edge_status register. I'll rework the
code to respect edge vs level.

>=20
> > +
> > +    trace_aspeed_vic_set_irq(irq, level);
> > +    aspeed_vic_update(s);
> > +}
> > +
> > +static uint64_t aspeed_vic_read(void *opaque, hwaddr offset, unsigned =
size)
> > +{
> > +    uint64_t val;
> > +    const bool high =3D !!(offset & 0x4);
> > +    const hwaddr n_offset =3D (offset & ~0x4);
> > +    AspeedVICState *s =3D (AspeedVICState *)opaque;
> > +
> > +    switch (n_offset) {
> > +    case 0x0: /* IRQ Status */
> > +        val =3D s->edge_status & ~s->int_select & s->int_enable;
> > +        break;
> > +    case 0x08: /* FIQ Status */
> > +        val =3D s->edge_status & s->int_select & s->int_enable;
> > +        break;
> > +    case 0x10: /* Raw Interrupt Status */
> > +        val =3D s->edge_status;
> > +        break;
> > +    case 0x18: /* Interrupt Selection */
> > +        val =3D s->int_select;
> > +        break;
> > +    case 0x20: /* Interrupt Enable */
> > +        val =3D s->int_enable;
> > +        break;
> > +    case 0x30: /* Software Interrupt */
> > +        val =3D s->int_trigger;
> > +        break;
> > +    case 0x40: /* Interrupt Sensitivity */
> > +        val =3D s->int_sense;
> > +        break;
> > +    case 0x48: /* Interrupt Both Edge Trigger Control */
> > +        val =3D s->int_dual_edge;
> > +        break;
> > +    case 0x50: /* Interrupt Event */
> > +        val =3D s->int_event;
> > +        break;
> > +    case 0x60: /* Edge Triggered Interrupt Status */
> > +        val =3D s->edge_status;
> > +        break;
> > +        /* Illegal */
> > +    case 0x28: /* Interrupt Enable Clear */
> > +    case 0x38: /* Software Interrupt Clear */
> > +    case 0x58: /* Edge Triggered Interrupt Clear */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "Read of write-only register with offset 0x%" HWADDR_P=
RIx "\n",
> > +                offset);
> > +        val =3D 0;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> > +                TYPE_ASPEED_VIC, __func__, offset);
> > +        val =3D 0;
> > +        break;
> > +    }
> > +    if (high) {
> > +        val >>=3D 32;
> > +        val &=3D AVIC_H_MASK;
>=20
>  val =3D extract64(val, 32, 15);  ?

Will do.

>=20
> > +    }
> > +    trace_aspeed_vic_read(offset, size, val);
> > +    return val;
> > +}
> > +
> > +static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t dat=
a,
> > +                             unsigned size)
> > +{
> > +    const bool high =3D !!(offset & 0x4);
> > +    const hwaddr n_offset =3D (offset & ~0x4);
> > +    AspeedVICState *s =3D (AspeedVICState *)opaque;
> > +
> > +    trace_aspeed_vic_write(offset, size, data);
> > +
> > +    if (high) {
> > +        data &=3D AVIC_H_MASK;
> > +        data <<=3D 32;
> > +    } else {
> > +        data &=3D AVIC_L_MASK;
> > +    }
> > +
> > +    switch (n_offset) {
> > +    case 0x18: /* Interrupt Selection */
> > +        if (high) {
> > +            s->int_select &=3D AVIC_L_MASK;
> > +        } else {
> > +            s->int_select &=3D ((UINT64_C(0) | AVIC_H_MASK) << 32);
> > +        }
> > +        s->int_select |=3D data;
> > +        break;
> > +    case 0x20: /* Interrupt Enable */
> > +        s->int_enable |=3D data;
>=20
> Are you sure this only ORs in new 1 bits?
>=20
> I suspect you may want s->value =3D deposit64(s->value, start, length, da=
ta)
> for at least some of these registers.

I agree.

>=20
> > +        break;
> > +    case 0x28: /* Interrupt Enable Clear */
> > +        s->int_enable &=3D ~data;
> > +        break;
> > +    case 0x30: /* Software Interrupt */
> > +        s->int_trigger |=3D data;
> > +        break;
> > +    case 0x38: /* Software Interrupt Clear */
> > +        s->int_trigger &=3D ~data;
> > +        break;
> > +    case 0x50: /* Interrupt Event */
> > +        s->int_event &=3D ~AVIC_INT_EVENT_W_MASK;
> > +        s->int_event |=3D (data & AVIC_INT_EVENT_W_MASK);
> > +        break;
> > +    case 0x58: /* Edge Triggered Interrupt Clear */
> > +        s->edge_status &=3D ~data;
> > +        break;
> > +    case 0x00: /* IRQ Status */
> > +    case 0x08: /* FIQ Status */
> > +    case 0x10: /* Raw Interrupt Status */
> > +    case 0x40: /* Interrupt Sensitivity */
> > +    case 0x48: /* Interrupt Both Edge Trigger Control */
> > +    case 0x60: /* Edge Triggered Interrupt Status */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "Write of read-only register with offset 0x%" HWADDR_P=
RIx "\n",
> > +                offset);
> > +        break;
> > +
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> > +                TYPE_ASPEED_VIC, __func__, offset);
> > +        break;
> > +    }
> > +    aspeed_vic_update(s);
> > +}
> > +
> > +static const MemoryRegionOps aspeed_vic_ops =3D {
> > +    .read =3D aspeed_vic_read,
> > +    .write =3D aspeed_vic_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +    .valid.min_access_size =3D 4,
> > +    .valid.max_access_size =3D 4,
> > +    .valid.unaligned =3D false,
> > +};
> > +
> > +static void aspeed_vic_reset(DeviceState *dev)
> > +{
> > +    AspeedVICState *s =3D ASPEED_VIC(dev);
> > +
> > +    s->int_select =3D 0;
> > +    s->int_enable =3D 0;
> > +    s->int_trigger =3D 0;
> > +    s->int_sense =3D (UINT64_C(0x1F07) << 32) | 0xFFF8FFFF;
> > +    s->int_dual_edge =3D (UINT64_C(0xF8) << 32) | 0x00070000;
> > +    s->int_event =3D (UINT64_C(0x5F07) << 32) | 0xFFF8FFFF;
>=20
> Just do s->whatever =3D 0x123456789abcdef0ULL .

Will do

>=20
> > +    s->edge_status =3D 0;
> > +}
> > +
> > +static void aspeed_vic_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +    AspeedVICState *s =3D ASPEED_VIC(dev);
> > +
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_vic_ops, s,
> > +                          TYPE_ASPEED_VIC, 0x20000);
> > +
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +
> > +    qdev_init_gpio_in(dev, aspeed_vic_set_irq, ASPEED_VIC_NR_IRQS);
> > +    sysbus_init_irq(sbd, &s->irq);
> > +    sysbus_init_irq(sbd, &s->fiq);
> > +}
> > +
> > +static void aspeed_vic_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    dc->realize =3D aspeed_vic_realize;
> > +    dc->reset =3D aspeed_vic_reset;
> > +    dc->desc =3D "ASPEED Interrupt Controller (New)";
>=20
> You should have a VMState and register it here.

Will do.

>=20
> > +}
> > +
> > +static const TypeInfo aspeed_vic_info =3D {
> > +    .name =3D TYPE_ASPEED_VIC,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedVICState),
> > +    .class_init =3D aspeed_vic_class_init,
> > +};
> > +
> > +static void aspeed_vic_register_types(void)
> > +{
> > +    type_register_static(&aspeed_vic_info);
> > +}
> > +
> > +type_init(aspeed_vic_register_types);
> > diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.=
h
> > new file mode 100644
> > index 0000000..43b2ec6
> > --- /dev/null
> > +++ b/include/hw/intc/aspeed_vic.h
> > @@ -0,0 +1,40 @@
> > +/*
> > + * ASPEED Interrupt Controller (New)
> > + *
> > + * Andrew Jeffery <andrew@aj.id.au>
> > + *
> > + * Copyright 2015 IBM Corp.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + *
> > + * Need to add SVIC and CVIC support
> > + */
> > +#ifndef ASPEED_VIC_H
> > +#define ASPEED_VIC_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_VIC "aspeed.vic"
> > +#define ASPEED_VIC(obj) OBJECT_CHECK(AspeedVICState, (obj), TYPE_ASPEE=
D_VIC)
> > +
> > +#define ASPEED_VIC_NR_IRQS 51
> > +
> > +typedef struct AspeedVICState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    MemoryRegion iomem;
> > +    uint64_t int_select;
> > +    uint64_t int_enable;
> > +    uint64_t int_trigger;
> > +    uint64_t int_sense;
> > +    uint64_t int_dual_edge;
> > +    uint64_t int_event;
> > +    uint64_t edge_status;
> > +    qemu_irq irq;
> > +    qemu_irq fiq;
>=20
> You might like to order the fields in this struct so all the ones which
> aren't device state that needs to be saved (iomem, irqs) are first,
> and then all the fields corresponding to device hw state.

Will do.

>=20
> > +} AspeedVICState;
> > +
> > +#endif /* ASPEED_VIC_H */
> > diff --git a/trace-events b/trace-events
> > index 5325a23..5718bdf 100644
> > --- a/trace-events
> > +++ b/trace-events
> > @@ -1899,3 +1899,12 @@ aspeed_timer_ctrl_op_overflow_interrupt(uint8_t =
i, bool enable) "Overflow interr
> >  aspeed_timer_set_ctrl2(uint32_t value) "CTRL2 set to 0x%" PRIx32
> >  aspeed_timer_set_value(int timer, int reg, uint32_t value) "Write to r=
egister %d of timer %d: 0x%" PRIx32
> >  aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "Rea=
d at 0x%" PRIx64 ": of size %u 0x%" PRIx64
> > +
> > +# hw/intc/aspeed_vic.c
> > +aspeed_vic_set_irq(int irq, int level) "Enabling IRQ %d: %d"
> > +aspeed_vic_update_fiq(int flags) "Raising FIQ %d"
> > +aspeed_vic_update_all_fiq(void) "All IRQs marked as fast"
> > +aspeed_vic_update_i(int irq) "Raising IRQ %d"
> > +aspeed_vic_update_none(void) "Lowering IRQs"
> > +aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "Read =
at 0x%" PRIx64 " of size %u: 0x% " PRIx64
> > +aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "Write=
 at 0x% " PRIx64 " of size %u: %0x" PRIx64
>=20
> Third argument is a uint32_t but format string is PRIx64 ?

Turns out there are several issues with the the traces I've added, none
of them good. I had tested the tracing by enabling the simple backend
(following docs/tracing.txt), which ignored all the problems :( I'll be
more thorough in the future.

>=20
> thanks
> -- PMM

--=-I6Ju+7/KZL5DMH3qtbOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW1j1YAAoJEJ0dnzgO5LT5uuwP+gM4AqerOHtRbhQzSqdBhkP/
qSycPeID65E+XvTMKKxjE1H3fook0uGMCySYkR4vCIdvDko9EEXy78FT7T7y+1c9
OdH0AkTi2I5dZe/+lM5h8qYVihNWQFj3QddvG9mhYqQc4RmeovNC0/LTZhV8Kk/T
PVhfhdPmL+8IMka466u/jTDw/bNNMkpFpxee6WWnw+yw5fMidC2HSf5LPPhN8TZZ
joIdsoe5n/aKafi0fRBoKOY7BVR2Fa+eGPHMGKtih+b2hWJtFvZBMorTA6roCo9B
gNqBxLmvEhuhDjhl4EBEJwqa5GxR1TpLDXVO9lDNM5zcvBy+y91EK3OLsiFh6je+
cejXXihrDHw7Z7uUnEVjHdNs8Ic8h1jT2xwD88v4lhjKzaG6g8gtB8pHME28g1qJ
mgksa48W1T7zTL+zKUVhRQjpwFIuBt1zNPJUR/KKJHiVUy9D6e2/95pWl7Y7Kz2P
XPBtXjB4K/FzZqpc9FgK5XTGObdLzc5hYTZ6Zj25C34js2JOV8AEoEZeAc7OM/kO
/9fPLI7rnrClF+IYALu+2C0UTVgH33dtNcIxAHPFzGKnTfUm6bztb6JcVFGR5l2a
JUdlUShVK5K8/ysNoXvnINXgjmR53ksTsggR64U0iXHgvgSpl8lbAHfZx8HIRj+r
zzKTN9iFESRUZNdPPI4S
=dNTn
-----END PGP SIGNATURE-----

--=-I6Ju+7/KZL5DMH3qtbOv--
