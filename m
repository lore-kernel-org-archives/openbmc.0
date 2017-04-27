Return-Path: <xow@google.com>
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDNrx5bLKzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 03:16:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mg44XF7v"; 
 dkim-atps=neutral
Received: by mail-qt0-x233.google.com with SMTP id y33so31454176qta.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FJlr51UEX09Eib+BWZaq/p+uwIYb4OPAQ7+BiiflVDo=;
 b=mg44XF7vzKgCFEoHiFztIQucRT50vFPOyN9TpbocvAuFEWKvm1cXhJjxSQbcbON9mX
 YuOHkO1u74/I3fbWdg7QzlhsUGlCHb112qdQHgVcMw0+hmEOjd9Fh577cHddsz44PCd7
 hUhODWZXhwOkGxU5dzRHmzNVZmXXGO//tr6zb4S7hDnJjGiQpyJdtkbEuQBI/iP+hJUf
 YdOvZcvTWW015uX08DMQ0gv+U+DSt7Kj9NkJOSIVuLh/AGI17Z9zu2FaXsowjmety70H
 Xpw0X7a4BCCJWHBitQqR62OlxvwWCGSHiGmJBnZMmmp/sESRlmzbruEm88kO+uLSwFik
 yjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FJlr51UEX09Eib+BWZaq/p+uwIYb4OPAQ7+BiiflVDo=;
 b=PvzFjyFLkpnxRmWGJ2mUCzsZ5iFWCzk6PLWr2ONiwYh/8CbwFL18ysEOLzJZV1bkS0
 DWUb7/18x7b8gRLxWYK7fQ5J9tPBhHp5OAeg4MCTHbzIccs3Pbuz9qfwHF8bRRaygpkq
 oiL8wErr8B5xzmDrlDMaz+nUiSEf0h6L2MN/CYVxBmQa31N6VvmD03q2a9Sf+aBhV4l2
 9pqmjqWNUrXpAZUYmbPM485vmVDp3i2ZHzcWfr7Uwqx7B0A8nXedk1ls66GfJ1S1mdeU
 HiPDkvD9/4sPz+nO0PCEq6z73dflzGlJCe5beTjuZSYAVL9wdYSS5PGEgWqirH91+SSR
 Zuxg==
X-Gm-Message-State: AN3rC/6TfCWI2z37Z36yIxnMnJtnVfR4tPoiVtDPLM4rdzOlJrZ0nWDc
 25lqs+HpYHXWMIHhG5yu+YCsu4eTcmeX
X-Received: by 10.200.49.123 with SMTP id h56mr6035482qtb.172.1493313374053;
 Thu, 27 Apr 2017 10:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Thu, 27 Apr 2017 10:16:13 -0700 (PDT)
In-Reply-To: <20170427060823.32226-6-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-6-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Thu, 27 Apr 2017 10:16:13 -0700
Message-ID: <CAPH-5w46rey_4d=enxOPwvjbZp2aL8smNZ6DMGPQraQtaFt3OQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 05/10] aspeed: zaius: Disable GPIO bias via
 devicetree pinconf requests
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 17:16:18 -0000

Hi Andrew,

On Wed, Apr 26, 2017 at 11:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Given there are fixes presumably present in revisions beyond EVT1, the
> special-casing done in the board file is implemented by separate
> devicetrees.

I don't think anyone is using EVT1 boards any more. They don't boot
CPUs. However, I like this approach for plumbing board special-casing
and we'll probably have to do it for EVT/DVT differences.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/Makefile                      |  1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts | 20 ++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts      | 10 ++++++++++
>  arch/arm/mach-aspeed/aspeed.c                   | 11 -----------
>  4 files changed, 31 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6127fd94591c..6102e7bd21ae 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -989,6 +989,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-garrison.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
> +       aspeed-bmc-opp-zaius-evt1.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts
> new file mode 100644
> index 000000000000..21b87a5dbae3
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts
> @@ -0,0 +1,20 @@
> +#include "aspeed-bmc-opp-zaius.dts"
> +
> +&pinctrl {
> +       pinctrl_gpiogab_unbiased: gpiogab_unbiased {
> +               pins = "A14", "E13", "D13", "C13", "B13", "Y21", "AA22", "U18";
> +               bias-disable;
> +       };
> +
> +       pinctrl_gpioi_unbiased: gpioi_unbiased {
> +               pins = "C22", "G18", "D19", "C20", "B22", "G19", "C18", "E20";
> +               bias-disable;
> +       };
> +};
> +
> +&gpio {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpioh_unbiased
> +                       &pinctrl_gpiogab_unbiased
> +                       &pinctrl_gpioi_unbiased>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 73496c8d50f6..c6e58c5b4df1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -359,4 +359,14 @@
>
>  &pinctrl {
>         aspeed,external-nodes = <&gfx &lhc>;
> +
> +       pinctrl_gpioh_unbiased: gpioi_unbiased {
> +               pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";
> +               bias-disable;
> +       };
> +};
> +
> +&gpio {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpioh_unbiased>;
>  };

Looks good.

> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index b3aba87964bf..f73a72676437 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -124,17 +124,6 @@ static void __init do_zaius_setup(void)
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
>         board_rev = (reg >> 3) & 0x1F;
>
> -       /* EVT1 hacks */
> -       if (board_rev == 0) {
> -               /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
> -               reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
> -               writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
> -       }

Please remove this code (in a separate commit if you prefer) and omit
aspeed-bmc-opp-zaius-evt1.dts.

> -
> -       /* Disable GPIO H/AC pulldowns to float 1-wire interface pins */
> -       reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
> -       writel(reg | BIT(23), AST_IO(AST_BASE_SCU | 0x8C));
> -
>         /* Assert MAC2 PHY hardware reset */
>         /* Set pin low */
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
> --
> 2.9.3
>

thanks
xo
