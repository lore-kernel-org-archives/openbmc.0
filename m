Return-Path: <xow@google.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF5Bb6JtwzDqBQ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 06:33:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VrtB2usv"; 
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id f76so62402870qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kDzm8VC6V1w3Mkcfheh85F5qJS4Mwxpn9uZ/hFG79+I=;
 b=VrtB2usvtSJFRq605erQN4Qn/EqFa9FUczVgrHfxzkjvpZY2T1uzuLRBok0cQf1qav
 wNMGLg/buayaofg51ZbEcealdEcmUCejDjQ+kiIxFESOMFTRKvzjdHcQG5u6Nunx2eFc
 miwXmyrSwK6wEGCTQ9RyHoGiq+u1zpf9S8LNzbNK+y4r4gHPLvabV5XTHFi/oji5sgqK
 dsh25mbWkvHyenHVSH3A241hL/dxvXOo84NmzbGYYyCfnPzIqdH+3VoOjSUJAhSiyLfC
 Ts9tnZrWcdkyB6Qbpia/RU6UrsKyj1LaZ99bl00eNoC6tHSbBx1Wo78UQwcq0SsuHtW2
 y/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kDzm8VC6V1w3Mkcfheh85F5qJS4Mwxpn9uZ/hFG79+I=;
 b=MnNYA8NhsUeHyV8LePiy+GaIqkHWEgN+4tZvXNoeXPJ7rwtNhqBsp9rp6bct7oXYSd
 w85C0AZm47xPowgleToR3LHUapt24sOtn4Ll7bO23oAn2HJn2SzgW0vM+Gb+NPwLD+ur
 4Vu14HlbxvKzKjY7SIpTIQiuZRT1cJ0YVpAGFd51n+lzjne2Ym+s9Kit6o8dLoVUL5kM
 J7csUtLUKBntodzttTgnNpbT4cS6hhFjgso2TIdMe/JyAGL9PXJ0ekRmVdPtqzRrMW4b
 2UG9f+uYGki7ks72ectzKxmZMDOscckId9CCy+ACpQUALsLwLIoCPj+ZQq4Sr/hKOQOp
 NUAw==
X-Gm-Message-State: AN3rC/66Ll09PXox7kjz0dihabddbNUI+dQlCIbW9WKkAFWJVesYrP79
 3a0Th85gLHWfuauC15WgEuljuMXmaeoXvMvW/A==
X-Received: by 10.55.3.13 with SMTP id 13mr10835410qkd.300.1493411637043; Fri,
 28 Apr 2017 13:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Fri, 28 Apr 2017 13:33:56 -0700 (PDT)
In-Reply-To: <20170428071043.1355-12-andrew@aj.id.au>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-12-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 28 Apr 2017 13:33:56 -0700
Message-ID: <CAPH-5w5Ykq=7WFukmtrp7_Z+ZzAbYMU1bQZhJ26K9BqJWA1zTA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 11/11] aspeed: zaius: Disable GPIO bias
 via devicetree pinconf requests
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 20:34:00 -0000

On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 16 ++++++++++++----
>  arch/arm/mach-aspeed/aspeed.c              |  4 ----
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index acf7cc8d0e6d..b5c4c0fb2986 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -333,7 +333,19 @@
>          */
>  };
>
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +
> +       pinctrl_gpioh_unbiased: gpioi_unbiased {
> +               pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";

Out of curiosity, do you need to specify all eight pins affected by
the "unbiased" register bit, or only the ones that you need for some
functionality? In this case, only the first four pins are required for
the 1-wire interfaces, but the whole port's pull-downs are controlled
by one bit.

> +               bias-disable;
> +       };
> +};
> +
>  &gpio {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_gpioh_unbiased>;
> +
>         line_iso_u146_en {
>                 gpio-hog;
>                 gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
> @@ -370,7 +382,3 @@
>  &gfx {
>         status = "okay";
>  };
> -
> -&pinctrl {
> -       aspeed,external-nodes = <&gfx &lhc>;
> -};
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 814a303a3894..760fed641a0b 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -124,10 +124,6 @@ static void __init do_zaius_setup(void)
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
>         board_rev = (reg >> 3) & 0x1F;
>
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

+OpenBMC list

Reviewed-by: Xo Wang <xow@google.com>
