Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sfHsTtW2"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydp8H6B4lzDrT6
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:29:19 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id p19so664150qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EucDP306u3ZRBNMJQrbhB1sfLIRdnrdmYro+LYkDB24=;
 b=sfHsTtW2PEdsY8kWcuFrklr4rzIj0ZUtpiadKUpDUPPtgJpdDd6LxJa431GLREmjGE
 fXK9ncQk/pApKFnW+Hjzq+2BvbYAHkUg1utYFWyaycYVMM8sLTUrdOcvK3+TfUJT3O9T
 Y4ddygaq1hLcJ82QoygubgTeinbERKk5Zc6XIrepUxy0uaSt4bxwO1vf+uHzTULqu2So
 5dvi1Xx1sD8mA5z6iuYttG3VSOm2nnJPH2B5NKVebZJqkqg8qFIWglIX/BOffDhR1Raz
 5okbLYsAKZbx1ng9IhH4ziAAby24JWyHCED8VXoLiX/yV0jYw4FEl9E0CXlKdVPwFmgk
 ottw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EucDP306u3ZRBNMJQrbhB1sfLIRdnrdmYro+LYkDB24=;
 b=ZaIcemD+sJsYfOyY3Om8/GYElPU6Uc2L+K1epWdxYk4NMczp8uFUTknIlZ3SHDLB6O
 lgiFkGFGYQ5JJaK5kYTTok9s8owoROQ02b3d2KYkyYloWctcJnuHcBn4q55dMxhn6WxU
 zlAdFz7O+8aJdh4it5evMkKHzuavrNoV6Bw4kN6KWRsaKMaZ2m98KpguDGzWsLkB4JWE
 k2NJW4jYtykdRezSRqrZutdUbUQBSw+YoHcZOTrNeWZXEWSQ8+jtUMtqQuBqVlaXs62M
 M/hV+CqM4Dfv1msY9R4z9w52mLLQqrbdr5I+7o9vs3VZi/h1YgJk7A5L4gTtUBesdf3s
 dqOQ==
X-Gm-Message-State: AJaThX785nLczEYAR4vAXFXaJ5DB9ZgUZ5eO671iuY/2fySj6hvP/PK7
 i0zG1M0p0I+WY7RKb4ClJR2hKq0hO0K+LxAvldxYIQ==
X-Google-Smtp-Source: AGs4zMbjcN4p662xkvLrRQGgw1uh9I14VwKZHl/pSOgeoZBYh8lx3WHI8agk+TfbcMjMNA6+8WXREWQz0bBuqdd8Xmo=
X-Received: by 10.55.201.11 with SMTP id q11mr9709791qki.303.1510946956551;
 Fri, 17 Nov 2017 11:29:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.79 with HTTP; Fri, 17 Nov 2017 11:29:15 -0800 (PST)
In-Reply-To: <1509985716-25759-2-git-send-email-tmaimon77@gmail.com>
References: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
 <1509985716-25759-2-git-send-email-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 17 Nov 2017 11:29:15 -0800
Message-ID: <CAFd5g44tDoV-9yeaZ3UCUZibW7vUMeBVQRAihB++LSC44ZO0TA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clocksource: npcm: add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Avi Fishman <avifishman70@gmail.com>, Rick Altherr <raltherr@google.com>, 
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 17 Nov 2017 19:29:20 -0000

