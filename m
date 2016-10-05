Return-Path: <maxims@google.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq19k21dWzDqQq
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 03:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=hRCbqnq+; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id t193so85402889ywc.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=Uk+lXkUJ1T4klQvAd7SQKEiymJ2hmU/kyN50BxWi9lE=;
 b=hRCbqnq+IFU3K9F5y7O7fSepBlssbosEkIzAPPs8MZu0e9zTPUno4Co+rHWIRapn3h
 UPPpZVWaje2FYFefVX28cuKhPs2+ok42fuBXY9bX5zdHMQWvlRtCn9mgMVG2Gwa1sSzJ
 Uw2dr7bovGU09Puk9Mt329DI2kCPFQUL3PDiVOVYbT1ptLrR5jGKr6VWmJ1/ZdtszR8j
 EXIQ+Iuaiohy7035zPjm44CoCsH4po4EIgHduxu1T8VUkkUxe0apoiJI9XRKcdme+tlt
 gQ5MPC6PLWhkpNgapUDqR4bNbocmWkjNyVInsr1yeyCWqHGLTkf4RuTKxVQC+1MCb2NE
 O5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=Uk+lXkUJ1T4klQvAd7SQKEiymJ2hmU/kyN50BxWi9lE=;
 b=QJ37KrsV09Y0XzusDjY/orSBWzW/O0y5FZX2nQCed7iGhr95qp6q2fbsZxOMDYC42U
 KF9+GnwxfG+XaoI5qXbFtnPd/fkCwqHrXKM+xznYgO51r0rPjm9j+fD8U9NYfteqSmYv
 wvbXllqfo0uWCGtj/IE1w194GBfO9HA7LB1LLTQY2eM3dCKt71xayXUQuHHtVgSZ6Jbe
 yDB4gEelkxOZ19H5KiYoeT4Rtm7tJmNUdo012CZgPpxfO/EM9J7gwyKK7KJ0XZp/4B02
 5aRs6igSjxDDwxu//KktTIogLOfXa2mPdt8EaNSX3zw0lCS/S4rIUR3xetdTdjCoL25h
 Tvpg==
X-Gm-Message-State: AA6/9RlRxZdvwq8QYqhk5exNRhzhHkLkiLJU3K7NnkPDIdn40RNYACclL3MHIydvh+52f9PCjz+F6A6QToGSIRHB
X-Received: by 10.13.212.147 with SMTP id w141mr7960848ywd.180.1475684166621; 
 Wed, 05 Oct 2016 09:16:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Wed, 5 Oct 2016 09:16:06 -0700 (PDT)
In-Reply-To: <1475173974-130879-1-git-send-email-maxims@google.com>
References: <1474998214-12720-1-git-send-email-maxims@google.com>
 <1475173974-130879-1-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 5 Oct 2016 09:16:06 -0700
Message-ID: <CAFR_W8p4nKxHxUDWtS3SxNcqp2sHyt+1eoznssKjTK6RCc=JVg@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fba1a8dddb1053e207e18
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
X-List-Received-Date: Wed, 05 Oct 2016 16:16:11 -0000

--001a114fba1a8dddb1053e207e18
Content-Type: text/plain; charset=UTF-8

Ping

