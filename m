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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LhQC5fwpzDrDT
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 21:19:29 +1000 (AEST)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Wed, 11 Apr 2018 19:19:41 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w3BBJAeZ000894	for
 <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 19:19:10 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: from mail-wr0-f200.google.com (mail-wr0-f200.google.com
 [209.85.128.200])	by IEC1-SPAM-2.inventec.com with ESMTP id w3BBJ37U008622
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 19:19:06 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: by mail-wr0-f200.google.com with SMTP id k27so863730wre.23
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=O5vhKrvkTdVDF1UO3K7fagNT1e5hmKrnT988K9ItW48=;
 b=iy+UFTljVkm5NlFg9z+XWHx8fsTfngMNq+UuUfF42DbvUpELzcTmrN2nMQFkB6+0so
 IDcUpoasfyQsg7nUrivkg8OfWoIcw47mE/s+d4tEO8eCiX9Z7bguL5LFrhXV1xB4Zmg9
 MCMeEyRE7twKaWcieM183vhb70kI3UnmsdEAffvItnugAkKjrpDaeXpw91814LhrY2OH
 67wTyAchU2yhMkKnTOVQxlfFLOdWpMrI6NgdI+0MCoAQO1Mf+eaZ/V7UkuBZLFDl0Lql
 NQKcGVA3Mob3QQbmdS4kGmNuVybVi484JeJei6nNmDZ2prxZhBowxi83q+iDfFxYIUU/
 atvg==
X-Gm-Message-State: ALQs6tBaNp/a7mPdFKVCTHsO4/wtIU9aRJEl4iaKIy8cnoVVBuZc7s7x
 HZWaSiaJjOBFsCPVq2xIWbzmwtpJqj3Ox0Gp49ZWyx4VRqXuGn/vKmRb6ZDAxPNrqwjFV6C3jkj
 umFqgQbBeEK5g8yNORrpa9XpajyvKsjxvM1w9ig==
X-Received: by 10.223.190.140 with SMTP id i12mr3282296wrh.63.1523445542263;
 Wed, 11 Apr 2018 04:19:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/U2DZhN0RnehLI1oL+CDlRv8QyPfV3sdMOMxbXGoXbHCy05yXgm+New1UAEoCZEOwBYUwyUXYOPL7qc9Nqd/g=
X-Received: by 10.223.190.140 with SMTP id i12mr3282280wrh.63.1523445541933;
 Wed, 11 Apr 2018 04:19:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.144.141 with HTTP; Wed, 11 Apr 2018 04:18:41 -0700 (PDT)
In-Reply-To: <CACPK8XdmYykJd45FFYZA1AAQPT5j+jiTr2c477yLo7rLWO2JzQ@mail.gmail.com>
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
 <CACPK8XdmYykJd45FFYZA1AAQPT5j+jiTr2c477yLo7rLWO2JzQ@mail.gmail.com>
From: =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?=
 <yang.brianc.w@inventec.com>
Date: Wed, 11 Apr 2018 19:18:41 +0800
Message-ID: <CAAvYUAzXe=QJYGMitEk6GpBOO+W_LzWZGQYdxFdi0fjoH8sdfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec Lanyang
 BMC
To: Joel Stanley <joel@jms.id.au>
CC: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Ken Chen <chen.kenyy@inventec.com>
Content-Type: text/plain; charset="UTF-8"
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w3BBJAeZ000894
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
X-List-Received-Date: Wed, 11 Apr 2018 11:19:33 -0000

Hi Joel,

Thank you for your suggestion.

