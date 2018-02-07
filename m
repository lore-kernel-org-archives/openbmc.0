Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3w7olME"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbt4S3xz3zF0yb
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 18:19:36 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id g14so5709943qti.2
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 23:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8DDlF+5XetjVBiLh3IX0EqzAViMkk4kN1P4mcwVywhg=;
 b=f3w7olMEEz2IBJN2FGuRQttx+AEfkMwNzTW4ygkzyiRqnmsKJRRrawi79XwDeBq0sZ
 P4zD/Sxxx8VFheNXrI5lESpz77G2BZPKcw1Ye/cFIfAKm120nGF4i61mtDBPXxs6X1Ag
 HucHCpIq7pYQyb8OD0eJCnsZOLbcQdtSBWlVKz6RXJeIKRpw61tBYNuahNsbXqG88faw
 X83mu/FkCPgmu80CBL+IbDOY8ccsRCqhkXjcamIaeQRq0A2cq2CevnQPp3z0aj9vzNOx
 UP4AaIh4hyUtI7Bld+aJpkFKmrzPlAsoWmncWKOu80bJh2JMU9RB2T3T3vbXpJHoJ91h
 sx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8DDlF+5XetjVBiLh3IX0EqzAViMkk4kN1P4mcwVywhg=;
 b=b153+1nrxRTiibGQOMli8K8K9Id31inSqnNJSjdoi0CpNRCiB0CFp+IimGOrcdsm+F
 QHH4rsD7DEqjkD+AZhcbKKTvlpkJ1F7LGgP/vLkFclyund1Le9lGiWGwhGMovwdcApC/
 HcSn3d1qmFzP48UsFTT8NuO7fo9F0Wr1wS6LiWXre6Mbju9pCBHRtz62KzDp2UwxtqFa
 F5PwFATjUFbUi+nfZcPjLLHlU7T8Qh6dQNfxyRd1MbUPQRKSYxEaabTD8vk1QiimW5Wf
 T9sdd+1b1ii/N1H97n5mAI+xby5iaheji+7tlDZYJWloGoed6rQYrGT6bzTbR7tsn1KU
 2hpg==
X-Gm-Message-State: APf1xPCxNWx99nLVI+w6G6d+PokRxZgIZJQP4Viwx3yV8yLbgbdUSViv
 R2P+ChaUKHzksQC/eWKN6j/TOdQlCUh9Q2rIkiI=
X-Google-Smtp-Source: AH8x2255N/D5CUyWiP81mo2S2u6E0xXmK1rRT0w7Gr82QIqEv+Y1AsgUFOKYFB69e0W1vQMW0f/2qa5d9GpRpGGVKp0=
X-Received: by 10.200.50.3 with SMTP id x3mr7595396qta.130.1517987973154; Tue,
 06 Feb 2018 23:19:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.179 with HTTP; Tue, 6 Feb 2018 23:19:12 -0800 (PST)
In-Reply-To: <20180207060111.3280-1-chen.kenyy@inventec.com>
References: <20180207060111.3280-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Feb 2018 17:49:12 +1030
X-Google-Sender-Auth: K_dI_77yhfbCtSR4F2VZRXzX84k
Message-ID: <CACPK8XfZ3bReXGktqr-7EL3xPyNQanXZoKCTWXy3K-UU4PP_EQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Add ARM system BMC
 device tree
To: Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 07:19:37 -0000

On Wed, Feb 7, 2018 at 4:31 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> Add centriq2400-rep dts and modify platform initial

Hi Ken,

There are a number of issues with this patch that I commented on in my
last review of v2.

I suggest you reply to each of the comments in my previous review and
let me know if you've addressed them (a simple 'ok' is enough). If you
disagree with the review, please explain why you want to keep the code
as it is. If you need further clarification then that's fine too,
follow up questions are encouraged.

Finally, when you're preparing a new version, add a change log just
below the ---. You can see an example of that in this patch:

 http://patchwork.ozlabs.org/patch/867147/

Cheers,

Joel

>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
> ---
>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 286 +++++++++++++++++++++
>  arch/arm/mach-aspeed/aspeed.c                      |  11 +
>  2 files changed, 297 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> new file mode 100644
> index 0000000..de1240b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0+
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
> +               uid_led {
> +                       label = "UID_LED";
> +                       gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ras_error_led {
> +                       label = "RAS_ERROR_LED";
> +                       gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               system_fault {
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
> +                lable = "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_spi1_default>;
> +        flash@0 {
> +                reg = < 0 >; /* chip select number */
> +                compatible = "jedec,spi-nor";
> +                status = "okay";
> +        };
> +};
> +
> +&spi2 {
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>;
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
> +        nvt210@4c {
> +                compatible = "nvt210";
> +                reg = <0x4c>;
> +        };
> +        eeprom@50 {
> +                compatible = "atmel,24c128";
> +                reg = <0x50>;
> +                pagesize = <128>;
> +        };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +        status = "okay";
> +
> +        pca9641@70 {
> +                compatible = "nxp,pca9641";
> +                reg = <0x70>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                i2c-arb{
> +                        tmp421@1d {
> +                                compatible = "tmp421";
> +                                reg = <0x1d>;
> +                        };
> +                        adm1278@12 {
> +                                compatible = "adi,adm1278";
> +                                reg = <0x12>;
> +                               Rsense = <500>;
> +                        };
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
> +&wdt2 {
> +        status = "okay";
> +};
> +
> +&gpio {
> +        pin_gpio_c7 {
> +                gpio-hog;
> +                gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
> +                output;
> +                line-name = "BIOS_SPI_MUX_S";
> +        };
> +
> +}
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 5965bbf..8fce9bc 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -232,6 +232,15 @@ static void __init do_mellanox_setup(void)
>         writel(reg, AST_IO(AST_BASE_SCU | 0x48));
>  }
>
> +
> +static void __init do_centriq2400rep_setup(void)
> +{
> +       u32 reg;
> +
> +       do_common_setup();
> +}
> +
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -284,6 +293,8 @@ static void __init aspeed_init_early(void)
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
