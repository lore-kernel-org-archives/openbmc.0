Return-Path: <maxims@google.com>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3strVX22L9zDsrT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bkpC07vX; 
 dkim-atps=neutral
Received: by mail-yw0-x22c.google.com with SMTP id u124so22265618ywg.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qB45Hx/CwL+/9WbxFhkZus1x33tNRmz5m5ltPm6UmTI=;
 b=bkpC07vXhaqtrpZ48zZ/3MA9le4ODgEE5vCcen/zklLl3VW0AOMI7lNxJTJNKQvwGf
 douetlNmnQZeBU9CyYojnwio5/Uz5BCYPBwxcDq7Z2sFZu1gPjpajuy6WZczhwOaum7T
 VnTr3wEeGFJQWbbWzSfcI8PoEeomIC1oDq+QhARA8rNem/2vgvYv3YdNcvnni4OZ5uev
 vVYdEG/pAKRObvNe73wUKEmVTIuR860RLXLOEZbN0PPqM89c0Igkiet4PN6FrQRoxy2f
 pAYV58Pr/CA8a9SJCk/8QN1BoRDY+jiOs58U5vkaZlIIfyeli0EKyfNut8CtDjRMv8nX
 NHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qB45Hx/CwL+/9WbxFhkZus1x33tNRmz5m5ltPm6UmTI=;
 b=Q/L5MMWhQ/F8IaGjNs9wVTciVLTVTkKPkZ/qTWmHo8JZI1me5BETo1V1JFXHtd3lIp
 b7xOsIduPmplVKb/3zTSvNoIz5i8xhS2F94jyTzMjysBjrzusTBkgax2dSPMyu03NjoE
 /D9VmScgjZ46pHlCpu8ixBBldZi/M0dackm40Za9Ry/FgcJ/XnkUJuvevH0hd+Di/45W
 Y6uz9k7zVhbzu0x81eJTbjLnt/M21DlAR2Zjx+kX7lFInalQeab4WaU4kx3cJ3na4ky0
 NXqQ2t+fT34NzgH0E6iaJv3oOY3TOYZ/a3TapCoz/buFEvyZXanmG7ecf593W/xdAT3o
 HT+w==
X-Gm-Message-State: AA6/9RkTeaZvcPiDt9rXi5uvAgGznMbn4Z1rDII5ZZXzNEKn3QWj3Edt+0ib0PVxe5j/sjnf2LluWNaAiWArlusw
X-Received: by 10.13.200.1 with SMTP id k1mr5598614ywd.24.1476223136492; Tue,
 11 Oct 2016 14:58:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.210.2 with HTTP; Tue, 11 Oct 2016 14:58:55 -0700 (PDT)
In-Reply-To: <1476117535-48144-1-git-send-email-maxims@google.com>
References: <1476117535-48144-1-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Tue, 11 Oct 2016 14:58:55 -0700
Message-ID: <CAFR_W8qtVOf3kCV-0=5pVLx9B3Eb77-Ub_Z7Ytkt91R33yaGwA@mail.gmail.com>
Subject: Re: [PATCH u-boot] aspeed/g5: Device Tree for ast2500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114e60fea98c2b053e9dfbf4
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
X-List-Received-Date: Tue, 11 Oct 2016 21:59:01 -0000

--001a114e60fea98c2b053e9dfbf4
Content-Type: text/plain; charset=UTF-8

Ping

On Mon, Oct 10, 2016 at 9:38 AM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> Device Tree for ast2500, copied from openbmc/linux (include file), plus
> minimal device tree configuration for ast2500 eval board.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
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

