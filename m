Return-Path: <Yang.BrianC.W@inventec.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=218.32.67.167; helo=mail.inventec.com;
 envelope-from=yang.brianc.w@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MsDx0DdqzF1jl
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 19:00:31 +1000 (AEST)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.361.1; Fri, 13 Apr 2018 17:00:23 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w3D90AE2056367	for
 <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 17:00:10 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: from mail-wm0-f72.google.com (mail-wm0-f72.google.com
 [74.125.82.72])	by IEC1-SPAM-2.inventec.com with ESMTP id w3D9069x043712
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 17:00:09 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: by mail-wm0-f72.google.com with SMTP id e185so833623wmg.5 for
 <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 02:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=xgWLHY2mz+Sr0K4mivKqWWHJ1xlgQLxu9i7uan9OfdI=;
 b=OAaAcrMFcW7RzIT6QdQK5DaUEIjzniSKYopUn8t4qiXBXwdbKNBrFpge1mzENyRafJ
 zvVKd4rmRwY0JSwp0iK1PPMulRAGHRgtktmt/x+U0qiff6BAOHi37DfKSfEqGQslpk5d
 L9K+peQFH4qAxjsDr5tbfVvAnkliEThuTOtCea4Z+9LtGvNDdraIrxURfzAFfGToAKJj
 FXCyF8jK+2og57/lWV6PTdqZroHEp/3XPKHeDsMIPsRqyc7/nzEmz3jYqbKMPjpEPHSH
 C1MZzhcaBk6Eiyrcb3iNEJd+H5Z5p+rGgYilZKwYp8Y67tE+AJKjom8cqFUL0dMtnG9w
 ORrQ==
X-Gm-Message-State: ALQs6tDPbHHnqDuJuG0IF8/CqBrJxFZNCtAfF4ikFnO79A1UupPGbdC6
 DVkUVWARy8TE0hrcmvotKF8CFfpPq17fhKsVCFmaL/rmz8/6TzFAHiP9P3ijDiJ5w0L7lSsblSq
 U/QirNku46FJyxErSfBSZUZXyUMoUkn07qyK44w==
X-Received: by 10.223.190.140 with SMTP id i12mr3222038wrh.63.1523610005444;
 Fri, 13 Apr 2018 02:00:05 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+ZDT3/6Sttv/NnS5rjAKzJkak1QHHr4REqBfKvTjXTbNmzS+4jO5vA7L6/kDwJQGA33BaQDloUchXwKAaP5eU=
X-Received: by 10.223.190.140 with SMTP id i12mr3222011wrh.63.1523610005088;
 Fri, 13 Apr 2018 02:00:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.144.141 with HTTP; Fri, 13 Apr 2018 01:59:44 -0700 (PDT)
In-Reply-To: <mailman.9.1523584802.20294.openbmc@lists.ozlabs.org>
References: <mailman.9.1523584802.20294.openbmc@lists.ozlabs.org>
From: =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?=
 <yang.brianc.w@inventec.com>
Date: Fri, 13 Apr 2018 16:59:44 +0800
Message-ID: <CAAvYUAx_d7fODP8C_61QwD8--OxCiKwLNWy0K289=9VNCR-raQ@mail.gmail.com>
Subject: Re: openbmc Digest, Vol 32, Issue 36
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w3D90AE2056367
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
X-List-Received-Date: Fri, 13 Apr 2018 09:00:34 -0000

