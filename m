Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.40.29; helo=14.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4202 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Jan 2019 21:02:10 AEDT
Received: from 14.mo4.mail-out.ovh.net (14.mo4.mail-out.ovh.net [46.105.40.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bdh26Kw0zDr0D
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 21:02:10 +1100 (AEDT)
Received: from player788.ha.ovh.net (unknown [10.109.159.7])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 773781C9AF1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 09:45:07 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id F38A91898DAF;
 Fri, 11 Jan 2019 08:44:58 +0000 (UTC)
Subject: Re: [RFC qemu legoater/aspeed-3.1 1/4] timer: aspeed: Fire interrupt
 on failure to meet deadline
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111035638.19725-1-andrew@aj.id.au>
 <20190111035638.19725-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6944bb11-c1ae-3599-eeca-1fcc16728ea1@kaod.org>
Date: Fri, 11 Jan 2019 09:44:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111035638.19725-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6310106029104139109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 11 Jan 2019 10:02:11 -0000

On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/timer/aspeed_timer.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 1a54d85e9d49..54c75bf4f322 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -128,10 +128,16 @@ static uint64_t calculate_next(struct AspeedTimer *t)
>      if (now < next)
>          return next;
>  
> -    /* We've missed all of the deadlines. Set a timer in the future to let
> -     * execution catch up */
> -    t->start = now;
> -    return next + 10000;
> +    /* We've missed all deadlines, fire interrupt and try again */
> +    timer_del(&t->timer);
> +
> +    if (timer_overflow_interrupt(t)) {
> +        t->level = !t->level;
> +        qemu_set_irq(t->irq, t->level);
> +    }
> +
> +    t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));

MAX(MAX()) ? 

Is that necessary ?

C.