On Mon, Nov 6, 2017 at 8:28 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Add Nuvoton BMC NPCM7xx timer driver.
>
> the clocksource Enable 24-bit TIMER0 and TIMER1 counters,
> while TIMER0 serves as clockevent and TIMER1 serves as clocksource.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/clocksource/Kconfig         |   8 ++
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/npcm7xx-timer.c | 239 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 drivers/clocksource/npcm7xx-timer.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index cc6062049170..46184af75d6c 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -140,6 +140,14 @@ config VT8500_TIMER
>         help
>           Enables support for the VT8500 driver.
>
> +config NPCM7XX_TIMER
> +       bool "NPCM7xx timer driver" if COMPILE_TEST
> +       depends on HAS_IOMEM
> +       select CLKSRC_MMIO
> +       help
> +         Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx arcithcture,
> +         While TIMER0 serves as clockevent and TIMER1 serves as clocksource.
> +
>  config CADENCE_TTC_TIMER
>         bool "Cadence TTC timer driver" if COMPILE_TEST
>         depends on COMMON_CLK
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 72711f1491e3..ff2b30b75b5b 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)   += timer-ti-32k.o
>  obj-$(CONFIG_CLKSRC_NPS)       += timer-nps.o
>  obj-$(CONFIG_OXNAS_RPS_TIMER)  += timer-oxnas-rps.o
>  obj-$(CONFIG_OWL_TIMER)                += owl-timer.o
> +obj-$(CONFIG_NPCM7XX_TIMER)    += npcm7xx-timer.o
>
>  obj-$(CONFIG_ARC_TIMERS)               += arc_timer.o
>  obj-$(CONFIG_ARM_ARCH_TIMER)           += arm_arch_timer.o
> diff --git a/drivers/clocksource/npcm7xx-timer.c b/drivers/clocksource/npcm7xx-timer.c
> new file mode 100644
> index 000000000000..b9b468da4560
> --- /dev/null
> +++ b/drivers/clocksource/npcm7xx-timer.c
> @@ -0,0 +1,239 @@
> +
> +/*
> + * Copyright (c) 2017 Nuvoton Technology corporation.
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation;version 2 of the License.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/clockchips.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include "timer-of.h"
> +
> +/* Timers registers */
> +#define NPCM7XX_REG_TCSR0      0x0 /* Timer 0 Control and Status Register */
> +#define NPCM7XX_REG_TICR0      0x8 /* Timer 0 Initial Count Register */
> +#define NPCM7XX_REG_TCSR1      0x4 /* Timer 1 Control and Status Register */
> +#define NPCM7XX_REG_TICR1      0xc /* Timer 1 Initial Count Register */
> +#define NPCM7XX_REG_TDR1       0x14 /* Timer 1 Data Register */
> +#define NPCM7XX_REG_TISR       0x18 /* Timer Interrupt Status Register */
> +
> +/* Timers control */
> +#define NPCM7XX_Tx_RESETINT            0x1f
> +#define NPCM7XX_Tx_PERIOD              BIT(27)
> +#define NPCM7XX_Tx_INTEN               BIT(29)
> +#define NPCM7XX_Tx_COUNTEN             BIT(30)
> +#define NPCM7XX_Tx_ONESHOT             0x0
> +#define NPCM7XX_Tx_OPER                        GENMASK(3, 27)
> +#define NPCM7XX_Tx_MIN_PRESCALE                0x1
> +#define NPCM7XX_Tx_TDR_MASK_BITS       24
> +#define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
> +#define NPCM7XX_T0_CLR_INT             0x1
> +#define NPCM7XX_Tx_CLR_CSR             0x0
> +
> +/* Timers operating mode */
> +#define NPCM7XX_START_PERIODIC_Tx (NPCM7XX_Tx_PERIOD | NPCM7XX_Tx_COUNTEN | \
> +                                       NPCM7XX_Tx_INTEN | \
> +                                       NPCM7XX_Tx_MIN_PRESCALE)
> +
> +#define NPCM7XX_START_ONESHOT_Tx (NPCM7XX_Tx_ONESHOT | NPCM7XX_Tx_COUNTEN | \
> +                                       NPCM7XX_Tx_INTEN | \
> +                                       NPCM7XX_Tx_MIN_PRESCALE)
> +
> +#define NPCM7XX_START_Tx (NPCM7XX_Tx_COUNTEN | NPCM7XX_Tx_PERIOD | \
> +                               NPCM7XX_Tx_MIN_PRESCALE)
> +
> +#define NPCM7XX_DEFAULT_CSR (NPCM7XX_Tx_CLR_CSR | NPCM7XX_Tx_MIN_PRESCALE)
> +
> +static int npcm7xx_timer_resume(struct clock_event_device *evt)
> +{
> +       struct timer_of *to = to_timer_of(evt);
> +       u32 val;
> +
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val |= NPCM7XX_Tx_COUNTEN;
> +       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +
> +       return 0;
> +}
> +
> +static int npcm7xx_timer_shutdown(struct clock_event_device *evt)
> +{
> +       struct timer_of *to = to_timer_of(evt);
> +       u32 val;
> +
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val &= ~NPCM7XX_Tx_COUNTEN;
> +       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +
> +       return 0;
> +}
> +
> +static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
> +{
> +       struct timer_of *to = to_timer_of(evt);
> +       u32 val;
> +
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val &= ~NPCM7XX_Tx_OPER;
> +
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val |= NPCM7XX_START_ONESHOT_Tx;
> +       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +
> +       return 0;
> +}
> +
> +static int npcm7xx_timer_periodic(struct clock_event_device *evt)
> +{
> +       struct timer_of *to = to_timer_of(evt);
> +       u32 val;
> +
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val &= ~NPCM7XX_Tx_OPER;
> +
> +       writel((timer_of_rate(to) / HZ),
> +               timer_of_base(to) + NPCM7XX_REG_TICR0);
> +       val |= NPCM7XX_START_PERIODIC_Tx;
> +
> +       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +
> +       return 0;
> +}
> +
> +static int npcm7xx_clockevent_setnextevent(unsigned long evt,
> +               struct clock_event_device *clk)
> +{
> +       struct timer_of *to = to_timer_of(clk);
> +       u32 val;
> +
> +       writel(evt, timer_of_base(to) + NPCM7XX_REG_TICR0);
> +       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +       val |= NPCM7XX_START_Tx;
> +       writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
> +{
> +       struct clock_event_device *evt = (struct clock_event_device *)dev_id;
> +       struct timer_of *to = to_timer_of(evt);
> +
> +       writel(NPCM7XX_T0_CLR_INT, timer_of_base(to) + NPCM7XX_REG_TISR);
> +
> +       evt->event_handler(evt);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static struct timer_of to_npcm7xx = {

nit: the prefix should be npcm7xx_*

> +       .flags = TIMER_OF_IRQ | TIMER_OF_BASE,
> +
> +       .clkevt = {
> +               .name               = "npcm7xx-timer0",
> +               .features           = CLOCK_EVT_FEAT_PERIODIC |
> +                                     CLOCK_EVT_FEAT_ONESHOT,
> +               .set_next_event     = npcm7xx_clockevent_setnextevent,
> +               .set_state_shutdown = npcm7xx_timer_shutdown,
> +               .set_state_periodic = npcm7xx_timer_periodic,
> +               .set_state_oneshot  = npcm7xx_timer_oneshot,
> +               .tick_resume        = npcm7xx_timer_resume,
> +               .rating             = 300,
> +       },
> +
> +       .of_irq = {
> +               .handler = npcm7xx_timer0_interrupt,
> +               .flags = IRQF_TIMER | IRQF_IRQPOLL,
> +       },
> +};
> +
> +static void __init npcm7xx_clockevents_init(u32 rate)
> +{
> +       writel(NPCM7XX_DEFAULT_CSR,
> +               timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR0);
> +
> +       writel(NPCM7XX_Tx_RESETINT,
> +               timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TISR);
> +
> +       to_npcm7xx.clkevt.cpumask = cpumask_of(0);
> +       clockevents_config_and_register(&to_npcm7xx.clkevt, rate,
> +                                       0x1, NPCM7XX_Tx_MAX_CNT);
> +}
> +
> +static void __init npcm7xx_clocksource_init(u32 rate)
> +{
> +       u32 val;
> +
> +       writel(NPCM7XX_DEFAULT_CSR,
> +               timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
> +       writel(NPCM7XX_Tx_MAX_CNT,
> +               timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TICR1);
> +
> +       val = readl(timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
> +       val |= NPCM7XX_START_Tx;
> +       writel(val, timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
> +
> +       clocksource_mmio_init(timer_of_base(&to_npcm7xx) +
> +                               NPCM7XX_REG_TDR1,
> +                               "npcm7xx-timer1", rate,
> +                               300, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
> +                               clocksource_mmio_readl_down);
> +}
> +
> +static int __init npcm7xx_timer_init(struct device_node *np)
> +{
> +       struct clk *clk;
> +       int ret;
> +       u32 rate;
> +
> +       clk = of_clk_get(np, 0);
> +
> +       if (IS_ERR(clk)) {
> +               ret = of_property_read_u32(np, "clock-frequency", &rate);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               clk_prepare_enable(clk);
> +               rate = clk_get_rate(clk);
> +               to_npcm7xx.of_clk.clk = clk;
> +       }
> +
> +       ret = timer_of_init(np, &to_npcm7xx);
> +       if (ret)
> +               goto err_timer_of_init;
> +
> +       /* Clock input is divided by PRESCALE + 1 before it is fed */
> +       /* to the counter */
> +       rate = rate / (NPCM7XX_Tx_MIN_PRESCALE + 1);
> +       to_npcm7xx.of_clk.rate = rate;
> +
> +       npcm7xx_clocksource_init(rate);
> +       npcm7xx_clockevents_init(rate);
> +
> +       pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %d\n",
> +                timer_of_base(&to_npcm7xx), timer_of_irq(&to_npcm7xx));
> +
> +       return 0;
> +
> +err_timer_of_init:
> +       if (!IS_ERR(clk)) {
> +               clk_disable_unprepare(clk);
> +               clk_put(clk);
> +       }
> +
> +       return ret;
> +}
> +
> +TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);
> +
> --
> 2.14.1
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
