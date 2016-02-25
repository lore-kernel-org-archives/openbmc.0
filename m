Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E87701A0063
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 03:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=Id3qnvsI; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id e6so52317642vkh.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 08:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;
 bh=dNGBFt0gjQdj3szRvNCxjlGvSr2Vd9xfGrxS3d76LQo=;
 b=Id3qnvsIV9IZJt29cMY+JgzousscOBrWULj/qKtZDn4ovGJ1Nrimv2voX6DZNZq5/u
 rH9ajCz+MrZgQ5r3BiPvnT/kX0eT5FOaP/OMHXRlS7F6dSdawpg9t1MY9+up7nx/gEub
 3kjtNU6ZQuX5rGBPsN9xKHiXPCUSvBNePhHXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-type;
 bh=dNGBFt0gjQdj3szRvNCxjlGvSr2Vd9xfGrxS3d76LQo=;
 b=MjamS5mM1twhr8DjYWbilxWQSee9XcShHjC+rzut6QlWz1c+Y4rN8zjm+fBZTySndd
 7gS4fbHNeP2gtRN5s+FiLjHpdd0REbDJiwuKSS2TYiVj3Xrdexxjyib7QmXoORJj9+Bl
 M4IWs5BbZGfsQP4jGoA97tUPeXBnZnr8TfN+pLiTDps/P8jBhTN7IOD9KNxTIyei5k8s
 1amNEa/Hnlvn2K5z/ZYpW3GALTdJjh9A9Hu8NKsAKO4Xf8CV82273hAICBX7J8h5dbxX
 +ixUqCYdL9gpJtlAZfNKOxL05gbeM75amCBWIgX9s62MxSJL7FW+5IiaENtA5Mhuu76U
 orGg==
X-Gm-Message-State: AG10YOTQBOKbmPDtLO2H2kUixbMD2FVdRQeaOz439FdcMNl8mLRsy09Npom6oOVZ4jW3KhBMg5f1N3mD/DlK5Tyd
X-Received: by 10.31.131.199 with SMTP id f190mr38025845vkd.90.1456417783419; 
 Thu, 25 Feb 2016 08:29:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:29:23 -0800 (PST)
In-Reply-To: <1455622497-25966-3-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:29:23 +0000
Message-ID: <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400 AVIC
 device model
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Sat, 27 Feb 2016 03:54:25 +1100
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
X-List-Received-Date: Thu, 25 Feb 2016 16:29:49 -0000

On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> Implement a minimal ASPEED AVIC device model, enough to boot a Linux
> kernel configured with aspeed_defconfig. The VIC implements the 'new'
> register set and expects this to be reflected in the device tree.

What do we mean by "new" here? Were there multiple revisions of
this hardware?

> The implementation is a little awkward as the hardware uses 32bit
> registers to manage 51 IRQs, and makes use of low and high registers for
> each conceptual register. The model's implementation uses 64bit data
> types to store the register values but must cope with access offset values
> in multiples of 4 passed to the callbacks. As such the read() and
> write() implementations process the provided offset to understand
> whether the access is requesting the lower or upper 32bits of the 64bit
> quantity.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/intc/Makefile.objs        |   1 +
>  hw/intc/aspeed_vic.c         | 256 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/intc/aspeed_vic.h |  40 +++++++
>  trace-events                 |   9 ++
>  4 files changed, 306 insertions(+)
>  create mode 100644 hw/intc/aspeed_vic.c
>  create mode 100644 include/hw/intc/aspeed_vic.h
>
> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
> index 6a13a39..0e47f0f 100644
> --- a/hw/intc/Makefile.objs
> +++ b/hw/intc/Makefile.objs
> @@ -31,3 +31,4 @@ obj-$(CONFIG_XICS_KVM) += xics_kvm.o
>  obj-$(CONFIG_ALLWINNER_A10_PIC) += allwinner-a10-pic.o
>  obj-$(CONFIG_S390_FLIC) += s390_flic.o
>  obj-$(CONFIG_S390_FLIC_KVM) += s390_flic_kvm.o
> +obj-$(CONFIG_ASPEED_SOC) += aspeed_vic.o
> diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
> new file mode 100644
> index 0000000..c000936
> --- /dev/null
> +++ b/hw/intc/aspeed_vic.c
> @@ -0,0 +1,256 @@
> +/*
> + * ASPEED Interrupt Controller (New)
> + *
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2015, 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Based off of the i.MX31 Vectored Interrupt Controller
> + *
> + * Note that this device model does not implement the legacy register space.
> + * The assumption is that the device base address is exposed such that all
> + * offsets are calculated relative to the address of the first "new" register.

Is there real hardware that doesn't implement the legacy register
space? Should we be at least implementing it enough to do a
LOG_UNIMP log of the fact we don't implement it?

> + */
> +#include <inttypes.h>

