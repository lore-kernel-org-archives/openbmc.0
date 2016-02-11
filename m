Return-Path: <clg@fr.ibm.com>
Received: from e06smtp08.uk.ibm.com (e06smtp08.uk.ibm.com [195.75.94.104])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 319A61A003D
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 01:33:00 +1100 (AEDT)
Received: from localhost
 by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@fr.ibm.com>;
 Thu, 11 Feb 2016 14:32:57 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 14:32:54 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@fr.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 25D2D1B08061
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:33:08 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
 [9.149.37.248])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BEWsfJ31260892
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:32:54 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BEWr2t003687
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 09:32:53 -0500
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1BEWrd1003663; Thu, 11 Feb 2016 09:32:53 -0500
Received: from [9.167.239.38] (icon-9-167-239-38.megacenter.de.ibm.com
 [9.167.239.38])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 0E00C220586;
 Thu, 11 Feb 2016 15:32:51 +0100 (CET)
Subject: Re: [PATCH 1/3] timers: Add ASPEED AST2400 timer device model
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
 <1454478393-11973-2-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>
Message-ID: <56BC9B91.1090806@fr.ibm.com>
Date: Thu, 11 Feb 2016 15:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454478393-11973-2-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021114-0033-0000-0000-000005B0D3D9
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
X-List-Received-Date: Thu, 11 Feb 2016 14:33:02 -0000

Hello Andrew,

Some comments below. 

On 02/03/2016 06:46 AM, Andrew Jeffery wrote:
> Implement basic AST2400 timer functionality: Timers can be configured,
> enabled, reset and disabled.
> 
> A number of hardware features are not implemented:
> 
> * Clock selection (internal vs external)
> * Timer Overflow interrupts
> * Clock value matching
> * Pulse generation
> 
> The implementation is enough to boot the Linux kernel configured with
> aspeed_defconfig.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/aspeed_timer.c         | 301 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/aspeed_timer.h |  52 +++++++
>  3 files changed, 354 insertions(+)
>  create mode 100644 hw/timer/aspeed_timer.c
>  create mode 100644 include/hw/timer/aspeed_timer.h
> 
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 133bd0d..c22ccf3 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
> +common-obj-y += aspeed_timer.o

Don't we have a config option for ASPEED ? It would look better.
  
