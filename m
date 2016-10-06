Return-Path: <maxims@google.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqfTP0Dt9zDrPb
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 04:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=mIMxvlIM; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id 191so7818567ybv.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=r9H/JeOKdOmhaR4J/n/Ww/pFn0jGiv01r/hMrifV8nA=;
 b=mIMxvlIMu9vCqa31CDxp+eGUUqfMhQ2snzX+HD5Yu2IfpnqUyLCt7C2EJ+b+euMmjS
 Hly1uS2JpIGkqhSFYDVC515pTmqdg5l5jlb246Y28BrSsDPehfSXk1a2Rmn0yMRKbjDN
 88Hxo60pLJ+lbKI1rVUlX5WKTd2rNoH3iQ9lfi+7VQWbKa5YXZFssp+u8gjuVKH5KiSJ
 aqMStSkPAsJCeHdjicSr34ccn6Ea6C0U95tqWrFK/ImTZCWNVhVc5azJr7mAniGzNtfy
 MZixF/PZ91CeBoUL27XnjsEE/PEPgNjK8LZFpY7XtO8EMl60UuMW6wuOxNGNFVj0A3ac
 hN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=r9H/JeOKdOmhaR4J/n/Ww/pFn0jGiv01r/hMrifV8nA=;
 b=j+wbDIMAI3M+VTcWJqLrV6me8YYw3TzoU7zm6ZGOmw4RqXL7+dfehM0KyS4xnGGudk
 NSqeCHcrMKwAZzpLchQegcy9MWHEfS3kH4L7aWJQKGlgh++4wKjeinmbh/kY8YgEpZUC
 Kvq5EJsl4XJSirBtOuGWH674lzd1ohsRkCqCbSGeAcivziuJtAWko4hXiw6tPvjHIkZi
 dCRK5xkabiaVNOiO3HVELwyJUxMWEnJfkMNze3I+tRZqHyWTPQnxEEx/mqxvoYNElmgV
 gsjOUDlRw701/xoAM+Rrt0kD39cIhxYgA7tp1JR3BbQG6yZkhrPQK5MnFcQFgV3bsAOG
 GnSQ==
X-Gm-Message-State: AA6/9RmURajJlJSvI11X/ldW2NZ+bvESbSKaGg2kIw9TJPOu07dqI5nP7vCWDpbt3hvFd42QoynbgcLfH+Ephw0R
X-Received: by 10.37.4.203 with SMTP id 194mr12387610ybe.10.1475774213800;
 Thu, 06 Oct 2016 10:16:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Thu, 6 Oct 2016 10:16:53 -0700 (PDT)
In-Reply-To: <CAFR_W8p4nKxHxUDWtS3SxNcqp2sHyt+1eoznssKjTK6RCc=JVg@mail.gmail.com>
References: <1474998214-12720-1-git-send-email-maxims@google.com>
 <1475173974-130879-1-git-send-email-maxims@google.com>
 <CAFR_W8p4nKxHxUDWtS3SxNcqp2sHyt+1eoznssKjTK6RCc=JVg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 6 Oct 2016 10:16:53 -0700
Message-ID: <CAFR_W8odtcmNUjA1uPLZh++pxMt+mOWxSx+6QSUB_ChjUBEqNQ@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11c001e8c92c98053e3575a8
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
X-List-Received-Date: Thu, 06 Oct 2016 17:16:58 -0000

--001a11c001e8c92c98053e3575a8
Content-Type: text/plain; charset=UTF-8

Ping

On Wed, Oct 5, 2016 at 9:16 AM, Maxim Sloyko <maxims@google.com> wrote:

> Ping
>
> On Thu, Sep 29, 2016 at 11:32 AM, <maxims@google.com> wrote:
>
>> From: Maxim Sloyko <maxims@google.com>
>>
>> Device Tree for ast2500, copied from openbmc/linux (include file), plus
>> minimal device tree configuration for ast2500 eval board.
>> ---
>>  arch/arm/dts/Makefile          |   2 +
>>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
>>  arch/arm/dts/aspeed-g5.dtsi    | 541 ++++++++++++++++++++++++++++++
>> +++++++++++
>>  3 files changed, 571 insertions(+)
>>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>>
>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>> index d1f8e22..09efa0a 100644
>> --- a/arch/arm/dts/Makefile
>> +++ b/arch/arm/dts/Makefile
>> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
>>         k2e-evm.dtb \
>>         k2g-evm.dtb
>>
>> +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
>> +
>>  targets += $(dtb-y)
>>
>>  # Add any required device tree compiler flags here
>> diff --git a/arch/arm/dts/aspeed-g5-evb.dts
>> b/arch/arm/dts/aspeed-g5-evb.dts
>> new file mode 100644
>> index 0000000..95dc77a
>> --- /dev/null
>> +++ b/arch/arm/dts/aspeed-g5-evb.dts
>> @@ -0,0 +1,28 @@
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +
>> +/ {
>> +       memory {
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x20000000>;
>> +       };
>> +
>> +       aliases {
>> +               i2c1 = &i2c0;
>> +               i2c4 = &i2c3;
>> +               i2c8 = &i2c7;
>> +       };
>> +};
>> +
>> +&i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c7 {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
>> new file mode 100644
>> index 0000000..eb81a2e
>> --- /dev/null
>> +++ b/arch/arm/dts/aspeed-g5.dtsi
>> @@ -0,0 +1,541 @@
>> +/* The device tree is copied from
>> + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/boot/
>> dts/aspeed-g5.dtsi
>> + */
>> +#include "skeleton.dtsi"
>> +
>> +/ {
>> +       model = "Aspeed BMC";
>> +       compatible = "aspeed,ast2500";
>> +       #address-cells = <1>;
>> +       #size-cells = <1>;
>> +       interrupt-parent = <&vic>;
>> +
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               cpu@0 {
>> +                       compatible = "arm,arm1176jzf-s";
>> +                       device_type = "cpu";
>> +                       reg = <0>;
>> +               };
>> +       };
>> +
>> +       ahb {
>> +               compatible = "simple-bus";
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges;
>> +
>> +               vic: interrupt-controller@1e6c0080 {
>> +                       compatible = "aspeed,ast2400-vic";
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       valid-sources = <0xfefff7ff 0x0807ffff>;
>> +                       reg = <0x1e6c0080 0x80>;
>> +               };
>> +
>> +               mac0: ethernet@1e660000 {
>> +                       compatible = "faraday,ftgmac100";
>> +                       reg = <0x1e660000 0x180>;
>> +                       interrupts = <2>;
>> +                       no-hw-checksum;
>> +                       status = "disabled";
>> +               };
>> +
>> +               mac1: ethernet@1e680000 {
>> +                       compatible = "faraday,ftgmac100";
>> +                       reg = <0x1e680000 0x180>;
>> +                       interrupts = <3>;
>> +                       no-hw-checksum;
>> +                       status = "disabled";
>> +               };
>> +
>> +               apb {
>> +                       compatible = "simple-bus";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       ranges;
>> +
>> +                       clk_clkin: clk_clkin@1e6e2070 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-clkin-clock";
>> +                               reg = <0x1e6e2070 0x04>;
>> +                       };
>> +
>> +                       syscon: syscon@1e6e2000 {
>> +                               compatible = "aspeed,g5-scu", "syscon",
>> "simple-mfd";
>> +                               reg = <0x1e6e2000 0x1a8>;
>> +
>> +                               pinctrl: pinctrl@1e6e2000 {
>> +                                       compatible = "aspeed,g5-pinctrl";
>> +
>> +                                       pinctrl_i2c9_default:
>> i2c9_default {
>> +                                               function = "I2C9";
>> +                                               groups = "I2C9";
>> +                                       };
>> +
>> +                                       pinctrl_i2c10_default:
>> i2c10_default {
>> +                                               function = "I2C10";
>> +                                               groups = "I2C10";
>> +                                       };
>> +
>> +                                       pinctrl_i2c11_default:
>> i2c11_default {
>> +                                               function = "I2C11";
>> +                                               groups = "I2C11";
>> +                                       };
>> +
>> +                                       pinctrl_i2c12_default:
>> i2c12_default {
>> +                                               function = "I2C12";
>> +                                               groups = "I2C12";
>> +                                       };
>> +
>> +                                       pinctrl_i2c13_default:
>> i2c13_default {
>> +                                               function = "I2C13";
>> +                                               groups = "I2C13";
>> +                                       };
>> +
>> +                                       pinctrl_gpid0_default:
>> gpid0_default {
>> +                                               function = "GPID0";
>> +                                               groups = "GPID0";
>> +                                       };
>> +
>> +                                       pinctrl_gpid1_default:
>> gpid1_default {
>> +                                               function = "GPID1";
>> +                                               groups = "GPID1";
>> +                                       };
>> +
>> +                                       pinctrl_sd1_default: sd1_default {
>> +                                               function = "SD1";
>> +                                               groups = "SD1";
>> +                                       };
>> +
>> +                                       pinctrl_i2c5_default:
>> i2c5_default {
>> +                                               function = "I2C5";
>> +                                               groups = "I2C5";
>> +                                       };
>> +
>> +                                       pinctrl_i2c6_default:
>> i2c6_default {
>> +                                               function = "I2C6";
>> +                                               groups = "I2C6";
>> +                                       };
>> +
>> +                                       pinctrl_i2c7_default:
>> i2c7_default {
>> +                                               function = "I2C7";
>> +                                               groups = "I2C7";
>> +                                       };
>> +
>> +                                       pinctrl_i2c8_default:
>> i2c8_default {
>> +                                               function = "I2C8";
>> +                                               groups = "I2C8";
>> +                                       };
>> +
>> +                                       pinctrl_pwm0_default:
>> pwm0_default {
>> +                                               function = "PWM0";
>> +                                               groups = "PWM0";
>> +                                       };
>> +
>> +                                       pinctrl_pwm1_default:
>> pwm1_default {
>> +                                               function = "PWM1";
>> +                                               groups = "PWM1";
>> +                                       };
>> +
>> +                                       pinctrl_pwm2_default:
>> pwm2_default {
>> +                                               function = "PWM2";
>> +                                               groups = "PWM2";
>> +                                       };
>> +
>> +                                       pinctrl_pwm3_default:
>> pwm3_default {
>> +                                               function = "PWM3";
>> +                                               groups = "PWM3";
>> +                                       };
>> +
>> +                                       pinctrl_pwm4_default:
>> pwm4_default {
>> +                                               function = "PWM4";
>> +                                               groups = "PWM4";
>> +                                       };
>> +
>> +                                       pinctrl_pwm5_default:
>> pwm5_default {
>> +                                               function = "PWM5";
>> +                                               groups = "PWM5";
>> +                                       };
>> +
>> +                                       pinctrl_pwm6_default:
>> pwm6_default {
>> +                                               function = "PWM6";
>> +                                               groups = "PWM6";
>> +                                       };
>> +
>> +                                       pinctrl_pwm7_default:
>> pwm7_default {
>> +                                               function = "PWM7";
>> +                                               groups = "PWM7";
>> +                                       };
>> +
>> +                                       pinctrl_i2c3_default:
>> i2c3_default {
>> +                                               function = "I2C3";
>> +                                               groups = "I2C3";
>> +                                       };
>> +
>> +                                       pinctrl_i2c4_default:
>> i2c4_default {
>> +                                               function = "I2C4";
>> +                                               groups = "I2C4";
>> +                                       };
>> +
>> +                                       pinctrl_i2c14_default:
>> i2c14_default {
>> +                                               function = "I2C14";
>> +                                               groups = "I2C14";
>> +                                       };
>> +
>> +                                       pinctrl_rgmii1_default:
>> rgmii1_default {
>> +                                               function = "RGMII1";
>> +                                               groups = "RGMII1";
>> +                                       };
>> +
>> +                                       pinctrl_rmii1_default:
>> rmii1_default {
>> +                                               function = "RMII1";
>> +                                               groups = "RMII1";
>> +                                       };
>> +
>> +                                       pinctrl_rgmii2_default:
>> rgmii2_default {
>> +                                               function = "RGMII2";
>> +                                               groups = "RGMII2";
>> +                                       };
>> +
>> +                                       pinctrl_rmii2_default:
>> rmii2_default {
>> +                                               function = "RMII2";
>> +                                               groups = "RMII2";
>> +                                       };
>> +                               };
>> +                       };
>> +
>> +                       clk_hpll: clk_hpll@1e6e2024 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-hpll-clock";
>> +                               reg = <0x1e6e2024 0x4>;
>> +                               clocks = <&clk_clkin>;
>> +                       };
>> +
>> +                       clk_ahb: clk_ahb@1e6e2070 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-ahb-clock";
>> +                               reg = <0x1e6e2070 0x4>;
>> +                               clocks = <&clk_hpll>;
>> +                       };
>> +
>> +                       clk_apb: clk_apb@1e6e2008 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,g5-apb-clock";
>> +                               reg = <0x1e6e2008 0x4>;
>> +                               clocks = <&clk_hpll>;
>> +                       };
>> +
>> +                       clk_uart: clk_uart@1e6e2008 {
>> +                               #clock-cells = <0>;
>> +                               compatible = "aspeed,uart-clock";
>> +                               reg = <0x1e6e202c 0x4>;
>> +                       };
>> +
>> +                       sram@1e720000 {
>> +                               compatible = "mmio-sram";
>> +                               reg = <0x1e720000 0x9000>;      // 36K
>> +                       };
>> +
>> +                       gpio: gpio@1e780000 {
>> +                               #gpio-cells = <2>;
>> +                               gpio-controller;
>> +                               compatible = "aspeed,ast2500-gpio";
>> +                               reg = <0x1e780000 0x1000>;
>> +                               interrupts = <20>;
>> +                               gpio-ranges = <&pinctrl 0 0 220>;
>> +                       };
>> +
>> +                       timer: timer@1e782000 {
>> +                               compatible = "aspeed,ast2400-timer";
>> +                               reg = <0x1e782000 0x90>;
>> +                               // The moxart_timer driver registers only
>> one
>> +                               // interrupt and assumes it's for timer 1
>> +                               //interrupts = <16 17 18 35 36 37 38 39>;
>> +                               interrupts = <16>;
>> +                               clocks = <&clk_apb>;
>> +                       };
>> +
>> +                       ibt: ibt@1e789140 {
>> +                               compatible = "aspeed,bt-host";
>> +                               reg = <0x1e789140 0x18>;
>> +                               interrupts = <8>;
>> +                       };
>> +
>> +                       wdt1: wdt@1e785000 {
>> +                               compatible = "aspeed,ast2500-wdt";
>> +                               reg = <0x1e785000 0x1c>;
>> +                       };
>> +
>> +                       wdt2: wdt@1e785020 {
>> +                               compatible = "aspeed,ast2500-wdt";
>> +                               reg = <0x1e785020 0x1c>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       wdt3: wdt@1e785040 {
>> +                               compatible = "aspeed,wdt";
>> +                               reg = <0x1e785074 0x1c>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart1: serial@1e783000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e783000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <9>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart2: serial@1e78d000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78d000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <32>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart3: serial@1e78e000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78e000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <33>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart4: serial@1e78f000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e78f000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <34>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       uart5: serial@1e784000 {
>> +                               compatible = "ns16550a";
>> +                               reg = <0x1e784000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <10>;
>> +                               clocks = <&clk_uart>;
>> +                               current-speed = <38400>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       vuart: vuart@1e787000 {
>> +                               compatible = "aspeed,vuart";
>> +                               reg = <0x1e787000 0x1000>;
>> +                               reg-shift = <2>;
>> +                               interrupts = <8>;
>> +                               clocks = <&clk_uart>;
>> +                               no-loopback-test;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       i2c: i2c@1e78a000 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <1>;
>> +                               #interrupt-cells = <1>;
>> +
>> +                               compatible =
>> "aspeed,ast2400-i2c-controller";
>> +                               reg = <0x1e78a000 0x40>;
>> +                               ranges = <0 0x1e78a000 0x1000>;
>> +                               interrupts = <12>;
>> +                               clocks = <&clk_apb>;
>> +                               clock-ranges;
>> +                               interrupt-controller;
>> +
>> +                               i2c0: i2c-bus@40 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x40 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <0>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <0>;
>> +                                       interrupt-parent = <&i2c>;
>> +                               };
>> +
>> +                               i2c1: i2c-bus@80 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x80 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <1>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <1>;
>> +                               };
>> +
>> +                               i2c2: i2c-bus@c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0xC0 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <2>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <2>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c3_default>;
>> +                               };
>> +
>> +                               i2c3: i2c-bus@100 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x100 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <3>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <3>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c4_default>;
>> +                               };
>> +
>> +                               i2c4: i2c-bus@140 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x140 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <4>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <4>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c5_default>;
>> +                               };
>> +
>> +                               i2c5: i2c-bus@180 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x180 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <5>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <5>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c6_default>;
>> +                               };
>> +
>> +                               i2c6: i2c-bus@1c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x1C0 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <6>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <6>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c7_default>;
>> +                               };
>> +
>> +                               i2c7: i2c-bus@300 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x300 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <7>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <7>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c8_default>;
>> +                               };
>> +
>> +                               i2c8: i2c-bus@340 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x340 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <8>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <8>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c9_default>;
>> +                               };
>> +
>> +                               i2c9: i2c-bus@380 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x380 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <9>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <9>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c10_default>;
>> +                               };
>> +
>> +                               i2c10: i2c-bus@3c0 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x3c0 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <10>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <10>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c11_default>;
>> +                               };
>> +
>> +                               i2c11: i2c-bus@400 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x400 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <11>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <11>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c12_default>;
>> +                               };
>> +
>> +                               i2c12: i2c-bus@440 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x440 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <12>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <12>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c13_default>;
>> +                               };
>> +
>> +                               i2c13: i2c-bus@480 {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       reg = <0x480 0x40>;
>> +                                       compatible =
>> "aspeed,ast2400-i2c-bus";
>> +                                       bus = <13>;
>> +                                       clock-frequency = <100000>;
>> +                                       status = "disabled";
>> +                                       interrupts = <13>;
>> +                                       pinctrl-names = "default";
>> +                                       pinctrl-0 =
>> <&pinctrl_i2c14_default>;
>> +                               };
>> +
>> +                       };
>> +
>> +               };
>> +       };
>> +};
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>>
>
>
> --
> *M*axim *S*loyko
>