Missing newline before #include. As with the other file, include
qemu/osdep.h first. (If you rebase on current master you'll find you
get compile errors otherwise.)

> +#include "hw/intc/aspeed_vic.h"
> +#include "trace.h"
> +
> +#define AVIC_L_MASK 0xFFFFFFFF

This needs a 'U' suffix or at least one of the compilers we build
with will complain.

> +#define AVIC_H_MASK 0x00007FFF
> +#define AVIC_INT_EVENT_W_MASK (UINT64_C(0x78000) << 32)

We generally use the ULL suffix rather than UINT64_C().

> +
> +static void aspeed_vic_update(AspeedVICState *s)
> +{
> +    int i;
> +    uint64_t new = (s->edge_status & s->int_enable);
> +    uint64_t flags;
> +
> +    flags = new & s->int_select;
> +    qemu_set_irq(s->fiq, !!flags);
> +    trace_aspeed_vic_update_fiq(!!flags);
> +
> +    flags = new & ~s->int_select;
> +    if (!flags) {
> +        qemu_set_irq(s->irq, !!flags);
> +        trace_aspeed_vic_update_all_fiq();
> +        return;
> +    }
> +
> +    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
> +        if (flags & (UINT64_C(1) << i)) {
> +            qemu_set_irq(s->irq, 1);
> +            trace_aspeed_vic_update_i(i);
> +            return;
> +        }
> +    }
> +
> +    qemu_set_irq(s->irq, 0);

I don't understand why you've written the FIQ setting code
in one (fairly straightforward) way, but the IRQ setting
code in a completely different way with an unnecessary loop
and a lot of redundant code.

> +    trace_aspeed_vic_update_none();
> +}
> +
> +static void aspeed_vic_set_irq(void *opaque, int irq, int level)
> +{
> +    AspeedVICState *s = (AspeedVICState *)opaque;
> +    if (irq > ASPEED_VIC_NR_IRQS) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Out-of-range interrupt number: %d\n",
> +                      irq);
> +        return;
> +    }
> +
> +    if (level) {
> +        s->edge_status |= (UINT64_C(1) << irq);
> +    } else {
> +        s->edge_status &= ~(UINT64_C(1) << irq);
> +    }

You can do this in one line with
   s->edge_status = deposit64(s->edge_status, irq, 1, level);

Why is the field called "edge status" when the code here appears
to be treating it as a line level? Are we missing edge-detect-and-latch
logic ?