>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> new file mode 100644
> index 0000000..88b5cef
> --- /dev/null
> +++ b/hw/timer/aspeed_timer.c
> @@ -0,0 +1,301 @@
> +/*
> + *  ASPEED AST2400 Timer
> + *
> + *  Andrew Jeffery <andrew@aj.id.au>
> + *
> + *  Copyright (C) 2015 IBM Corp.
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
> +
> +#define TIMER_NUM_TIMERS 8
> +#define TIMER_NUM_REGS 4
> +
> +#define TIMER_CTRL 0
> +#define TIMER_CTRL2 1
> +#define TIMER_CTRL_BITS 4
> +
> +#ifdef DEBUG
> +# define DPRINTF(format, ...) fprintf(stderr, format , ## __VA_ARGS__)
> +#else
> +# define DPRINTF(format, ...) do { } while (0)
> +#endif

We should use trace events instead of printfs.

> +static void aspeed_timer_update(AspeedTimer *t)
> +{
> +    if (t->enabled) {
> +        qemu_irq_raise(t->irq);
> +    } else {
> +        qemu_irq_lower(t->irq);
> +    }
> +}
> +
> +static void aspeed_timer_tick(void *opaque)
> +{
> +    AspeedTimer *t = opaque;
> +
> +    aspeed_timer_update(t);
> +}
> +
> +#define L_OFFSET_TO_TIMER(o) (o / (TIMER_NUM_REGS * sizeof(uint32_t)))
> +#define H_OFFSET_TO_TIMER(o) (L_OFFSET_TO_TIMER((o) - 0x40) + 4)
> +#define OFFSET_TO_REG(o) ((o / sizeof(uint32_t)) % TIMER_NUM_REGS)

These defines looks complex to me. See a proposal below.

> +static uint64_t aspeed_timer_get_value(AspeedTimerState *s, int timer, int reg)
> +{
> +    if (timer > TIMER_NUM_TIMERS) {
> +        qemu_log_mask(LOG_UNIMP, "Programming error, unknown timer: %d\n",
> +                      timer);
> +        return 0;
> +    }

I am not sure we need this test. It would mean we got something wrong 
in aspeed_timer_read() which can not happen with the arithmetic we are 
doing. 

> +    switch (reg) {
> +    case 0: /* Status */
> +        return ptimer_get_count(s->timers[timer].timer);
> +    case 1: /* Reload */
> +        return s->timers[timer].reload;
> +    case 2: /* First match */
> +    case 3: /* Second match */
> +        return s->timers[timer].match[reg - 2];
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %d\n",
> +                      reg);
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
> +{

If we define :

	int reg = (offset & 0xf) / 4;

then we can use it below :

> +    AspeedTimerState *s = opaque;
> +    switch (offset) {
> +    case 0x30: /* Control Register */
> +        return s->control[TIMER_CTRL];
> +    case 0x34: /* Control Register 2 */
> +        return s->control[TIMER_CTRL2];
> +    case 0x00 ... 0x2c: /* Timers 1 - 4 */
> +        return aspeed_timer_get_value(s, L_OFFSET_TO_TIMER(offset),
> +                                      OFFSET_TO_REG(offset));

           return aspeed_timer_get_value(s, (offset >> 4) + 1, reg);

> +    case 0x40 ... 0x8c: /* Timers 5 - 8 */
> +        return aspeed_timer_get_value(s, H_OFFSET_TO_TIMER(offset),
> +                                      OFFSET_TO_REG(offset));

           return aspeed_timer_get_value(s, (offset >> 4), reg);

I believe this is correct and does the same ? 

> +    /* Illegal */
> +    case 0x38:
> +    case 0x3C:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %x\n", __func__,
> +                      (int)offset);
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static void aspeed_timer_set_value(AspeedTimerState *s, int timer, int reg,
> +                                   uint32_t value)
> +{
> +    AspeedTimer *t;
> +
> +    if (timer > TIMER_NUM_TIMERS) {
> +        qemu_log_mask(LOG_UNIMP, "Programming error, unknown timer: %d\n",
> +                      timer);
> +        return;
> +    }
> +    t = &s->timers[timer];
> +    switch (reg) {
> +    case 0: /* Status */
> +        ptimer_get_count(t->timer);
> +        break;
> +    case 1: /* Reload */
> +        t->reload = value;
> +        ptimer_set_limit(t->timer, value, 1);
> +        break;
> +    case 2: /* First match */
> +    case 3: /* Second match */
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
> +static void aspeed_timer_set_ctrl(AspeedTimerState *s, uint32_t new)
> +{
> +    int i;
> +    uint32_t changed = s->control[TIMER_CTRL] ^ new;
> +
> +    while (32 > (i = ctz32(changed))) {
> +        int timer, op;
> +        bool set;
> +        AspeedTimer *t;
> +
> +        timer = i / TIMER_CTRL_BITS;
> +        assert(timer < TIMER_NUM_TIMERS);
> +        t = &s->timers[timer];
> +        op = i % TIMER_CTRL_BITS;
> +        set = new & (1U << i);
> +        switch (op) {
> +        case 0: /* Timer Enable */
> +            if (set) {
> +                ptimer_run(t->timer, 0);
> +                DPRINTF("Timer %d (%p) running\n", timer, t->timer);
> +            } else {
> +                DPRINTF("Stopping timer %d\n", timer);
> +                ptimer_stop(t->timer);
> +                ptimer_set_limit(t->timer, t->reload, 1);
> +            }
> +            t->enabled = set;
> +            break;
> +        case 1: /* Clock Selection */
> +            if (set) {
> +                DPRINTF("External clock\n");
> +            } else {
> +                DPRINTF("Internal clock\n");
> +            }

if we are interested with these debug messages, may be we could use a 
global trace event for the routine aspeed_timer_set_ctrl() and remove 
all the DPRINTF()

> +            break;
> +        case 2: /* Overflow Interrupt */
> +            if (set) {
> +                DPRINTF("Overflow interrupt enabled\n");
> +            } else {
> +                DPRINTF("Overflow interrupt disabled\n");
> +            }
> +            break;
> +        case 3: /* Pulse Generation and Output Enable */
> +            if (timer < 4) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Timer %d does not support pulse mode\n", timer);
> +            } else if (set) {
> +                DPRINTF("Pulse enabled\n");
> +            } else {
> +                DPRINTF("Pulse disabled\n");
> +            }
> +            break;
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "Programming error, unexpected op: %d\n",
> +                          op);
> +            break;
> +        }
> +        changed &= ~(1U << i);
> +    }
> +    s->control[TIMER_CTRL] = new;
> +}
> +
> +static void aspeed_timer_set_ctrl2(AspeedTimerState *s, uint32_t value)
> +{
> +    DPRINTF("value=0x%" PRIx32 "\n", value);
> +}
> +
> +static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
> +                               unsigned size)
> +{
> +    AspeedTimerState *s = opaque;
> +    uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
> +
> +    if (size != sizeof(uint32_t)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Unexpected register write size: %d\n",
> +                      size);
> +        return;
> +    }