2018-04-13 10:00 GMT+08:00  <openbmc-request@lists.ozlabs.org>:
> Send openbmc mailing list submissions to
>         openbmc@lists.ozlabs.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.ozlabs.org/listinfo/openbmc
> or, via email, send a message with subject or body 'help' to
>         openbmc-request@lists.ozlabs.org
>
> You can reach the person managing the list at
>         openbmc-owner@lists.ozlabs.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
>
>
> Today's Topics:
>
>    1. Re: openbmc Digest, Vol 32, Issue 32 (Andrew Jeffery)
>    2. Re: openbmc Digest, Vol 32, Issue 32 (Wang, Haiyue)
>    3. Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
>       Lanyang BMC (Andrew Jeffery)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Fri, 13 Apr 2018 10:00:17 +0930
> From: Andrew Jeffery <andrew@aj.id.au>
> To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>,
>         openbmc@lists.ozlabs.org, openbmc-request@lists.ozlabs.org, Joel
>         Stanley <joel@jms.id.au>, benh@kernel.crashing.org
> Subject: Re: openbmc Digest, Vol 32, Issue 32
> Message-ID:
>         <1523579417.2617274.1336331832.4088E66A@webmail.messagingengine.com>
> Content-Type: text/plain; charset="utf-8"
>
> Hi Haiyue,
>
> On Thu, 12 Apr 2018, at 17:25, Wang, Haiyue wrote:
>> Hi Andrew,
>>
>> Facebook uses the 'devmem' utility and python script to implement the
>> soc register
>>
>> read and write in a simple way. And the yocto layer is also very clear
>> like different
>>
>> chip vendor and common parts.
>>
>>
>> Kernel device tree upstream is also very slow, we needs two parts
>> (device tree + user app)
>>
>> to finish the soc setting. But Facebook just uses user app, this
>> development is fast, and
>>
>> simple is the best.
>>
>>
>> Well, just for sharing what I found, I may misunderstood the BIG idea
>> after this kernel
>>
>> patch design. :-)
>
> Ben's covered the main points, but yes, what was implicit was we're looking to improve the security of the BMC. I'll try to make sure I'm more explicit in the future.
>
> Cheers,
>
> Andrew
>
>
> ------------------------------
>
> Message: 2
> Date: Fri, 13 Apr 2018 08:37:05 +0800
> From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
> To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
>         openbmc-request@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
>         benh@kernel.crashing.org
> Subject: Re: openbmc Digest, Vol 32, Issue 32
> Message-ID: <ecd541ac-0912-6fb9-bb50-a096d037f721@linux.intel.com>
> Content-Type: text/plain; charset=utf-8; format=flowed
>
> Hi Andrew,
>
> I thought it just needed a memory map function for some special
> SoC registers. I truly learn more from this security design. :)
>
> Thanks.
>
> BR,
> Haiyue
>
>
> On 2018-04-13 08:30, Andrew Jeffery wrote:
>> Hi Haiyue,
>>
>> On Thu, 12 Apr 2018, at 17:25, Wang, Haiyue wrote:
>>> Hi Andrew,
>>>
>>> Facebook uses the 'devmem' utility and python script to implement the
>>> soc register
>>>
>>> read and write in a simple way. And the yocto layer is also very clear
>>> like different
>>>
>>> chip vendor and common parts.
>>>
>>>
>>> Kernel device tree upstream is also very slow, we needs two parts
>>> (device tree + user app)
>>>
>>> to finish the soc setting. But Facebook just uses user app, this
>>> development is fast, and
>>>
>>> simple is the best.
>>>
>>>
>>> Well, just for sharing what I found, I may misunderstood the BIG idea
>>> after this kernel
>>>
>>> patch design. :-)
>> Ben's covered the main points, but yes, what was implicit was we're looking to improve the security of the BMC. I'll try to make sure I'm more explicit in the future.
>>
>> Cheers,
>>
>> Andrew
>
>
>
> ------------------------------
>
> Message: 3
> Date: Fri, 13 Apr 2018 11:27:46 +0930
> From: Andrew Jeffery <andrew@aj.id.au>
> To: openbmc@lists.ozlabs.org
> Subject: Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec
>         Lanyang BMC
> Message-ID:
>         <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
> Content-Type: text/plain; charset="utf-8"
>

Hi Andrew,