> +
> +    trace_aspeed_vic_set_irq(irq, level);
> +    aspeed_vic_update(s);
> +}
> +
> +static uint64_t aspeed_vic_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t val;
> +    const bool high = !!(offset & 0x4);
> +    const hwaddr n_offset = (offset & ~0x4);
> +    AspeedVICState *s = (AspeedVICState *)opaque;
> +
> +    switch (n_offset) {
> +    case 0x0: /* IRQ Status */
> +        val = s->edge_status & ~s->int_select & s->int_enable;
> +        break;
> +    case 0x08: /* FIQ Status */
> +        val = s->edge_status & s->int_select & s->int_enable;
> +        break;
> +    case 0x10: /* Raw Interrupt Status */
> +        val = s->edge_status;
> +        break;
> +    case 0x18: /* Interrupt Selection */
> +        val = s->int_select;
> +        break;
> +    case 0x20: /* Interrupt Enable */
> +        val = s->int_enable;
> +        break;
> +    case 0x30: /* Software Interrupt */
> +        val = s->int_trigger;
> +        break;
> +    case 0x40: /* Interrupt Sensitivity */
> +        val = s->int_sense;
> +        break;
> +    case 0x48: /* Interrupt Both Edge Trigger Control */
> +        val = s->int_dual_edge;
> +        break;
> +    case 0x50: /* Interrupt Event */
> +        val = s->int_event;
> +        break;
> +    case 0x60: /* Edge Triggered Interrupt Status */
> +        val = s->edge_status;
> +        break;
> +        /* Illegal */
> +    case 0x28: /* Interrupt Enable Clear */
> +    case 0x38: /* Software Interrupt Clear */
> +    case 0x58: /* Edge Triggered Interrupt Clear */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "Read of write-only register with offset 0x%" HWADDR_PRIx "\n",
> +                offset);
> +        val = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> +                TYPE_ASPEED_VIC, __func__, offset);
> +        val = 0;
> +        break;
> +    }
> +    if (high) {
> +        val >>= 32;
> +        val &= AVIC_H_MASK;

 val = extract64(val, 32, 15);  ?

> +    }
> +    trace_aspeed_vic_read(offset, size, val);
> +    return val;
> +}
> +
> +static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    const bool high = !!(offset & 0x4);
> +    const hwaddr n_offset = (offset & ~0x4);
> +    AspeedVICState *s = (AspeedVICState *)opaque;
> +
> +    trace_aspeed_vic_write(offset, size, data);
> +
> +    if (high) {
> +        data &= AVIC_H_MASK;
> +        data <<= 32;
> +    } else {
> +        data &= AVIC_L_MASK;
> +    }
> +
> +    switch (n_offset) {
> +    case 0x18: /* Interrupt Selection */
> +        if (high) {
> +            s->int_select &= AVIC_L_MASK;
> +        } else {
> +            s->int_select &= ((UINT64_C(0) | AVIC_H_MASK) << 32);
> +        }
> +        s->int_select |= data;
> +        break;
> +    case 0x20: /* Interrupt Enable */
> +        s->int_enable |= data;

Are you sure this only ORs in new 1 bits?

I suspect you may want s->value = deposit64(s->value, start, length, data)
for at least some of these registers.

> +        break;
> +    case 0x28: /* Interrupt Enable Clear */
> +        s->int_enable &= ~data;
> +        break;
> +    case 0x30: /* Software Interrupt */
> +        s->int_trigger |= data;
> +        break;
> +    case 0x38: /* Software Interrupt Clear */
> +        s->int_trigger &= ~data;
> +        break;
> +    case 0x50: /* Interrupt Event */
> +        s->int_event &= ~AVIC_INT_EVENT_W_MASK;
> +        s->int_event |= (data & AVIC_INT_EVENT_W_MASK);
> +        break;
> +    case 0x58: /* Edge Triggered Interrupt Clear */
> +        s->edge_status &= ~data;
> +        break;
> +    case 0x00: /* IRQ Status */
> +    case 0x08: /* FIQ Status */
> +    case 0x10: /* Raw Interrupt Status */
> +    case 0x40: /* Interrupt Sensitivity */
> +    case 0x48: /* Interrupt Both Edge Trigger Control */
> +    case 0x60: /* Edge Triggered Interrupt Status */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "Write of read-only register with offset 0x%" HWADDR_PRIx "\n",
> +                offset);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> +                TYPE_ASPEED_VIC, __func__, offset);
> +        break;
> +    }
> +    aspeed_vic_update(s);
> +}
> +
> +static const MemoryRegionOps aspeed_vic_ops = {
> +    .read = aspeed_vic_read,
> +    .write = aspeed_vic_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .valid.unaligned = false,
> +};
> +
> +static void aspeed_vic_reset(DeviceState *dev)
> +{
> +    AspeedVICState *s = ASPEED_VIC(dev);
> +
> +    s->int_select = 0;
> +    s->int_enable = 0;
> +    s->int_trigger = 0;
> +    s->int_sense = (UINT64_C(0x1F07) << 32) | 0xFFF8FFFF;
> +    s->int_dual_edge = (UINT64_C(0xF8) << 32) | 0x00070000;
> +    s->int_event = (UINT64_C(0x5F07) << 32) | 0xFFF8FFFF;

Just do s->whatever = 0x123456789abcdef0ULL .

> +    s->edge_status = 0;
> +}
> +
> +static void aspeed_vic_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedVICState *s = ASPEED_VIC(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_vic_ops, s,
> +                          TYPE_ASPEED_VIC, 0x20000);
> +
> +    sysbus_init_mmio(sbd, &s->iomem);
> +
> +    qdev_init_gpio_in(dev, aspeed_vic_set_irq, ASPEED_VIC_NR_IRQS);
> +    sysbus_init_irq(sbd, &s->irq);
> +    sysbus_init_irq(sbd, &s->fiq);
> +}
> +
> +static void aspeed_vic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->realize = aspeed_vic_realize;
> +    dc->reset = aspeed_vic_reset;
> +    dc->desc = "ASPEED Interrupt Controller (New)";

