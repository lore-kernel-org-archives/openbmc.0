Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skx1457NjzDsTW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:54:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=x2nOfgp5; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id u196so2244719vkd.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7NuB4jub2sFLxRNGbYJqnGUk6ra+D53WNNd38Kz25RI=;
 b=x2nOfgp5iNQZEywMmNbm5LtKEtpNcy6LxY5r1dHqWZPqrvPo61UDZ+67IsPPRBYKyi
 JJwReRVFVpXseyhjF8vL+SJ+24KHtfru3nF2cW9PGRb/j614gPRkRhPBEJelpvNe6ake
 NTDYqbKtfYs9D+4DyuwXsFsJjmzsqKRoE4/LB7nIB29nvyzcfIh/uBVpXBj+u0DaaHR7
 cUdKmJcAHVHr70wmsKXluV/kt7aPocedrX8wvW52hrxfgj/jSeC0LIhrAtLqPU65oKvL
 dpHUvrgERqNLK2QKKAj1b5bZE7ngBzGHp/eKbBDXQSzOFK39EEf7VQmUtegv2M6qZPa2
 6dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7NuB4jub2sFLxRNGbYJqnGUk6ra+D53WNNd38Kz25RI=;
 b=cvV018vl+qaMZDUTcMTt0u6VHblXlyNQ9CejbCIBEfytATwH1gJMH0EtWI0FgSyRs+
 j4dRRuXirA8QMO+Bg8IQzMJ7OwtzXUn4+jMFf0vI1LRrsKl8fA1J/mRdDqmrR9YF26G4
 7L3UvfNJBRpd8HA33oJuvdfM3nlsGL5CBVXQ7gpvThbRW+8h0D1zBeZc6XIw/mz6CaRH
 JnT6Q/0Dm/IMYede3RK/LZ9o2HyhK56y9REjOvQYib/kwkyNTDAnCosiEJdQWEGbumo+
 HSszMIb/0Xa7DnO31Ah2N4Hb71bB/4Jkeos9yj3Oc4Sx7l1S1cCPhJLpuXOr/PUrBxi6
 g+hQ==
X-Gm-Message-State: AA6/9RlPlpp84usuQpCvSnjYUMFhMa3WhtX792US0E6Z4uFIU9Y/YhJouxTizXOOTv9Z4mrE1d3zpsEzgnAdMg==
X-Received: by 10.31.183.78 with SMTP id h75mr18731640vkf.148.1475110470098;
 Wed, 28 Sep 2016 17:54:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 17:54:09 -0700 (PDT)
In-Reply-To: <a2fce70d4285ec2321a64a4f7145ea8a90d988b3.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a2fce70d4285ec2321a64a4f7145ea8a90d988b3.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:24:09 +0930
X-Google-Sender-Auth: LMpcm8y-W8U_VFJssPM8YF5dXX8
Message-ID: <CACPK8XcWuZe9bCLAwX+FGvEjgMqQmEhGAR1V65hvCmKuTa-s7Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: aspeed: "Not enabled" is a significant mux
 state
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2016 00:54:33 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Consider a scenario with one pin P that has two signals A and B, where A
> is defined to be higher priority than B: That is, if the mux IP is in a
> state that would consider both A and B to be active on P, then A will be
> the active signal.
>
> To instead configure B as the active signal we must configure the mux so
> that A is inactive. The mux state for signals can be described by
> logical operations on one or more bits from one or more registers (a
> "signal expression"), which in some cases leads to aliased mux states for
> a particular signal. Further, signals described by multi-bit bitfields
> often do not only need to record the states that would make them active
> (the "enable" expressions), but also the states that makes them inactive
> (the "disable" expressions). All of this combined leads to four possible
> states for a signal:
>
>          1. A signal is active with respect to an "enable" expression
>          2. A signal is not active with respect to an "enable" expression
>          3. A signal is inactive with respect to a "disable" expression
>          4. A signal is not inactive with respect to a "disable" expression
>
> In the case of P, if we are looking to activate B without explicitly
> having configured A it's enough to consider A inactive if all of A's
> "enable" signal expressions evaluate to "not active". If any evaluate to
> "active" then the corresponding "disable" states must be applied so it
> becomes inactive.
>
> For example, on the AST2400 the pins composing GPIO bank H provide
> signals ROMD8 through ROMD15 (high priority) and those for UART6 (low
> priority). The mux states for ROMD8 through ROMD15 are aliased, i.e.
> there are two mux states that result in the respective signals being
> configured:
>
>          A. SCU90[6]=1
>          B. Strap[4,1:0]=100
>
> Further, the second mux state is a 3-bit bitfield that explicitly
> defines the enabled state but the disabled state is implicit, i.e. if
> Strap[4,1:0] is not exactly "100" then ROMD8 through ROMD15 are not
> considered active. This requires the mux function evaluation logic to
> use approach 2. above, however the existing code was using approach 3.
> The problem was brought to light on the Palmetto machines where the
> strap register value is 0x120ce416, and prevented GPIO requests in bank
> H from succeeding despite the hardware being in a position to allow
> them.
>
> Fixes: 318398c09a8d ("pinctrl: Add core pinctrl support for Aspeed SoCs")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

That's a decent commit message.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 0391f9f13f3e..49aeba912531 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -166,13 +166,9 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                                 bool enable, struct regmap *map)
>  {
>         int i;
> -       bool ret;
> -
> -       ret = aspeed_sig_expr_eval(expr, enable, map);
> -       if (ret)
> -               return ret;
>
>         for (i = 0; i < expr->ndescs; i++) {
> +               bool ret;
>                 const struct aspeed_sig_desc *desc = &expr->descs[i];
>                 u32 pattern = enable ? desc->enable : desc->disable;
>
> @@ -199,12 +195,18 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>  static bool aspeed_sig_expr_enable(const struct aspeed_sig_expr *expr,
>                                    struct regmap *map)
>  {
> +       if (aspeed_sig_expr_eval(expr, true, map))
> +               return true;
> +
>         return aspeed_sig_expr_set(expr, true, map);
>  }
>
>  static bool aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
>                                     struct regmap *map)
>  {
> +       if (!aspeed_sig_expr_eval(expr, true, map))
> +               return true;
> +
>         return aspeed_sig_expr_set(expr, false, map);
>  }
>
> --
> git-series 0.8.10