On Thu, Sep 29, 2016 at 11:32 AM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> Device Tree for ast2500, copied from openbmc/linux (include file), plus
> minimal device tree configuration for ast2500 eval board.
> ---
>  arch/arm/dts/Makefile          |   2 +
>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
>  arch/arm/dts/aspeed-g5.dtsi    | 541 ++++++++++++++++++++++++++++++
> +++++++++++
>  3 files changed, 571 insertions(+)
>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index d1f8e22..09efa0a 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
>         k2e-evm.dtb \
>         k2g-evm.dtb
>
> +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
> +
>  targets += $(dtb-y)
>
>  # Add any required device tree compiler flags here
> diff --git a/arch/arm/dts/aspeed-g5-evb.dts b/arch/arm/dts/aspeed-g5-evb.
> dts
> new file mode 100644
> index 0000000..95dc77a
> --- /dev/null
> +++ b/arch/arm/dts/aspeed-g5-evb.dts
> @@ -0,0 +1,28 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       aliases {
> +               i2c1 = &i2c0;
> +               i2c4 = &i2c3;
> +               i2c8 = &i2c7;
> +       };
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
> new file mode 100644
> index 0000000..eb81a2e
> --- /dev/null
> +++ b/arch/arm/dts/aspeed-g5.dtsi
> @@ -0,0 +1,541 @@
> +/* The device tree is copied from
> + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/
> boot/dts/aspeed-g5.dtsi
> + */
> +#include "skeleton.dtsi"
> +
> +/ {
> +       model = "Aspeed BMC";
> +       compatible = "aspeed,ast2500";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&vic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       compatible = "arm,arm1176jzf-s";
> +                       device_type = "cpu";
> +                       reg = <0>;
> +               };
> +       };
> +
> +       ahb {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vic: interrupt-controller@1e6c0080 {
> +                       compatible = "aspeed,ast2400-vic";
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +                       valid-sources = <0xfefff7ff 0x0807ffff>;
> +                       reg = <0x1e6c0080 0x80>;
> +               };
> +
> +               mac0: ethernet@1e660000 {
> +                       compatible = "faraday,ftgmac100";
> +                       reg = <0x1e660000 0x180>;
> +                       interrupts = <2>;
> +                       no-hw-checksum;
> +                       status = "disabled";
> +               };
> +
> +               mac1: ethernet@1e680000 {
> +                       compatible = "faraday,ftgmac100";
> +                       reg = <0x1e680000 0x180>;
> +                       interrupts = <3>;
> +                       no-hw-checksum;
> +                       status = "disabled";
> +               };
> +
> +               apb {
> +                       compatible = "simple-bus";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       clk_clkin: clk_clkin@1e6e2070 {
> +                               #clock-cells = <0>;
> +                               compatible = "aspeed,g5-clkin-clock";
> +                               reg = <0x1e6e2070 0x04>;
> +                       };
> +
> +                       syscon: syscon@1e6e2000 {
> +                               compatible = "aspeed,g5-scu", "syscon",
> "simple-mfd";
> +                               reg = <0x1e6e2000 0x1a8>;
> +
> +                               pinctrl: pinctrl@1e6e2000 {
> +                                       compatible = "aspeed,g5-pinctrl";
> +
> +                                       pinctrl_i2c9_default: i2c9_default
> {
> +                                               function = "I2C9";
> +                                               groups = "I2C9";
> +                                       };
> +
> +                                       pinctrl_i2c10_default:
> i2c10_default {
> +                                               function = "I2C10";
> +                                               groups = "I2C10";
> +                                       };
> +
> +                                       pinctrl_i2c11_default:
> i2c11_default {
> +                                               function = "I2C11";
> +                                               groups = "I2C11";
> +                                       };
> +
> +                                       pinctrl_i2c12_default:
> i2c12_default {
> +                                               function = "I2C12";
> +                                               groups = "I2C12";
> +                                       };
> +
> +                                       pinctrl_i2c13_default:
> i2c13_default {
> +                                               function = "I2C13";
> +                                               groups = "I2C13";
> +                                       };
> +
> +                                       pinctrl_gpid0_default:
> gpid0_default {
> +                                               function = "GPID0";
> +                                               groups = "GPID0";
> +                                       };
> +
> +                                       pinctrl_gpid1_default:
> gpid1_default {
> +                                               function = "GPID1";
> +                                               groups = "GPID1";
> +                                       };
> +
> +                                       pinctrl_sd1_default: sd1_default {
> +                                               function = "SD1";
> +                                               groups = "SD1";
> +                                       };
> +
> +                                       pinctrl_i2c5_default: i2c5_default
> {
> +                                               function = "I2C5";
> +                                               groups = "I2C5";
> +                                       };
> +
> +                                       pinctrl_i2c6_default: i2c6_default
> {
> +                                               function = "I2C6";
> +                                               groups = "I2C6";
> +                                       };
> +
> +                                       pinctrl_i2c7_default: i2c7_default
> {
> +                                               function = "I2C7";
> +                                               groups = "I2C7";
> +                                       };
> +
> +                                       pinctrl_i2c8_default: i2c8_default
> {
> +                                               function = "I2C8";
> +                                               groups = "I2C8";
> +                                       };
> +
> +                                       pinctrl_pwm0_default: pwm0_default
> {
> +                                               function = "PWM0";
> +                                               groups = "PWM0";
> +                                       };
> +
> +                                       pinctrl_pwm1_default: pwm1_default
> {
> +                                               function = "PWM1";
> +                                               groups = "PWM1";
> +                                       };
> +
> +                                       pinctrl_pwm2_default: pwm2_default
> {
> +                                               function = "PWM2";
> +                                               groups = "PWM2";
> +                                       };
> +
> +                                       pinctrl_pwm3_default: pwm3_default
> {
> +                                               function = "PWM3";
> +                                               groups = "PWM3";
> +                                       };
> +
> +                                       pinctrl_pwm4_default: pwm4_default
> {
> +                                               function = "PWM4";
> +                                               groups = "PWM4";
> +                                       };
> +
> +                                       pinctrl_pwm5_default: pwm5_default
> {
> +                                               function = "PWM5";
> +                                               groups = "PWM5";
> +                                       };
> +
> +                                       pinctrl_pwm6_default: pwm6_default
> {
> +                                               function = "PWM6";
> +                                               groups = "PWM6";
> +                                       };
> +
> +                                       pinctrl_pwm7_default: pwm7_default
> {
> +                                               function = "PWM7";
> +                                               groups = "PWM7";
> +                                       };
> +
> +                                       pinctrl_i2c3_default: i2c3_default
> {
> +                                               function = "I2C3";
> +                                               groups = "I2C3";
> +                                       };
> +
> +                                       pinctrl_i2c4_default: i2c4_default
> {
> +                                               function = "I2C4";
> +                                               groups = "I2C4";
> +                                       };
> +
> +                                       pinctrl_i2c14_default:
> i2c14_default {
> +                                               function = "I2C14";
> +                                               groups = "I2C14";
> +                                       };
> +
> +                                       pinctrl_rgmii1_default:
> rgmii1_default {
> +                                               function = "RGMII1";
> +                                               groups = "RGMII1";
> +                                       };
> +
> +                                       pinctrl_rmii1_default:
> rmii1_default {
> +                                               function = "RMII1";
> +                                               groups = "RMII1";
> +                                       };
> +
> +                                       pinctrl_rgmii2_default:
> rgmii2_default {
> +                                               function = "RGMII2";
> +                                               groups = "RGMII2";
> +                                       };
> +
> +                                       pinctrl_rmii2_default:
> rmii2_default {
> +                                               function = "RMII2";
> +                                               groups = "RMII2";
> +                                       };
> +                               };
> +                       };
> +
> +                       clk_hpll: clk_hpll@1e6e2024 {
> +                               #clock-cells = <0>;
> +                               compatible = "aspeed,g5-hpll-clock";
> +                               reg = <0x1e6e2024 0x4>;
> +                               clocks = <&clk_clkin>;
> +                       };
> +
> +                       clk_ahb: clk_ahb@1e6e2070 {
> +                               #clock-cells = <0>;
> +                               compatible = "aspeed,g5-ahb-clock";
> +                               reg = <0x1e6e2070 0x4>;
> +                               clocks = <&clk_hpll>;
> +                       };
> +
> +                       clk_apb: clk_apb@1e6e2008 {
> +                               #clock-cells = <0>;
> +                               compatible = "aspeed,g5-apb-clock";
> +                               reg = <0x1e6e2008 0x4>;
> +                               clocks = <&clk_hpll>;
> +                       };
> +
> +                       clk_uart: clk_uart@1e6e2008 {
> +                               #clock-cells = <0>;
> +                               compatible = "aspeed,uart-clock";
> +                               reg = <0x1e6e202c 0x4>;
> +                       };
> +
> +                       sram@1e720000 {
> +                               compatible = "mmio-sram";
> +                               reg = <0x1e720000 0x9000>;      // 36K
> +                       };
> +
> +                       gpio: gpio@1e780000 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2500-gpio";
> +                               reg = <0x1e780000 0x1000>;
> +                               interrupts = <20>;
> +                               gpio-ranges = <&pinctrl 0 0 220>;
> +                       };
> +
> +                       timer: timer@1e782000 {
> +                               compatible = "aspeed,ast2400-timer";
> +                               reg = <0x1e782000 0x90>;
> +                               // The moxart_timer driver registers only
> one
> +                               // interrupt and assumes it's for timer 1
> +                               //interrupts = <16 17 18 35 36 37 38 39>;
> +                               interrupts = <16>;
> +                               clocks = <&clk_apb>;
> +                       };
> +
> +                       ibt: ibt@1e789140 {
> +                               compatible = "aspeed,bt-host";
> +                               reg = <0x1e789140 0x18>;
> +                               interrupts = <8>;
> +                       };
> +
> +                       wdt1: wdt@1e785000 {
> +                               compatible = "aspeed,ast2500-wdt";
> +                               reg = <0x1e785000 0x1c>;
> +                       };
> +
> +                       wdt2: wdt@1e785020 {
> +                               compatible = "aspeed,ast2500-wdt";
> +                               reg = <0x1e785020 0x1c>;
> +                               status = "disabled";
> +                       };
> +
> +                       wdt3: wdt@1e785040 {
> +                               compatible = "aspeed,wdt";
> +                               reg = <0x1e785074 0x1c>;
> +                               status = "disabled";
> +                       };
> +
> +                       uart1: serial@1e783000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e783000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <9>;
> +                               clocks = <&clk_uart>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       uart2: serial@1e78d000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e78d000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <32>;
> +                               clocks = <&clk_uart>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       uart3: serial@1e78e000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e78e000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <33>;
> +                               clocks = <&clk_uart>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       uart4: serial@1e78f000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e78f000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <34>;
> +                               clocks = <&clk_uart>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       uart5: serial@1e784000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e784000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <10>;
> +                               clocks = <&clk_uart>;
> +                               current-speed = <38400>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       vuart: vuart@1e787000 {
> +                               compatible = "aspeed,vuart";
> +                               reg = <0x1e787000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <8>;
> +                               clocks = <&clk_uart>;
> +                               no-loopback-test;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c: i2c@1e78a000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               #interrupt-cells = <1>;
> +
> +                               compatible = "aspeed,ast2400-i2c-
> controller";
> +                               reg = <0x1e78a000 0x40>;
> +                               ranges = <0 0x1e78a000 0x1000>;
> +                               interrupts = <12>;
> +                               clocks = <&clk_apb>;
> +                               clock-ranges;
> +                               interrupt-controller;
> +
> +                               i2c0: i2c-bus@40 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x40 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <0>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <0>;
> +                                       interrupt-parent = <&i2c>;
> +                               };
> +
> +                               i2c1: i2c-bus@80 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x80 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <1>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <1>;
> +                               };
> +
> +                               i2c2: i2c-bus@c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0xC0 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <2>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <2>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c3_default>;
> +                               };
> +
> +                               i2c3: i2c-bus@100 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x100 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <3>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <3>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c4_default>;
> +                               };
> +
> +                               i2c4: i2c-bus@140 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x140 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <4>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <4>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c5_default>;
> +                               };
> +
> +                               i2c5: i2c-bus@180 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x180 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <5>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <5>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c6_default>;
> +                               };
> +
> +                               i2c6: i2c-bus@1c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1C0 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <6>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <6>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c7_default>;
> +                               };
> +
> +                               i2c7: i2c-bus@300 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x300 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <7>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <7>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c8_default>;
> +                               };
> +
> +                               i2c8: i2c-bus@340 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x340 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <8>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <8>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c9_default>;
> +                               };
> +
> +                               i2c9: i2c-bus@380 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x380 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <9>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <9>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c10_default>;
> +                               };
> +
> +                               i2c10: i2c-bus@3c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3c0 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <10>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <10>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c11_default>;
> +                               };
> +
> +                               i2c11: i2c-bus@400 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x400 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <11>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <11>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c12_default>;
> +                               };
> +
> +                               i2c12: i2c-bus@440 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x440 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <12>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <12>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c13_default>;
> +                               };
> +
> +                               i2c13: i2c-bus@480 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x480 0x40>;
> +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> +                                       bus = <13>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <13>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 =
> <&pinctrl_i2c14_default>;
> +                               };
> +
> +                       };
> +
> +               };
> +       };
> +};
> --
> 2.8.0.rc3.226.g39d4020
>
>