You should have a VMState and register it here.

> +}
> +
> +static const TypeInfo aspeed_vic_info = {
> +    .name = TYPE_ASPEED_VIC,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedVICState),
> +    .class_init = aspeed_vic_class_init,
> +};
> +
> +static void aspeed_vic_register_types(void)
> +{
> +    type_register_static(&aspeed_vic_info);
> +}
> +
> +type_init(aspeed_vic_register_types);
> diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.h
> new file mode 100644
> index 0000000..43b2ec6
> --- /dev/null
> +++ b/include/hw/intc/aspeed_vic.h
> @@ -0,0 +1,40 @@
> +/*
> + * ASPEED Interrupt Controller (New)
> + *
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2015 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Need to add SVIC and CVIC support
> + */
> +#ifndef ASPEED_VIC_H
> +#define ASPEED_VIC_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_VIC "aspeed.vic"
> +#define ASPEED_VIC(obj) OBJECT_CHECK(AspeedVICState, (obj), TYPE_ASPEED_VIC)
> +
> +#define ASPEED_VIC_NR_IRQS 51
> +
> +typedef struct AspeedVICState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    uint64_t int_select;
> +    uint64_t int_enable;
> +    uint64_t int_trigger;
> +    uint64_t int_sense;
> +    uint64_t int_dual_edge;
> +    uint64_t int_event;
> +    uint64_t edge_status;
> +    qemu_irq irq;
> +    qemu_irq fiq;

You might like to order the fields in this struct so all the ones which
aren't device state that needs to be saved (iomem, irqs) are first,
and then all the fields corresponding to device hw state.

> +} AspeedVICState;
> +
> +#endif /* ASPEED_VIC_H */
> diff --git a/trace-events b/trace-events
> index 5325a23..5718bdf 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -1899,3 +1899,12 @@ aspeed_timer_ctrl_op_overflow_interrupt(uint8_t i, bool enable) "Overflow interr
>  aspeed_timer_set_ctrl2(uint32_t value) "CTRL2 set to 0x%" PRIx32
>  aspeed_timer_set_value(int timer, int reg, uint32_t value) "Write to register %d of timer %d: 0x%" PRIx32
>  aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "Read at 0x%" PRIx64 ": of size %u 0x%" PRIx64
> +
> +# hw/intc/aspeed_vic.c
> +aspeed_vic_set_irq(int irq, int level) "Enabling IRQ %d: %d"
> +aspeed_vic_update_fiq(int flags) "Raising FIQ %d"
> +aspeed_vic_update_all_fiq(void) "All IRQs marked as fast"
> +aspeed_vic_update_i(int irq) "Raising IRQ %d"
> +aspeed_vic_update_none(void) "Lowering IRQs"
> +aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "Read at 0x%" PRIx64 " of size %u: 0x% " PRIx64
> +aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "Write at 0x% " PRIx64 " of size %u: %0x" PRIx64

Third argument is a uint32_t but format string is PRIx64 ?

thanks
-- PMM
