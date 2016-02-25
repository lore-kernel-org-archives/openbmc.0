Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5486D1A0008
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 03:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=Gf5qSjQQ; 
 dkim-atps=neutral
Received: by mail-vk0-x22a.google.com with SMTP id e6so51774533vkh.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 08:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;
 bh=HzED5WebM0ijLIpotJ4PKxxQTI6SnMJ8FgYIjHBLsxg=;
 b=Gf5qSjQQXDZoPAAI10iMXvrlMUTakN9poAXj/N11KJ16kIOW/yDWPkIf1wIpE6TKj+
 IUbQtJlWrxqZSoPAIU9Pl8G0AQuDYU10wc/JJVTAwr3fzaPL22URndt1f8rS8zQCQGU0
 38E/z6RApZEqzLWWPHXzs5cL+UQgNkMdTcsHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-type;
 bh=HzED5WebM0ijLIpotJ4PKxxQTI6SnMJ8FgYIjHBLsxg=;
 b=ftNTXkoU5jnwjK79eU0JJ/5h1cR+8qdvSKmCiV24f70+oJgkUSgSe0Ro4ykUkhe81/
 7OzSWNpwPozo1/hDiqJr8OgloAacDxVHOLe2j2CNC16u1leWlFEA6con2pvPtKDLe2OG
 SmiVX6O7aLi+aa1qLAlhsYrIisAYI/5+e+9NxXhomd1dfXchBmBF/6PxwDhfQxBvjqFX
 QTy9SFhBd5FF4r0BlJIdkcP441oLmdxg+rinajh0tQYNdgYjsajC38/WR8+21wQDSZ+R
 9zlA+pRjtqEeC05fHhER2EusZ+DRuoEnw2lGMZp89nGKlgG7vDC1kHrMr+qdV8h+DuHm
 Qq3g==
X-Gm-Message-State: AG10YOTbacuNgHmAXW4lZqoxi8uYNrsyqCqaYu+SxdjRZf8ApgR4IfcTw9pfvAOS2sMQTOhzoS0WQFbQuw2+wS9x
X-Received: by 10.31.131.199 with SMTP id f190mr37953875vkd.90.1456416733325; 
 Thu, 25 Feb 2016 08:12:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:11:53 -0800 (PST)
In-Reply-To: <1455622497-25966-2-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:11:53 +0000
Message-ID: <CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer
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
X-List-Received-Date: Thu, 25 Feb 2016 16:12:18 -0000

On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> Implement basic AST2400 timer functionality: Timers can be configured,
> enabled, reset and disabled.
>
> A number of hardware features are not implemented:
>
> * Timer Overflow interrupts
> * Clock value matching
> * Pulse generation
>
> The implementation is enough to boot the Linux kernel configured with
> aspeed_defconfig.

Thanks; this mostly looks in reasonable shape; I have some comments below.

