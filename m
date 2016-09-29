Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxnz20ZJzDrX8
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=riQQ9aZw; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id i25so2024834uab.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 18:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vOYotmuuhPn6Du5H80q8tME62Zk1nS/49ZHp4aQfFXE=;
 b=riQQ9aZwBnNiNXNBSnWEzVDS5e0ogUlPDVEw4QINcXcsY+Zz8ZnnqI2eVjQ5z5pU+b
 AK92HkUJzobmwsDIxT6CVjfGnXCO0mlo8sIlin6AxrAvx2q4wom+M/qmlRz8hMSYqyB1
 ++3IWF3yha1ykj5YuqewT3UcxeCbty93C492I0jqcGsYt/b0cR8rSOkgEY7AwnNpdIh0
 FeXHgY+hHIDP0EPLfwWaC6jLGrRdsgJogidB0WgGELg+wLu5uTvRR48PZYfvtJbGW+bx
 CRKfhMj2+oRJlpqfIRTCH6bfNB6VQ6+MczwSy1CB66XNfsFwvFqjDTJmznpK3G05QKW9
 n7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vOYotmuuhPn6Du5H80q8tME62Zk1nS/49ZHp4aQfFXE=;
 b=iGqTO+Z7BoHgOHhx5zuSAG043b/MplfdhxWCeWomIKwXngOdA8IC7K93Va9fXvAu8x
 hj0eSWDEd6gWyLASLb+uA2Ug5kAQx0451hIoCMcYg8vvPI3I4mVKj1O4xbIvz3CNEkNz
 ncAkInDjar5mugWVW9v/UI2XZajae0aVZQ4KLLrsJAYuE0f1XCZjNmOnfAstofKfHKms
 88IQ42xauuUhiXjFaxrsHPA6wCSLnv1/QZTlhZVCv7TN3gCtZ6zDfQI5/V38+a8GINUL
 sDNHKGT8ECllymKmUysING9NHU+fX3bHlWRQT/RB77VW5q4LpMdFgH+lO4irMj8SjRJA
 AKqA==
X-Gm-Message-State: AA6/9RmwtmJEzBDeKe4BRVjZnTKsYTcGDonYavLNAReiXspIBHgNYAYEM8eZXYnqquJ20Qru9vTFhBU+dNIRig==
X-Received: by 10.176.86.136 with SMTP id a8mr8751520uab.118.1475112597249;
 Wed, 28 Sep 2016 18:29:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 18:29:36 -0700 (PDT)
In-Reply-To: <1474998214-12720-1-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:59:36 +0930
X-Google-Sender-Auth: TJz6UDg_ofWPy-PKk536f0bZD8E
Message-ID: <CACPK8Xe9qsbigeq-jpUs7LrqV5cMJtMuuXsk3z9kAy84K3=ffg@mail.gmail.com>
Subject: Re: [PATCH 1/3] aspeed/g5: Device Tree for ast2500, copied from
 openbmc/linux (include file), plus minimal device tree configuration for
 ast2500 eval board.
To: Maxim Sloyko <maxims@google.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 01:30:00 -0000

On Wed, Sep 28, 2016 at 3:13 AM,  <maxims@google.com> wrote:
> From: Maxim Sloyko <maxims@google.com>
>
> Fixed the bug in board initialization, which caused
> failures during boot with device tree.
> The flags are used to modify malloc behaviour after relocation,
> resetting the flag caused it to fail.

This unrelated to the device tree additions and therefore should be in
a separate patch.

The device tree additions look okay.