This should be caught by the MemoryRegionOps ops if you define :

	.min_access_size = 4,
        .max_access_size = 4,

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
> +        aspeed_timer_set_value(s, L_OFFSET_TO_TIMER(offset),
> +                               OFFSET_TO_REG(offset), tv);

same remark than for the read.

> +        break;
> +    case 0x40 ... 0x8c:
> +        aspeed_timer_set_value(s, H_OFFSET_TO_TIMER(offset),
> +                               OFFSET_TO_REG(offset), tv);
> +        break;
> +    /* Illegal */
> +    case 0x38:
> +    case 0x3C:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %" HWADDR_PRIx "\n",
> +                __func__, offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps aspeed_timer_ops = {
> +    .read = aspeed_timer_read,
> +    .write = aspeed_timer_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void aspeed_timer_init(AspeedTimer *t, uint32_t freq)
> +{
> +    QEMUBH *bh;
> +
> +    bh = qemu_bh_new(aspeed_timer_tick, t);
> +    assert(bh);
> +    t->timer = ptimer_init(bh);
> +    assert(t->timer);
> +    ptimer_set_freq(t->timer, freq);
> +}
> +
> +static void aspeed_timers_realize(DeviceState *dev, Error **errp)
> +{
> +    int i;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedTimerState *s = ASPEED_TIMER(dev);
> +
> +    /* Hard-code the APB 24MHz clock rate for the moment */
> +    for (i = 0; i < TIMER_NUM_TIMERS; i++) {

we could use ARRAY_SIZE() instead of TIMER_NUM_TIMERS

> +        aspeed_timer_init(&s->timers[i], 24000000);

The freq can be changed with the control register 1. May be we could 
have a freq attribute to  struct AspeedTimer to begin with ? 

> +        sysbus_init_irq(sbd, &s->timers[i].irq);
> +    }
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
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> new file mode 100644
> index 0000000..d6e0efc
> --- /dev/null
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -0,0 +1,52 @@
> +/*
> + *  ASPEED AST2400 Timer
> + *
> + *  Andrew Jeffery <andrew@aj.id.au>
> + *
> + *  Copyright (C) 2016 IBM Corp.
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
> +#ifndef ASPEED_TIMER_H
> +#define ASPEED_TIMER_H
> +
> +#include "hw/ptimer.h"
> +
> +#define ASPEED_TIMER(obj) \
> +    OBJECT_CHECK(AspeedTimerState, (obj), TYPE_ASPEED_TIMER);
> +#define TYPE_ASPEED_TIMER "aspeed.timer"
> +#define TIMER_BASE 0x1E782000

I think this address define should be in ast2400.c

> +#define TIMER_NR_TIMERS 8

May be use a ASPEED_ prefix to protect the namespace.

#define ASPEED_TIMER_NR_TIMERS 8

> +
> +typedef struct AspeedTimer {
> +    ptimer_state *timer;
> +    uint32_t reload;
> +    uint32_t match[2];
> +    qemu_irq irq;
> +    bool enabled;

freq ? just to say we might need to take it into account ? 

C.
 
> +} AspeedTimer;
> +
> +typedef struct AspeedTimerState {
> +    /* < private > */
> +    SysBusDevice parent;
> +
> +    /* < public > */
> +    MemoryRegion iomem;
> +    AspeedTimer timers[TIMER_NR_TIMERS];
> +    uint32_t control[2];
> +    qemu_irq irq;
> +} AspeedTimerState;
> +
> +#endif /* ASPEED_TIMER_H */
> 
