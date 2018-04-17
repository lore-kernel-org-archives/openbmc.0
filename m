Return-Path: <Yang.BrianC.W@inventec.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=yang.brianc.w@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Q9cK4zTlzF21P
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 13:25:20 +1000 (AEST)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Tue, 17 Apr 2018 11:25:27 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w3H3OdJd072558	for
 <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 11:24:39 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: from mail-wr0-f198.google.com (mail-wr0-f198.google.com
 [209.85.128.198])	by IEC1-SPAM-2.inventec.com with ESMTP id w3H3OaXN037675
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 11:24:38 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: by mail-wr0-f198.google.com with SMTP id o8so14441671wra.12
 for <openbmc@lists.ozlabs.org>; Mon, 16 Apr 2018 20:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2uVTpxkTZizC7SEvZEPdWej2o2v/PFsqBdfvl+lNj6w=;
 b=dMgcfFNcHVbwLu0m5dFDwaXaJRLAwQyt3PcyHZ9/ZU7A6wZPcHsodwmIcGd7z7WFBV
 yQWjBWWycRmpZWvRpk2QrEdilFybTkZngKJkNImww+ZX1Aw3TyyDLNb2pmwOmk8xppzY
 AbFNTlJwrIgVJX2nS6j8YRUrsTZ/ETGAvAUJKXeE4yC8mxEL4aiAHc3BzbiC97W0Fhlo
 hPde/lqFsLN7kXtx3KxB8TYYVOBBuS8hpSAsLoj50PSEfnt8Kv15s65RepJpmBB4QZhZ
 UU1w/r8uhu7/zHvvhHOAG14PBlpMiHANxYni8VamPjjzotGfN+PoKuOXjxCO+wLFpYya
 vRKQ==
X-Gm-Message-State: ALQs6tAoEL61apuTjEJf3VO7Rn8yAzb+e65xoM8VWfXkS7XCKGMdETw+
 C3tYwHWn9EF63gZs7iBnMcyuwov1+l3bE6J5RHRgxYeFW9EPMBFmZcZCyZpslxOfBAUrAnXnYfW
 gCDGKmJVUywkAe7D1/DmZ1kbzfaT4Frz4m5gaaQ==
X-Received: by 10.223.202.18 with SMTP id o18mr180366wrh.281.1523935475555;
 Mon, 16 Apr 2018 20:24:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx490Qw19oWHvhsM1+NO7Z99XGY4GKJrqakAVWbG11niWicJd3xrWVraKp6ijE9Y3zLGY1eoiOF98UeT8e31+BtM=
X-Received: by 10.223.202.18 with SMTP id o18mr180352wrh.281.1523935475254;
 Mon, 16 Apr 2018 20:24:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.144.141 with HTTP; Mon, 16 Apr 2018 20:24:14 -0700 (PDT)
In-Reply-To: <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
 <39E6480C5A587146BAA4D885C7BCF7EEC6B7921E@IEC1-EX2010-MX4.iec.inventec>
 <CAAvYUAw1ZH2DFrMr8mJydfQUVHatioxeNrOitwy4KU8fG5fuYA@mail.gmail.com>
 <1523930744.402617.1340420568.34CE3271@webmail.messagingengine.com>
From: =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?=
 <yang.brianc.w@inventec.com>
Date: Tue, 17 Apr 2018 11:24:14 +0800
Message-ID: <CAAvYUAw6t57AaLcpMfBCDa0xs_ezDyWQP0BZUVj3muchRTQvQQ@mail.gmail.com>
Subject: Re: FW: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
 Lanyang BMC
To: Andrew Jeffery <andrew@aj.id.au>
CC: =?UTF-8?B?Q2hlbi5LZW5ZWSDpmbPmsLjnh58gVEFP?= <Chen.KenYY@inventec.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU <mine260309@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w3H3OdJd072558
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2018 03:25:23 -0000

Hi Andrew,

