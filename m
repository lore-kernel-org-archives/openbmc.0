Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ffwoZCm2"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVpYL2GV3zDrK6
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 21:23:17 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id n195so3519679itg.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 02:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nZosgXonUyYzko03gc+9yv72GWdpdXNmFjLczviNSac=;
 b=ffwoZCm23TmO5wV0X91tfi3Q5D0146klfmHmusaoj4bBKCRh1W2A6J170Hxg+NfcHY
 dtx2yh0lhXOgOPo0qenXJo76DRrK/x8CkXhGBCG8I7fUYd5oJ4uwu+EQUMq5fCRwWf1l
 pqlVTJNEvK3Z1CjSi3NoVUyu+cN0/us8LAkldxAYyF9WNIiycNY4vD4dt9pa0QB5TRWQ
 IBs0VjfDHJ+lHNIbHLuYWHisD/ipwMEr+dtdulbhXFUt92+ZPgmfUVEl6NbVc/dEvYcw
 We8z/lPd53vrqjIkxSl1BTFL2y2NK0lSDR3SuQ/F0TyCFig6T97cJsOYqJE5E7xy0ElH
 f2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nZosgXonUyYzko03gc+9yv72GWdpdXNmFjLczviNSac=;
 b=bVXe9aLBG07zOxAz8s7pU+1YbaXuYX5ar1pcRQpK3P7VWk7wx9Vm6ao1HTj+AMxfKu
 z6zt+QRqRap2Vj3c3iP7fMiAPUL+c1HoQdJFqjAP0K2E7mXjydiJkjzBT0BsvCI8dr9X
 S/WlaDpP1nJ4KLVN15TBczW5KnOF/CFcDpi8Mv6LL/PpyrdOh/liufuTbLy027gmh8kl
 DjSet9hfKazotfcttFb9jc5owg5ZAYkMmpUM6YMRd/T6TNhVSXor1IL1WvqnIKtdE5oF
 D1u0q7/eFSLnzt9gqbWbQzideUHqeOUGaZHNT+lRL/Xe6lDlCdeg8p26D6eoqCtrExj0
 DzQw==
X-Gm-Message-State: AJaThX5ivALqpKYKcYKW2jRosRbJrcu6LEC/BHynRQ29Kgv6bxrOwn+8
 x4ZRtDpw92hI0HcZ4YpsMhUhBiepm4Q/9FB1tvY=
X-Google-Smtp-Source: ABhQp+RRxUNpitKQk3Cm4GRkPA0PX1OA4puepWZRYDcRtBr23tR4WMbzkMKnIz24etIOUiMKGhXygABvSDdjivLynhg=
X-Received: by 10.36.105.65 with SMTP id e62mr8581654itc.16.1509963795118;
 Mon, 06 Nov 2017 02:23:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.28.66 with HTTP; Mon, 6 Nov 2017 02:23:14 -0800 (PST)
In-Reply-To: <CAFd5g4751PvW8yMW5KXqbHRC9sC8PUZcsSbJmQQorLqTms_dwA@mail.gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
 <1509538604-8218-2-git-send-email-tmaimon77@gmail.com>
 <CAFd5g4751PvW8yMW5KXqbHRC9sC8PUZcsSbJmQQorLqTms_dwA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 6 Nov 2017 12:23:14 +0200
Message-ID: <CAP6Zq1h26LehuwW06WXfLNJ2E5B539ZZKtnGNqYKQW4CY4-3hQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clocksource: npcm: add NPCM7xx timer driver
To: Brendan Higgins <brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 10:23:19 -0000

