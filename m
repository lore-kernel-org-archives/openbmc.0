Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rCqvd40W7zDqCn
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 17:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wQN06yfK; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=irFFiSgj; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id q184so17216461qkf.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RfNWrRD0fjvTDBji2/hQBsLZEwl2BR8e7Px8EiqzH1A=;
 b=wQN06yfKtTG2thto5fFPn5hoL911I1Mwslye5at5YP3X+DH6z8JL1wEzlRgDaBnIdM
 3ju4jV/s4PcjyNxpYDGk5ARAeE1MPbxAWzxKHKWHkn0Clq7LKItKHmQ76ct2vIS2H/l+
 /jLxst7SGbTDLrP6j0UNTfiimPj2eOyal74ZV9VHJhFVtgYoapXledYD2U3C6uiLK2zg
 I+XtmWupK9YAlcGjFMWJ9fzra5LUsD9kvtaDVlYa158Ocx3haqthEB7VdbF33s49uKjO
 12ZLm4MJwwNbgHGgB0URIKnDmywHKhsCwiw+PBPq/gtZAcKg7eJz5R+cQZFc3H1K0Tje
 LBtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RfNWrRD0fjvTDBji2/hQBsLZEwl2BR8e7Px8EiqzH1A=;
 b=irFFiSgjK4XbZ2jl4OYXaoA5k+KVziVga0zirAWa1Pf6ObKpUKK4Hu0qvFikUkCbTt
 NGAxgmHSDyNLUa1MKF5BRbJDwb6RIHxmkHypevYPpaTFxwlGvoI5pcyBwHrGNfnGMP13
 X7qNLqWQAudRzcTztd23b2ws5/b2/lScdpOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RfNWrRD0fjvTDBji2/hQBsLZEwl2BR8e7Px8EiqzH1A=;
 b=TDjICwQ1EwO93DDA6zgxhoeUXR1f25WPEr4fmMG9HoV+QODj8su6Rc03V1KkkXiyv1
 F16nblLGuIEkDCTO8ufeQZj6CL85l6zrJ5BaRXUry/Uc6TWsR1n+e6lCTMn/4oUnhXbH
 QzJPKaopVwqKyHanqLvo7fiE3dmrd2M9q60c122k4aJP1pQ8Wp4+O5mmiBiH4CpGYbWo
 1zmnaV5vODC1bGl5nO7XYmmmp4TyUmNrPON2F/qTIotVFjehNbmRHjbnYNH8j/EIk46F
 ICtEyIYZ5CtXZWEYNipupHFq/2ky7/XIkacg7xy5LUzuOdoskBcvmtp8g2JsjzNS5Q1c
 zXnw==
X-Gm-Message-State: AOPr4FVS/fDcKRChrXTjQ1ShyOOkUSoAcC4ALU+vW7wFELjGJcD13MNTpCsGQiUPFNarlRJHxeKC+VnvXoP5Pg==
X-Received: by 10.55.94.7 with SMTP id s7mr14231059qkb.181.1463988634874; Mon,
 23 May 2016 00:30:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Mon, 23 May 2016 00:30:15 -0700 (PDT)
In-Reply-To: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
References: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 May 2016 17:00:15 +0930
X-Google-Sender-Auth: -nX7FVLFXp4vo79yxmGkLoSd-jU
Message-ID: <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
Subject: Re: [PATCH qemu] hw/timer: Add clock value matching support to
 aspeed_timer
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 07:30:39 -0000

On Fri, May 20, 2016 at 12:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Clock value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on
> the palmetto-bmc machine. Two match registers are provided for each
> timer.

Thanks for implementing this.

