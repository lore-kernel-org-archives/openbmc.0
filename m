Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H9Q1MK2j"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLnjg11zczF0Yd
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 11:17:58 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id 33so20543164qtv.1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 16:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PKViMyCWJZfoHcas/gaufWf6p0zNYyJa2vRSV3J4LI8=;
 b=H9Q1MK2jyvP8uVmqphe8OmnnBXri2EdnTTbqVsC6otIXx2YqwaiZbsKWg47zNjgQZy
 OVZBklrdUT6aSFpYSHU0rJVC4jywIqcJJoP8k4XCy2EP6wN4g5AMcSgfN42ZtxStzwys
 Ew7sBY02NLg5/pHx3ehXgVQlpBttjjKPljVYAw5PJ1qXSf4wJhq3KFfS+hGiVz5NLrz5
 LWcJ+B6Imt3Eqy2EHLNdMFvZS63WRXCStil2gScFohUF7vzLg0uYXmCs266wM7Y33o7D
 gGIR/hifcQ9hMGoXWtWfiIf2Va1mc1UnDEYqYS8hyBsiLCcnW6x2t3/2Zwq1KD5UqT2S
 MN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PKViMyCWJZfoHcas/gaufWf6p0zNYyJa2vRSV3J4LI8=;
 b=IK37xgkh5/EXeyTPJd/8vBcOe8T+OSEz82CZLd4+rUosq/MuaJhwdS5NPmZBnwwMSA
 W3HrJ+198+lU8IAARzNvzjjQhB4z9tkealv5nK/qTWJJvcH9Ylw19sMwW6uaEXpU9Huj
 /HpwLwpVKDi6Q+2hzTjL3g3VKaMUPQbVHRvCy43Hf2X/t52nQGXtpj1FNRHf1W07L8pz
 sWSYY2BeRODiWbbY6eFZQJ00CmoFVWAkPSPygH2Fh4alRtM2ev5FERvJQRqd30KMUpzj
 i/9LG42fboZWhA/QAQWglnNOGsUb06xNowBd8ySn2lIK/R0dGhRtw6zHfDFIPgDpPxjo
 Bs5Q==
X-Gm-Message-State: AKwxytd9+xK0Sg9WOAam0IhlS2MqBd2o8bX2g6j6CwnRqBrIBBt5UTTl
 beFKYQt1FxAWXZHptA8F9BmJgCuz9N59+jZuAzQ=
X-Google-Smtp-Source: ACJfBouZpIbJLknI+nDKgepv265KxL2rXN2qhVEBMh/Dsosd6GtcAlJjTUmzKsKA8JWw8D2yO/aEZCQiviXPQVxuJ7I=
X-Received: by 10.200.36.199 with SMTP id t7mr12457684qtt.141.1516148276113;
 Tue, 16 Jan 2018 16:17:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 16:17:35 -0800 (PST)
In-Reply-To: <20180108030013.20873-1-chen.kenyy@inventec.com>
References: <20180108030013.20873-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 18:17:35 -0600
X-Google-Sender-Auth: y6ouyrSrfi9but4aoGDpai0eFjQ
Message-ID: <CACPK8XeHFZrCJuFb33i3+xvCvfTLNEXbKcW11eFLjRtm8V5LXQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system BMC
 device tree
To: Ken Chen <chen.kenyy@inventec.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 00:18:00 -0000

Hello Ken,

Thanks for the patch. Some comments are below. Feel free to ask
questions if you need more information.

On Sun, Jan 7, 2018 at 9:00 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> Add 2400-rep dts and modify platform initial in aspeed.c

What is 2400-rep stand for?

I can see it being confused with the ast2400. Do you have other
suggestions for names for this machine?

>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts | 440 ++++++++++++++++++++++++++
>  arch/arm/mach-aspeed/aspeed.c                 |  22 ++
>  2 files changed, 462 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
> new file mode 100644
> index 0000000..cf389f5
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
> @@ -0,0 +1,440 @@

Add copyright information to the first line. Something like this:

 // SPDX-License-Identifier: GPL-2.0
 // Copyright 2018 My Company, Inc

eg:

 https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts?h=for-next


> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Qualcomm Centriq 2400  REP AST2520";
> +       compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */

We use this for an OpenPower specific feature that allows faster
loading of the host firmware. Are you planning on doing the same with
ARM?

> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 7>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               UID_LED {

lowercase for the node please:

 uid_led {
 }

> +                       label = "UID_LED";

I think we have a naming convention for openbmc led labels. Brad, can
you help out here?

> +                       gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               RAS_ERROR_LED {
> +                       label = "RAS_ERROR_LED";
> +                       gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               System_Fault {
> +                       label = "System_fault";
> +                       gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;

add:

                label = "bmc";

> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +        reg = <0x1e630000 0xc4 0x30000000 0x08000000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "aspeed,ast2500-spi";
> +        status = "okay";
> +        clocks = <&clk_ahb>;
> +        clock-names = "ahb";
> +        flash@0 {
> +                reg = < 0 >; /* chip select number */
> +                compatible = "jedec,spi-nor";
> +                status = "okay";
> +        };

This is all defined in the aspeed-g5.dtsi. You just need this to
enable the controller and the first chip select:

&spi1 {
     status = "okay";
     flash@0 {
               status = "okay";
               m25p,fast-read;
               label = "pnor";
     };
};

> +};
> +
> +&spi2 {
> +        compatible = "aspeed,ast2500-spi-generic";
> +        reg = <0x1e631000 0xc4 0x38000000 0x02000000>;
> +        interrupts = <59>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        status = "okay";
> +        spi2@0 {
> +                reg = < 0 >;
> +                compatible = "centriq,centriq2400-spi-hwmon";

That's kind of strange. I assume you have a driver for this?

Either way, the device tree is incorrect.

> +                spi-max-frequency = <16000000>;
> +                status = "okay";
> +        };
> +};
> +
> +&uart3 {
> +        status = "okay";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_txd3_default
> +                     &pinctrl_rxd3_default>;
> +        current-speed = <115200>;
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       pca9542@70 {
> +                compatible = "pca9542";
> +                reg = <0x70>;
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +                       pca9546@77 {
> +                               compatible = "pca9546";
> +                               reg = <0x77>;
> +                               i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                                       eeprom@52 {
> +                                               compatible = "atmel,24c02";
> +                                               reg = <0x52>;
> +                                       };
> +                               };
> +                               i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                                       eeprom@57 {
> +                                               compatible = "atmel,24c02";
> +                                               reg = <0x57>;
> +                                       };
> +                               };
> +                       };
> +               };
> +               i2c@1 {
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +                       pca9546@77 {
> +                               compatible = "pca9546";
> +                               reg = <0x77>;
> +                               i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                                       eeprom@57 {
> +                                               compatible = "atmel,24c02";
> +                                               reg = <0x57>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +        };
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +        tmp421@1e {
> +                compatible = "ti,tmp421";
> +                reg = <0x1e>;
> +        };
> +        tmp421@2a {
> +                compatible = "ti,tmp421";
> +                reg = <0x2a>;
> +        };
> +        tmp421@4e {
> +                compatible = "ti,tmp421";
> +                reg = <0x4e>;
> +        };
> +        tmp421@1c {
> +                compatible = "ti,tmp421";
> +                reg = <0x1c>;
> +        };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       ssif {
> +                compatible = "ssif-smbus-slave";

There are no bindings that use this string. Do you have a driver for this?

> +                reg = <0x42>;
> +        };
> +
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +        ir38163@42 {
> +                compatible = "ir38163";

There are no bindings that use this string. Do you have a driver for this?

> +                reg = <0x42>;
> +        };
> +       ir38163@44 {
> +                compatible = "ir38163";
> +                reg = <0x44>;
> +        };
> +       ir38163@46 {
> +                compatible = "ir38163";
> +                reg = <0x46>;
> +        };
> +       ir38163@48 {
> +                compatible = "ir38163";
> +                reg = <0x48>;
> +        };
> +       pxm1310@02 {
> +                compatible = "pxm1310";

Again, there are no bindings that use this string. Do you have a
driver for this?

> +                reg = <0x02>;
> +        };
> +       pxm1310@04 {
> +                compatible = "pxm1310";
> +                reg = <0x04>;
> +        };
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       tmp421@1d {
> +                compatible = "ti,tmp421";
> +                reg = <0x1d>;
> +        };
> +        tmp421@1f {
> +                compatible = "ti,tmp421";
> +                reg = <0x1f>;
> +        };
> +        tmp421@4d {
> +                compatible = "ti,tmp421";
> +                reg = <0x4d>;
> +        };
> +        tmp421@4f {
> +                compatible = "ti,tmp421";
> +                reg = <0x4f>;
> +        };
> +
> +        nvt210@4c {
> +                compatible = "nvt210";
> +                reg = <0x4c>;
> +        };
> +
> +       eeprom@50 {
> +                compatible = "atmel,24c128";
> +                reg = <0x50>;
> +               pagesize = <128>;

Whitespace is bad here.

> +        };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +        adm1278@10 {
> +                compatible = "adi,adm1278";
> +                reg = <0x10>;
> +               Rsense = <250>;
> +        };
> +        adm1278@11 {
> +                compatible = "adi,adm1278";
> +                reg = <0x11>;
> +               Rsense = <250>;

This looks wrong. Is this a custom modification to the driver to
support this property?

> +        };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       pca9641@70 {
> +               compatible = "nxp,pca9641";
> +               reg = <0x70>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                i2c-arb{
> +                        tmp421@1d {
> +                                compatible = "tmp421";
> +                                reg = <0x1d>;
> +                        };
> +                       adm1278@12 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x12>;
> +                               Rsense = <500>;
> +                       };
> +                        max31790@20 {
> +                                compatible = "max31790";
> +                                reg = <0x20>;
> +                                #address-cells = <1>;
> +                                #size-cells = <0>;
> +                               fan-mode = "pwm";
> +                                fanconfig1 = <0x08>;
> +                                fanconfig2 = <0x09>;
> +                                fanconfig3 = <0x08>;
> +                                fanconfig4 = <0x08>;
> +                                fanconfig5 = <0x09>;
> +                                fanconfig6 = <0x08>;
> +                        };

Andrew, can you please review the max parts?

> +                       max31790@23 {
> +                               compatible = "max31790";
> +                               reg = <0x23>;
> +                               #address-cells = <2>;
> +                               #size-cells = <0>;
> +                               fan-mode = "pwm";
> +                                fanconfig1 = <0x08>;
> +                                fanconfig2 = <0x09>;
> +                                fanconfig3 = <0x08>;
> +                                fanconfig4 = <0x08>;
> +                                fanconfig5 = <0x09>;
> +                                fanconfig6 = <0x08>;
> +                       };
> +                       eeprom@50 {
> +                               compatible = "atmel,24c02";
> +                               reg = <0x50>;
> +                       };
> +                        ds1100@58 {
> +                                compatible = "ds1100";
> +                                reg = <0x58>;
> +                        };
> +               };
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "disabled";
> +};
> +
> +&i2c11 {
> +       status = "disabled";
> +};
> +
> +&i2c12 {
> +       status = "disabled";
> +};
> +
> +&i2c13 {
> +       status = "disabled";
> +};

Delete the above; they are disabled by default so you don't need to
specify this.

> +&vuart {
> +       status = "okay";
> +};
> +
> +&gfx {
> +        status = "okay";
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +&gpio {
> +       pin_gpio_a3 {

Do you want to add labels that contain the net names for each gpio? I
recommend doing this so it is understood what each line is doing.


> +               gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_c7 {
> +               gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_d2 {
> +               gpios = <ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
> +       pin_gpio_d3 {
> +               gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
> +       pin_gpio_f6 {
> +               gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
> +       pin_gpio_g4 {
> +               gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_LOW>;
> +               output-low;
> +       };
> +       pin_gpio_g6 {
> +               gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_l4 {
> +               gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
> +       pin_gpio_o6 {
> +               gpios = <ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_p0 {
> +               gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
> +       pin_gpio_p2 {
> +               gpios = <ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_q4 {
> +               gpios = <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +       };
> +       pin_gpio_r1 {
> +               gpios = <ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
> +       pin_gpio_y2 {
> +               gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
> +};
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 5965bbf..4f6a5e9 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c

Device tree changes should go in a separate to code changes.

> @@ -29,6 +29,7 @@
>  #define AST_BASE_MAC0          0X1E660000 /* MAC 1 */
>  #define AST_BASE_SCU           0x1E6E2000 /* System Control Unit (SCU) */
>  #define AST_BASE_GPIO          0x1E780000 /* GPIO Controller */
> +#define AST_BASE_WDT           0x1E785000 /* Watchdog Timer */
>
>  static struct map_desc aspeed_io_desc[] __initdata __maybe_unused = {
>         {
> @@ -232,6 +233,25 @@ static void __init do_mellanox_setup(void)
>         writel(reg, AST_IO(AST_BASE_SCU | 0x48));
>  }
>
> +
> +static void __init do_centriq2400rep_setup(void)
> +{
> +       u32 reg;
> +
> +       do_common_setup();
> +       writel(0x00000010, AST_IO(AST_BASE_WDT | 0x2c));

We have a watchdog driver for modifying the watchdog. Please use that
instead of this line.

> +
> +       writel(0xff000000, AST_IO(AST_BASE_SCU | 0x88));

This appears to be modifying the multi function pin control. What are
you trying to do?

We should be able to use the pinctrl driver to modify these settings.

> +
> +       /* Set GPIOC7 to output high to init host spi driver */
> +       reg = readl(AST_IO(AST_BASE_GPIO | 0x04)) | BIT(23);
> +       writel(reg, AST_IO(AST_BASE_GPIO | 0x04));
> +       reg = readl(AST_IO(AST_BASE_GPIO)) | BIT(23);
> +       writel(reg, AST_IO(AST_BASE_GPIO));

Can you use a GPIO hog instead?


> +}
> +
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -284,6 +304,8 @@ static void __init aspeed_init_early(void)
>                 do_lanyang_setup();
>         if (of_machine_is_compatible("mellanox,msn-bmc"))
>                 do_mellanox_setup();
> +        if (of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
> +                do_centriq2400rep_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 2.9.3
>