-- 
*M*axim *S*loyko

--001a114fba1a8dddb1053e207e18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+UGluZzwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFRodSwgU2VwIDI5LCAyMDE2IGF0IDExOjMyIEFNLCAg
PHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86bWF4aW1zQGdvb2dsZS5jb20iIHRh
cmdldD0iX2JsYW5rIj5tYXhpbXNAZ29vZ2xlLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+RnJvbTogTWF4aW0g
U2xveWtvICZsdDs8YSBocmVmPSJtYWlsdG86bWF4aW1zQGdvb2dsZS5jb20iPm1heGltc0Bnb29n
bGUuY29tPC9hPiZndDs8YnI+DQo8YnI+DQpEZXZpY2UgVHJlZSBmb3IgYXN0MjUwMCwgY29waWVk
IGZyb20gb3BlbmJtYy9saW51eCAoaW5jbHVkZSBmaWxlKSwgcGx1czxicj4NCm1pbmltYWwgZGV2
aWNlIHRyZWUgY29uZmlndXJhdGlvbiBmb3IgYXN0MjUwMCBldmFsIGJvYXJkLjxicj4NCi0tLTxi
cj4NCsKgYXJjaC9hcm0vZHRzL01ha2VmaWxlwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArPGJyPg0K
wqBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi5kdHMgfMKgIDI4ICsrKzxicj4NCsKgYXJjaC9h
cm0vZHRzL2FzcGVlZC1nNS5kdHNpwqAgwqAgfCA1NDEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrPHdicj4rKysrKysrKysrKzxicj4NCsKgMyBmaWxlcyBjaGFuZ2VkLCA1NzEgaW5zZXJ0
aW9ucygrKTxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9hc3BlZWQtZzUt
ZXZiLmR0czxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9hc3BlZWQtZzUu
ZHRzaTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvTWFrZWZpbGUgYi9hcmNo
L2FybS9kdHMvTWFrZWZpbGU8YnI+DQppbmRleCBkMWY4ZTIyLi4wOWVmYTBhIDEwMDY0NDxicj4N
Ci0tLSBhL2FyY2gvYXJtL2R0cy9NYWtlZmlsZTxicj4NCisrKyBiL2FyY2gvYXJtL2R0cy9NYWtl
ZmlsZTxicj4NCkBAIC0yMzMsNiArMjMzLDggQEAgZHRiLSQoQ09ORklHX1NPQ19LRVlTVE9ORSkg
Kz0gazJoay1ldm0uZHRiIFw8YnI+DQrCoCDCoCDCoCDCoCBrMmUtZXZtLmR0YiBcPGJyPg0KwqAg
wqAgwqAgwqAgazJnLWV2bS5kdGI8YnI+DQo8YnI+DQorZHRiLSQoQ09ORklHX1RBUkdFVF9BU1Rf
RzUpICs9IGFzcGVlZC1nNS1ldmIuZHRiPGJyPg0KKzxicj4NCsKgdGFyZ2V0cyArPSAkKGR0Yi15
KTxicj4NCjxicj4NCsKgIyBBZGQgYW55IHJlcXVpcmVkIGRldmljZSB0cmVlIGNvbXBpbGVyIGZs
YWdzIGhlcmU8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuPHdi
cj5kdHMgYi9hcmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi48d2JyPmR0czxicj4NCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAwMDAwMC4uOTVkYzc3YTxicj4NCi0tLSAvZGV2L251
bGw8YnI+DQorKysgYi9hcmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi48d2JyPmR0czxicj4NCkBA
IC0wLDAgKzEsMjggQEA8YnI+DQorL2R0cy12MS87PGJyPg0KKzxicj4NCisjaW5jbHVkZSAmcXVv
dDthc3BlZWQtZzUuZHRzaSZxdW90Ozxicj4NCis8YnI+DQorLyB7PGJyPg0KK8KgIMKgIMKgIMKg
bWVtb3J5IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZpY2VfdHlwZSA9ICZxdW90
O21lbW9yeSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg4
MDAwMDAwMCAweDIwMDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBhbGlhc2VzIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxID0g
JmFtcDtpMmMwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzQgPSAmYW1wO2kyYzM7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjOCA9ICZhbXA7aTJjNzs8YnI+DQorwqAg
wqAgwqAgwqB9Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFtcDtpMmMwIHs8YnI+DQorwqAgwqAg
wqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCit9Ozxicj4NCis8YnI+DQorJmFt
cDtpMmMzIHs8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4N
Cit9Ozxicj4NCis8YnI+DQorJmFtcDtpMmM3IHs8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtva2F5JnF1b3Q7Ozxicj4NCit9Ozxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMv
YXNwZWVkLWc1LmR0c2kgYi9hcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0c2k8YnI+DQpuZXcgZmls
ZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAuLmViODFhMmU8YnI+DQotLS0gL2Rldi9u
dWxsPGJyPg0KKysrIGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KQEAgLTAsMCAr
MSw1NDEgQEA8YnI+DQorLyogVGhlIGRldmljZSB0cmVlIGlzIGNvcGllZCBmcm9tPGJyPg0KKyAq
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvOWVjOWQwOS9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvPHdicj5saW51eC9ibG9iLzllYzlk
MDkvYXJjaC9hcm0vPHdicj5ib290L2R0cy9hc3BlZWQtZzUuZHRzaTwvYT48YnI+DQorICovPGJy
Pg0KKyNpbmNsdWRlICZxdW90O3NrZWxldG9uLmR0c2kmcXVvdDs8YnI+DQorPGJyPg0KKy8gezxi
cj4NCivCoCDCoCDCoCDCoG1vZGVsID0gJnF1b3Q7QXNwZWVkIEJNQyZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgI3Np
emUtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9
ICZsdDsmYW1wO3ZpYyZndDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNwdXMgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVAMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxhcm0xMTc2anpmLXMmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNlX3R5cGUg
PSAmcXVvdDtjcHUmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
K8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYWhiIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c2ltcGxlLWJ1cyZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHZpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMWU2YzAwODAgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQs
YXN0MjQwMC12aWMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2YWxpZC1zb3VyY2VzID0gJmx0OzB4ZmVmZmY3ZmYgMHgw
ODA3ZmZmZiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4MWU2YzAwODAgMHg4MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFjMDogZXRoZXJuZXRAMWU2
NjAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtmYXJhZGF5LGZ0Z21hYzEwMCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTY2MDAwMCAweDE4MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1ody1jaGVja3N1
bTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtYWMxOiBldGhlcm5ldEAxZTY4MDAwMCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2ZhcmFkYXksZnRnbWFjMTAwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNjgwMDAwIDB4MTgwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWh3LWNoZWNrc3VtOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVk
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGFwYiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3NpbXBsZS1idXMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAm
bHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2Vz
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbGtfY2xr
aW46IGNsa19jbGtpbkAxZTZlMjA3MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsZzUtY2xraW4tY2xvY2smcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwNzAgMHgwNCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3lzY29uOiBzeXNjb25AMWU2
ZTIwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtc2N1JnF1b3Q7LCAmcXVvdDtzeXNjb24m
cXVvdDssICZxdW90O3NpbXBsZS1tZmQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwMDAgMHgxYTgmZ3Q7
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwaW5jdHJsOiBwaW5jdHJsQDFlNmUyMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7YXNwZWVkLGc1LXBpbmN0cmwmcXVvdDs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjOV9k
ZWZhdWx0OiBpMmM5X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1
b3Q7STJDOSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM5JnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjMTBfZGVmYXVsdDogaTJj
MTBfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxMCZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMxMCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzExX2RlZmF1bHQ6IGkyYzExX2RlZmF1
bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTEmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDMTEmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmMxMl9kZWZhdWx0OiBpMmMxMl9kZWZhdWx0IHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzEyJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzEyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfaTJjMTNfZGVmYXVsdDogaTJjMTNfZGVmYXVsdCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxMyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncm91cHMgPSAmcXVvdDtJMkMxMyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5jdHJsX2dwaWQwX2RlZmF1bHQ6IGdwaWQwX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGZ1bmN0aW9uID0gJnF1b3Q7R1BJRDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBz
ID0gJnF1b3Q7R1BJRDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9n
cGlkMV9kZWZhdWx0OiBncGlkMV9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlv
biA9ICZxdW90O0dQSUQxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90
O0dQSUQxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfc2QxX2RlZmF1
bHQ6IHNkMV9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1NE
MSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtTRDEmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmM1X2RlZmF1bHQ6IGkyYzVfZGVmYXVs
dCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM1JnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzUmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybF9pMmM2X2RlZmF1bHQ6IGkyYzZfZGVmYXVsdCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM2JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdyb3VwcyA9ICZxdW90O0kyQzYmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybF9pMmM3X2RlZmF1bHQ6IGkyYzdfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZnVuY3Rpb24gPSAmcXVvdDtJMkM3JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9
ICZxdW90O0kyQzcmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmM4
X2RlZmF1bHQ6IGkyYzhfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAm
cXVvdDtJMkM4JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzgm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd20wX2RlZmF1bHQ6IHB3
bTBfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV00wJnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTAmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd20xX2RlZmF1bHQ6IHB3bTFfZGVmYXVsdCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV00xJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybF9wd20yX2RlZmF1bHQ6IHB3bTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV00yJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdyb3VwcyA9ICZxdW90O1BXTTImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlu
Y3RybF9wd20zX2RlZmF1bHQ6IHB3bTNfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVu
Y3Rpb24gPSAmcXVvdDtQV00zJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZx
dW90O1BXTTMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd200X2Rl
ZmF1bHQ6IHB3bTRfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVv
dDtQV000JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTQmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd201X2RlZmF1bHQ6IHB3bTVf
ZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV001JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTUmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd202X2RlZmF1bHQ6IHB3bTZfZGVmYXVsdCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV002JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTYmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybF9wd203X2RlZmF1bHQ6IHB3bTdfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV003JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdy
b3VwcyA9ICZxdW90O1BXTTcmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bF9pMmMzX2RlZmF1bHQ6IGkyYzNfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rp
b24gPSAmcXVvdDtJMkMzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90
O0kyQzMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmM0X2RlZmF1
bHQ6IGkyYzRfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJ
MkM0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmMxNF9kZWZhdWx0OiBpMmMxNF9k
ZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzE0JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzE0JnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcmdtaWkxX2RlZmF1bHQ6IHJnbWlpMV9kZWZhdWx0
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1JHTUlJMSZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtSR01JSTEmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybF9ybWlpMV9kZWZhdWx0OiBybWlpMV9kZWZhdWx0IHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1JNSUkxJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1JNSUkxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfcmdtaWkyX2RlZmF1bHQ6IHJnbWlpMl9kZWZhdWx0IHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1JHTUlJMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncm91cHMgPSAmcXVvdDtSR01JSTImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcGluY3RybF9ybWlpMl9kZWZhdWx0OiBybWlpMl9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmdW5jdGlvbiA9ICZxdW90O1JNSUkyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdy
b3VwcyA9ICZxdW90O1JNSUkyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbGtfaHBsbDogY2xrX2hwbGxAMWU2ZTIwMjQgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZs
dDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGc1LWhwbGwtY2xvY2smcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MWU2ZTIwMjQgMHg0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfY2xraW4mZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa19haGI6IGNsa19haGJAMWU2ZTIwNzAgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9j
ay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGc1LWFoYi1jbG9jayZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgxZTZlMjA3MCAweDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19ocGxsJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbGtfYXBiOiBjbGtfYXBiQDFl
NmUyMDA4IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1h
cGItY2xvY2smcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwMDggMHg0Jmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtj
bGtfaHBsbCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX3VhcnQ6
IGNsa191YXJ0QDFlNmUyMDA4IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCx1YXJ0LWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDJjIDB4NCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3JhbUAxZTcyMDAwMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O21taW8tc3JhbSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTcyMDAwMCAweDkwMDAmZ3Q7O8KgIMKgIMKg
IC8vIDM2Szxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW86IGdwaW9AMWU3
ODAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
YXNwZWVkLGFzdDI1MDAtZ3BpbyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4MDAwMCAweDEwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MjAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cGluY3RybCAwIDAgMjIwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lcjogdGltZXJAMWU3ODIw
MDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQwMC10aW1lciZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgx
ZTc4MjAwMCAweDkwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAvLyBUaGUgbW94YXJ0X3RpbWVyIGRyaXZlciByZWdpc3RlcnMgb25seSBv
bmU8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
LyBpbnRlcnJ1cHQgYW5kIGFzc3VtZXMgaXQmIzM5O3MgZm9yIHRpbWVyIDE8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvL2ludGVycnVwdHMgPSAm
bHQ7MTYgMTcgMTggMzUgMzYgMzcgMzggMzkmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTYmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9
ICZsdDsmYW1wO2Nsa19hcGImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlidDogaWJ0QDFlNzg5MTQwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGJ0LWhvc3QmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4MWU3ODkxNDAgMHgxOCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs4Jmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3ZHQxOiB3ZHRAMWU3ODUwMDAgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsYXN0MjUwMC13ZHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODUwMDAgMHgxYyZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2R0Mjogd2R0QDFlNzg1MDIwIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtd2R0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg1MDIw
IDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHdkdDM6IHdkdEAxZTc4NTA0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVl
ZCx3ZHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODUwNzQgMHgxYyZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJs
ZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDE6IHNlcmlh
bEAxZTc4MzAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzgz
MDAwIDB4MTAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OSZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tz
ID0gJmx0OyZhbXA7Y2xrX3VhcnQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJs
ZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDI6IHNlcmlh
bEAxZTc4ZDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhk
MDAwIDB4MTAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MzImZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
cyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2Fi
bGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQzOiBzZXJp
YWxAMWU3OGUwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4
ZTAwMCAweDEwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMzJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
a3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNh
YmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0NDogc2Vy
aWFsQDFlNzhmMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3
OGYwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszNCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2tzID0gJmx0OyZhbXA7Y2xrX3VhcnQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlz
YWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDU6IHNl
cmlhbEAxZTc4NDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
Nzg0MDAwIDB4MTAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTAmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNs
b2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjdXJyZW50LXNwZWVkID0gJmx0OzM4NDAwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1s
b29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHZ1YXJ0OiB2dWFydEAxZTc4NzAwMCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCx2dWFydCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NzAwMCAweDEwMDAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9
ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBu
by1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzogaTJjQDFlNzhhMDAwIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZs
dDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzEmZ3Q7Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLTx3YnI+Y29udHJvbGxlciZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgxZTc4YTAwMCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByYW5nZXMgPSAmbHQ7MCAweDFlNzhhMDAwIDB4
MTAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX2FwYiZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2stcmFuZ2VzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMwOiBpMmMtYnVzQDQwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtcGFyZW50ID0gJmx0OyZhbXA7aTJjJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMx
OiBpMmMtYnVzQDgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg4MCAweDQwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBidXMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0
OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0cyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMyOiBpMmMtYnVzQGMwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
YWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHhDMCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MiZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzNfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMzogaTJj
LWJ1c0AxMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNz
aXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDEwMCAweDQwJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBidXMgPSAmbHQ7MyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEw
MDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDszJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVm
YXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzRfZGVm
YXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaTJjNDogaTJjLWJ1c0AxNDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0g
Jmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDE0MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFz
dDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7NCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlz
YWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs0Jmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7
JmFtcDtwaW5jdHJsX2kyYzVfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNTogaTJjLWJ1c0AxODAgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0
OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDE4MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAm
bHQ7NSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZs
dDs1Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzZfZGVmYXVsdCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJj
NjogaTJjLWJ1c0AxYzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFDMCAweDQw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7NiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0g
Jmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0cyA9ICZsdDs2Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1
b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2ky
YzdfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaTJjNzogaTJjLWJ1c0AzMDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNl
bGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDMwMCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNw
ZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7NyZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1
b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs3Jmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAg
PSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzhfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjODogaTJjLWJ1c0AzNDAg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxz
ID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDM0MCAweDQwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
dXMgPSAmbHQ7OCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0
cyA9ICZsdDs4Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzlfZGVmYXVsdCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaTJjOTogaTJjLWJ1c0AzODAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDM4
MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJj
LWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7OSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVl
bmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs5Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVz
ID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5j
dHJsX2kyYzEwX2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEwOiBpMmMtYnVzQDNjMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Fk
ZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVnID0gJmx0OzB4M2MwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxMCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmMxMV9kZWZhdWx0Jmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxMTog
aTJjLWJ1c0A0MDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwMCAweDQwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBidXMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZs
dDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVv
dDtkZWZhdWx0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaTJj
MTJfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaTJjMTI6IGkyYy1idXNANDQwIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1j
ZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHg0NDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2Fz
cGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzEyJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEyJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEzX2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEzOiBpMmMtYnVz
QDQ4MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUt
Y2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDgwIDB4NDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVzJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJ1cyA9ICZsdDsxMyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAw
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDsxMyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1
bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmMxNF9kZWZh
dWx0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDC
oH07PGJyPg0KK307PGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4ODg4
ODgiPi0tPGJyPg0KMi44LjAucmMzLjIyNi5nMzlkNDAyMDxicj4NCjxicj4NCjwvZm9udD48L3Nw
YW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+
LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWls
X3NpZ25hdHVyZSI+PGRpdj48Yj5NPC9iPmF4aW0gPGI+UzwvYj5sb3lrbzwvZGl2PjwvZGl2Pg0K
PC9kaXY+DQo=
--001a114fba1a8dddb1053e207e18--