> Hi Brian,
>
> On Wed, 11 Apr 2018, at 17:12, Brian Yang wrote:
>> The Inventec Lanyang is Power 9 platform with ast2500 BMC.
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
>>       aspeed-ast2500-evb.dtb \
>>       aspeed-bmc-arm-centriq2400-rep.dtb \
>>       aspeed-bmc-intel-s2600wf.dtb \
>> +     aspeed-bmc-opp-lanyang.dtb \
>>       aspeed-bmc-opp-palmetto.dtb \
>>       aspeed-bmc-opp-romulus.dtb \
>>       aspeed-bmc-opp-witherspoon.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/
>> boot/dts/aspeed-bmc-opp-lanyang.dts
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
>> +     model = "Lanyang BMC";
>> +     compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
>> +
>> +     chosen {
>> +             stdout-path = &uart5;
>> +             bootargs = "console=ttyS4,115200 earlyprintk";
>> +     };
>> +
>> +     memory {
>> +             reg = <0x80000000 0x40000000>;
>> +     };
>> +
>> +     reserved-memory {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +
>> +             flash_memory: region@98000000 {
>> +                     no-map;
>> +                     reg = <0x98000000 0x04000000>; /* 64M */
>> +             };
>> +     };
>> +
>> +     leds {
>> +             compatible = "gpio-leds";
>> +
>> +             sys_boot_status {
>> +                     label = "System_boot_status";
>> +                     gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
>> +             };
>> +
>> +             attention {
>> +                     label = "Attention_locator";
>> +                     gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
>> +             };
>> +
>> +             plt_fault {
>> +                     label = "Platform_fault";
>> +                     gpios = <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
>> +             };
>> +
>> +             hdd_fault {
>> +                     label = "Onboard_drive_fault";
>> +                     gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
>> +             };
>> +             bmc_err {
>> +                     lable = "BMC_fault";
>> +                     gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
>> +             };
>> +
>> +             sys_err {
>> +                     lable = "Sys_fault";
>> +                     gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
>> +             };
>> +     };
>> +
>> +     fsi: gpio-fsi {
>> +             compatible = "fsi-master-gpio", "fsi-master";
>> +             #address-cells = <2>;
>> +             #size-cells = <0>;
>> +
>> +             clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
>> +             data-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
>> +             trans-gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
>> +             enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>> +             mux-gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
>> +     };
>> +
>> +     iio-hwmon {
>> +             compatible = "iio-hwmon";
>> +             io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
>> +                     <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>> +                     <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
>> +                     <&adc 13>, <&adc 14>, <&adc 15>;
>> +     };
>> +
>> +     iio-hwmon-battery {
>> +             compatible = "iio-hwmon";
>> +             io-channels = <&adc 12>;
>> +     };
>> +};
>> +
>> +#include "ibm-power9-cfam.dtsi"
>> +
>> +&pwm_tacho {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
>> +             &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>> +
>> +     fan@0 {
>> +             reg = <0x00>;
>> +             aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> +     };
>> +
>> +     fan@1 {
>> +             reg = <0x01>;
>> +             aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> +     };
>> +
>> +     fan@2 {
>> +             reg = <0x02>;
>> +             aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> +     };
>> +
>> +     fan@3 {
>> +             reg = <0x03>;
>> +             aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> +     };
>> +};
>> +
>> +&fmc {
>> +     status = "okay";
>> +     flash@0 {
>> +             status = "okay";
>> +             m25p,fast-read;
>> +             label = "bmc";
>> +#include "openbmc-flash-layout.dtsi"
>> +     };
>> +};
>> +
>> +&spi1 {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_spi1_default>;
>> +
>> +     flash@0 {
>> +             status = "okay";
>> +             label = "pnor";
>> +             m25p,fast-read;
>> +     };
>> +};
>> +
>> +&spi2 {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_spi2ck_default
>> +                  &pinctrl_spi2cs0_default
>> +                  &pinctrl_spi2cs1_default
>> +                  &pinctrl_spi2miso_default
>> +                  &pinctrl_spi2mosi_default>;
>> +
>> +     flash@0 {
>> +             status = "okay";
>> +     };
>> +};
>> +
>> +&uart1 {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_txd1_default
>> +                  &pinctrl_rxd1_default>;
>> +};
>> +
>> +&lpc_ctrl {
>> +     status = "okay";
>> +     memory-region = <&flash_memory>;
>> +     flash = <&spi1>;
>> +};
>> +
>> +&lpc_snoop {
>> +     status = "okay";
>> +     snoop-ports = <0x80>;
>> +};
>> +
>> +&mbox {
>> +     status = "okay";
>> +};
>> +
>> +&uart5 {
>> +     status = "okay";
>> +};
>> +
>> +&mac0 {
>> +     status = "okay";
>> +
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_rmii1_default>;
>> +     use-ncsi;
>> +};
>> +
>> +&mac1 {
>> +     status = "okay";
>> +
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>> +};
>> +
>> +&i2c0 {
>> +     status = "okay";
>> +
>> +     eeprom@55 {
>> +             compatible = "atmel,24c64";
>> +             reg = <0x55>;
>> +             pagesize = <32>;
>> +     };
>> +
>> +     rtc@68 {
>> +             compatible = "nxp,pcf8523";
>> +             reg = <0x68>;
>> +     };
>> +
>> +     tmp75@48 {
>> +             compatible = "ti,tmp75";
>> +             reg = <0x48>;
>> +     };
>> +};
>> +
>> +&i2c1 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c5 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c6 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c7 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c8 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c9 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c10 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c11 {
>> +     status = "okay";
>> +};
>
> Do we need to enable all of the above i2c buses? By comparison, Zaius enables i2c0, i2c1, i2c4, i2c7 and i2c8.