2018-04-11 17:29 GMT+08:00 Joel Stanley <joel@jms.id.au>:
> Hi Brian,
>
> On 11 April 2018 at 17:12, Brian Yang <yang.brianc.w@inventec.com> wrote:
>> The Inventec Lanyang is Power 9 platform with ast2500 BMC.
>
> Thanks for the patch. I have one small comment below.
>
> Aside from that comment it looks good to me. I'll apply it once I get
> an ack from Andrew and Lei.
>
>>
>> Tested-by: Brian Yang <yang.brianc.w@inventec.com>
>> Signed-off-by: Brian Yang <yang.brianc.w@inventec.com>
>>
>> ---
>>
>> v0->v1
>> -Add test information in commit
>> ---
>>  arch/arm/boot/dts/Makefile                   |   1 +
>>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 331 +++++++++++++++++++++++++++
>>  2 files changed, 332 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 5cfee25..d1882f0 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1057,6 +1057,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>         aspeed-ast2500-evb.dtb \
>>         aspeed-bmc-arm-centriq2400-rep.dtb \
>>         aspeed-bmc-intel-s2600wf.dtb \
>> +       aspeed-bmc-opp-lanyang.dtb \
>>         aspeed-bmc-opp-palmetto.dtb \
>>         aspeed-bmc-opp-romulus.dtb \
>>         aspeed-bmc-opp-witherspoon.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> new file mode 100644
>> index 0000000..6241730
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>> @@ -0,0 +1,331 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +// Copyright (c) 2018 Inventec Corporation
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +       model = "Lanyang BMC";
>> +       compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "console=ttyS4,115200 earlyprintk";
>> +       };
>> +
>> +       memory {
>> +               reg = <0x80000000 0x40000000>;
>> +       };
>> +
>> +       reserved-memory {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges;
>> +
>> +               flash_memory: region@98000000 {
>> +                       no-map;
>> +                       reg = <0x98000000 0x04000000>; /* 64M */
>> +               };
>> +       };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               sys_boot_status {
>> +                       label = "System_boot_status";
>> +                       gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               attention {
>> +                       label = "Attention_locator";
>> +                       gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
>> +               };
>> +
>> +               plt_fault {
>> +                       label = "Platform_fault";
>> +                       gpios = <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
>> +               };
>> +
>> +               hdd_fault {
>> +                       label = "Onboard_drive_fault";
>> +                       gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
>> +               };
>> +               bmc_err {
>> +                       lable = "BMC_fault";
>> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
>> +               };
>> +
>> +               sys_err {
>> +                       lable = "Sys_fault";
>> +                       gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
>> +               };
>> +       };
>> +
>> +       fsi: gpio-fsi {
>> +               compatible = "fsi-master-gpio", "fsi-master";
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>> +
>> +               clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
>> +               data-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
>> +               trans-gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
>> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>> +               mux-gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
>> +       };
>> +
>> +       iio-hwmon {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
>> +                       <&adc 13>, <&adc 14>, <&adc 15>;
>> +       };
>> +
>> +       iio-hwmon-battery {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&adc 12>;
>> +       };
>> +};
>> +
>> +#include "ibm-power9-cfam.dtsi"
>> +
>> +&pwm_tacho {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
>> +               &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>> +
>> +       fan@0 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> +       };
>> +
>> +       fan@1 {
>> +               reg = <0x01>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> +       };
>> +
>> +       fan@2 {
>> +               reg = <0x02>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> +       };
>> +
>> +       fan@3 {
>> +               reg = <0x03>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> +       };
>> +};
>> +
>> +&fmc {
>> +       status = "okay";
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +               label = "bmc";
>> +#include "openbmc-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +&spi1 {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_spi1_default>;
>> +
>> +       flash@0 {
>> +               status = "okay";
>> +               label = "pnor";
>> +               m25p,fast-read;
>> +       };
>> +};
>> +
>> +&spi2 {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_spi2ck_default
>> +                    &pinctrl_spi2cs0_default
>> +                    &pinctrl_spi2cs1_default
>> +                    &pinctrl_spi2miso_default
>> +                    &pinctrl_spi2mosi_default>;
>> +
>> +       flash@0 {
>> +               status = "okay";
>
> Do you want to give this a name? It makes it easier to look for the
> chip in eg. /dev/mtd/* if it has a label.
>

We did not define the name of this SPI, so we want to keep this empty.

>> +       };
>> +};
>> +
>> +&uart1 {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_txd1_default
>> +                    &pinctrl_rxd1_default>;
>> +};
>> +
>> +&lpc_ctrl {
>> +       status = "okay";
>> +       memory-region = <&flash_memory>;
>> +       flash = <&spi1>;
>> +};
>> +
>> +&lpc_snoop {
>> +       status = "okay";
>> +       snoop-ports = <0x80>;
>> +};
>> +
>> +&mbox {
>> +       status = "okay";
>> +};
>> +
>> +&uart5 {
>> +       status = "okay";
>> +};
>> +
>> +&mac0 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rmii1_default>;
>> +       use-ncsi;
>> +};
>> +
>> +&mac1 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>> +};
>> +
>> +&i2c0 {
>> +       status = "okay";
>> +
>> +       eeprom@55 {
>> +               compatible = "atmel,24c64";
>> +               reg = <0x55>;
>> +               pagesize = <32>;
>> +       };
>> +
>> +       rtc@68 {
>> +               compatible = "nxp,pcf8523";
>> +               reg = <0x68>;
>> +       };
>> +
>> +       tmp75@48 {
>> +               compatible = "ti,tmp75";
>> +               reg = <0x48>;
>> +       };
>> +};
>> +
>> +&i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c5 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c6 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c8 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c10 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&vuart {
>> +       status = "okay";
>> +};
>> +
>> +&gfx {
>> +       status = "okay";
>> +};
>> +
>> +&pinctrl {
>> +       aspeed,external-nodes = <&gfx &lhc>;
>> +};
>> +
>> +&gpio {
>> +       pin_gpio_b0 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_HDD1_PWR_EN";
>> +       };
>> +
>> +       pin_gpio_b5 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
>> +               input;
>> +               line-name = "BMC_USB1_OCI2";
>> +       };
>> +
>> +       pin_gpio_h5 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_CP0_PERST_ENABLE_R";
>> +       };
>> +
>> +       pin_gpio_z2 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "RST_PCA9546_U177_N";
>> +       };
>> +
>> +       pin_gpio_aa6 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_CP0_RESET_N";
>> +       };
>> +
>> +       pin_gpio_aa7 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name = "BMC_TPM_RESET_N";
>> +       };
>> +
>> +       pin_gpio_ab0 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +               line-name = "BMC_USB_PWRON_N";
>> +       };
>> +};
>> +
>> +&ibt {
>> +       status = "okay";
>> +};
>> +
>> +&adc {
>> +       status = "okay";
>> +};
>> +
>> --
>> 2.7.4
>>
