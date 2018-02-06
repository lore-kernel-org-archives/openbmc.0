Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iey8T1mT"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbD3S6RWmzF0X6
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 16:46:28 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id l29so893069qkj.8
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 21:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=EPdCXB9aXyQxaj9bNLKCsn0d8wfMssa/ScNg33/0Gs8=;
 b=iey8T1mTLs1Jyb1gKiXodd9Jcn6n8JfVRWGZ3qUl8VcxNI3xTFdZCjJXs1rceTO691
 vXzcALzelgXSbPjv/3voiHbHy2jepchISuog6vw0Co99qvlZ/oh2PUSHhjDf7zok9L8P
 gACMxI3QtpRTYAsn4tpSSZtJBIZXG9ZvAkSVFwLa7KWYf5jiESkiLIBzNQK0X6PEBki5
 dq1aboeF7E64tPobm0LZBRnwNY1Dc2vGPQOeVhhbouMsYR07v8jybX+WHXXdA0wpq/it
 WAHfe2ouP1YOrtlRFGLRA4pvX8K3lROZgl4GqzqUOfGczhibKcewxmh8PSp11eVyVEgQ
 0izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=EPdCXB9aXyQxaj9bNLKCsn0d8wfMssa/ScNg33/0Gs8=;
 b=I5OazUNxbayj0lS8IpywvvyvL2wr7zYTOsbpcRjXvOKHncaf9uEMpoESurkHeNvRI9
 78pm/8yGY9BZ67MdLq7Z+j+1U3dckBNbFB2IyD/zR0l2iI7nipF0uxA5Z64lCIQif7hr
 k8wGjX+lziH9i1cLqKOMNp4oQpi5UYGqvVA1Pi1y/a4/Ck9hp86HEJtDdGlbytcHRiLi
 N3EqZT+NwPI2J9MozjxdTP6qaL4Oa0+iAnfi+smRoVorKtKTzMmMHXBvv0bq1tSbFoBV
 E1EFbeam6tJr4L2USfQ/fwy28dkPNhZoQUoq0NiSqU5VFvwu7zgcPFh2BE6L1kRSIYcu
 mzHw==
X-Gm-Message-State: APf1xPBSIVV5sLd4ycMjnUCc2D3VmBNdz6QsTTatpPzoS0/QM/vMkz4P
 nfsClCZ6ztVcwONoTmgZS49KC97cpplxfE5WQdY=
X-Google-Smtp-Source: AH8x224Hrz0C39afoYvf7XOUIHkzQjlOclwdzgD+eV6ZJPrzZzHM4E6KQBfDAcL/24BPsjlu1xrQU3b0Y1CmmcQIQp0=
X-Received: by 10.55.20.228 with SMTP id 97mr1874186qku.158.1517895985529;
 Mon, 05 Feb 2018 21:46:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Mon, 5 Feb 2018 21:46:05 -0800 (PST)
In-Reply-To: <39E6480C5A587146BAA4D885C7BCF7EEC6AD8200@IET-EX2010-MX2.iec.inventec>
References: <20180205030343.25114-1-chen.kenyy@inventec.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6AD8200@IET-EX2010-MX2.iec.inventec>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Feb 2018 16:16:05 +1030
X-Google-Sender-Auth: chg4b0QyudGUGUYT5k2C1CWXgXY
Message-ID: <CACPK8XcjviDZfr5aMUj55OZ0g1RgDsJ9qA3WwRiafo2FZuu2jg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Add ARM system BMC
 device tree
To: =?UTF-8?B?Q2hlbi5LZW5ZWSDpmbPmsLjnh58gVEFP?= <Chen.KenYY@inventec.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "Tsung-Han Yang (Harold)" <haroldy@qti.qualcomm.com>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 06 Feb 2018 05:46:29 -0000

On Tue, Feb 6, 2018 at 3:45 PM, Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO
<Chen.KenYY@inventec.com> wrote:
> Should I remove the device hasn't the driver yet?

Yes please. If we don't have bindings to review against (documents
inside Documentation/devicetree/bindings) then it's hard to know if
the device tree is correct. Please remove any of the nodes that don't
have bindings in the openbmc tree.


>
>
> -----Original Message-----
> From: Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO
> Sent: Monday, February 05, 2018 11:04 AM
> To: openbmc@lists.ozlabs.org
> Cc: Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO; joel@jms.id.au
> Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Add ARM system BMC d=
evice tree

Can you please target your patch at the dev-4.13 branch?

>
> Add centriq2400-rep dts and modify platform initial
>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
> ---
>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 350 +++++++++++++++=
++++++

You have forgotten to add your device tree to the makefile at
arch/arm/boot/dts/Makefile

Please look for the other aspeed .dtb rules down the bottom of the file.