Thank you for your review.
We need to enable all of the above i2c buses because we want to verify
the i2c bus is fine by i2ctool.
Because we use the above i2c buses on Lanyang platform.

>
>> +
>> +&vuart {
>> +     status = "okay";
>> +};
>> +
>> +&gfx {
>> +     status = "okay";
>> +};
>> +
>> +&pinctrl {
>> +     aspeed,external-nodes = <&gfx &lhc>;
>> +};
>> +
>> +&gpio {
>> +     pin_gpio_b0 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
>> +             output-high;
>> +             line-name = "BMC_HDD1_PWR_EN";
>> +     };
>> +
>> +     pin_gpio_b5 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
>> +             input;
>> +             line-name = "BMC_USB1_OCI2";
>> +     };
>> +
>> +     pin_gpio_h5 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
>> +             output-high;
>> +             line-name = "BMC_CP0_PERST_ENABLE_R";
>> +     };
>> +
>> +     pin_gpio_z2 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
>> +             output-high;
>> +             line-name = "RST_PCA9546_U177_N";
>> +     };
>> +
>> +     pin_gpio_aa6 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
>> +             output-high;
>> +             line-name = "BMC_CP0_RESET_N";
>> +     };
>> +
>> +     pin_gpio_aa7 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
>> +             output-high;
>> +             line-name = "BMC_TPM_RESET_N";
>> +     };
>> +
>> +     pin_gpio_ab0 {
>> +             gpio-hog;
>> +             gpios = <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
>> +             output-high;
>> +             line-name = "BMC_USB_PWRON_N";
>> +     };
>> +};
>> +
>> +&ibt {
>> +     status = "okay";
>> +};
>> +
>> +&adc {
>> +     status = "okay";
>> +};
>> +
>> --
>> 2.7.4
>>
>
> Looks okay from a pinctrl perspective, so if there is reason to enable all of the i2c buses, then I'll send an Acked-by
>
> Cheers,
>
> Andrew
>
>
> End of openbmc Digest, Vol 32, Issue 36
> ***************************************

Thank you

Brian