-- 
*M*axim *S*loyko

--001a11c001e8c92c98053e3575a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+UGluZzwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgT2N0IDUsIDIwMTYgYXQgOToxNiBBTSwgTWF4
aW0gU2xveWtvIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOm1heGltc0Bnb29n
bGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWF4aW1zQGdvb2dsZS5jb208L2E+Jmd0Ozwvc3Bhbj4g
d3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
IDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxk
aXYgZGlyPSJsdHIiPlBpbmc8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGRpdj48ZGl2
IGNsYXNzPSJoNSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBUaHUsIFNlcCAyOSwg
MjAxNiBhdCAxMTozMiBBTSwgIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOm1h
eGltc0Bnb29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWF4aW1zQGdvb2dsZS5jb208L2E+Jmd0
Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPkZyb206IE1heGltIFNsb3lrbyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1heGltc0Bnb29n
bGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+bWF4aW1zQGdvb2dsZS5jb208L2E+Jmd0Ozxicj4NCjxi
cj4NCkRldmljZSBUcmVlIGZvciBhc3QyNTAwLCBjb3BpZWQgZnJvbSBvcGVuYm1jL2xpbnV4IChp
bmNsdWRlIGZpbGUpLCBwbHVzPGJyPg0KbWluaW1hbCBkZXZpY2UgdHJlZSBjb25maWd1cmF0aW9u
IGZvciBhc3QyNTAwIGV2YWwgYm9hcmQuPGJyPg0KLS0tPGJyPg0KwqBhcmNoL2FybS9kdHMvTWFr
ZWZpbGXCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICs8YnI+DQrCoGFyY2gvYXJtL2R0cy9hc3BlZWQt
ZzUtZXZiLjx3YnI+ZHRzIHzCoCAyOCArKys8YnI+DQrCoGFyY2gvYXJtL2R0cy9hc3BlZWQtZzUu
ZHRzacKgIMKgIHwgNTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKzx3YnI+KysrKysr
KysrKys8YnI+DQrCoDMgZmlsZXMgY2hhbmdlZCwgNTcxIGluc2VydGlvbnMoKyk8YnI+DQrCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi5kdHM8YnI+DQrCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0c2k8YnI+DQo8YnI+DQpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vZHRzL01ha2VmaWxl
PGJyPg0KaW5kZXggZDFmOGUyMi4uMDllZmEwYSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9k
dHMvTWFrZWZpbGU8YnI+DQorKysgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGU8YnI+DQpAQCAtMjMz
LDYgKzIzMyw4IEBAIGR0Yi0kKENPTkZJR19TT0NfS0VZU1RPTkUpICs9IGsyaGstZXZtLmR0YiBc
PGJyPg0KwqAgwqAgwqAgwqAgazJlLWV2bS5kdGIgXDxicj4NCsKgIMKgIMKgIMKgIGsyZy1ldm0u
ZHRiPGJyPg0KPGJyPg0KK2R0Yi0kKENPTkZJR19UQVJHRVRfQVNUX0c1KSArPSBhc3BlZWQtZzUt
ZXZiLmR0Yjxicj4NCis8YnI+DQrCoHRhcmdldHMgKz0gJChkdGIteSk8YnI+DQo8YnI+DQrCoCMg
QWRkIGFueSByZXF1aXJlZCBkZXZpY2UgdHJlZSBjb21waWxlciBmbGFncyBoZXJlPGJyPg0KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUtZXZiLmQ8d2JyPnRzIGIvYXJjaC9hcm0v
ZHRzL2FzcGVlZC1nNS1ldmIuZDx3YnI+dHM8YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4N
CmluZGV4IDAwMDAwMDAuLjk1ZGM3N2E8YnI+DQotLS0gL2Rldi9udWxsPGJyPg0KKysrIGIvYXJj
aC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuZDx3YnI+dHM8YnI+DQpAQCAtMCwwICsxLDI4IEBAPGJy
Pg0KKy9kdHMtdjEvOzxicj4NCis8YnI+DQorI2luY2x1ZGUgJnF1b3Q7YXNwZWVkLWc1LmR0c2km
cXVvdDs8YnI+DQorPGJyPg0KKy8gezxicj4NCivCoCDCoCDCoCDCoG1lbW9yeSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNlX3R5cGUgPSAmcXVvdDttZW1vcnkmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAwMDAwMDAgMHgyMDAwMDAw
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYWxpYXNl
cyB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMSA9ICZhbXA7aTJjMDs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM0ID0gJmFtcDtpMmMzOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGkyYzggPSAmYW1wO2kyYzc7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQor
fTs8YnI+DQorPGJyPg0KKyZhbXA7aTJjMCB7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1
b3Q7b2theSZxdW90Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7aTJjMyB7PGJyPg0KK8Kg
IMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0K
KyZhbXA7aTJjNyB7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8
YnI+DQorfTs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpIGIv
YXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+
DQppbmRleCAwMDAwMDAwLi5lYjgxYTJlPGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2Fy
Y2gvYXJtL2R0cy9hc3BlZWQtZzUuZHRzaTxicj4NCkBAIC0wLDAgKzEsNTQxIEBAPGJyPg0KKy8q
IFRoZSBkZXZpY2UgdHJlZSBpcyBjb3BpZWQgZnJvbTxicj4NCisgKiA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iLzllYzlkMDkvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWc1LmR0c2kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL2xpbjx3YnI+dXgvYmxvYi85ZWM5ZDA5L2FyY2gvYXJtL2Jvb3Qv
PHdicj5kdHMvYXNwZWVkLWc1LmR0c2k8L2E+PGJyPg0KKyAqLzxicj4NCisjaW5jbHVkZSAmcXVv
dDtza2VsZXRvbi5kdHNpJnF1b3Q7PGJyPg0KKzxicj4NCisvIHs8YnI+DQorwqAgwqAgwqAgwqBt
b2RlbCA9ICZxdW90O0FzcGVlZCBCTUMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCNhZGRyZXNz
LWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzEm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoGludGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFtcDt2aWMmZ3Q7
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjcHVzIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY3B1QDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDthcm0sYXJtMTE3Nmp6Zi1zJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7Y3B1JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoGFoYiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3NpbXBsZS1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmFuZ2VzOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2aWM6IGlu
dGVycnVwdC1jb250cm9sbGVyQDFlNmMwMDgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtdmljJnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdC1jb250
cm9sbGVyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1
cHQtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdmFsaWQtc291cmNlcyA9ICZsdDsweGZlZmZmN2ZmIDB4MDgwN2ZmZmYmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmMwMDgw
IDB4ODAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hYzA6IGV0aGVybmV0QDFlNjYwMDAwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7ZmFyYWRh
eSxmdGdtYWMxMDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzB4MWU2NjAwMDAgMHgxODAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8taHctY2hlY2tzdW07PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbWFjMTogZXRoZXJuZXRAMWU2ODAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtmYXJhZGF5LGZ0Z21hYzEw
MCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAm
bHQ7MHgxZTY4MDAwMCAweDE4MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBuby1ody1jaGVja3N1bTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhcGIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJhbmdlczs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2Nsa2luOiBjbGtfY2xraW5AMWU2
ZTIwNzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGc1LWNs
a2luLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4MDQmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN5c2Nvbjogc3lzY29uQDFlNmUyMDAwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7YXNwZWVkLGc1LXNjdSZxdW90OywgJnF1b3Q7c3lzY29uJnF1b3Q7LCAmcXVvdDtzaW1w
bGUtbWZkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDAwIDB4MWE4Jmd0Ozs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybDogcGlu
Y3RybEAxZTZlMjAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1waW5j
dHJsJnF1b3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzlfZGVmYXVsdDogaTJjOV9kZWZh
dWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzkmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDOSZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzEwX2RlZmF1bHQ6IGkyYzEwX2RlZmF1bHQgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTAmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDMTAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybF9pMmMxMV9kZWZhdWx0OiBpMmMxMV9kZWZhdWx0IHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzExJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdyb3VwcyA9ICZxdW90O0kyQzExJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bmN0cmxfaTJjMTJfZGVmYXVsdDogaTJjMTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZnVuY3Rpb24gPSAmcXVvdDtJMkMxMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMg
PSAmcXVvdDtJMkMxMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2ky
YzEzX2RlZmF1bHQ6IGkyYzEzX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9u
ID0gJnF1b3Q7STJDMTMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7
STJDMTMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9ncGlkMF9kZWZh
dWx0OiBncGlkMF9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90
O0dQSUQwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0dQSUQwJnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfZ3BpZDFfZGVmYXVsdDogZ3Bp
ZDFfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtHUElEMSZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtHUElEMSZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3NkMV9kZWZhdWx0OiBzZDFfZGVmYXVsdCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtTRDEmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7U0QxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfaTJjNV9kZWZhdWx0OiBpMmM1X2RlZmF1bHQgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDNSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtJMkM1JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0
cmxfaTJjNl9kZWZhdWx0OiBpMmM2X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0
aW9uID0gJnF1b3Q7STJDNiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVv
dDtJMkM2JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjN19kZWZh
dWx0OiBpMmM3X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7
STJDNyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM3JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjOF9kZWZhdWx0OiBpMmM4X2Rl
ZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDOCZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM4JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtMF9kZWZhdWx0OiBwd20wX2RlZmF1bHQgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMCZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV00wJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBpbmN0cmxfcHdtMV9kZWZhdWx0OiBwd20xX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91
cHMgPSAmcXVvdDtQV00xJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxf
cHdtMl9kZWZhdWx0OiBwd20yX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9u
ID0gJnF1b3Q7UFdNMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQ
V00yJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtM19kZWZhdWx0
OiBwd20zX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdN
MyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV00zJnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNF9kZWZhdWx0OiBwd200X2RlZmF1
bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV000JnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNV9kZWZhdWx0OiBwd201X2RlZmF1bHQgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNSZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncm91cHMgPSAmcXVvdDtQV001JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBpbmN0cmxfcHdtNl9kZWZhdWx0OiBwd202X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGZ1bmN0aW9uID0gJnF1b3Q7UFdNNiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMg
PSAmcXVvdDtQV002JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdt
N19kZWZhdWx0OiBwd203X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0g
JnF1b3Q7UFdNNyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV003
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjM19kZWZhdWx0OiBp
MmMzX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMyZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMzJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjNF9kZWZhdWx0OiBpMmM0X2RlZmF1bHQg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDNCZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmxfaTJjMTRfZGVmYXVsdDogaTJjMTRfZGVmYXVsdCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxNCZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncm91cHMgPSAmcXVvdDtJMkMxNCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsX3JnbWlpMV9kZWZhdWx0OiByZ21paTFfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtSR01JSTEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z3JvdXBzID0gJnF1b3Q7UkdNSUkxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bmN0cmxfcm1paTFfZGVmYXVsdDogcm1paTFfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZnVuY3Rpb24gPSAmcXVvdDtSTUlJMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMg
PSAmcXVvdDtSTUlJMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3Jn
bWlpMl9kZWZhdWx0OiByZ21paTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rp
b24gPSAmcXVvdDtSR01JSTImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1
b3Q7UkdNSUkyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcm1paTJf
ZGVmYXVsdDogcm1paTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAm
cXVvdDtSTUlJMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtSTUlJ
MiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xr
X2hwbGw6IGNsa19ocGxsQDFlNmUyMDI0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O2FzcGVlZCxnNS1ocGxsLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDI0IDB4NCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2tzID0gJmx0OyZhbXA7Y2xrX2Nsa2luJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbGtfYWhiOiBjbGtfYWhiQDFlNmUyMDcwIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1haGItY2xvY2smcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2
ZTIwNzAgMHg0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfaHBsbCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2FwYjogY2xrX2FwYkAxZTZlMjAwOCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxz
ID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtYXBiLWNsb2NrJnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDFlNmUyMDA4IDB4NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX2hwbGwmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa191YXJ0OiBjbGtfdWFydEAxZTZlMjAw
OCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsdWFydC1jbG9j
ayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgxZTZlMjAyYyAweDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHNyYW1AMWU3MjAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDttbWlvLXNyYW0mcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4MWU3MjAwMDAgMHg5MDAwJmd0OzvCoCDCoCDCoCAvLyAzNks8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvOiBncGlvQDFlNzgwMDAwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9
ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwLWdw
aW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4MWU3ODAwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzIwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BpbmN0cmwgMCAwIDIyMCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgdGltZXI6IHRpbWVyQDFlNzgyMDAwIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7YXNwZWVkLGFzdDI0MDAtdGltZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODIwMDAgMHg5MCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8g
VGhlIG1veGFydF90aW1lciBkcml2ZXIgcmVnaXN0ZXJzIG9ubHkgb25lPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8gaW50ZXJydXB0IGFuZCBh
c3N1bWVzIGl0JiMzOTtzIGZvciB0aW1lciAxPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy9pbnRlcnJ1cHRzID0gJmx0OzE2IDE3IDE4IDM1IDM2
IDM3IDM4IDM5Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzE2Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfYXBi
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpYnQ6IGlidEAxZTc4OTE0
MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxidC1ob3N0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg5MTQw
IDB4MTgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgd2R0MTogd2R0QDFlNzg1MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1
MDAtd2R0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg1MDAwIDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHdkdDI6IHdkdEAxZTc4NTAyMCB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2Fz
cGVlZCxhc3QyNTAwLXdkdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NTAyMCAweDFjJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3
ZHQzOiB3ZHRAMWU3ODUwNDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsd2R0JnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDFlNzg1MDc0IDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQxOiBzZXJpYWxAMWU3ODMwMDAgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4MzAwMCAweDEwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1z
aGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzkmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191
YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQyOiBzZXJpYWxAMWU3OGQwMDAgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4ZDAwMCAweDEwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1z
aGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtf
dWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0Mzogc2VyaWFsQDFlNzhlMDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3OGUwMDAgMHgxMDAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWct
c2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszMyZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xr
X3VhcnQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDQ6IHNlcmlhbEAxZTc4ZjAwMCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhmMDAwIDB4MTAwMCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
LXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MzQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Ns
a191YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQ1OiBzZXJpYWxAMWU3ODQwMDAgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBh
dGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NDAwMCAweDEwMDAmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
Zy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtj
bGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY3VycmVudC1zcGVlZCA9ICZsdDszODQwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMg
PSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB2dWFydDogdnVhcnRAMWU3ODcwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsdnVhcnQmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4MWU3ODcwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0
cyA9ICZsdDs4Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpMmM6IGkyY0AxZTc4YTAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMg
PSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O2FzcGVlZCxhc3QyNDAwLWkyYy1jb250cm9sbGVyPHdicj4mcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3
OGEwMDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmFuZ2VzID0gJmx0OzAgMHgxZTc4YTAwMCAweDEwMDAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7MTImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19hcGImZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLXJhbmdlczs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQt
Y29udHJvbGxlcjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaTJjMDogaTJjLWJ1c0A0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMg
PSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4NDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxh
c3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNs
b2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rp
c2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2kyYyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTogaTJjLWJ1c0A4MCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAm
bHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0g
Jmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaTJjMjogaTJjLWJ1c0BjMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAm
bHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4QzAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3Qy
NDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
LWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2Fi
bGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZh
bXA7cGluY3RybF9pMmMzX2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzM6IGkyYy1idXNAMTAwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0
OzMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7
MyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM0X2RlZmF1bHQmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzQ6
IGkyYy1idXNAMTQwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxNDAgMHg0MCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnVzID0gJmx0OzQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZs
dDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90
O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM1
X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGkyYzU6IGkyYy1idXNAMTgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxs
cyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHgxODAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVl
ZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzUmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NSZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0g
Jmx0OyZhbXA7cGluY3RybF9pMmM2X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzY6IGkyYy1idXNAMWMwIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9
ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxQzAgMHg0MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVz
ID0gJmx0OzYmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7NiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM3X2RlZmF1bHQmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGkyYzc6IGkyYy1idXNAMzAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzMDAg
MHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1i
dXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzcmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5j
eSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9
ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3Ry
bF9pMmM4X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzg6IGkyYy1idXNAMzQwIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVz
cy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgzNDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzgmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM5X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzk6IGkyYy1idXNA
MzgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1j
ZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzODAgMHg0MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnVzID0gJmx0OzkmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7OSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmMxMF9kZWZhdWx0
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpMmMxMDogaTJjLWJ1c0AzYzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0
OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDNjMCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0
MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTAmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
LWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2Fi
bGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTAmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0
cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsm
YW1wO3BpbmN0cmxfaTJjMTFfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTE6IGkyYy1idXNANDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZs
dDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0g
Jmx0OzExJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0g
Jmx0OzExJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEyX2RlZmF1bHQmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGkyYzEyOiBpMmMtYnVzQDQ0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDQw
IDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMt
YnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVl
bmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1l
cyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGlu
Y3RybF9pMmMxM19kZWZhdWx0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxMzogaTJjLWJ1c0A0ODAgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNh
ZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDQ4MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTMm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTMm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaTJjMTRfZGVmYXVsdCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCit9Ozxicj4N
CjxzcGFuIGNsYXNzPSJtXzg1NTAwOTg3MjU0NTg4NjI4MDRIT0VuWmIiPjxmb250IGNvbG9yPSIj
ODg4ODg4Ij4tLTxicj4NCjIuOC4wLnJjMy4yMjYuZzM5ZDQwMjA8YnI+DQo8YnI+DQo8L2ZvbnQ+
PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PGJyIGNsZWFyPSJhbGwiPjxkaXY+PGJyPjwv
ZGl2PjwvZGl2PjwvZGl2PjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4
Ij4tLSA8YnI+PGRpdiBjbGFzcz0ibV84NTUwMDk4NzI1NDU4ODYyODA0Z21haWxfc2lnbmF0dXJl
IiBkYXRhLXNtYXJ0bWFpbD0iZ21haWxfc2lnbmF0dXJlIj48ZGl2PjxiPk08L2I+YXhpbSA8Yj5T
PC9iPmxveWtvPC9kaXY+PC9kaXY+DQo8L2ZvbnQ+PC9zcGFuPjwvZGl2Pg0KPC9ibG9ja3F1b3Rl
PjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRp
dj48Yj5NPC9iPmF4aW0gPGI+UzwvYj5sb3lrbzwvZGl2PjwvZGl2Pg0KPC9kaXY+DQo=
--001a11c001e8c92c98053e3575a8--