>  arch/arm/mach-aspeed/aspeed.c                      |  22 ++

Please include modifications to aspeed.c in a different patch.

>  2 files changed, 372 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/=
arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> new file mode 100644
> index 0000000..4094732
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "Qualcomm Centriq 2400  REP AST2520";
> +       compatible =3D "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg =3D <0x80000000 0x40000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc 7>;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               uid_led {
> +                       label =3D "UID_LED";
> +                       gpios =3D <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LO=
W>;
> +               };
> +
> +               ras_error_led {
> +                       label =3D "RAS_ERROR_LED";
> +                       gpios =3D <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LO=
W>;
> +               };
> +
> +               system_fault {
> +                       label =3D "System_fault";
> +                       gpios =3D <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LO=
W>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +                lable =3D "bmc";

typo: label.

> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +        status =3D "okay";
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&pinctrl_spi1_default>;
> +        flash@0 {
> +                reg =3D < 0 >; /* chip select number */
> +                compatible =3D "jedec,spi-nor";

You do not need these two properties, as they are inherited from those
in aspeed-g5.dtsi. Remove these two lines please.

> +                status =3D "okay";
> +        };
> +};
> +
> +&spi2 {
> +        compatible =3D "aspeed,ast2500-spi-generic";
> +        reg =3D <0x1e631000 0xc4 0x38000000 0x02000000>;
> +        interrupts =3D <59>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;

This looks to be a custom driver, As discussed above, please do not
include this until we have merged the device tree bindings and driver.

> +        status =3D "okay";
> +        spi2@0 {
> +                reg =3D < 0 >;
> +                compatible =3D "centriq,centriq2400-spi-hwmon";
> +                spi-max-frequency =3D <16000000>;
> +                status =3D "okay";
> +        };
> +};
> +
> +&uart3 {
> +        status =3D "okay";
> +
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&pinctrl_txd3_default
> +                     &pinctrl_rxd3_default>;
> +        current-speed =3D <115200>;
> +};
> +
> +&lpc_ctrl {

Do you use /dev/aspeed-lpc-ctrl from userspace in your system? If not,
you do not want to enable the lpc_ctrl node.

> +       status =3D "okay";
> +       memory-region =3D <&flash_memory>;
> +       flash =3D <&spi1>;
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> +
> +&mac0 {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>; }=
;

The closing } should be on the next line.

