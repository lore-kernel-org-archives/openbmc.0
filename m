Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCSFQ4SywzDqFH
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 14:45:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h/EfsGPp"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id x188so23342740itb.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 21:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tS2cxX0Rv59Z8gcTUij7+u0chDWZHwBjQaTKxHIHzI0=;
 b=h/EfsGPpSQibQFVfSbUBQM8ir+GxC3W86pbplOoEjzMrkdaaRYPxzgNU6l90P2KkpH
 8EU197R3Ea5Uhmnpr8K0aP0bW7q0sZGJI86veuHjHzYstVX7AD/NhHVSVr0yJ1UfYSZT
 yon9Qku/b9lWnkcIujj8nbL7tSRJULiE8EhEKjnWMiScEvsxfiqA8PP0fZkPSqE7AiHg
 xdGOAJ8VMb2yXDRmnCRAPWNocdWDhv6UQsJguaRvj43Z5CY2wbQWxyrgdvd+DB3Oa7JY
 SB/nEAAX9gxamtA2PdcVdg7RhABjYYPVPC1UBJeqzHcKTu7PrYY+9t2/CrBvT1bwM9CP
 /kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tS2cxX0Rv59Z8gcTUij7+u0chDWZHwBjQaTKxHIHzI0=;
 b=fkre60HCy5dAVhoD3LutnoGH/eW0Fdlg7MPEJtPUZVbykGQ9Ks5FQopk28G/b7PLAw
 E4OoRs4UJP/0TFvJW0Sg0mrqFxWvNkVZO7sOftiTfo1pJ8W5oQ5TWp76fcTOhorhqBtp
 kkelYFWKjSqCvK+SpdO9Rv1FPAFDWKOx8KgINtpIPBBLvzYe2wLyogT58Ijs3vjEVz2y
 yz9VN9ruz5xiTgbfL7bdeIs6T4di60RQSpBJCW8aCXKsMaKTwx+k537DZl771ToB6N/Z
 ZRV3y0qnmWsFsUgBLMwO8HY8qwgnQ1h6HGN3rYafbLFsyIevE5EbGhaurv3aV1a7L8Vr
 uK6Q==
X-Gm-Message-State: AN3rC/47NfJXw25oLWC+hnnlftE4gi0sArVKqZ6cbm1NeWyiFECLh4Bi
 m2PTG/hYGhhVDCnOvEKMNL2BDhn2YA==
X-Received: by 10.36.69.195 with SMTP id c64mr9203236itd.12.1493181944552;
 Tue, 25 Apr 2017 21:45:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.150.10 with HTTP; Tue, 25 Apr 2017 21:45:43 -0700 (PDT)
In-Reply-To: <20170425105207.39501-1-chen.kenyy@inventec.com>
References: <20170425105207.39501-1-chen.kenyy@inventec.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Apr 2017 12:45:43 +0800
Message-ID: <CAARXrtkrU8qn6+OtZXO_qCMs2zwmWxcK9ctykpS6Sqz-+an8-Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Modify Laanyang BMC
 device tree
To: KenChenIEC <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 26 Apr 2017 04:45:47 -0000

Hi Ken,

On Tue, Apr 25, 2017 at 6:52 PM, KenChenIEC <chen.kenyy@inventec.com> wrote:
> Modify Lanyang dts and add lanyang initial in aspeed.c
>
> Signed-off-by: KenChenIEC <chen.kenyy@inventec.com>
Probably it's better to change to "Ken Chen <chen.kenyy@inventec.com>"

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
