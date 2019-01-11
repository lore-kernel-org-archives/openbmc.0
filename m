Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.107.29; helo=15.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1205 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Jan 2019 21:47:18 AEDT
Received: from 15.mo5.mail-out.ovh.net (15.mo5.mail-out.ovh.net
 [178.33.107.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bfh628b5zDr1f
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 21:47:15 +1100 (AEDT)
Received: from player730.ha.ovh.net (unknown [10.109.160.217])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 15F8520EA64
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 11:10:52 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 1AE641715757;
 Fri, 11 Jan 2019 10:10:48 +0000 (UTC)
Subject: Re: [RFC qemu legoater/aspeed-3.1 4/4] timer: aspeed: Provide
 back-pressure information for short periods
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-5-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <65ac448c-d53f-c2f8-c123-69e45afd2a90@kaod.org>
Date: Fri, 11 Jan 2019 11:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111035638.19725-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7758576261953129317
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2019 10:47:18 -0000

On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> First up: This is not the way the hardware behaves.

I think this is OK from the QEMU side. It would be better if Linux was 
not involved though.

> However, it helps resolve real-world problems with short periods being
> used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
> Fix set_next_event handler") in Linux fixed the timer driver to
> correctly schedule the next event for the Aspeed controller, and in
> combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random number
> device") Linux will now set a timer with a period as low as 1us.
> 
> Configuring a qemu timer with such a short period results in spending
> time handling the interrupt in the model rather than executing guest
> code, leading to noticeable "sticky" behaviour in the guest.
> 
> The behaviour of Linux is correct with respect to the hardware, so we
> need to improve our handling under emulation. The approach chosen is to
> provide back-pressure information by calculating an acceptable minimum
> number of ticks to be set on the model. Under Linux an additional read
> is added in the timer configuration path to detect back-pressure, which
> will never occur on hardware. However if back-pressure is observed, the
> driver alerts the clock event subsystem, which then performs its own
> next event dilation via a config option - d1748302f70b ("clockevents:
> Make minimum delay adjustments configurable")

So, this is approach is not totally unacceptable, QEMU is an hypervisor
which has its own timing constraints.
 
> A minimum period of 5us was experimentally determined on a Lenovo
> T480s, which I've increased to 20us for "safety".
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/misc/aspeed_scu.c            | 6 ++++++
>  hw/timer/aspeed_timer.c         | 6 +++++-
>  include/hw/timer/aspeed_timer.h | 1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 257f9a6c6b8a..0410776b456a 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -432,6 +432,12 @@ static void aspeed_scu_realize(DeviceState *dev, Error **errp)
>                            TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
>  
>      sysbus_init_mmio(sbd, &s->iomem);
> +
> +    /*
> +     * Reset on realize to ensure the APB clock value is calculated in time for
> +     * use by the timer model, which is reset before the SCU.
> +     */
> +    aspeed_scu_reset(dev);

sigh. May be we should call aspeed_scu_set_apb_freq() from the Aspeed timer
model ?

>  }
>  
>  static const VMStateDescription vmstate_aspeed_scu = {
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 35b40a7c4010..0f3501ac5a5c 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -254,7 +254,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
>      switch (reg) {
>      case TIMER_REG_RELOAD:
>          old_reload = t->reload;
> -        t->reload = value;
> +        t->reload = value < t->min_ticks ? t->min_ticks : value;
>  
>          /* If the reload value was not previously set, or zero, and
>           * the current value is valid, try to start the timer if it is
> @@ -306,7 +306,11 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
>  
>  static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
>  {
> +    AspeedTimerCtrlState *s = timer_to_ctrl(t);
> +    uint32_t rate = enable ? TIMER_CLOCK_EXT_HZ : s->scu->apb_freq;
> +
>      trace_aspeed_timer_ctrl_external_clock(t->id, enable);
> +    t->min_ticks = muldiv64(20 * SCALE_US, rate, NANOSECONDS_PER_SECOND);

That '20' deserves a define I think.

C.

>  }
>  
>  static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index 1fb949e16710..10c851ebb6d7 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -41,6 +41,7 @@ typedef struct AspeedTimer {
>       * interrupts, signalling with both the rising and falling edge.
>       */
>      int32_t level;
> +    uint32_t min_ticks;
>      uint32_t reload;
>      uint32_t match[2];
>      uint64_t start;
> 