> +
> +&i2c0 {
> +       status =3D "okay";
> +
> +       pca9542@70 {
> +                compatible =3D "pca9542";
> +                reg =3D <0x70>;
> +               i2c@0 {

Your whitespace is messed up here. Please use tabs to align the nodes.

> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +                       pca9546@77 {
> +                               compatible =3D "pca9546";
> +                               reg =3D <0x77>;
> +                               i2c@0 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <0>;
> +                                       eeprom@52 {
> +                                               compatible =3D "atmel,24c=
02";
> +                                               reg =3D <0x52>;
> +                                       };
> +                               };
> +                               i2c@2 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <2>;
> +                                       eeprom@57 {
> +                                               compatible =3D "atmel,24c=
02";
> +                                               reg =3D <0x57>;
> +                                       };
> +                               };
> +                       };
> +               };
> +               i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +                       pca9546@77 {
> +                               compatible =3D "pca9546";
> +                               reg =3D <0x77>;
> +                               i2c@2 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <2>;
> +                                       eeprom@57 {
> +                                               compatible =3D "atmel,24c=
02";
> +                                               reg =3D <0x57>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +        };
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +
> +        tmp421@1e {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x1e>;
> +        };
> +        tmp421@2a {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x2a>;
> +        };
> +        tmp421@4e {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x4e>;
> +        };
> +        tmp421@1c {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x1c>;
> +        };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +       ssif {
> +                compatible =3D "ssif-smbus-slave";

Remove this node until we have reviewed the bindings.

> +                reg =3D <0x42>;
> +        };
> +
> +};
> +
> +&i2c3 {
> +       status =3D "okay";
> +};
> +
> +&i2c4 {
> +       status =3D "okay";
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +
> +        ir38163@42 {
> +                compatible =3D "ir38163";
> +                reg =3D <0x42>;
> +        };
> +       ir38163@44 {
> +                compatible =3D "ir38163";
> +                reg =3D <0x44>;
> +        };
> +       ir38163@46 {
> +                compatible =3D "ir38163";
> +                reg =3D <0x46>;
> +        };
> +       ir38163@48 {
> +                compatible =3D "ir38163";
> +                reg =3D <0x48>;
> +        };
> +       pxm1310@02 {
> +                compatible =3D "pxm1310";
> +                reg =3D <0x02>;
> +        };
> +       pxm1310@04 {
> +                compatible =3D "pxm1310";
> +                reg =3D <0x04>;
> +        };
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +
> +       tmp421@1d {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x1d>;
> +        };
> +        tmp421@1f {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x1f>;
> +        };
> +        tmp421@4d {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x4d>;
> +        };
> +        tmp421@4f {
> +                compatible =3D "ti,tmp421";
> +                reg =3D <0x4f>;
> +        };
> +        nvt210@4c {
> +                compatible =3D "nvt210";
> +                reg =3D <0x4c>;
> +        };
> +        eeprom@50 {
> +                compatible =3D "atmel,24c128";
> +                reg =3D <0x50>;
> +                pagesize =3D <128>;
> +        };
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +
> +        adm1278@10 {
> +                compatible =3D "adi,adm1278";
> +                reg =3D <0x10>;
> +               Rsense =3D <250>;
> +        };
> +        adm1278@11 {
> +                compatible =3D "adi,adm1278";
> +                reg =3D <0x11>;
> +               Rsense =3D <250>;
> +        };
> +};
> +
> +&i2c8 {
> +        status =3D "okay";
> +
> +        pca9641@70 {
> +                compatible =3D "nxp,pca9641";
> +                reg =3D <0x70>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                i2c-arb{
> +                        tmp421@1d {
> +                                compatible =3D "tmp421";
> +                                reg =3D <0x1d>;
> +                        };
> +                        adm1278@12 {
> +                                compatible =3D "adi,adm1278";
> +                                reg =3D <0x12>;
> +                               Rsense =3D <500>;
> +                        };
> +                        max31790@20 {
> +                                compatible =3D "max31790";
> +                                reg =3D <0x20>;
> +                                #address-cells =3D <1>;
> +                                #size-cells =3D <0>;
> +                               fan-mode =3D "pwm";

Whitespace problems here too.

> +                                fanconfig1 =3D <0x08>;
> +                                fanconfig2 =3D <0x09>;
> +                                fanconfig3 =3D <0x08>;
> +                                fanconfig4 =3D <0x08>;
> +                                fanconfig5 =3D <0x09>;
> +                                fanconfig6 =3D <0x08>;
> +                        };
> +                       max31790@23 {
> +                                compatible =3D "max31790";
> +                                reg =3D <0x23>;
> +                                #address-cells =3D <2>;
> +                               #size-cells =3D <0>;
> +                               fan-mode =3D "pwm";
> +                                fanconfig1 =3D <0x08>;
> +                                fanconfig2 =3D <0x09>;
> +                                fanconfig3 =3D <0x08>;
> +                                fanconfig4 =3D <0x08>;
> +                                fanconfig5 =3D <0x09>;
> +                                fanconfig6 =3D <0x08>;
> +                        };
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c02";
> +                               reg =3D <0x50>;
> +                       };
> +                        ds1100@58 {
> +                                compatible =3D "ds1100";
> +                                reg =3D <0x58>;
> +                        };
> +               };
> +       };
> +};
> +
> +&i2c9 {
> +       status =3D "okay";
> +};
> +
> +&vuart {
> +       status =3D "okay";
> +};
> +
> +&gfx {
> +        status =3D "okay";
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes =3D <&gfx &lhc>;
> +};
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c index 5965bbf..4f6a5e9 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -29,6 +29,7 @@
>  #define AST_BASE_MAC0          0X1E660000 /* MAC 1 */
>  #define AST_BASE_SCU           0x1E6E2000 /* System Control Unit (SCU) *=
/
>  #define AST_BASE_GPIO          0x1E780000 /* GPIO Controller */
> +#define AST_BASE_WDT           0x1E785000 /* Watchdog Timer */
>
>  static struct map_desc aspeed_io_desc[] __initdata __maybe_unused =3D {
>         {
> @@ -232,6 +233,25 @@ static void __init do_mellanox_setup(void)
>         writel(reg, AST_IO(AST_BASE_SCU | 0x48));  }
>
> +
> +static void __init do_centriq2400rep_setup(void) {
> +       u32 reg;
> +
> +       do_common_setup();
> +       writel(0x00000010, AST_IO(AST_BASE_WDT | 0x2c));
> +
> +       writel(0xff000000, AST_IO(AST_BASE_SCU | 0x88));
> +
> +       /* Set GPIOC7 to output high to init host spi driver */
> +       reg =3D readl(AST_IO(AST_BASE_GPIO | 0x04)) | BIT(23);
> +       writel(reg, AST_IO(AST_BASE_GPIO | 0x04));
> +
> +       reg =3D readl(AST_IO(AST_BASE_GPIO)) | BIT(23);
> +       writel(reg, AST_IO(AST_BASE_GPIO)); }
> +
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void) @@ -284,6 +304,8 @@ static vo=
id __init aspeed_init_early(void)
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
