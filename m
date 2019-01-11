Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.8; helo=13.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Jan 2019 21:07:17 AEDT
Received: from 13.mo4.mail-out.ovh.net (13.mo4.mail-out.ovh.net [178.33.251.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bdnx4L4zzDr1f
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 21:07:16 +1100 (AEDT)
Received: from player732.ha.ovh.net (unknown [10.109.146.173])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A53661C8100
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 10:58:29 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 08BD616F6959;
 Fri, 11 Jan 2019 09:58:25 +0000 (UTC)
Subject: Re: [RFC qemu legoater/aspeed-3.1 2/4] timer: aspeed: Status register
 contains reload for stopped timer
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ec1c3721-9c7c-c026-47fe-1ea1b30e2319@kaod.org>
Date: Fri, 11 Jan 2019 10:58:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111035638.19725-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7549158879447452517
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 11 Jan 2019 10:07:18 -0000

On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> From the datasheet:
> 
>> This register stores the current status of counter #N. When timer
>> enable bit TMC30[N * b] is disabled, the reload register will be
>> loaded into this counter. When timer bit TMC30[N * b] is set, the
>> counter will start to decrement. CPU can update this register value
>> when enable bit is set.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/timer/aspeed_timer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 54c75bf4f322..6adc14d62034 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -182,7 +182,11 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
>  
>      switch (reg) {
>      case TIMER_REG_STATUS:
> -        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        if (timer_enabled(t)) {
> +            value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        } else {
> +            value = t->reload;
> +        }
>          break;
>      case TIMER_REG_RELOAD:
>          value = t->reload;
> 
