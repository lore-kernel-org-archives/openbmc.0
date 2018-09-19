Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="gETcbdgx"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FwjN5QhZzF0R8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 09:16:36 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d4-v6so3417881pfn.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 16:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=upesM3/JllML0LNNgjjQOvrQWh7XEfYp5JW8q2MKRfc=;
 b=gETcbdgx4uwtvpmXzuStTsgDCEv7dEcig09uuf99RInrx/QUbKyaFOa7hGLxcjlLE8
 ZhQv9afRbBqlF6bfvttwNoV+W0oc3RaGvxUhKyK22NAefKngtn0f38kw2FlOx0JBn3AY
 W3wGLfMsZAzmhPLitCkq/Nceq9GNmzvKLhv20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upesM3/JllML0LNNgjjQOvrQWh7XEfYp5JW8q2MKRfc=;
 b=TRv+/DJXwGNVubiskPdwFco8AR6tc1sPi0OoVUNYCVg+J05drcg88a5lg7yvCI0vvD
 nCRDOq639SCQoj0JCuV8vMIVpRUysFRsx53CUufFrRiO77rhjwxR2kuauNO7w4y4Fd+A
 4IEbIr+Ai4bIna4dBsL8ZIj9hV6YbP5Cb2L3laM5/C2AkfrKd2Jbh5jWHcsgvIHG2T7O
 3dCZVoen/x8GYh9Wk9K2Ozejad0NroIgibk6XJfySq6fEJAIXe8paSJ/ElCyp3eKOvPj
 y92+QTWK4TX63smH3tp8RMF15kqiAS235nDjvq3/eiNCQHv4ksy3wl/ZFw7wg12cauJF
 cLsA==
X-Gm-Message-State: APzg51CJllUZ6fb4MtWpS4W3MguaHfBYhw+l/oZxff0C+wbd+JTQ6Elk
 OhA580CZ74b8GEKQOPDUlHEZWw==
X-Google-Smtp-Source: ANB0VdZTGARNJclNzdJGPwBfkcWTVSFmmMEA1u6Vm1vX+l3AqJ67FI95bjFc748i9bhar3zNMvqzUg==
X-Received: by 2002:a65:65c6:: with SMTP id
 y6-v6mr34692726pgv.436.1537398994617; 
 Wed, 19 Sep 2018 16:16:34 -0700 (PDT)
Received: from [10.21.2.196] ([209.121.128.187])
 by smtp.googlemail.com with ESMTPSA id
 n29-v6sm26439749pgl.30.2018.09.19.16.16.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Sep 2018 16:16:33 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix set_next_event handler
To: Tao Ren <taoren@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, cov@fb.com, tfang@fb.com,
 Linus Walleij <linus.walleij@linaro.org>
References: <20180919221331.2511558-1-taoren@fb.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bb452948-0a9e-140d-57d5-85c1732fca86@linaro.org>
Date: Thu, 20 Sep 2018 01:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180919221331.2511558-1-taoren@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 19 Sep 2018 23:16:41 -0000

On 20/09/2018 00:13, Tao Ren wrote:
> Currently, the aspeed MATCH1 register is updated to <current_count -
> cycles> in set_next_event handler, with the assumption that COUNT
> register value is preserved when the timer is disabled and it continues
> decrementing after the timer is enabled. But the assumption is wrong:
> RELOAD register is loaded into COUNT register when the aspeed timer is
> enabled, which means the next event may be delayed because timer
> interrupt won't be generated until <0xFFFFFFFF - current_count +
> cycles>.
> 
> The problem can be fixed by updating RELOAD register to <cycles>, and
> COUNT register will be re-loaded when the timer is enabled and interrupt
> is generated when COUNT register overflows.
> 
> The test result on Facebook Backpack-CMM BMC hardware (AST2500) shows
> the issue is fixed: without the patch, usleep(100) suspends the process
> for several milliseconds (and sometimes even over 40 milliseconds);
> after applying the fix, usleep(100) takes averagely 240 microseconds to
> return under the same workload level.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Linus, any comments ?

> ---
>  drivers/clocksource/timer-fttmr010.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
> index c020038ebfab..cf93f6419b51 100644
> --- a/drivers/clocksource/timer-fttmr010.c
> +++ b/drivers/clocksource/timer-fttmr010.c
> @@ -130,13 +130,17 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
>  	cr &= ~fttmr010->t1_enable_val;
>  	writel(cr, fttmr010->base + TIMER_CR);
>  
> -	/* Setup the match register forward/backward in time */
> -	cr = readl(fttmr010->base + TIMER1_COUNT);
> -	if (fttmr010->count_down)
> -		cr -= cycles;
> -	else
> -		cr += cycles;
> -	writel(cr, fttmr010->base + TIMER1_MATCH1);
> +	if (fttmr010->count_down) {
> +		/*
> +		 * ASPEED Timer Controller will load TIMER1_LOAD register
> +		 * into TIMER1_COUNT register when the timer is re-enabled.
> +		 */
> +		writel(cycles, fttmr010->base + TIMER1_LOAD);
> +	} else {
> +		/* Setup the match register forward in time */
> +		cr = readl(fttmr010->base + TIMER1_COUNT);
> +		writel(cr + cycles, fttmr010->base + TIMER1_MATCH1);
> +	}
>  
>  	/* Start */
>  	cr = readl(fttmr010->base + TIMER_CR);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
