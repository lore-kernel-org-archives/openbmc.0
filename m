Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sStX74ZXNzDrpp
 for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2016 14:14:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Z/wEjhDm; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id u68so1652604uau.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Sep 2016 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=k3oiQ750hmEFTEAMCJgjEnTKivU6Qjzmka/+TMGLxTI=;
 b=Z/wEjhDmNb0COPu8JKudHxF6HbG1rg8w2F3XwzACrVHCihi9/Q5BMJDhbmyHCnS7aO
 OIv6I5B9tyJ111qm3TR6KpIu3dXaAmDWfkoiVGDmSkhmHtNzwvaukrIV1hfL5rAdPfYf
 XU4QnBI2O4Apk5oJW7Mc6HNGuUld2EFRc+Mlum+4HmaliCrH2YsiFDAMAiQ5z2VH7Mys
 4AhbNUcjHrBN55VEWVPxePEnoCFCZ0GAbzl2dsswDFubB4vz2c+YcM7OlGQR63dT/SQL
 rq5Hi9pTCSYcq3qnmqlv6WqKNUgjtUN6u2hxdL055Ob9PdjDjVstb5Kffu9UxWBktr8u
 pGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=k3oiQ750hmEFTEAMCJgjEnTKivU6Qjzmka/+TMGLxTI=;
 b=NdOldikZxUYrcH+p/8AV09N9Sr/PdN0DyHFfWhYGSZ3rFb2DTVpzcZyOf/5DJSX4Yz
 bSq9L3wgNpfyroI9kDLMkR7tXIKyX1HTtbdW940OUNd4kAd3z//qgEsZaIlwpMLEiPJH
 JfiuFxpyFtD4ORMQ/MqLLt7CK00LTl5azVv8RLpxv5GJK22/DI8vm3ayrOH7dDCNLcZy
 Ibf+Xq/+v+7/oGalAE9KnrVZuiYURuDNrNbJyO/ss/8jCS3Pu7HmaLzNeTf6B8RxDrxB
 NxdpHb9DdUjhILJRCjmkHVf3GjSb4VUNRAN0yF0n2yU0dqDLkHGhlScvt5BGMhpU/9Iq
 dTNQ==
X-Gm-Message-State: AE9vXwNxaYl74E/8evjEo+6zaeXlQP5LveutJ4GbWwdwOLJGCC0ntiUZPAk1zcEqqZOBPzHV3D10FTpqgGRUew==
X-Received: by 10.176.0.108 with SMTP id 99mr15507516uai.43.1473135253707;
 Mon, 05 Sep 2016 21:14:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Mon, 5 Sep 2016 21:13:53 -0700 (PDT)
In-Reply-To: <20160902073051.31492-4-andrew@aj.id.au>
References: <20160902073051.31492-1-andrew@aj.id.au>
 <20160902073051.31492-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Sep 2016 13:43:53 +0930
X-Google-Sender-Auth: jHaAhMC6T0VGIubdjovpL2ctlOE
Message-ID: <CACPK8XdowuFqzpFa_GNQjA8C3GDkOej0MvFv=q0x9fk_D-cH+g@mail.gmail.com>
Subject: Re: [PATCH linux 3/3] pinctrl-aspeed: "Not enabled" is a significant
 mux state
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 06 Sep 2016 04:14:16 -0000

On Fri, Sep 2, 2016 at 5:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Consider a scenario with one pin P that has two signals A and B, where A
> is defined to be higher priority than B: That is, if the mux IP is in a
> state that would consider both A and B to be active on P, then A will be
> the active signal.

When a signal A loves signal B very much...

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
> For example, the pins composing GPIO bank H provide signals ROMD8
> through ROMD15 (high priority) and those for UART6 (low priority). The
> mux states for ROMD8 through ROMD15 are aliased, i.e. there are two mux
> states that result in the respective signals being configured:
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

Looks good to me!

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 07d09e04a6ed..07bbeda7f53e 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -130,11 +130,6 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                 bool enable, struct regmap *map)
>  {
>         int i;
> -       bool ret;
> -
> -       ret = aspeed_sig_expr_eval(expr, enable, map);
> -       if (ret)
> -               return ret;
>
>         for (i = 0; i < expr->ndescs; i++) {
>                 const struct aspeed_sig_desc *desc = &expr->descs[i];
> @@ -167,12 +162,24 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>  static bool aspeed_sig_expr_enable(const struct aspeed_sig_expr *expr,
>                 struct regmap *map)
>  {
> +       bool ret;
> +
> +       ret = aspeed_sig_expr_eval(expr, true, map);
> +       if (ret)
> +               return true;
> +
>         return aspeed_sig_expr_set(expr, true, map);
>  }
>
>  static bool aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
>                 struct regmap *map)
>  {
> +       bool ret;
> +
> +       ret = aspeed_sig_expr_eval(expr, true, map);
> +       if (!ret)
> +               return true;
> +
>         return aspeed_sig_expr_set(expr, false, map);
>  }
>
> --
> 2.9.3.1.g0db844e
>