We also boot much faster now.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/timer/aspeed_timer.c         | 132 +++++++++++++++++++++++++++++-----------
>  include/hw/timer/aspeed_timer.h |   5 +-
>  2 files changed, 101 insertions(+), 36 deletions(-)
>
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 51e8303cdaa3..e88234e7823f 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -9,13 +9,12 @@
>   * the COPYING file in the top-level directory.
>   */
>
> +#include <math.h>
>  #include "qemu/osdep.h"
> -#include "hw/ptimer.h"
>  #include "hw/sysbus.h"
>  #include "hw/timer/aspeed_timer.h"
>  #include "qemu-common.h"
>  #include "qemu/bitops.h"
> -#include "qemu/main-loop.h"
>  #include "qemu/timer.h"
>  #include "trace.h"
>
> @@ -76,21 +75,96 @@ static inline bool timer_can_pulse(AspeedTimer *t)
>      return t->id >= TIMER_FIRST_CAP_PULSE;
>  }
>
> +static inline bool timer_external_clock(AspeedTimer *t)
> +{
> +    return timer_ctrl_status(t, op_external_clock);
> +}
> +
> +static inline double calculate_period(struct AspeedTimer *t)
> +{
> +    double rate;
> +
> +    rate = timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ : TIMER_CLOCK_APB_HZ;

Would it make more sense return the rate from timer_external_clock
(perhaps get_timer_clock?).

> +
> +    return NANOSECONDS_PER_SECOND / rate;
> +}
> +
> +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
> +{
> +    double ticks;
> +
> +    ticks = floor((now_ns - t->start) / calculate_period(t));
> +
> +    return t->reload - MIN(t->reload, (uint32_t) ticks);

Ugh, Casty McCastface.

Perhaps make ticks the uint32_t:

 uint32_t ticks = (uint32_t)floor( ... );

> +}
> +
> +static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
> +{
> +    double delta_ns;
> +
> +    ticks = MIN(t->reload, ticks);
> +    delta_ns = floor((t->reload - ticks) * calculate_period(t));

As above.

> +
> +    return t->start + (uint64_t) delta_ns;
> +}
> +
> +static uint64_t calculate_next(struct AspeedTimer *t)
> +{
> +    uint64_t now;
> +    uint64_t next;
> +    int i;
> +    uint64_t seq[] = {
> +        MAX(t->match[0], t->match[1]),
> +        MIN(t->match[0], t->match[1]),
> +        0,
> +    };

Perhaps a comment on why you chose to do it like this? I only
understand because you explained it to me.

> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    for (i = 0; i < ARRAY_SIZE(seq); i++) {
> +        next = calculate_time(t, seq[i]);
> +        if (now < next) {
> +            return next;
> +        }
> +    }
> +
> +    {
> +        uint64_t reload_ns;
> +
> +        reload_ns = (uint64_t) floor(t->reload * calculate_period(t));
> +        t->start = now - ((now - t->start) % reload_ns);
> +    }

Why is this scoped like this?

> +
> +    return calculate_next(t);
> +}
> +
>  static void aspeed_timer_expire(void *opaque)
>  {
>      AspeedTimer *t = opaque;
> +    bool interrupt = false;
> +    uint32_t ticks;
>
> -    /* Only support interrupts on match values of zero for the moment - this is
> -     * sufficient to boot an aspeed_defconfig Linux kernel.
> -     *
> -     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer.c)
> -     */
> -    bool match = !(t->match[0] && t->match[1]);
> -    bool interrupt = timer_overflow_interrupt(t) || match;
> -    if (timer_enabled(t) && interrupt) {
> +    if (!timer_enabled(t)) {
> +        return;
> +    }
> +
> +    ticks = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +
> +    interrupt = !ticks && timer_overflow_interrupt(t);

I think it's clearer to say

if (!ticks && timer_overflow_interrupt)
   interrupt = true;


> +
> +    if (!interrupt) {
> +        interrupt = ticks <= MIN(t->match[0], t->match[1]);
> +    }

if (!interrupt && ticks <=  MIN(t->match[0], t->match[1]))
    interrupt = true;

> +
> +    if (!interrupt) {
> +        interrupt = ticks <= MAX(t->match[0], t->match[1]);
> +    }

As above. And the advantage of structuring it like this is these
else..else if statements can be represented as such.

> +
> +    if (interrupt) {
>          t->level = !t->level;
>          qemu_set_irq(t->irq, t->level);
>      }
> +
> +    timer_mod(&t->timer, calculate_next(t));
>  }
