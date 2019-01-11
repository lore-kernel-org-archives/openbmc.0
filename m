Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.44.175; helo=3.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2195 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Jan 2019 21:08:11 AEDT
Received: from 3.mo3.mail-out.ovh.net (3.mo3.mail-out.ovh.net [46.105.44.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bdpz18ZkzDqTm
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 21:08:10 +1100 (AEDT)
Received: from player730.ha.ovh.net (unknown [10.109.143.220])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6DD121F0AF5
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 11:00:21 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id A29CA1712AD2;
 Fri, 11 Jan 2019 10:00:13 +0000 (UTC)
Subject: Re: [RFC qemu legoater/aspeed-3.1 3/4] timer: aspeed: Fix match
 calculations
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-4-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <26a82fbe-d088-6b6d-c88c-65279b7fbfae@kaod.org>
Date: Fri, 11 Jan 2019 11:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111035638.19725-4-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7580965549890046821
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 11 Jan 2019 10:08:11 -0000

On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> If the match value exceeds reload then we don't want to include it in
> calculations for the next event.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Looks correct apart from the MAX(MAX())

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/timer/aspeed_timer.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 6adc14d62034..35b40a7c4010 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -107,6 +107,11 @@ static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
>      return t->start + delta_ns;
>  }
>  
> +static inline uint32_t calculate_match(struct AspeedTimer *t, int i)
> +{
> +    return t->match[i] < t->reload ? t->match[i] : 0;
> +}
> +
>  static uint64_t calculate_next(struct AspeedTimer *t)
>  {
>      uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> @@ -116,11 +121,11 @@ static uint64_t calculate_next(struct AspeedTimer *t)
>       * registers, so sort using MAX/MIN/zero. We sort in that order as the
>       * timer counts down to zero. */
>  
> -    next = calculate_time(t, MAX(t->match[0], t->match[1]));
> +    next = calculate_time(t, MAX(calculate_match(t, 0), calculate_match(t, 1)));
>      if (now < next)
>          return next;
>  
> -    next = calculate_time(t, MIN(t->match[0], t->match[1]));
> +    next = calculate_time(t, MIN(calculate_match(t, 0), calculate_match(t, 1)));
>      if (now < next)
>          return next;
>  
> @@ -136,8 +141,10 @@ static uint64_t calculate_next(struct AspeedTimer *t)
>          qemu_set_irq(t->irq, t->level);
>      }
>  
> +    next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
>      t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
> +
> +    return calculate_time(t, next);
>  }
>  
>  static void aspeed_timer_mod(AspeedTimer *t)
> 
