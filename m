Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zh5B6XTDzDqN8
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 11:59:58 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id ECO62937;
 Wed, 13 Feb 2019 08:53:37 +0800
Received: from mail-lf1-f46.google.com (10.100.1.52) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Wed, 13 Feb 2019 08:53:33 +0800
Received: by mail-lf1-f46.google.com with SMTP id u21so469621lfu.1;
 Tue, 12 Feb 2019 16:53:33 -0800 (PST)
X-Gm-Message-State: AHQUAubdlhvHtgCeu+xkYbFoMsY6o0cO52WMEavKztnVfh65quI3DWPC
 G0flVr4g9e0W9CzK/LZ68kPuY+ZL3PRQTOc6lqs=
X-Google-Smtp-Source: AHgI3IY4B+JtwkHZ1gTeCq6ZI2mAP8VRiW4kh1DzkWt7zqpN/DSJKDmAMqoU/J6fCwzhg3s2Au8IjzeRbFWNHDIouj8=
X-Received: by 2002:a19:f707:: with SMTP id z7mr4359577lfe.54.1550019210749;
 Tue, 12 Feb 2019 16:53:30 -0800 (PST)
MIME-Version: 1.0
References: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
 <4C4C6975-CA11-4609-BF8D-6246A1C5F193@fb.com>
In-Reply-To: <4C4C6975-CA11-4609-BF8D-6246A1C5F193@fb.com>
From: John Wang <wangzqbj@inspur.com>
Date: Wed, 13 Feb 2019 08:53:19 +0800
X-Gmail-Original-Message-ID: <CAHkHK09m4=--6h3kKnbx9bHf_9tJC1_c3e31VXcSu7rZ94vT3Q@mail.gmail.com>
Message-ID: <CAHkHK09m4=--6h3kKnbx9bHf_9tJC1_c3e31VXcSu7rZ94vT3Q@mail.gmail.com>
Subject: Re: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
To: Vijay Khemka <vijaykhemka@fb.com>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201607.home.langchao.com (10.100.2.7) To
 jtjnmail201606.home.langchao.com (10.100.2.6)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 01:00:00 -0000

On Wed, Feb 13, 2019 at 6:11 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 2/12/19, 1:58 PM, "Linux-aspeed on behalf of John Wang" <linu=
x-aspeed-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of wangzqb=
j@inspur.com> wrote:
>
>     Add initial version of device tree file for on5263m5 ast2500bmc
>
>     Signed-off-by: John Wang <wangzqbj@inspur.com>
>     ---
>      arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++=
++++++++++
>      1 file changed, 146 insertions(+)
>      create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
>
>     diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/=
arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
>     new file mode 100644
>     index 0000000..064ae30
>     --- /dev/null
>     +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
>     @@ -0,0 +1,146 @@
>     +// SPDX-License-Identifier: GPL-2.0
>     +// Copyright (c) 2018 Inspur Corporation
>     +/dts-v1/;
>     +
>     +#include "aspeed-g5.dtsi"
>     +#include <dt-bindings/gpio/aspeed-gpio.h>
>     +
>     +/ {
>     +   model =3D "ON5263M5 BMC";
>     +   compatible =3D "inspur,on5263m5-bmc", "aspeed,ast2500";
>     +
>     +   chosen {
>     +           stdout-path =3D &uart5;
>     +           bootargs =3D "earlyprintk";
>     +   };
>     +
>     +   memory {
>     +           reg =3D <0x80000000 0x20000000>;
>     +   };
>     +
>     +   reserved-memory {
>     +           #address-cells =3D <1>;
>     +           #size-cells =3D <1>;
>     +           ranges;
>     +
>     +           vga_memory: framebuffer@9f000000 {
>     +                   no-map;
>     +                   reg =3D <0x9f000000 0x01000000>;
>     +           };
>     +   };
>     +
>     +   leds {
>     +       compatible =3D "gpio-leds";
>     +
>     +       bmc_alive {
>     +           label =3D "bmc_alive";
>     +           gpios =3D <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
>     +           linux,default-trigger =3D "timer";
>     +       };
>     +   };
>     +
>     +   iio-hwmon {
>     +           compatible =3D "iio-hwmon";
>     +           io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>     +                   <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
>     +   };
>     +
>     +};
>     +
>     +&fmc {
>     +   status =3D "okay";
>     +   flash@0 {
>     +           status =3D "okay";
>     +           m25p,fast-read;
>     +           label =3D "bmc";
>     +#include "openbmc-flash-layout.dtsi"
>     +   };
>     +};
>     +
>     +&spi1 {
>     +   status =3D "okay";
>     +   pinctrl-names =3D "default";
>     +   pinctrl-0 =3D <&pinctrl_spi1_default>;
>     +
>     +   flash@0 {
>     +           status =3D "okay";
>     +           m25p,fast-read;
>     +           label =3D "pnor";
>     +   };
>     +};
>     +
>     +&uart5 {
>     +   status =3D "okay";
>     +};
>     +
>     +&mac0 {
>     +   status =3D "okay";
>     +
>     +   pinctrl-names =3D "default";
>     +   pinctrl-0 =3D <&pinctrl_rmii1_default>;
>     +   use-ncsi;
>     +};
>     +
>     +&mac1 {
>     +   status =3D "okay";
>     +
>     +   pinctrl-names =3D "default";
>     +   pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>     +};
>     +
>     +&i2c6 {
>     +   status =3D "okay";
>     +
>     +   tmp421@4e {
>     +           compatible =3D "ti,tmp421";
>     +           reg =3D <0x4e>;
>     +   };
>     +
>     +   tmp112@48 {
>     +           compatible =3D "ti,tmp112";
>     +           reg =3D <0x48>;
>     +   };
>     +
>     +   eeprom@54 {
>     +           compatible =3D "atmel,24c64";
>     +                   reg =3D <0x54>;
>     +           pagesize =3D <32>;
>     +   };
>     +};
>     +
>     +&i2c7 {
>     +   status =3D "okay";
>     +
>     +   adm1278@11 {
>     +             compatible =3D "adi,adm1278";
>     +             reg =3D <0x11>;
>     +   };
>     +};
>     +
>     +&gfx {
>     +   status =3D "okay";
>     +};
>     +
>     +&pinctrl {
>     +   aspeed,external-nodes =3D <&gfx &lhc>;
>     +};
> This pinctrl definition is not required as it is already defined in aspee=
d-g5.dtsi.
Thanks,Vijay. Next patch,I would drop the definition.
>     +
>     +&pwm_tacho {
>     +   status =3D "okay";
>     +   pinctrl-names =3D "default";
>     +   pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
>     +
>     +   fan@0 {
>     +                   reg =3D <0x00>;
>     +                   aspeed,fan-tach-ch =3D /bits/ 8 <0x00 0x01>;
>     +   };
>     +
>     +   fan@1 {
>     +                   reg =3D <0x01>;
>     +                   aspeed,fan-tach-ch =3D /bits/ 8 <0x02 0x03>;
>     +   };
>     +};
>     +
>     +&adc {
>     +   status =3D "okay";
>     +};
>     --
>     2.7.4
>
>
>