2018-04-17 10:05 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:
> Hi Brian,
>
> On Mon, 16 Apr 2018, at 20:39, YangBrianC.W =E6=A5=8A=E5=98=89=E5=81=89 T=
AO wrote:
>> Hi Andrew,
>>
>>
>> 2018-04-16 15:04 GMT+08:00 Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F TAO <C=
hen.KenYY@inventec.com>:
>> > FYR
>> >
>> > -----Original Message-----
>> > From: openbmc [mailto:openbmc-bounces+chen.kenyy=3Dinventec.com@lists.=
ozlabs.org] On Behalf Of Andrew Jeffery
>> > Sent: Friday, April 13, 2018 9:58 AM
>> > To: openbmc@lists.ozlabs.org
>> > Subject: Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec =
Lanyang BMC
>> >
>> > Hi Brian,
>> >
>> > On Wed, 11 Apr 2018, at 17:12, Brian Yang wrote:
>> >> The Inventec Lanyang is Power 9 platform with ast2500 BMC.
>> >>
>> >> Tested-by: Brian Yang <yang.brianc.w@inventec.com>
>> >> Signed-off-by: Brian Yang <yang.brianc.w@inventec.com>
>> >>
>> >> ---
>> >>
>> >> v0->v1
>> >> -Add test information in commit
>> >> ---
>> >>  arch/arm/boot/dts/Makefile                   |   1 +
>> >>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 331
>> >> +++++++++++++++++++++++++++
>> >>  2 files changed, 332 insertions(+)
>> >>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> >>
>> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> >> index 5cfee25..d1882f0 100644
>> >> --- a/arch/arm/boot/dts/Makefile
>> >> +++ b/arch/arm/boot/dts/Makefile
>> >> @@ -1057,6 +1057,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>> >>       aspeed-ast2500-evb.dtb \
>> >>       aspeed-bmc-arm-centriq2400-rep.dtb \
>> >>       aspeed-bmc-intel-s2600wf.dtb \
>> >> +     aspeed-bmc-opp-lanyang.dtb \
>> >>       aspeed-bmc-opp-palmetto.dtb \
>> >>       aspeed-bmc-opp-romulus.dtb \
>> >>       aspeed-bmc-opp-witherspoon.dtb \
>> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/
>> >> boot/dts/aspeed-bmc-opp-lanyang.dts
>> >> new file mode 100644
>> >> index 0000000..6241730
>> >> --- /dev/null
>> >> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> >> @@ -0,0 +1,331 @@
>> >> +// SPDX-License-Identifier: GPL-2.0+
>> >> +// Copyright (c) 2018 Inventec Corporation /dts-v1/;
>> >> +
>> >> +#include "aspeed-g5.dtsi"
>> >> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> >> +
>> >> +/ {
>> >> +     model =3D "Lanyang BMC";
>> >> +     compatible =3D "inventec,lanyang-bmc", "aspeed,ast2500";
>> >> +
>> >> +     chosen {
>> >> +             stdout-path =3D &uart5;
>> >> +             bootargs =3D "console=3DttyS4,115200 earlyprintk";
>> >> +     };
>> >> +
>> >> +     memory {
>> >> +             reg =3D <0x80000000 0x40000000>;
>> >> +     };
>> >> +
>> >> +     reserved-memory {
>> >> +             #address-cells =3D <1>;
>> >> +             #size-cells =3D <1>;
>> >> +             ranges;
>> >> +
>> >> +             flash_memory: region@98000000 {
>> >> +                     no-map;
>> >> +                     reg =3D <0x98000000 0x04000000>; /* 64M */
>> >> +             };
>> >> +     };
>> >> +
>> >> +     leds {
>> >> +             compatible =3D "gpio-leds";
>> >> +
>> >> +             sys_boot_status {
>> >> +                     label =3D "System_boot_status";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_=
LOW>;
>> >> +             };
>> >> +
>> >> +             attention {
>> >> +                     label =3D "Attention_locator";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_=
HIGH>;
>> >> +             };
>> >> +
>> >> +             plt_fault {
>> >> +                     label =3D "Platform_fault";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_=
HIGH>;
>> >> +             };
>> >> +
>> >> +             hdd_fault {
>> >> +                     label =3D "Onboard_drive_fault";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_=
HIGH>;
>> >> +             };
>> >> +             bmc_err {
>> >> +                     lable =3D "BMC_fault";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_=
HIGH>;
>> >> +             };
>> >> +
>> >> +             sys_err {
>> >> +                     lable =3D "Sys_fault";
>> >> +                     gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_=
HIGH>;
>> >> +             };
>> >> +     };
>> >> +
>> >> +     fsi: gpio-fsi {
>> >> +             compatible =3D "fsi-master-gpio", "fsi-master";
>> >> +             #address-cells =3D <2>;
>> >> +             #size-cells =3D <0>;
>> >> +
>> >> +             clock-gpios =3D <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HI=
GH>;
>> >> +             data-gpios =3D <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIG=
H>;
>> >> +             trans-gpios =3D <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HI=
GH>;
>> >> +             enable-gpios =3D <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_H=
IGH>;
>> >> +             mux-gpios =3D <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH=
>;
>> >> +     };
>> >> +
>> >> +     iio-hwmon {
>> >> +             compatible =3D "iio-hwmon";
>> >> +             io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>> >> +                     <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>> >> +                     <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
>> >> +                     <&adc 13>, <&adc 14>, <&adc 15>;
>> >> +     };
>> >> +
>> >> +     iio-hwmon-battery {
>> >> +             compatible =3D "iio-hwmon";
>> >> +             io-channels =3D <&adc 12>;
>> >> +     };
>> >> +};
>> >> +
>> >> +#include "ibm-power9-cfam.dtsi"
>> >> +
>> >> +&pwm_tacho {
>> >> +     status =3D "okay";
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
>> >> +             &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>> >> +
>> >> +     fan@0 {
>> >> +             reg =3D <0x00>;
>> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
>> >> +     };
>> >> +
>> >> +     fan@1 {
>> >> +             reg =3D <0x01>;
>> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
>> >> +     };
>> >> +
>> >> +     fan@2 {
>> >> +             reg =3D <0x02>;
>> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
>> >> +     };
>> >> +
>> >> +     fan@3 {
>> >> +             reg =3D <0x03>;
>> >> +             aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
>> >> +     };
>> >> +};
>> >> +
>> >> +&fmc {
>> >> +     status =3D "okay";
>> >> +     flash@0 {
>> >> +             status =3D "okay";
>> >> +             m25p,fast-read;
>> >> +             label =3D "bmc";
>> >> +#include "openbmc-flash-layout.dtsi"
>> >> +     };
>> >> +};
>> >> +
>> >> +&spi1 {
>> >> +     status =3D "okay";
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_spi1_default>;
>> >> +
>> >> +     flash@0 {
>> >> +             status =3D "okay";
>> >> +             label =3D "pnor";
>> >> +             m25p,fast-read;
>> >> +     };
>> >> +};
>> >> +
>> >> +&spi2 {
>> >> +     status =3D "okay";
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_spi2ck_default
>> >> +                  &pinctrl_spi2cs0_default
>> >> +                  &pinctrl_spi2cs1_default
>> >> +                  &pinctrl_spi2miso_default
>> >> +                  &pinctrl_spi2mosi_default>;
>> >> +
>> >> +     flash@0 {
>> >> +             status =3D "okay";
>> >> +     };
>> >> +};
>> >> +
>> >> +&uart1 {
>> >> +     status =3D "okay";
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_txd1_default
>> >> +                  &pinctrl_rxd1_default>;
>> >> +};
>> >> +
>> >> +&lpc_ctrl {
>> >> +     status =3D "okay";
>> >> +     memory-region =3D <&flash_memory>;
>> >> +     flash =3D <&spi1>;
>> >> +};
>> >> +
>> >> +&lpc_snoop {
>> >> +     status =3D "okay";
>> >> +     snoop-ports =3D <0x80>;
>> >> +};
>> >> +
>> >> +&mbox {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&uart5 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&mac0 {
>> >> +     status =3D "okay";
>> >> +
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_rmii1_default>;
>> >> +     use-ncsi;
>> >> +};
>> >> +
>> >> +&mac1 {
>> >> +     status =3D "okay";
>> >> +
>> >> +     pinctrl-names =3D "default";
>> >> +     pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;=
 };
>> >> +
>> >> +&i2c0 {
>> >> +     status =3D "okay";
>> >> +
>> >> +     eeprom@55 {
>> >> +             compatible =3D "atmel,24c64";
>> >> +             reg =3D <0x55>;
>> >> +             pagesize =3D <32>;
>> >> +     };
>> >> +
>> >> +     rtc@68 {
>> >> +             compatible =3D "nxp,pcf8523";
>> >> +             reg =3D <0x68>;
>> >> +     };
>> >> +
>> >> +     tmp75@48 {
>> >> +             compatible =3D "ti,tmp75";
>> >> +             reg =3D <0x48>;
>> >> +     };
>> >> +};
>> >> +
>> >> +&i2c1 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c2 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c3 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c4 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c5 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c6 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c7 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c8 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c9 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c10 {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&i2c11 {
>> >> +     status =3D "okay";
>> >> +};
>> >
>> > Do we need to enable all of the above i2c buses? By comparison, Zaius =
enables i2c0, i2c1, i2c4, i2c7 and i2c8.
>>
>> Thank you for your review.
>>
>> We need to enable all of the above i2c buses because we want to verify
>> the i2c bus is fine by i2ctool.
>>
>> Because we use the above i2c buses on Lanyang platform.
>
> Okay, it's still not clear to me. Are there devices on all the buses? If =
so, do any have bindings that we could use to describe them here? It looks =
odd enabling all the buses but not "using" any of them.
>
> If you're just enabling them to test the bus with i2ctool then I feel tha=
t we might be better with that staying as a local change for your testing, =
rather than merging this as is. Joel?
>
> Cheers,
>
> Andrew

I think we could describe those devices on the i2c buses first.

When I finish the drivers for those devices, I will update related code.

Thank you

Brian
>
>>
>>
>> >
>> >> +
>> >> +&vuart {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&gfx {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&pinctrl {
>> >> +     aspeed,external-nodes =3D <&gfx &lhc>; };
>> >> +
>> >> +&gpio {
>> >> +     pin_gpio_b0 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
>> >> +             output-high;
>> >> +             line-name =3D "BMC_HDD1_PWR_EN";
>> >> +     };
>> >> +
>> >> +     pin_gpio_b5 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
>> >> +             input;
>> >> +             line-name =3D "BMC_USB1_OCI2";
>> >> +     };
>> >> +
>> >> +     pin_gpio_h5 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
>> >> +             output-high;
>> >> +             line-name =3D "BMC_CP0_PERST_ENABLE_R";
>> >> +     };
>> >> +
>> >> +     pin_gpio_z2 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
>> >> +             output-high;
>> >> +             line-name =3D "RST_PCA9546_U177_N";
>> >> +     };
>> >> +
>> >> +     pin_gpio_aa6 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
>> >> +             output-high;
>> >> +             line-name =3D "BMC_CP0_RESET_N";
>> >> +     };
>> >> +
>> >> +     pin_gpio_aa7 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
>> >> +             output-high;
>> >> +             line-name =3D "BMC_TPM_RESET_N";
>> >> +     };
>> >> +
>> >> +     pin_gpio_ab0 {
>> >> +             gpio-hog;
>> >> +             gpios =3D <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
>> >> +             output-high;
>> >> +             line-name =3D "BMC_USB_PWRON_N";
>> >> +     };
>> >> +};
>> >> +
>> >> +&ibt {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> +&adc {
>> >> +     status =3D "okay";
>> >> +};
>> >> +
>> >> --
>> >> 2.7.4
>> >>
>> >
>> > Looks okay from a pinctrl perspective, so if there is reason to enable=
 all of the i2c buses, then I'll send an Acked-by
>> >
>> > Cheers,
>> >
>> > Andrew
>>
>>
>> Thank you
>>
>>
>> Brian