Do we have a datasheet for this chip ?

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  default-configs/arm-softmmu.mak |   2 +
>  hw/timer/Makefile.objs          |   2 +
>  hw/timer/aspeed_timer.c         | 313 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/aspeed_timer.h |  55 +++++++
>  trace-events                    |   9 ++
>  5 files changed, 381 insertions(+)
>  create mode 100644 hw/timer/aspeed_timer.c
>  create mode 100644 include/hw/timer/aspeed_timer.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index a9f82a1..4072174 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -110,3 +110,5 @@ CONFIG_IOH3420=y
>  CONFIG_I82801B11=y
>  CONFIG_ACPI=y
>  CONFIG_SMBIOS=y
> +
> +CONFIG_ASPEED_SOC=y
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 133bd0d..f6f7351 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -33,3 +33,5 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
>  obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
>
>  common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
> +
> +common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> new file mode 100644
> index 0000000..0359528
> --- /dev/null
> +++ b/hw/timer/aspeed_timer.c
> @@ -0,0 +1,313 @@
> +/*
> + *  ASPEED AST2400 Timer
> + *
> + *  Andrew Jeffery <andrew@aj.id.au>
> + *
> + *  Copyright (C) 2015, 2016 IBM Corp.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, write to the Free Software Foundation, Inc.,
> + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#include <assert.h>
> +#include <stdio.h>
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "qemu-common.h"
> +#include "hw/ptimer.h"
> +#include "qemu/main-loop.h"
> +#include "hw/timer/aspeed_timer.h"
> +#include "trace.h"

All source files need to #include "qemu/osdep.h" as their first
include. That then means you don't need to include assert.h or
stdio.h yourself.

What do we need from qemu/main-loop.h?

> +
> +#define TIMER_NR_REGS 4
> +
> +#define TIMER_CTRL_BITS 4
> +
> +#define TIMER_CLOCK_USE_EXT true
> +#define TIMER_CLOCK_EXT_HZ 1000000
> +#define TIMER_CLOCK_USE_APB false
> +#define TIMER_CLOCK_APB_HZ 24000000
> +
> +#define TIMER_CTRL_OP_ENABLE 0
> +#define TIMER_CTRL_OP_CLOCK_SELECT 1
> +#define TIMER_CTRL_OP_OVERFLOW_INTERRUPT 2
> +#define TIMER_CTRL_OP_PULSE_ENABLE 3
> +
> +#define TIMER_REG_STATUS 0
> +#define TIMER_REG_RELOAD 1
> +#define TIMER_REG_MATCH_FIRST 2
> +#define TIMER_REG_MATCH_SECOND 3
> +
> +static inline bool timer_can_pulse(AspeedTimer *t)
> +{
> +    return t->id >= 4;
> +}
> +
> +static void aspeed_timer_irq_update(AspeedTimer *t)
> +{
> +    qemu_set_irq(t->irq, t->enabled);

Surely the timer doesn't assert its IRQ line all
the time it's enabled? This doesn't look like the right condition.

> +}
> +
> +static void aspeed_timer_tick(void *opaque)
> +{
> +    AspeedTimer *t = opaque;
> +
> +    aspeed_timer_irq_update(t);
> +}
> +
> +static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
> +{
> +    uint64_t value;
> +
> +    switch (reg) {
> +    case TIMER_REG_STATUS:
> +        value = ptimer_get_count(t->timer);
> +        break;
> +    case TIMER_REG_RELOAD:
> +        value = t->reload;
> +        break;
> +    case TIMER_REG_MATCH_FIRST:
> +    case TIMER_REG_MATCH_SECOND:
> +        value = t->match[reg - 2];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %d\n",
> +                      reg);
> +        value = 0;
> +        break;
> +    }
> +    return value;
> +}
> +
> +static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    AspeedTimerState *s = opaque;
> +    const int reg = (offset & 0xf) / 4;
> +    uint64_t value;
> +
> +    switch (offset) {
> +    case 0x30: /* Control Register */
> +        value = s->ctrl;
> +        break;
> +    case 0x34: /* Control Register 2 */
> +        value = s->ctrl2;
> +        break;
> +    case 0x00 ... 0x2c: /* Timers 1 - 4 */
> +        value = aspeed_timer_get_value(&s->timers[(offset >> 4)], reg);
> +        break;
> +    case 0x40 ... 0x8c: /* Timers 5 - 8 */
> +        value = aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], reg);
> +        break;
> +    /* Illegal */
> +    case 0x38:
> +    case 0x3C:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> +                __func__, offset);
> +        value = 0;
> +        break;
> +    }
> +    trace_aspeed_timer_read(offset, size, value);
> +    return value;
> +}
> +
> +static void aspeed_timer_set_value(AspeedTimerState *s, int timer, int reg,
> +                                   uint32_t value)
> +{
> +    AspeedTimer *t;
> +
> +    assert(timer >= 0 && timer < ASPEED_TIMER_NR_TIMERS &&
> +            "Programming error: Unexpected timer index");
> +    trace_aspeed_timer_set_value(timer, reg, value);
> +    t = &s->timers[timer];
> +    switch (reg) {
> +    case TIMER_REG_STATUS:
> +        if (t->enabled) {
> +            ptimer_set_count(t->timer, value);
> +        }
> +        break;
> +    case TIMER_REG_RELOAD:
> +        t->reload = value;
> +        ptimer_set_limit(t->timer, value, 1);
> +        break;
> +    case TIMER_REG_MATCH_FIRST:
> +    case TIMER_REG_MATCH_SECOND:
> +        /* Nothing is done to make matching work, we just record the value */
> +        t->match[reg - 2] = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %d\n",
> +                      reg);
> +        break;
> +    }
> +}
> +
> +static void aspeed_timer_ctrl_op(AspeedTimer *t, int op, bool set)
> +{
> +    switch (op) {
> +    case TIMER_CTRL_OP_ENABLE:
> +        trace_aspeed_timer_ctrl_op_timer_enable(t->id, set);
> +        if (set) {
> +            ptimer_run(t->timer, 0);
> +        } else {
> +            ptimer_stop(t->timer);
> +            ptimer_set_limit(t->timer, t->reload, 1);
> +        }
> +        t->enabled = set;

Is this enabled bit really separate state within the h/w from
the bit in the control register? Storing the same state twice
in different places in the qemu device state struct is usually
a bad idea if you can avoid it.

> +        break;
> +    case TIMER_CTRL_OP_CLOCK_SELECT:
> +        trace_aspeed_timer_ctrl_op_clock_select(t->id, set);
> +        if (set) {
> +            ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
> +        } else {
> +            ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
> +        }
> +        break;
> +    case TIMER_CTRL_OP_OVERFLOW_INTERRUPT:
> +        trace_aspeed_timer_ctrl_op_overflow_interrupt(t->id, set);
> +        break;
> +    case TIMER_CTRL_OP_PULSE_ENABLE:
> +        if (timer_can_pulse(t)) {
> +            trace_aspeed_timer_ctrl_op_pulse_enable(t->id, set);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                    "Timer does not support pulse mode\n");
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Programming error, unexpected op: %d\n",
> +                op);
> +        break;
> +    }
> +}
> +
> +static void aspeed_timer_set_ctrl(AspeedTimerState *s, uint32_t new)
> +{
> +    int i;
> +    uint32_t changed = s->ctrl ^ new;
> +
> +    while (32 > (i = ctz32(changed))) {
> +        int timer, op;
> +        bool set;
> +        AspeedTimer *t;
> +
> +        timer = i / TIMER_CTRL_BITS;
> +        assert(timer < ASPEED_TIMER_NR_TIMERS);
> +        t = &s->timers[timer];
> +        op = i % TIMER_CTRL_BITS;
> +        set = new & (1U << i);
> +        aspeed_timer_ctrl_op(t, op, set);
> +        changed &= ~(1U << i);
> +    }

This is effectively processing the bits in order from
low to high (and doing the loop-through-bits in a confusing
to read way as well). That doesn't seem right to me --
if the guest does one write to say "enable timer with this clock"
then you want to first pick the right clock and then enable
the timer, not enable the timer first and then change the
frequency. (Conversely if the guest writes to disable the timer
you want to disable it first and then reconfigure it.)

> +    s->ctrl = new;
> +}
> +
> +static void aspeed_timer_set_ctrl2(AspeedTimerState *s, uint32_t value)
> +{
> +    trace_aspeed_timer_set_ctrl2(value);
> +}
> +
> +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
> +                               unsigned size)
> +{
> +    const uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
> +    const int reg = (offset & 0xf) / 4;
> +    AspeedTimerState *s = opaque;
> +
> +    switch (offset) {
> +    /* Control Registers */
> +    case 0x30:
> +        aspeed_timer_set_ctrl(s, tv);
> +        break;
> +    case 0x34:
> +        aspeed_timer_set_ctrl2(s, tv);
> +        break;
> +    /* Timer Registers */
> +    case 0x00 ... 0x2c:
> +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
> +        break;
> +    case 0x40 ... 0x8c:
> +        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv);
> +        break;
> +    /* Illegal */
> +    case 0x38:
> +    case 0x3C:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> +                __func__, offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_timer_ops = {
> +    .read = aspeed_timer_read,
> +    .write = aspeed_timer_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .valid.unaligned = false,
> +};
> +
> +static void aspeed_timer_init(AspeedTimer *t, uint8_t id, bool ext_clock)

You should call this aspeed_init_one_timer() or something,
because with this function name it looks like it ought to
be the instance_init function for the class.

> +{
> +    QEMUBH *bh;
> +
> +    t->id = id;
> +    bh = qemu_bh_new(aspeed_timer_tick, t);
> +    assert(bh);
> +    t->timer = ptimer_init(bh);
> +    assert(t->timer);
> +    aspeed_timer_ctrl_op(t, TIMER_CTRL_OP_CLOCK_SELECT, ext_clock);
> +}
> +
> +static void aspeed_timers_realize(DeviceState *dev, Error **errp)

Stray 's' in function name.

> +{
> +    int i;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedTimerState *s = ASPEED_TIMER(dev);
> +    uint32_t clock_mask = 0;
> +
> +    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
> +        aspeed_timer_init(&s->timers[i], i, TIMER_CLOCK_USE_APB);
> +        clock_mask |= (1 << (1 + i * TIMER_CTRL_BITS));
> +        sysbus_init_irq(sbd, &s->timers[i].irq);
> +    }
> +    /* Ensure control reg has timers configured with APB clock selected */
> +    s->ctrl &= ~clock_mask;

Reset of register values should go in your device's reset
function (which you need to implement and register as dc->reset).

> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_timer_ops, s,
> +                          TYPE_ASPEED_TIMER, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = aspeed_timers_realize;
> +    dc->desc = "ASPEED Timer";

You should implement a VMState struct for device migration,
and wire it up here via dc->vmsd.

> +}
> +
> +static const TypeInfo aspeed_timer_info = {
> +    .name = TYPE_ASPEED_TIMER,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedTimerState),
> +    .class_init = timer_class_init,
> +};
> +
> +static void aspeed_timer_register_types(void)
> +{
> +    type_register_static(&aspeed_timer_info);
> +}
> +
> +type_init(aspeed_timer_register_types);

Usual convention is to omit the ';' on type_init() etc, though as usual
there is some code in the tree that doesn't do so.

thanks
-- PMM