--001a114e60fea98c2b053e9dfbf4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+UGluZzwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIE1vbiwgT2N0IDEwLCAyMDE2IGF0IDk6MzggQU0sICA8
c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xlLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPm1heGltc0Bnb29nbGUuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5Gcm9tOiBNYXhpbSBT
bG95a28gJmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xlLmNvbSI+bWF4aW1zQGdvb2ds
ZS5jb208L2E+Jmd0Ozxicj4NCjxicj4NCkRldmljZSBUcmVlIGZvciBhc3QyNTAwLCBjb3BpZWQg
ZnJvbSBvcGVuYm1jL2xpbnV4IChpbmNsdWRlIGZpbGUpLCBwbHVzPGJyPg0KbWluaW1hbCBkZXZp
Y2UgdHJlZSBjb25maWd1cmF0aW9uIGZvciBhc3QyNTAwIGV2YWwgYm9hcmQuPGJyPg0KPGJyPg0K
U2lnbmVkLW9mZi1ieTogTWF4aW0gU2xveWtvICZsdDs8YSBocmVmPSJtYWlsdG86bWF4aW1zQGdv
b2dsZS5jb20iPm1heGltc0Bnb29nbGUuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGFyY2gv
YXJtL2R0cy9NYWtlZmlsZcKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKzxicj4NCsKgYXJjaC9hcm0v
ZHRzL2FzcGVlZC1nNS1ldmIuZHRzIHzCoCAyOCArKys8YnI+DQrCoGFyY2gvYXJtL2R0cy9hc3Bl
ZWQtZzUuZHRzacKgIMKgIHwgNTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKzx3YnI+
KysrKysrKysrKys8YnI+DQrCoDMgZmlsZXMgY2hhbmdlZCwgNTcxIGluc2VydGlvbnMoKyk8YnI+
DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi5kdHM8YnI+
DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0c2k8YnI+DQo8
YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vZHRzL01h
a2VmaWxlPGJyPg0KaW5kZXggZDFmOGUyMi4uMDllZmEwYSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNo
L2FybS9kdHMvTWFrZWZpbGU8YnI+DQorKysgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGU8YnI+DQpA
QCAtMjMzLDYgKzIzMyw4IEBAIGR0Yi0kKENPTkZJR19TT0NfS0VZU1RPTkUpICs9IGsyaGstZXZt
LmR0YiBcPGJyPg0KwqAgwqAgwqAgwqAgazJlLWV2bS5kdGIgXDxicj4NCsKgIMKgIMKgIMKgIGsy
Zy1ldm0uZHRiPGJyPg0KPGJyPg0KK2R0Yi0kKENPTkZJR19UQVJHRVRfQVNUX0c1KSArPSBhc3Bl
ZWQtZzUtZXZiLmR0Yjxicj4NCis8YnI+DQrCoHRhcmdldHMgKz0gJChkdGIteSk8YnI+DQo8YnI+
DQrCoCMgQWRkIGFueSByZXF1aXJlZCBkZXZpY2UgdHJlZSBjb21waWxlciBmbGFncyBoZXJlPGJy
Pg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUtZXZiLjx3YnI+ZHRzIGIvYXJj
aC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuPHdicj5kdHM8YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0
NDxicj4NCmluZGV4IDAwMDAwMDAuLjk1ZGM3N2E8YnI+DQotLS0gL2Rldi9udWxsPGJyPg0KKysr
IGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuPHdicj5kdHM8YnI+DQpAQCAtMCwwICsxLDI4
IEBAPGJyPg0KKy9kdHMtdjEvOzxicj4NCis8YnI+DQorI2luY2x1ZGUgJnF1b3Q7YXNwZWVkLWc1
LmR0c2kmcXVvdDs8YnI+DQorPGJyPg0KKy8gezxicj4NCivCoCDCoCDCoCDCoG1lbW9yeSB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2aWNlX3R5cGUgPSAmcXVvdDttZW1vcnkmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAwMDAwMDAgMHgy
MDAwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
YWxpYXNlcyB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMSA9ICZhbXA7aTJjMDs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM0ID0gJmFtcDtpMmMzOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGkyYzggPSAmYW1wO2kyYzc7PGJyPg0KK8KgIMKgIMKgIMKgfTs8
YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7aTJjMCB7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyZhbXA7aTJjMyB7PGJy
Pg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQorfTs8YnI+DQor
PGJyPg0KKyZhbXA7aTJjNyB7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZx
dW90Ozs8YnI+DQorfTs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5k
dHNpIGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2
NDQ8YnI+DQppbmRleCAwMDAwMDAwLi5lYjgxYTJlPGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisr
KyBiL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUuZHRzaTxicj4NCkBAIC0wLDAgKzEsNTQxIEBAPGJy
Pg0KKy8qIFRoZSBkZXZpY2UgdHJlZSBpcyBjb3BpZWQgZnJvbTxicj4NCisgKiA8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iLzllYzlkMDkvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc1LmR0c2kiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jLzx3YnI+bGludXgvYmxvYi85ZWM5ZDA5L2FyY2gvYXJt
Lzx3YnI+Ym9vdC9kdHMvYXNwZWVkLWc1LmR0c2k8L2E+PGJyPg0KKyAqLzxicj4NCisjaW5jbHVk
ZSAmcXVvdDtza2VsZXRvbi5kdHNpJnF1b3Q7PGJyPg0KKzxicj4NCisvIHs8YnI+DQorwqAgwqAg
wqAgwqBtb2RlbCA9ICZxdW90O0FzcGVlZCBCTUMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCNh
ZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0g
Jmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoGludGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFtcDt2
aWMmZ3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjcHVzIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY3B1QDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0sYXJtMTE3Nmp6Zi1zJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7Y3B1
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFoYiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3NpbXBsZS1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmFuZ2VzOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2
aWM6IGludGVycnVwdC1jb250cm9sbGVyQDFlNmMwMDgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtdmlj
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dC1jb250cm9sbGVyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNp
bnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdmFsaWQtc291cmNlcyA9ICZsdDsweGZlZmZmN2ZmIDB4MDgwN2ZmZmYmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
NmMwMDgwIDB4ODAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hYzA6IGV0aGVybmV0QDFlNjYwMDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
ZmFyYWRheSxmdGdtYWMxMDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2NjAwMDAgMHgxODAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MiZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8taHctY2hlY2tzdW07PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbWFjMTogZXRoZXJuZXRAMWU2ODAwMDAgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtmYXJhZGF5LGZ0
Z21hYzEwMCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHgxZTY4MDAwMCAweDE4MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1ody1jaGVja3N1bTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhcGIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJhbmdlczs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2Nsa2luOiBjbGtfY2xr
aW5AMWU2ZTIwNzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVk
LGc1LWNsa2luLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4MDQmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN5c2Nvbjogc3lzY29uQDFlNmUyMDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7YXNwZWVkLGc1LXNjdSZxdW90OywgJnF1b3Q7c3lzY29uJnF1b3Q7LCAmcXVv
dDtzaW1wbGUtbWZkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDAwIDB4MWE4Jmd0Ozs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bDogcGluY3RybEAxZTZlMjAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxn
NS1waW5jdHJsJnF1b3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzlfZGVmYXVsdDogaTJj
OV9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzkmcXVv
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDOSZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzEwX2RlZmF1bHQ6IGkyYzEwX2RlZmF1bHQg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTAmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDMTAmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybF9pMmMxMV9kZWZhdWx0OiBpMmMxMV9kZWZhdWx0IHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzExJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzExJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBpbmN0cmxfaTJjMTJfZGVmYXVsdDogaTJjMTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtJMkMxMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsX2kyYzEzX2RlZmF1bHQ6IGkyYzEzX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1
bmN0aW9uID0gJnF1b3Q7STJDMTMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0g
JnF1b3Q7STJDMTMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9ncGlk
MF9kZWZhdWx0OiBncGlkMF9kZWZhdWx0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9
ICZxdW90O0dQSUQwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0dQ
SUQwJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfZ3BpZDFfZGVmYXVs
dDogZ3BpZDFfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtH
UElEMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtHUElEMSZxdW90
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3NkMV9kZWZhdWx0OiBzZDFfZGVm
YXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtTRDEmcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7U0QxJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjNV9kZWZhdWx0OiBpMmM1X2RlZmF1bHQgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDNSZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncm91cHMgPSAmcXVvdDtJMkM1JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBpbmN0cmxfaTJjNl9kZWZhdWx0OiBpMmM2X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGZ1bmN0aW9uID0gJnF1b3Q7STJDNiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMg
PSAmcXVvdDtJMkM2JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJj
N19kZWZhdWx0OiBpMmM3X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0g
JnF1b3Q7STJDNyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM3
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjOF9kZWZhdWx0OiBp
MmM4X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDOCZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM4JnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtMF9kZWZhdWx0OiBwd20wX2RlZmF1bHQg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMCZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV00wJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmxfcHdtMV9kZWZhdWx0OiBwd20xX2RlZmF1bHQgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncm91cHMgPSAmcXVvdDtQV00xJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bmN0cmxfcHdtMl9kZWZhdWx0OiBwd20yX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1
bmN0aW9uID0gJnF1b3Q7UFdNMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAm
cXVvdDtQV00yJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtM19k
ZWZhdWx0OiBwd20zX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1
b3Q7UFdNMyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV00zJnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNF9kZWZhdWx0OiBwd200
X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNCZxdW90
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV000JnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNV9kZWZhdWx0OiBwd201X2RlZmF1bHQgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNSZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV001JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfcHdtNl9kZWZhdWx0OiBwd202X2RlZmF1bHQgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtQV002JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0
cmxfcHdtN19kZWZhdWx0OiBwd203X2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0
aW9uID0gJnF1b3Q7UFdNNyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVv
dDtQV003JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjM19kZWZh
dWx0OiBpMmMzX2RlZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7
STJDMyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMzJnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjNF9kZWZhdWx0OiBpMmM0X2Rl
ZmF1bHQgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDNCZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM0JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjMTRfZGVmYXVsdDogaTJjMTRfZGVmYXVsdCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxNCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMxNCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5jdHJsX3JnbWlpMV9kZWZhdWx0OiByZ21paTFfZGVmYXVsdCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtSR01JSTEmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZ3JvdXBzID0gJnF1b3Q7UkdNSUkxJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBpbmN0cmxfcm1paTFfZGVmYXVsdDogcm1paTFfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtSTUlJMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtSTUlJMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5j
dHJsX3JnbWlpMl9kZWZhdWx0OiByZ21paTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZnVuY3Rpb24gPSAmcXVvdDtSR01JSTImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBz
ID0gJnF1b3Q7UkdNSUkyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxf
cm1paTJfZGVmYXVsdDogcm1paTJfZGVmYXVsdCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rp
b24gPSAmcXVvdDtSTUlJMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVv
dDtSTUlJMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2xrX2hwbGw6IGNsa19ocGxsQDFlNmUyMDI0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1ocGxsLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDI0
IDB4NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX2Nsa2luJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjbGtfYWhiOiBjbGtfYWhiQDFlNmUyMDcwIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAm
bHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxnNS1haGItY2xvY2smcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MWU2ZTIwNzAgMHg0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfaHBsbCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2FwYjogY2xrX2FwYkAxZTZlMjAwOCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2Nr
LWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtYXBiLWNsb2NrJnF1
b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDFlNmUyMDA4IDB4NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX2hwbGwmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa191YXJ0OiBjbGtfdWFydEAx
ZTZlMjAwOCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsdWFy
dC1jbG9jayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTZlMjAyYyAweDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHNyYW1AMWU3MjAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDttbWlvLXNy
YW0mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4MWU3MjAwMDAgMHg5MDAwJmd0OzvCoCDCoCDCoCAvLyAzNks8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvOiBncGlvQDFlNzgwMDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1j
ZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3Qy
NTAwLWdwaW8mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODAwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0
OzIwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BpbmN0cmwgMCAwIDIyMCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGltZXI6IHRpbWVyQDFlNzgyMDAwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtdGltZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODIwMDAgMHg5
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLy8gVGhlIG1veGFydF90aW1lciBkcml2ZXIgcmVnaXN0ZXJzIG9ubHkgb25lPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8gaW50ZXJydXB0
IGFuZCBhc3N1bWVzIGl0JiMzOTtzIGZvciB0aW1lciAxPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy9pbnRlcnJ1cHRzID0gJmx0OzE2IDE3IDE4
IDM1IDM2IDM3IDM4IDM5Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzE2Jmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtj
bGtfYXBiJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpYnQ6IGlidEAx
ZTc4OTE0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxidC1ob3N0JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
Nzg5MTQwIDB4MTgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgd2R0MTogd2R0QDFlNzg1MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVk
LGFzdDI1MDAtd2R0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg1MDAwIDB4MWMmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdkdDI6IHdkdEAxZTc4NTAyMCB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O2FzcGVlZCxhc3QyNTAwLXdkdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NTAyMCAweDFjJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB3ZHQzOiB3ZHRAMWU3ODUwNDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsd2R0JnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDFlNzg1MDc0IDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQxOiBzZXJpYWxAMWU3ODMwMDAg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4MzAwMCAweDEwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzkmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1w
O2Nsa191YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQyOiBzZXJpYWxAMWU3OGQwMDAg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4ZDAwMCAweDEwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMyJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFt
cDtjbGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0Mzogc2VyaWFsQDFlNzhlMDAw
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3OGUwMDAgMHgxMDAw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszMyZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZh
bXA7Y2xrX3VhcnQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDQ6IHNlcmlhbEAxZTc4ZjAw
MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhmMDAwIDB4MTAw
MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MzQmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsm
YW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQ1OiBzZXJpYWxAMWU3ODQw
MDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NDAwMCAweDEw
MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7
JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY3VycmVudC1zcGVlZCA9ICZsdDszODQwMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVz
dDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2dWFydDogdnVhcnRAMWU3ODcwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsdnVh
cnQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4MWU3ODcwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDs4Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2st
dGVzdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpMmM6IGkyY0AxZTc4YTAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUt
Y2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy08d2JyPmNvbnRyb2xsZXImcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MWU3OGEwMDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2VzID0gJmx0OzAgMHgxZTc4YTAwMCAweDEwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MTImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19hcGImZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLXJhbmdlczs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRl
cnJ1cHQtY29udHJvbGxlcjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMDogaTJjLWJ1c0A0MCB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3Mt
Y2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzB4NDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2Fz
cGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZx
dW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2kyYyZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTogaTJjLWJ1c0A4
MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2Vs
bHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAgMHg0MCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnVzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaTJjMjogaTJjLWJ1c0BjMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2Vs
bHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4QzAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVl
ZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzImZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MiZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0g
Jmx0OyZhbXA7cGluY3RybF9pMmMzX2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzM6IGkyYy1idXNAMTAwIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9
ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMDAgMHg0MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVz
ID0gJmx0OzMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7MyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM0X2RlZmF1bHQmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGkyYzQ6IGkyYy1idXNAMTQwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxNDAg
MHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1i
dXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5j
eSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9
ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3Ry
bF9pMmM1X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzU6IGkyYy1idXNAMTgwIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVz
cy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgxODAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzUmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NSZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM2X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzY6IGkyYy1idXNA
MWMwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1j
ZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxQzAgMHg0MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnVzID0gJmx0OzYmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7NiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM3X2RlZmF1bHQm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGkyYzc6IGkyYy1idXNAMzAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsx
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7
MHgzMDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAw
LWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzcmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZy
ZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVk
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NyZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1u
YW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7
cGluY3RybF9pMmM4X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzg6IGkyYy1idXNAMzQwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
YWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzNDAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0Ozgm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM5X2RlZmF1bHQmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzk6IGky
Yy1idXNAMzgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
c2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzODAgMHg0MCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnVzID0gJmx0OzkmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsx
MDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7OSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2Rl
ZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmMxMF9k
ZWZhdWx0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpMmMxMDogaTJjLWJ1c0AzYzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxz
ID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDNjMCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVk
LGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9
ICZsdDsmYW1wO3BpbmN0cmxfaTJjMTFfZGVmYXVsdCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTE6IGkyYy1idXNANDAw
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxs
cyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MDAgMHg0MCZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnVzID0gJmx0OzExJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1
cHRzID0gJmx0OzExJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZx
dW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEyX2RlZmF1bHQm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGkyYzEyOiBpMmMtYnVzQDQ0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7
MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4NDQwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQw
MC1pMmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2st
ZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJs
ZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZh
bXA7cGluY3RybF9pMmMxM19kZWZhdWx0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxMzogaTJjLWJ1c0A0ODAgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0
OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQ4MCAweDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAm
bHQ7MTMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MTMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaTJjMTRfZGVmYXVsdCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCit9
Ozxicj4NCi0tPGJyPg0KMi44LjAucmMzLjIyNi5nMzlkNDAyMDxicj4NCjxicj4NCjwvYmxvY2tx
dW90ZT48L2Rpdj48YnI+PGJyIGNsZWFyPSJhbGwiPjxkaXY+PGJyPjwvZGl2Pi0tIDxicj48ZGl2
IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUi
PjxkaXY+PGI+TTwvYj5heGltIDxiPlM8L2I+bG95a288L2Rpdj48L2Rpdj4NCjwvZGl2Pg0K
--001a114e60fea98c2b053e9dfbf4--