On 4 November 2017 at 02:28, Brendan Higgins <brendanhiggins@google.com> wrote:
> Looks like you missed a couple of comments from Daniel:
> https://www.spinics.net/lists/devicetree/msg196683.html
>
> Also, I think the binding documentation is supposed to come before the driver.
>
> On Wed, Nov 1, 2017 at 5:16 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Add Nuvoton BMC NPCM7xx timer driver.
>>
>> the clocksource Enable 24-bit TIMER0 and TIMER1 counters,
>> while TIMER0 serves as clockevent and TIMER1 serves as clocksource.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> ---
>>  drivers/clocksource/Kconfig         |   8 ++
>>  drivers/clocksource/Makefile        |   1 +
>>  drivers/clocksource/npcm7xx-timer.c | 224 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 233 insertions(+)
>>  create mode 100644 drivers/clocksource/npcm7xx-timer.c
>
> Looks like you forgot to rename the driver.

I think Daniel asked to modify the driver name from npcm7xx_timer.c
to npcm7xx-timer.c and i did it.
>
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index cc6062049170..46184af75d6c 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -140,6 +140,14 @@ config VT8500_TIMER
>>         help
>>           Enables support for the VT8500 driver.
>>
>> +config NPCM7XX_TIMER
>> +       bool "NPCM7xx timer driver" if COMPILE_TEST
>> +       depends on HAS_IOMEM
>> +       select CLKSRC_MMIO
>> +       help
>> +         Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx arcithcture,
>> +         While TIMER0 serves as clockevent and TIMER1 serves as clocksource.
>> +
>>  config CADENCE_TTC_TIMER
>>         bool "Cadence TTC timer driver" if COMPILE_TEST
>>         depends on COMMON_CLK
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index dbc1ad14515e..f2a9318a1eec 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -53,6 +53,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)   += timer-ti-32k.o
>>  obj-$(CONFIG_CLKSRC_NPS)       += timer-nps.o
>>  obj-$(CONFIG_OXNAS_RPS_TIMER)  += timer-oxnas-rps.o
>>  obj-$(CONFIG_OWL_TIMER)                += owl-timer.o
>> +obj-$(CONFIG_NPCM7XX_TIMER)    += npcm7xx-timer.o
>>
>>  obj-$(CONFIG_ARC_TIMERS)               += arc_timer.o
>>  obj-$(CONFIG_ARM_ARCH_TIMER)           += arm_arch_timer.o
>> diff --git a/drivers/clocksource/npcm7xx-timer.c b/drivers/clocksource/npcm7xx-timer.c
>> new file mode 100644
>> index 000000000000..d1ea5c183a69
>> --- /dev/null
>> +++ b/drivers/clocksource/npcm7xx-timer.c
>> @@ -0,0 +1,224 @@
>> +
>> +/*
>> + * Copyright (c) 2017 Nuvoton Technology corporation.
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation;version 2 of the License.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/sched.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/err.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/clockchips.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_address.h>
>> +
>> +struct npcm7xx_clockevent_data {
>> +       struct clock_event_device cvd;
>> +       void __iomem *timer_base;
>> +       unsigned int rate;
>> +};
>> +
>> +/* Timers registers */
>> +#define NPCM7XX_REG_TCSR0      0x0 /* Timer 0 Control and Status Register */
>> +#define NPCM7XX_REG_TICR0      0x8 /* Timer 0 Initial Count Register */
>> +#define NPCM7XX_REG_TCSR1      0x4 /* Timer 1 Control and Status Register */
>> +#define NPCM7XX_REG_TICR1      0xc /* Timer 1 Initial Count Register */
>> +#define NPCM7XX_REG_TDR1       0x14 /* Timer 1 Data Register */
>> +#define NPCM7XX_REG_TISR       0x18 /* Timer Interrupt Status Register */
>> +
>> +/* Timers control */
>> +#define NPCM7XX_Tx_RESETINT            0x1f
>> +#define NPCM7XX_Tx_PERIOD              BIT(27)
>> +#define NPCM7XX_Tx_INTEN               BIT(29)
>> +#define NPCM7XX_Tx_COUNTEN             BIT(30)
>> +#define NPCM7XX_Tx_ONESHOT             0x0
>> +#define NPCM7XX_Tx_OPER                        GENMASK(3, 27)
>> +#define NPCM7XX_Tx_MIN_PRESCALE                0x1
>> +#define NPCM7XX_Tx_TDR_MASK_BITS       24
>> +#define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
>> +#define NPCM7XX_T0_CLR_INT             0x1
>> +#define NPCM7XX_Tx_CLR_CSR             0x0
>> +
>> +/* Timers operating mode */
>> +#define NPCM7XX_START_PERIODIC_Tx (NPCM7XX_Tx_PERIOD | NPCM7XX_Tx_COUNTEN | \
>> +                                       NPCM7XX_Tx_INTEN | \
>> +                                       NPCM7XX_Tx_MIN_PRESCALE)
>> +
>> +#define NPCM7XX_START_ONESHOT_Tx (NPCM7XX_Tx_ONESHOT | NPCM7XX_Tx_COUNTEN | \
>> +                                       NPCM7XX_Tx_INTEN | \
>> +                                       NPCM7XX_Tx_MIN_PRESCALE)
>> +#define NPCM7XX_START_Tx (NPCM7XX_Tx_COUNTEN | NPCM7XX_Tx_PERIOD | \
>> +                               NPCM7XX_Tx_MIN_PRESCALE)
>> +
>> +static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
>> +{
>> +       u32 val;
>> +       struct npcm7xx_clockevent_data *cevtd =
>> +               container_of(evt, struct npcm7xx_clockevent_data, cvd);
>> +
>> +       val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +       val &= ~NPCM7XX_Tx_OPER;
>> +
>> +       val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +       val |= NPCM7XX_START_ONESHOT_Tx;
>> +       writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +
>> +       return 0;
>> +}
>> +
>> +static int npcm7xx_timer_periodic(struct clock_event_device *evt)
>> +{
>> +       struct npcm7xx_clockevent_data *cevtd =
>> +               container_of(evt, struct npcm7xx_clockevent_data, cvd);
>> +       u32 val;
>> +
>> +       val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +       val &= ~NPCM7XX_Tx_OPER;
>> +
>> +       writel((cevtd->rate / HZ), cevtd->timer_base + NPCM7XX_REG_TICR0);
>> +       val |= NPCM7XX_START_PERIODIC_Tx;
>> +
>> +       writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +
>> +       return 0;
>> +}
>> +
>> +static int npcm7xx_clockevent_setnextevent(unsigned long evt,
>> +               struct clock_event_device *clk)
>> +{
>> +       struct npcm7xx_clockevent_data *cevtd =
>> +               container_of(clk, struct npcm7xx_clockevent_data, cvd);
>> +       u32 val;
>> +
>> +       writel(evt, cevtd->timer_base + NPCM7XX_REG_TICR0);
>> +       val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +       val |= NPCM7XX_START_Tx;
>> +       writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct npcm7xx_clockevent_data npcm7xx_clockevent_data = {
>> +       .cvd = {
>> +               .name               = "npcm7xx-timer0",
>> +               .features           = CLOCK_EVT_FEAT_PERIODIC |
>> +                                     CLOCK_EVT_FEAT_ONESHOT,
>> +               .set_next_event     = npcm7xx_clockevent_setnextevent,
>> +               .set_state_shutdown = npcm7xx_timer_oneshot,
>> +               .set_state_periodic = npcm7xx_timer_periodic,
>> +               .set_state_oneshot  = npcm7xx_timer_oneshot,
>> +               .tick_resume        = npcm7xx_timer_oneshot,
>> +               .rating             = 300
>> +       },
>> +};
>> +
>> +static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
>> +{
>> +       struct npcm7xx_clockevent_data *cevtd = dev_id;
>> +       struct clock_event_device *evt = &cevtd->cvd;
>> +
>> +       writel(NPCM7XX_T0_CLR_INT, cevtd->timer_base + NPCM7XX_REG_TISR);
>> +
>> +       if (evt->event_handler) {
>
> I think Daniel was implying this is impossible or at least deserves a comment.
> I think I originally added this check to make the driver not crash when I was
> ripping out some of the HAL dependencies. I did not think about it too hard, so
> this might need some looking into.

I found the issue, calling incorrect procedure in set_state_shutdown().
will send a fix in V3.
>
>> +               evt->event_handler(evt);
>> +               return IRQ_HANDLED;
>> +       }
>> +
>> +       return IRQ_NONE;
>> +}
>> +
>> +static struct irqaction npcm7xx_timer0_irq = {
>> +       .name           = "npcm7xx-timer0",
>> +       .flags          = IRQF_TIMER | IRQF_IRQPOLL,
>> +       .handler        = npcm7xx_timer0_interrupt,
>> +       .dev_id         = &npcm7xx_clockevent_data,
>> +};
>> +
>> +static void __init npcm7xx_clockevents_init(int irq, u32 rate)
>> +{
>> +       writel(NPCM7XX_Tx_CLR_CSR,
>> +               npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR0);
>> +
>> +       writel(NPCM7XX_Tx_RESETINT,
>> +               npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TISR);
>> +       setup_irq(irq, &npcm7xx_timer0_irq);
>> +       npcm7xx_clockevent_data.cvd.cpumask = cpumask_of(0);
>> +
>> +       clockevents_config_and_register(&npcm7xx_clockevent_data.cvd, rate,
>> +                                       0x1, NPCM7XX_Tx_MAX_CNT);
>> +}
>> +
>> +static void __init npcm7xx_clocksource_init(u32 rate)
>> +{
>> +       u32 val;
>> +
>> +       writel(NPCM7XX_Tx_CLR_CSR,
>> +               npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
>> +       writel(NPCM7XX_Tx_MAX_CNT,
>> +               npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TICR1);
>> +
>> +       val = readl(npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
>> +       val |= NPCM7XX_START_Tx;
>> +       writel(val, npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
>> +
>> +       clocksource_mmio_init(npcm7xx_clockevent_data.timer_base +
>> +                               NPCM7XX_REG_TDR1,
>> +                               "npcm7xx-timer1", rate,
>> +                               300, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
>> +                               clocksource_mmio_readl_down);
>> +}
>> +
>> +static int __init npcm7xx_timer_init(struct device_node *np)
>> +{
>> +       struct clk *clk;
>> +       int irq, ret;
>> +       u32 rate;
>> +
>> +       irq = irq_of_parse_and_map(np, 0);
>
> Looks like this, the base addr, and possibly the clock is common with what
> timer_of_init does.
see above.
>
>> +       if (!irq)
>> +               return -EINVAL;
>> +
>> +       npcm7xx_clockevent_data.timer_base = of_iomap(np, 0);
>> +       if (!npcm7xx_clockevent_data.timer_base)
>> +               return -ENXIO;
>> +
>> +       clk = of_clk_get(np, 0);
>> +
>> +       if (IS_ERR(clk)) {
>> +               ret = of_property_read_u32(np, "clock-frequency", &rate);
>> +               if (ret)
>> +                       goto err_iounmap;
>> +       } else {
>> +               clk_prepare_enable(clk);
>> +               rate = clk_get_rate(clk);
>> +       }
>> +
>> +       /* Clock input is divided by PRESCALE + 1 before it is fed */
>> +       /* to the counter */
>> +       rate = rate / (NPCM7XX_Tx_MIN_PRESCALE + 1);
>> +
>> +       npcm7xx_clockevent_data.rate = rate;
>> +
>> +       npcm7xx_clocksource_init(rate);
>> +       npcm7xx_clockevents_init(irq, rate);
>> +
>> +       pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %u\n",
>> +               npcm7xx_clockevent_data.timer_base, irq);
>> +
>> +       return 0;
>> +
>> +err_iounmap:
>> +       iounmap(npcm7xx_clockevent_data.timer_base);
>> +       return ret;
>> +
>> +}
>> +
>> +TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm7xx-timer", npcm7xx_timer_init);
>> +
>> --
>> 2.14.1
>>

Thanks!
