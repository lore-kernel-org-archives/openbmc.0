Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCXwD11rxzDqBN
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 18:16:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cM9B4LJN"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 203so18537693ywe.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AbLFY7awKaVofcIFHarWO35iydL+DHd6NLbKA6ALc/w=;
 b=cM9B4LJN+BHWmKi5kCHc3rwwGLe3AUi6gqUVxqsHjcJ58waR1yINjGbFu1lLMfIzE+
 rpMwcH+p/o/DtHw131GbgYKPlvZ2xmg7UAR3+yaMcPmdYWy05zQYj6hI0x9C6/O78cgF
 fJUqE2Z6/GDaE6UJ2BOHghrZxC/Dt+NkU6VIjy7Qsw2rTEmGhIbvGiTGw40gXI5CApv0
 Txt74EHqqDBpUTzFJALqg2HS7MUP0ZigXNK13cV5BGPdopEFclvtDVlmhQly7GSfr1TX
 PKPgjEz+M92ZkVTL6ctY4f2DqTBQO/uXobL5p+G2z1+a5AJTDA44fLwXtpCPsfGFu/oV
 Katg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AbLFY7awKaVofcIFHarWO35iydL+DHd6NLbKA6ALc/w=;
 b=MMmvOZlIKnZHf3a1oF2IgsSiCiti93PZiA09hirlofxceK76NfFRZBcxvNkb+yCo4H
 LX2AUJYAcOvZ9wVJo26oZM1mJMK1YrDJ4ClYRvigrBpeHAN2wCVN49ImPQMFJZbL3UXQ
 Ywz5ZPk1FO1ZgP6uEvw3Y2yDyNly5h9z+XuEaL+h97ODN9qorFsmq1ZcQFKS6H2aFeA1
 MKSspANfnzIx46ewktnEKRepDds5VRTCb+jCykT5BqbH6kf+hSMv5rQhEnldIr+yFoNm
 ZY+uJQKMa/P193bv67HUfqDTMQItFcx6I3aEJytHh5GJB4ZbHAhUFvkn+sKe9gTzXIkX
 Hz3A==
X-Gm-Message-State: AN3rC/7iDHbbe6QI2WRWI1ed2kKbE6fy1gnJtZTn7ZJLw/qUcBnouvWI
 WPRy6GsMXGfFV9xVFAVjl+7wJAltMA==
X-Received: by 10.129.169.8 with SMTP id g8mr14206919ywh.56.1493194568864;
 Wed, 26 Apr 2017 01:16:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 26 Apr 2017 01:15:48 -0700 (PDT)
In-Reply-To: <20170426051358.1909-1-chen.kenyy@inventec.com>
References: <20170426051358.1909-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Apr 2017 17:45:48 +0930
X-Google-Sender-Auth: YlSJOLwgfkMKN5nFN3mGVU4WZKQ
Message-ID: <CACPK8Xe19-dDyn3GO5RE46=XSdAU=UC=egySFs37d1pBtExW5w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] ARM: dts: aspeed: Modify Laanyang BMC
 device tree
To: Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Wed, 26 Apr 2017 08:16:13 -0000

Hi Ken,

Thank you for your patch. I have some questions below.

On Wed, Apr 26, 2017 at 2:43 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> Modify Lanyang dts and add lanyang initial in aspeed.c
>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 13 +++---
>  arch/arm/mach-aspeed/aspeed.c                | 65 ++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> index 176e4b4..6456458 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -1,4 +1,4 @@
> -/dts-v1/;
> +/dts-v3/;
>
>  #include "aspeed-g5.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> @@ -302,18 +302,17 @@
>  };
>
>  &gpio {
> -       line_apss_reset {
> -               gpio-hog;
> -               gpios = <ASPEED_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
> -               output-high;
> -               line-name = "BMC_APSS_RESET_N";
> -       };
> +
>  };
>
>  &vuart {
>         status = "okay";
>  };
>
> +&gfx {
> +        status = "okay";
> +};
> +
>  &pinctrl {
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index a7b03a0..b1073e5 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -238,6 +238,69 @@ static void __init do_romulus_setup(void)
>      writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
> +static void __init do_lanyang_setup(void)
> +{
> +        unsigned long reg;
> +        unsigned long board_rev;
> +        /* D3 in GPIOA/B/C/D direction and data registers */
> +        unsigned long phy_reset_mask = BIT(27);
> +
> +        do_common_setup();
> +
> +        /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
> +        reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
> +        board_rev = (reg >> 3) & 0x1F;

Can you check that the board uses GPIOM for revision GPIOs? The
version of the schematic that I saw does not.

> +
> +        /* EVT1 hacks */
> +        if (board_rev == 0) {
> +                /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
> +                reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
> +                writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
> +        }
> +
> +        /* Disable GPIO H/AC pulldowns to float 1-wire interface pins */
> +        reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
> +        writel(reg | BIT(23), AST_IO(AST_BASE_SCU | 0x8C));
> +
> +        /* Assert MAC2 PHY hardware reset */

It looks like GPIOD3 is not used for PHY hardware reset.

> +        /* Set pin low */
> +        reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
> +        writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
> +        /* Enable pin for output */
> +        reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
> +        writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
> +        udelay(3);
> +        /* Set pin high */
> +        reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
> +        writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
> +
> +        /* Setup PNOR address mapping for 64M flash
> +         *
> +         *   ADRBASE: 0x3000 (0x30000000)
> +         *   HWMBASE: 0x0C00 (0x0C000000)
> +         *  ADDRMASK: 0xFC00 (0xFC000000)
> +         *   HWNCARE: 0x03FF (0x03FF0000)
> +         *
> +         * Mapping appears at 0x60300fc000000 on the host
> +         */
> +        writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
> +        writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> +
> +        /* Set SPI1 CE1 decoding window to 0x34000000 */
> +        writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
> +
> +        /* Set SPI1 CE0 decoding window to 0x30000000 */
> +        writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));

We should not need to do this. mboxd will set them.

Cheers,

Joel

> +
> +        /* Disable default behavior of UART1 being held in reset by LPCRST#.
> +         * By releasing UART1 from being controlled by LPC reset, it becomes
> +         * immediately available regardless of the host being up.
> +         */
> +        reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +        /* Clear "Enable UART1 reset source from LPC" */
> +        writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
> +}
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -275,6 +338,8 @@ static void __init aspeed_init_early(void)
>                 do_witherspoon_setup();
>         if (of_machine_is_compatible("ibm,romulus-bmc"))
>                 do_romulus_setup();
> +        if (of_machine_is_compatible("inventec,lanyang-bmc"))
> +                do_romulus_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 2.9.3
>