> ---
>  arch/arm/dts/Makefile          |   2 +
>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
>  arch/arm/dts/aspeed-g5.dtsi    | 541 +++++++++++++++++++++++++++++++++++++++++
>  board/aspeed/ast-g5/ast-g5.c   |   1 -
>  4 files changed, 571 insertions(+), 1 deletion(-)
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
> diff --git a/arch/arm/dts/aspeed-g5-evb.dts b/arch/arm/dts/aspeed-g5-evb.dts
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
> + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/boot/dts/aspeed-g5.dtsi
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
> +                               compatible = "aspeed,g5-scu", "syscon", "simple-mfd";
> +                               reg = <0x1e6e2000 0x1a8>;
> +
> +                               pinctrl: pinctrl@1e6e2000 {
> +                                       compatible = "aspeed,g5-pinctrl";
> +
> +                                       pinctrl_i2c9_default: i2c9_default {
> +                                               function = "I2C9";
> +                                               groups = "I2C9";
> +                                       };
> +
> +                                       pinctrl_i2c10_default: i2c10_default {
> +                                               function = "I2C10";
> +                                               groups = "I2C10";
> +                                       };
> +
> +                                       pinctrl_i2c11_default: i2c11_default {
> +                                               function = "I2C11";
> +                                               groups = "I2C11";
> +                                       };
> +
> +                                       pinctrl_i2c12_default: i2c12_default {
> +                                               function = "I2C12";
> +                                               groups = "I2C12";
> +                                       };
> +
> +                                       pinctrl_i2c13_default: i2c13_default {
> +                                               function = "I2C13";
> +                                               groups = "I2C13";
> +                                       };
> +
> +                                       pinctrl_gpid0_default: gpid0_default {
> +                                               function = "GPID0";
> +                                               groups = "GPID0";
> +                                       };
> +
> +                                       pinctrl_gpid1_default: gpid1_default {
> +                                               function = "GPID1";
> +                                               groups = "GPID1";
> +                                       };
> +
> +                                       pinctrl_sd1_default: sd1_default {
> +                                               function = "SD1";
> +                                               groups = "SD1";
> +                                       };
> +
> +                                       pinctrl_i2c5_default: i2c5_default {
> +                                               function = "I2C5";
> +                                               groups = "I2C5";
> +                                       };
> +
> +                                       pinctrl_i2c6_default: i2c6_default {
> +                                               function = "I2C6";
> +                                               groups = "I2C6";
> +                                       };
> +
> +                                       pinctrl_i2c7_default: i2c7_default {
> +                                               function = "I2C7";
> +                                               groups = "I2C7";
> +                                       };
> +
> +                                       pinctrl_i2c8_default: i2c8_default {
> +                                               function = "I2C8";
> +                                               groups = "I2C8";
> +                                       };
> +
> +                                       pinctrl_pwm0_default: pwm0_default {
> +                                               function = "PWM0";
> +                                               groups = "PWM0";
> +                                       };
> +
> +                                       pinctrl_pwm1_default: pwm1_default {
> +                                               function = "PWM1";
> +                                               groups = "PWM1";
> +                                       };
> +
> +                                       pinctrl_pwm2_default: pwm2_default {
> +                                               function = "PWM2";
> +                                               groups = "PWM2";
> +                                       };
> +
> +                                       pinctrl_pwm3_default: pwm3_default {
> +                                               function = "PWM3";
> +                                               groups = "PWM3";
> +                                       };
> +
> +                                       pinctrl_pwm4_default: pwm4_default {
> +                                               function = "PWM4";
> +                                               groups = "PWM4";
> +                                       };
> +
> +                                       pinctrl_pwm5_default: pwm5_default {
> +                                               function = "PWM5";
> +                                               groups = "PWM5";
> +                                       };
> +
> +                                       pinctrl_pwm6_default: pwm6_default {
> +                                               function = "PWM6";
> +                                               groups = "PWM6";
> +                                       };
> +
> +                                       pinctrl_pwm7_default: pwm7_default {
> +                                               function = "PWM7";
> +                                               groups = "PWM7";
> +                                       };
> +
> +                                       pinctrl_i2c3_default: i2c3_default {
> +                                               function = "I2C3";
> +                                               groups = "I2C3";
> +                                       };
> +
> +                                       pinctrl_i2c4_default: i2c4_default {
> +                                               function = "I2C4";
> +                                               groups = "I2C4";
> +                                       };
> +
> +                                       pinctrl_i2c14_default: i2c14_default {
> +                                               function = "I2C14";
> +                                               groups = "I2C14";
> +                                       };
> +
> +                                       pinctrl_rgmii1_default: rgmii1_default {
> +                                               function = "RGMII1";
> +                                               groups = "RGMII1";
> +                                       };
> +
> +                                       pinctrl_rmii1_default: rmii1_default {
> +                                               function = "RMII1";
> +                                               groups = "RMII1";
> +                                       };
> +
> +                                       pinctrl_rgmii2_default: rgmii2_default {
> +                                               function = "RGMII2";
> +                                               groups = "RGMII2";
> +                                       };
> +
> +                                       pinctrl_rmii2_default: rmii2_default {
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
> +                               // The moxart_timer driver registers only one
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
> +                               compatible = "aspeed,ast2400-i2c-controller";
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
> +                                       compatible = "aspeed,ast2400-i2c-bus";
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
> +                                       compatible = "aspeed,ast2400-i2c-bus";
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
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <2>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <2>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c3_default>;
> +                               };
> +
> +                               i2c3: i2c-bus@100 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x100 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <3>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <3>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c4_default>;
> +                               };
> +
> +                               i2c4: i2c-bus@140 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x140 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <4>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <4>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c5_default>;
> +                               };
> +
> +                               i2c5: i2c-bus@180 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x180 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <5>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <5>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c6_default>;
> +                               };
> +
> +                               i2c6: i2c-bus@1c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1C0 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <6>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <6>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c7_default>;
> +                               };
> +
> +                               i2c7: i2c-bus@300 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x300 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <7>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <7>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c8_default>;
> +                               };
> +
> +                               i2c8: i2c-bus@340 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x340 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <8>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <8>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c9_default>;
> +                               };
> +
> +                               i2c9: i2c-bus@380 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x380 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <9>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <9>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c10_default>;
> +                               };
> +
> +                               i2c10: i2c-bus@3c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3c0 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <10>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <10>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c11_default>;
> +                               };
> +
> +                               i2c11: i2c-bus@400 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x400 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <11>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <11>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c12_default>;
> +                               };
> +
> +                               i2c12: i2c-bus@440 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x440 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <12>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <12>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c13_default>;
> +                               };
> +
> +                               i2c13: i2c-bus@480 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x480 0x40>;
> +                                       compatible = "aspeed,ast2400-i2c-bus";
> +                                       bus = <13>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <13>;
> +                                       pinctrl-names = "default";
> +                                       pinctrl-0 = <&pinctrl_i2c14_default>;
> +                               };
> +
> +                       };
> +
> +               };
> +       };
> +};
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index 81ea88a..6fa1e12 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -52,7 +52,6 @@ int board_init(void)
>  {
>         /* adress of boot parameters */
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> -       gd->flags = 0;
>         return 0;
>  }
>
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
