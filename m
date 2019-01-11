Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.40.148; helo=5.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 5.mo173.mail-out.ovh.net (5.mo173.mail-out.ovh.net
 [46.105.40.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bg274GcYzDqTR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 22:02:52 +1100 (AEDT)
Received: from player758.ha.ovh.net (unknown [10.109.160.143])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 9481FDF9E3
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 10:06:30 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 3A2C3192A94F;
 Fri, 11 Jan 2019 09:06:26 +0000 (UTC)
Subject: Re: [RFC linux dev-4.19] clocksource: fttmr010: Detect back-pressure
 for Aspeed controllers
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111033628.18677-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d0220a96-aff0-38b3-e8e2-b2c93811cc53@kaod.org>
Date: Fri, 11 Jan 2019 10:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111033628.18677-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6671519901235448677
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 11 Jan 2019 11:02:56 -0000

On 1/11/19 4:36 AM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

This patch should not have any impact on a real system where l == cycles.
It might be difficult to merge though.

C. 

> ---
> 
> See the cover letter on the corresponding qemu RFC series, to be sent after
> this patch.
> 
>  arch/arm/mach-aspeed/Kconfig         | 1 +
>  drivers/clocksource/timer-fttmr010.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index 2d5570e6e186..6b82d5416cf0 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -7,6 +7,7 @@ menuconfig ARCH_ASPEED
>  	select FTTMR010_TIMER
>  	select MFD_SYSCON
>  	select PINCTRL
> +	select GENERIC_CLOCKEVENTS_MIN_ADJUST
>  	help
>  	  Say Y here if you want to run your kernel on an ASpeed BMC SoC.
>  
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index cf93f6419b51..f15386b98289 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -124,6 +124,7 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
>  {
>  	struct fttmr010 *fttmr010 = to_fttmr010(evt);
>  	u32 cr;
> +	u32 l;
>  
>  	/* Stop */
>  	cr = readl(fttmr010->base + TIMER_CR);
> @@ -136,6 +137,12 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
>  		 * into TIMER1_COUNT register when the timer is re-enabled.
>  		 */
>  		writel(cycles, fttmr010->base + TIMER1_LOAD);
> +#if CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST> +		/* QEMU model may provide back-pressure on requested period */
> +		l = readl(fttmr010->base + TIMER1_LOAD);
> +		if (l > cycles)
> +			return -EINVAL;
> +#endif
>  	} else {
>  		/* Setup the match register forward in time */
>  		cr = readl(fttmr010->base + TIMER1_COUNT);
> 
