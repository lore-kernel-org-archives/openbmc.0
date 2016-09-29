Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skx1J1c9WzDsj8
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oUARp2BC; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id i25so2006781uab.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2rxFyHCm3pgmyY7Cw31pdjtGGOKkbjxbtyDdh7y/k8c=;
 b=oUARp2BC6x8e0h71szaLS9ordflr6fBvAcLv2je0m1/lJP49PSjPYraadgB4bOBB0t
 QHYhmGTrTKv0y4JWXZ8nVYeFdEExY0rkgOUpezgb2n3z7SAbQly74X4N0ct7huxO9ayn
 X2PkacgrK0yNEH4c+8qyR1b19xXjP4Lv9AA7LcaYvtc3sKnDjkxM3ojTf8EAMHcjUNPQ
 9RjJReiKT7wcCX8clQiMMoM1+WquLuMmP2jI2LYOf6Nd8N3OKC0pL6ASCYKTFzYpbkdh
 pUmDBum4v0uEf6663Zpns7HsE9I8FBe4dGvYneKXnUINnYZP2P0JKczzL2IuTsdwZ4z0
 GbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2rxFyHCm3pgmyY7Cw31pdjtGGOKkbjxbtyDdh7y/k8c=;
 b=HcknqFhUlvZlrJ62JViX0KnzNdnK1Bj62ZjcX0aQ8LxUg5KrOA0Qc4Bqrs3bywdJZ1
 j/WKp+zCLqmgAyNQE1r+u5MJcu2E0vkjTv3bNRPelRtgbzRMJ0pbOqbRAYURd4CyEBcz
 NsJCD7iTOBdR2i8H19AZRkLNao1fCnNw1GmZD/aL6xRYkdwIHaoifpMcRBQAs7YvbQaP
 wFVbSQp1l4ppOLc+qkNMZc1+LhP5eWdRszZI9pJfXTDwhl0F8uHbRNsONYCVX+6epWz4
 WRsaOAkHay8em8G2XjDUuyELPYS69en9Ykz1+JijRxk/2WTF+oIhZHou519cEghG01Nd
 +EmA==
X-Gm-Message-State: AA6/9Rmo+UdTTK4gYMDCq70xfea4jShQZ0c7V8xXq7oUzGUZx3QilGNC4xnkVeaVj48CSiT5RTcGM/oWqVvnxA==
X-Received: by 10.176.86.136 with SMTP id a8mr8686995uab.118.1475110481870;
 Wed, 28 Sep 2016 17:54:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 17:54:21 -0700 (PDT)
