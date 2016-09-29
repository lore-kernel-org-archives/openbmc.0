Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skx175n0nzDsTW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:54:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iaGC26Au; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id z126so2245488vkd.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gafFtGQl7mpazqqRU+eK3c/cxusZHsdmUSG1ERo1CeA=;
 b=iaGC26AuLjKSHpg2L4WqtovxdQOyDPRCoe1u6MfRnaf7l9nPGJU3ebEnI6AnuIihnf
 Xj8Day3jIjl5wZSWVU1795OZqfoY+mo+lF9u3U4U0pSSOOl32OqWOjaj78tV0MVuf6I4
 Ug4nEXqTY0mZN1zYOYrG6cGaoZC81ZNCWd4t9v8OxUoHZFt1ylixfH4BDdxjQErk+jgQ
 /mjS8+CtRsJc865oahR6H54yTDZrWjZA9Y2x1m6ri5XtoXNM2T40gN8us3btaqPYLHbC
 3Kg4xuKfbFrGQnyB5FCJtVphfX0XzF19IvKjIDdyAODIgfV6FAEnvkCUbXwaehLe2Yru
 vt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gafFtGQl7mpazqqRU+eK3c/cxusZHsdmUSG1ERo1CeA=;
 b=Jmgen2RAPlXMdce62mpoAmJQdjCP5tmG3AWFzJVuSKhu6MJ4DQF5O24w3QdfwYDwzw
 HZgpveqYWtvEX+b0RJdwhoHoVs5+V9TExffqf4n7UMVJsjt9iWxxDXUzjiUdZVAkZMsF
 HHGdz60fRGGlSLyd0/oN7nwLWmMkcBLBBDKW2iYXR2o7oo8a+wgl84qlgF0W60IDzBSb
 jEQ42EghZgGrXJBsn0sVL78nW88YCcLVkHWm+0CR6lr9aHUMgRqo3NxsxNmAt282LPbW
 MxA9xWHIZk5oED91QNwAJwWqniIoDlTojSVIYTUOycMA+QwQN/fX9x9Ee8YSw95pZpOC
 R6MA==
X-Gm-Message-State: AA6/9RlgvgxcSuR0dLoZawqPUVai7JWwaxtCd/L43Jp1s62R54Vlz7seUgdBq5J129sqSUXrfkKvOr5GTM9F+A==
X-Received: by 10.31.168.145 with SMTP id r139mr19522141vke.124.1475110473581; 
 Wed, 28 Sep 2016 17:54:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 17:54:13 -0700 (PDT)
In-Reply-To: <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:24:13 +0930
X-Google-Sender-Auth: FXaD6WD7C-Z0YZ81SyVrxTKaSuw
Message-ID: <CACPK8XchVHEn9cJKwkQWTDO+M2Luvc1Vd2K9+M1+umbsPcexqw@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: aspeed-g5: Fix names of GPID2 pins
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
X-List-Received-Date: Thu, 29 Sep 2016 00:54:36 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Fixes simple typos in the initial commit. There is no behavioural
> change.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Reported-by: Xo Wang <xow@google.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index e1ab864e1a7f..14639834a5eb 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -151,21 +151,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
>
>  #define GPID2_DESC      SIG_DESC_SET(SCU8C, 9)
>
> -#define D20 26
> +#define F20 26
>  SIG_EXPR_LIST_DECL_SINGLE(SD2DAT0, SD2, SD2_DESC);
>  SIG_EXPR_DECL(GPID2IN, GPID2, GPID2_DESC);
>  SIG_EXPR_DECL(GPID2IN, GPID, GPID_DESC);
>  SIG_EXPR_LIST_DECL_DUAL(GPID2IN, GPID2, GPID);
> -MS_PIN_DECL(D20, GPIOD2, SD2DAT0, GPID2IN);
> +MS_PIN_DECL(F20, GPIOD2, SD2DAT0, GPID2IN);
>
> -#define D21 27
> +#define D20 27
>  SIG_EXPR_LIST_DECL_SINGLE(SD2DAT1, SD2, SD2_DESC);
>  SIG_EXPR_DECL(GPID2OUT, GPID2, GPID2_DESC);
>  SIG_EXPR_DECL(GPID2OUT, GPID, GPID_DESC);
>  SIG_EXPR_LIST_DECL_DUAL(GPID2OUT, GPID2, GPID);
> -MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID2OUT);
> +MS_PIN_DECL(D20, GPIOD3, SD2DAT1, GPID2OUT);
>
> -FUNC_GROUP_DECL(GPID2, D20, D21);
> +FUNC_GROUP_DECL(GPID2, F20, D20);
>
>  #define GPIE_DESC      SIG_DESC_SET(HW_STRAP1, 21)
>  #define GPIE0_DESC     SIG_DESC_SET(SCU8C, 12)
> @@ -614,7 +614,6 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(D10),
>         ASPEED_PINCTRL_PIN(D2),
>         ASPEED_PINCTRL_PIN(D20),
> -       ASPEED_PINCTRL_PIN(D21),
>         ASPEED_PINCTRL_PIN(D4),
>         ASPEED_PINCTRL_PIN(D5),
>         ASPEED_PINCTRL_PIN(D6),
> @@ -630,6 +629,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(E7),
>         ASPEED_PINCTRL_PIN(E9),
>         ASPEED_PINCTRL_PIN(F19),
> +       ASPEED_PINCTRL_PIN(F20),
>         ASPEED_PINCTRL_PIN(F9),
>         ASPEED_PINCTRL_PIN(H20),
>         ASPEED_PINCTRL_PIN(L1),
> --
> git-series 0.8.10