In-Reply-To: <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <bdd34f8c4bfabbc1d3cd05a66ac8734da514b1e5.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:24:21 +0930
X-Google-Sender-Auth: g8IiI-T4_g71Cft_gbSv2NfuPfM
Message-ID: <CACPK8XcEn3cOjS68g_gmqfQwWNuKiRypk-_0NUm91QdUKN6Fng@mail.gmail.com>
Subject: Re: [PATCH 4/8] pinctrl: aspeed-g5: Fix pin association of SPI1
 function
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
X-List-Received-Date: Thu, 29 Sep 2016 00:54:45 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The SPI1 function was associated with the wrong pins: The functions that
> those pins provide is either an SPI debug or passthrough function
> coupled to SPI1. Make the SPI1 mux function configure the relevant pins
> and associate new SPI1DEBUG and SPI1PASSTHRU functions with the pins
> that were already defined.
>
> The notation used in the datasheet's multi-function pin table for the SoC is
> often creative: in this case the SYS* signals are enabled by a single bit,
> which is nothing unusual on its own, but in this case the bit was also
> participating in a multi-bit bitfield and therefore represented multiple
> functions. This fact was overlooked in the original patch.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  4 +-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 86 ++++++-
>  2 files changed, 81 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> index 5e60ad18f147..2ad18c4ea55c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> @@ -43,7 +43,9 @@ aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
>
>  GPID0 GPID2 GPIE0 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4 I2C5 I2C6 I2C7 I2C8
>  I2C9 MAC1LINK MDIO1 MDIO2 OSCCLK PEWAKE PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7
> -RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8
> +RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 SPI1DEBUG SPI1PASSTHRU TIMER4 TIMER5 TIMER6
> +TIMER7 TIMER8 VGABIOSROM
> +
>
>  Examples:
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 235d929e74fd..c8c72e8259d3 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -186,24 +186,84 @@ MS_PIN_DECL(C20, GPIOE1, NDCD3, GPIE0OUT);
>
>  FUNC_GROUP_DECL(GPIE0, B20, C20);
>
> -#define SPI1_DESC      SIG_DESC_SET(HW_STRAP1, 13)
> +#define SPI1_DESC              { HW_STRAP1, GENMASK(13, 12), 1, 0 }
> +#define SPI1DEBUG_DESC         { HW_STRAP1, GENMASK(13, 12), 2, 0 }
> +#define SPI1PASSTHRU_DESC      { HW_STRAP1, GENMASK(13, 12), 3, 0 }
> +
>  #define C18 64
> -SIG_EXPR_LIST_DECL_SINGLE(SYSCS, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SYSCS, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SYSCS, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(SYSCS, SPI1DEBUG, SPI1PASSTHRU);
>  SS_PIN_DECL(C18, GPIOI0, SYSCS);
>
>  #define E15 65
> -SIG_EXPR_LIST_DECL_SINGLE(SYSCK, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SYSCK, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SYSCK, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(SYSCK, SPI1DEBUG, SPI1PASSTHRU);
>  SS_PIN_DECL(E15, GPIOI1, SYSCK);
>
> -#define A14 66
> -SIG_EXPR_LIST_DECL_SINGLE(SYSMOSI, SPI1, COND1, SPI1_DESC);
> -SS_PIN_DECL(A14, GPIOI2, SYSMOSI);
> +#define B16 66
> +SIG_EXPR_DECL(SYSMOSI, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SYSMOSI, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(SYSMOSI, SPI1DEBUG, SPI1PASSTHRU);
> +SS_PIN_DECL(B16, GPIOI2, SYSMOSI);
>
>  #define C16 67
> -SIG_EXPR_LIST_DECL_SINGLE(SYSMISO, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SYSMISO, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SYSMISO, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(SYSMISO, SPI1DEBUG, SPI1PASSTHRU);
>  SS_PIN_DECL(C16, GPIOI3, SYSMISO);
>
> -FUNC_GROUP_DECL(SPI1, C18, E15, A14, C16);
> +#define VB_DESC        SIG_DESC_SET(HW_STRAP1, 5)
> +
> +#define B15 68
> +SIG_EXPR_DECL(SPI1CS0, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SPI1CS0, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1CS0, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1CS0, SIG_EXPR_PTR(SPI1CS0, SPI1),
> +                           SIG_EXPR_PTR(SPI1CS0, SPI1DEBUG),
> +                           SIG_EXPR_PTR(SPI1CS0, SPI1PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBCS, VGABIOSROM, COND1, VB_DESC);
> +MS_PIN_DECL(B15, GPIOI4, SPI1CS0, VBCS);
> +
> +#define C15 69
> +SIG_EXPR_DECL(SPI1CK, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SPI1CK, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1CK, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1CK, SIG_EXPR_PTR(SPI1CK, SPI1),
> +                           SIG_EXPR_PTR(SPI1CK, SPI1DEBUG),
> +                           SIG_EXPR_PTR(SPI1CK, SPI1PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBCK, VGABIOSROM, COND1, VB_DESC);
> +MS_PIN_DECL(C15, GPIOI5, SPI1CK, VBCK);
> +
> +#define A14 70
> +SIG_EXPR_DECL(SPI1MOSI, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SPI1MOSI, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1MOSI, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1MOSI, SIG_EXPR_PTR(SPI1MOSI, SPI1),
> +                           SIG_EXPR_PTR(SPI1MOSI, SPI1DEBUG),
> +                           SIG_EXPR_PTR(SPI1MOSI, SPI1PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBMOSI, VGABIOSROM, COND1, VB_DESC);
> +MS_PIN_DECL(A14, GPIOI6, SPI1MOSI, VBMOSI);
> +
> +#define A15 71
> +SIG_EXPR_DECL(SPI1MISO, SPI1, COND1, SPI1_DESC);
> +SIG_EXPR_DECL(SPI1MISO, SPI1DEBUG, COND1, SPI1DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1MISO, SPI1PASSTHRU, COND1, SPI1PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1MISO, SIG_EXPR_PTR(SPI1MISO, SPI1),
> +                           SIG_EXPR_PTR(SPI1MISO, SPI1DEBUG),
> +                           SIG_EXPR_PTR(SPI1MISO, SPI1PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBMISO, VGABIOSROM, COND1, VB_DESC);
> +MS_PIN_DECL(A15, GPIOI7, SPI1MISO, VBMISO);
> +
> +FUNC_GROUP_DECL(SPI1, B15, C15, A14, A15);
> +FUNC_GROUP_DECL(SPI1DEBUG, C18, E15, B16, C16, B15, C15, A14, A15);
> +FUNC_GROUP_DECL(SPI1PASSTHRU, C18, E15, B16, C16, B15, C15, A14, A15);
> +FUNC_GROUP_DECL(VGABIOSROM, B15, C15, A14, A15);
> +
> +#define R2 72
> +SIG_EXPR_LIST_DECL_SINGLE(SGPMCK, SGPM, SIG_DESC_SET(SCU84, 8));
> +SS_PIN_DECL(R2, GPIOJ0, SGPMCK);
>
>  #define L2 73
>  SIG_EXPR_LIST_DECL_SINGLE(SGPMLD, SGPM, SIG_DESC_SET(SCU84, 9));
> @@ -580,6 +640,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(A12),
>         ASPEED_PINCTRL_PIN(A13),
>         ASPEED_PINCTRL_PIN(A14),
> +       ASPEED_PINCTRL_PIN(A15),
>         ASPEED_PINCTRL_PIN(A2),
>         ASPEED_PINCTRL_PIN(A3),
>         ASPEED_PINCTRL_PIN(A4),
> @@ -592,6 +653,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(B12),
>         ASPEED_PINCTRL_PIN(B13),
>         ASPEED_PINCTRL_PIN(B14),
> +       ASPEED_PINCTRL_PIN(B15),
> +       ASPEED_PINCTRL_PIN(B16),
>         ASPEED_PINCTRL_PIN(B2),
>         ASPEED_PINCTRL_PIN(B20),
>         ASPEED_PINCTRL_PIN(B3),
> @@ -603,6 +666,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(C12),
>         ASPEED_PINCTRL_PIN(C13),
>         ASPEED_PINCTRL_PIN(C14),
> +       ASPEED_PINCTRL_PIN(C15),
>         ASPEED_PINCTRL_PIN(C16),
>         ASPEED_PINCTRL_PIN(C18),
>         ASPEED_PINCTRL_PIN(C2),
> @@ -691,11 +755,14 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
>         ASPEED_PINCTRL_GROUP(RMII2),
>         ASPEED_PINCTRL_GROUP(SD1),
>         ASPEED_PINCTRL_GROUP(SPI1),
> +       ASPEED_PINCTRL_GROUP(SPI1DEBUG),
> +       ASPEED_PINCTRL_GROUP(SPI1PASSTHRU),
>         ASPEED_PINCTRL_GROUP(TIMER4),
>         ASPEED_PINCTRL_GROUP(TIMER5),
>         ASPEED_PINCTRL_GROUP(TIMER6),
>         ASPEED_PINCTRL_GROUP(TIMER7),
>         ASPEED_PINCTRL_GROUP(TIMER8),
> +       ASPEED_PINCTRL_GROUP(VGABIOSROM),
>  };
>
>  static const struct aspeed_pin_function aspeed_g5_functions[] = {
> @@ -733,11 +800,14 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
>         ASPEED_PINCTRL_FUNC(RMII2),
>         ASPEED_PINCTRL_FUNC(SD1),
>         ASPEED_PINCTRL_FUNC(SPI1),
> +       ASPEED_PINCTRL_FUNC(SPI1DEBUG),
> +       ASPEED_PINCTRL_FUNC(SPI1PASSTHRU),
>         ASPEED_PINCTRL_FUNC(TIMER4),
>         ASPEED_PINCTRL_FUNC(TIMER5),
>         ASPEED_PINCTRL_FUNC(TIMER6),
>         ASPEED_PINCTRL_FUNC(TIMER7),
>         ASPEED_PINCTRL_FUNC(TIMER8),
> +       ASPEED_PINCTRL_FUNC(VGABIOSROM),
>  };
>
>  static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
> --
> git-series 0.8.10
