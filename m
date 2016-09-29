Return-Path: <maxims@google.com>
Received: from mail-yb0-x22b.google.com (mail-yb0-x22b.google.com
 [IPv6:2607:f8b0:4002:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slLTt4zZHzDskQ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 03:02:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=jul4D82F; 
 dkim-atps=neutral
Received: by mail-yb0-x22b.google.com with SMTP id z8so19454451ybh.3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vd75cFzXzNpwM0sq4zBcaONORF5aTiNOzvXQ2FfY6Os=;
 b=jul4D82FtMojOvTdnAauL58H17kElLn288NMORyEHHiudu8Oo2OKj5glJKQVOoEMDB
 0JnNUlz2CPb22OKx5Ei7XbcfIhtSJd7eiXkFQ8748eFqfIZsPKShfQEpDplZfyCTaSt0
 Gtd0jT1XN+D6WwIvLIyI+XloGu2umfpHYe/Mkzn8gQwmKRjbE562uSn5ytshSV3FKhbl
 gSkRnzbwgeJFRYthFvuIFA3n0F3cl/ybljzwzbjGJp0mw4w0k5TjHmQIyi1paHDPDOHq
 1OgdGoelF7CiqUDIWinaDraXLeD0+RrJZSHFwaELyxkhquYlMdhuSW5Cl2gLNLBtffeY
 lIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vd75cFzXzNpwM0sq4zBcaONORF5aTiNOzvXQ2FfY6Os=;
 b=D9anBSvi2Ng64OzMMBasyjKNjt+P3xh7mrqhoNwucJyphktW0KiHCDMAEhh+z+oEaV
 p816kYKWUTBA+sWfdCkeDJU8lEXgJtvLEkjhCYXyVQdiI+4iQKqlj9BJkxhDs04jqYMJ
 cjxMjZKyOC+zy9JA3NzpmUFpqd3RAsNbETzC9ddqMgD5HyK7kepGup7NvbCgq5vjFqES
 7JsTmAk1XbD8aQLaEeJmspVPFYZxvec2hacjmFpQ4pnVcDbDFipkJ19kTgFnxqrBq1Aw
 mPwRKkZTjVhbKuVY0tbRS5zaUAWV8dKSpheEqy3szjcR3N9Vj3eVVvbU19HsVQgo/hFY
 NSzQ==
X-Gm-Message-State: AA6/9Rmr9jZ5meQIBTOmn0rUExY9Hux1PMvFNlGIksLatleE6qMxFYE1qvNoyjGTSq3ERbcvs25fWgpo8w6vC+R9
X-Received: by 10.37.173.165 with SMTP id z37mr1748235ybi.88.1475168543753;
 Thu, 29 Sep 2016 10:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Thu, 29 Sep 2016 10:02:23 -0700 (PDT)
In-Reply-To: <CACPK8Xe9qsbigeq-jpUs7LrqV5cMJtMuuXsk3z9kAy84K3=ffg@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <CACPK8Xe9qsbigeq-jpUs7LrqV5cMJtMuuXsk3z9kAy84K3=ffg@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 29 Sep 2016 10:02:23 -0700
Message-ID: <CAFR_W8r=fh+1yozkdD1YVqshHrfXCKrq17ULRSGaYCqZsfbdfQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] aspeed/g5: Device Tree for ast2500, copied from
 openbmc/linux (include file), plus minimal device tree configuration for
 ast2500 eval board.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045dc30209619a053da871f7
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
X-List-Received-Date: Thu, 29 Sep 2016 17:02:28 -0000

--f403045dc30209619a053da871f7
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 28, 2016 at 6:29 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Sep 28, 2016 at 3:13 AM,  <maxims@google.com> wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > Fixed the bug in board initialization, which caused
> > failures during boot with device tree.
> > The flags are used to modify malloc behaviour after relocation,
> > resetting the flag caused it to fail.
>
> This unrelated to the device tree additions and therefore should be in
> a separate patch.
>

This is related, because the device tree can't be used without this fix.


>
> The device tree additions look okay.
>
> > ---
> >  arch/arm/dts/Makefile          |   2 +
> >  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
> >  arch/arm/dts/aspeed-g5.dtsi    | 541 ++++++++++++++++++++++++++++++
> +++++++++++
> >  board/aspeed/ast-g5/ast-g5.c   |   1 -
> >  4 files changed, 571 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
> >  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index d1f8e22..09efa0a 100644
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
> >         k2e-evm.dtb \
> >         k2g-evm.dtb
> >
> > +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
> > +
> >  targets += $(dtb-y)
> >
> >  # Add any required device tree compiler flags here
> > diff --git a/arch/arm/dts/aspeed-g5-evb.dts
> b/arch/arm/dts/aspeed-g5-evb.dts
> > new file mode 100644
> > index 0000000..95dc77a
> > --- /dev/null
> > +++ b/arch/arm/dts/aspeed-g5-evb.dts
> > @@ -0,0 +1,28 @@
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +
> > +/ {
> > +       memory {
> > +               device_type = "memory";
> > +               reg = <0x80000000 0x20000000>;
> > +       };
> > +
> > +       aliases {
> > +               i2c1 = &i2c0;
> > +               i2c4 = &i2c3;
> > +               i2c8 = &i2c7;
> > +       };
> > +};
> > +
> > +&i2c0 {
> > +       status = "okay";
> > +};
> > +
> > +&i2c3 {
> > +       status = "okay";
> > +};
> > +
> > +&i2c7 {
> > +       status = "okay";
> > +};
> > diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
> > new file mode 100644
> > index 0000000..eb81a2e
> > --- /dev/null
> > +++ b/arch/arm/dts/aspeed-g5.dtsi
> > @@ -0,0 +1,541 @@
> > +/* The device tree is copied from
> > + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/
> boot/dts/aspeed-g5.dtsi
> > + */
> > +#include "skeleton.dtsi"
> > +
> > +/ {
> > +       model = "Aspeed BMC";
> > +       compatible = "aspeed,ast2500";
> > +       #address-cells = <1>;
> > +       #size-cells = <1>;
> > +       interrupt-parent = <&vic>;
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               cpu@0 {
> > +                       compatible = "arm,arm1176jzf-s";
> > +                       device_type = "cpu";
> > +                       reg = <0>;
> > +               };
> > +       };
> > +
> > +       ahb {
> > +               compatible = "simple-bus";
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               vic: interrupt-controller@1e6c0080 {
> > +                       compatible = "aspeed,ast2400-vic";
> > +                       interrupt-controller;
> > +                       #interrupt-cells = <1>;
> > +                       valid-sources = <0xfefff7ff 0x0807ffff>;
> > +                       reg = <0x1e6c0080 0x80>;
> > +               };
> > +
> > +               mac0: ethernet@1e660000 {
> > +                       compatible = "faraday,ftgmac100";
> > +                       reg = <0x1e660000 0x180>;
> > +                       interrupts = <2>;
> > +                       no-hw-checksum;
> > +                       status = "disabled";
> > +               };
> > +
> > +               mac1: ethernet@1e680000 {
> > +                       compatible = "faraday,ftgmac100";
> > +                       reg = <0x1e680000 0x180>;
> > +                       interrupts = <3>;
> > +                       no-hw-checksum;
> > +                       status = "disabled";
> > +               };
> > +
> > +               apb {
> > +                       compatible = "simple-bus";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges;
> > +
> > +                       clk_clkin: clk_clkin@1e6e2070 {
> > +                               #clock-cells = <0>;
> > +                               compatible = "aspeed,g5-clkin-clock";
> > +                               reg = <0x1e6e2070 0x04>;
> > +                       };
> > +
> > +                       syscon: syscon@1e6e2000 {
> > +                               compatible = "aspeed,g5-scu", "syscon",
> "simple-mfd";
> > +                               reg = <0x1e6e2000 0x1a8>;
> > +
> > +                               pinctrl: pinctrl@1e6e2000 {
> > +                                       compatible = "aspeed,g5-pinctrl";
> > +
> > +                                       pinctrl_i2c9_default:
> i2c9_default {
> > +                                               function = "I2C9";
> > +                                               groups = "I2C9";
> > +                                       };
> > +
> > +                                       pinctrl_i2c10_default:
> i2c10_default {
> > +                                               function = "I2C10";
> > +                                               groups = "I2C10";
> > +                                       };
> > +
> > +                                       pinctrl_i2c11_default:
> i2c11_default {
> > +                                               function = "I2C11";
> > +                                               groups = "I2C11";
> > +                                       };
> > +
> > +                                       pinctrl_i2c12_default:
> i2c12_default {
> > +                                               function = "I2C12";
> > +                                               groups = "I2C12";
> > +                                       };
> > +
> > +                                       pinctrl_i2c13_default:
> i2c13_default {
> > +                                               function = "I2C13";
> > +                                               groups = "I2C13";
> > +                                       };
> > +
> > +                                       pinctrl_gpid0_default:
> gpid0_default {
> > +                                               function = "GPID0";
> > +                                               groups = "GPID0";
> > +                                       };
> > +
> > +                                       pinctrl_gpid1_default:
> gpid1_default {
> > +                                               function = "GPID1";
> > +                                               groups = "GPID1";
> > +                                       };
> > +
> > +                                       pinctrl_sd1_default: sd1_default
> {
> > +                                               function = "SD1";
> > +                                               groups = "SD1";
> > +                                       };
> > +
> > +                                       pinctrl_i2c5_default:
> i2c5_default {
> > +                                               function = "I2C5";
> > +                                               groups = "I2C5";
> > +                                       };
> > +
> > +                                       pinctrl_i2c6_default:
> i2c6_default {
> > +                                               function = "I2C6";
> > +                                               groups = "I2C6";
> > +                                       };
> > +
> > +                                       pinctrl_i2c7_default:
> i2c7_default {
> > +                                               function = "I2C7";
> > +                                               groups = "I2C7";
> > +                                       };
> > +
> > +                                       pinctrl_i2c8_default:
> i2c8_default {
> > +                                               function = "I2C8";
> > +                                               groups = "I2C8";
> > +                                       };
> > +
> > +                                       pinctrl_pwm0_default:
> pwm0_default {
> > +                                               function = "PWM0";
> > +                                               groups = "PWM0";
> > +                                       };
> > +
> > +                                       pinctrl_pwm1_default:
> pwm1_default {
> > +                                               function = "PWM1";
> > +                                               groups = "PWM1";
> > +                                       };
> > +
> > +                                       pinctrl_pwm2_default:
> pwm2_default {
> > +                                               function = "PWM2";
> > +                                               groups = "PWM2";
> > +                                       };
> > +
> > +                                       pinctrl_pwm3_default:
> pwm3_default {
> > +                                               function = "PWM3";
> > +                                               groups = "PWM3";
> > +                                       };
> > +
> > +                                       pinctrl_pwm4_default:
> pwm4_default {
> > +                                               function = "PWM4";
> > +                                               groups = "PWM4";
> > +                                       };
> > +
> > +                                       pinctrl_pwm5_default:
> pwm5_default {
> > +                                               function = "PWM5";
> > +                                               groups = "PWM5";
> > +                                       };
> > +
> > +                                       pinctrl_pwm6_default:
> pwm6_default {
> > +                                               function = "PWM6";
> > +                                               groups = "PWM6";
> > +                                       };
> > +
> > +                                       pinctrl_pwm7_default:
> pwm7_default {
> > +                                               function = "PWM7";
> > +                                               groups = "PWM7";
> > +                                       };
> > +
> > +                                       pinctrl_i2c3_default:
> i2c3_default {
> > +                                               function = "I2C3";
> > +                                               groups = "I2C3";
> > +                                       };
> > +
> > +                                       pinctrl_i2c4_default:
> i2c4_default {
> > +                                               function = "I2C4";
> > +                                               groups = "I2C4";
> > +                                       };
> > +
> > +                                       pinctrl_i2c14_default:
> i2c14_default {
> > +                                               function = "I2C14";
> > +                                               groups = "I2C14";
> > +                                       };
> > +
> > +                                       pinctrl_rgmii1_default:
> rgmii1_default {
> > +                                               function = "RGMII1";
> > +                                               groups = "RGMII1";
> > +                                       };
> > +
> > +                                       pinctrl_rmii1_default:
> rmii1_default {
> > +                                               function = "RMII1";
> > +                                               groups = "RMII1";
> > +                                       };
> > +
> > +                                       pinctrl_rgmii2_default:
> rgmii2_default {
> > +                                               function = "RGMII2";
> > +                                               groups = "RGMII2";
> > +                                       };
> > +
> > +                                       pinctrl_rmii2_default:
> rmii2_default {
> > +                                               function = "RMII2";
> > +                                               groups = "RMII2";
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       clk_hpll: clk_hpll@1e6e2024 {
> > +                               #clock-cells = <0>;
> > +                               compatible = "aspeed,g5-hpll-clock";
> > +                               reg = <0x1e6e2024 0x4>;
> > +                               clocks = <&clk_clkin>;
> > +                       };
> > +
> > +                       clk_ahb: clk_ahb@1e6e2070 {
> > +                               #clock-cells = <0>;
> > +                               compatible = "aspeed,g5-ahb-clock";
> > +                               reg = <0x1e6e2070 0x4>;
> > +                               clocks = <&clk_hpll>;
> > +                       };
> > +
> > +                       clk_apb: clk_apb@1e6e2008 {
> > +                               #clock-cells = <0>;
> > +                               compatible = "aspeed,g5-apb-clock";
> > +                               reg = <0x1e6e2008 0x4>;
> > +                               clocks = <&clk_hpll>;
> > +                       };
> > +
> > +                       clk_uart: clk_uart@1e6e2008 {
> > +                               #clock-cells = <0>;
> > +                               compatible = "aspeed,uart-clock";
> > +                               reg = <0x1e6e202c 0x4>;
> > +                       };
> > +
> > +                       sram@1e720000 {
> > +                               compatible = "mmio-sram";
> > +                               reg = <0x1e720000 0x9000>;      // 36K
> > +                       };
> > +
> > +                       gpio: gpio@1e780000 {
> > +                               #gpio-cells = <2>;
> > +                               gpio-controller;
> > +                               compatible = "aspeed,ast2500-gpio";
> > +                               reg = <0x1e780000 0x1000>;
> > +                               interrupts = <20>;
> > +                               gpio-ranges = <&pinctrl 0 0 220>;
> > +                       };
> > +
> > +                       timer: timer@1e782000 {
> > +                               compatible = "aspeed,ast2400-timer";
> > +                               reg = <0x1e782000 0x90>;
> > +                               // The moxart_timer driver registers
> only one
> > +                               // interrupt and assumes it's for timer 1
> > +                               //interrupts = <16 17 18 35 36 37 38 39>;
> > +                               interrupts = <16>;
> > +                               clocks = <&clk_apb>;
> > +                       };
> > +
> > +                       ibt: ibt@1e789140 {
> > +                               compatible = "aspeed,bt-host";
> > +                               reg = <0x1e789140 0x18>;
> > +                               interrupts = <8>;
> > +                       };
> > +
> > +                       wdt1: wdt@1e785000 {
> > +                               compatible = "aspeed,ast2500-wdt";
> > +                               reg = <0x1e785000 0x1c>;
> > +                       };
> > +
> > +                       wdt2: wdt@1e785020 {
> > +                               compatible = "aspeed,ast2500-wdt";
> > +                               reg = <0x1e785020 0x1c>;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       wdt3: wdt@1e785040 {
> > +                               compatible = "aspeed,wdt";
> > +                               reg = <0x1e785074 0x1c>;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       uart1: serial@1e783000 {
> > +                               compatible = "ns16550a";
> > +                               reg = <0x1e783000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <9>;
> > +                               clocks = <&clk_uart>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       uart2: serial@1e78d000 {
> > +                               compatible = "ns16550a";
> > +                               reg = <0x1e78d000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <32>;
> > +                               clocks = <&clk_uart>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       uart3: serial@1e78e000 {
> > +                               compatible = "ns16550a";
> > +                               reg = <0x1e78e000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <33>;
> > +                               clocks = <&clk_uart>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       uart4: serial@1e78f000 {
> > +                               compatible = "ns16550a";
> > +                               reg = <0x1e78f000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <34>;
> > +                               clocks = <&clk_uart>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       uart5: serial@1e784000 {
> > +                               compatible = "ns16550a";
> > +                               reg = <0x1e784000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <10>;
> > +                               clocks = <&clk_uart>;
> > +                               current-speed = <38400>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       vuart: vuart@1e787000 {
> > +                               compatible = "aspeed,vuart";
> > +                               reg = <0x1e787000 0x1000>;
> > +                               reg-shift = <2>;
> > +                               interrupts = <8>;
> > +                               clocks = <&clk_uart>;
> > +                               no-loopback-test;
> > +                               status = "disabled";
> > +                       };
> > +
> > +                       i2c: i2c@1e78a000 {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <1>;
> > +                               #interrupt-cells = <1>;
> > +
> > +                               compatible = "aspeed,ast2400-i2c-
> controller";
> > +                               reg = <0x1e78a000 0x40>;
> > +                               ranges = <0 0x1e78a000 0x1000>;
> > +                               interrupts = <12>;
> > +                               clocks = <&clk_apb>;
> > +                               clock-ranges;
> > +                               interrupt-controller;
> > +
> > +                               i2c0: i2c-bus@40 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x40 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <0>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <0>;
> > +                                       interrupt-parent = <&i2c>;
> > +                               };
> > +
> > +                               i2c1: i2c-bus@80 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x80 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <1>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <1>;
> > +                               };
> > +
> > +                               i2c2: i2c-bus@c0 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0xC0 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <2>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <2>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c3_default>;
> > +                               };
> > +
> > +                               i2c3: i2c-bus@100 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x100 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <3>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <3>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c4_default>;
> > +                               };
> > +
> > +                               i2c4: i2c-bus@140 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x140 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <4>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <4>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c5_default>;
> > +                               };
> > +
> > +                               i2c5: i2c-bus@180 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x180 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <5>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <5>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c6_default>;
> > +                               };
> > +
> > +                               i2c6: i2c-bus@1c0 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x1C0 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <6>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <6>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c7_default>;
> > +                               };
> > +
> > +                               i2c7: i2c-bus@300 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x300 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <7>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <7>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c8_default>;
> > +                               };
> > +
> > +                               i2c8: i2c-bus@340 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x340 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <8>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <8>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c9_default>;
> > +                               };
> > +
> > +                               i2c9: i2c-bus@380 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x380 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <9>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <9>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c10_default>;
> > +                               };
> > +
> > +                               i2c10: i2c-bus@3c0 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x3c0 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <10>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <10>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c11_default>;
> > +                               };
> > +
> > +                               i2c11: i2c-bus@400 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x400 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <11>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <11>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c12_default>;
> > +                               };
> > +
> > +                               i2c12: i2c-bus@440 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x440 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <12>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <12>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c13_default>;
> > +                               };
> > +
> > +                               i2c13: i2c-bus@480 {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +                                       reg = <0x480 0x40>;
> > +                                       compatible =
> "aspeed,ast2400-i2c-bus";
> > +                                       bus = <13>;
> > +                                       clock-frequency = <100000>;
> > +                                       status = "disabled";
> > +                                       interrupts = <13>;
> > +                                       pinctrl-names = "default";
> > +                                       pinctrl-0 =
> <&pinctrl_i2c14_default>;
> > +                               };
> > +
> > +                       };
> > +
> > +               };
> > +       };
> > +};
> > diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> > index 81ea88a..6fa1e12 100644
> > --- a/board/aspeed/ast-g5/ast-g5.c
> > +++ b/board/aspeed/ast-g5/ast-g5.c
> > @@ -52,7 +52,6 @@ int board_init(void)
> >  {
> >         /* adress of boot parameters */
> >         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> > -       gd->flags = 0;
> >         return 0;
> >  }
> >
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>



-- 
*M*axim *S*loyko

--f403045dc30209619a053da871f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgU2VwIDI4LCAyMDE2IGF0IDY6MjkgUE0sIEpvZWwgU3Rh
bmxleSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpqb2VsQGptcy5pZC5hdSIg
dGFyZ2V0PSJfYmxhbmsiPmpvZWxAam1zLmlkLmF1PC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48c3BhbiBjbGFzcz0i
Ij5PbiBXZWQsIFNlcCAyOCwgMjAxNiBhdCAzOjEzIEFNLMKgICZsdDs8YSBocmVmPSJtYWlsdG86
bWF4aW1zQGdvb2dsZS5jb20iPm1heGltc0Bnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0K
Jmd0OyBGcm9tOiBNYXhpbSBTbG95a28gJmx0OzxhIGhyZWY9Im1haWx0bzptYXhpbXNAZ29vZ2xl
LmNvbSI+bWF4aW1zQGdvb2dsZS5jb208L2E+Jmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEZpeGVk
IHRoZSBidWcgaW4gYm9hcmQgaW5pdGlhbGl6YXRpb24sIHdoaWNoIGNhdXNlZDxicj4NCiZndDsg
ZmFpbHVyZXMgZHVyaW5nIGJvb3Qgd2l0aCBkZXZpY2UgdHJlZS48YnI+DQomZ3Q7IFRoZSBmbGFn
cyBhcmUgdXNlZCB0byBtb2RpZnkgbWFsbG9jIGJlaGF2aW91ciBhZnRlciByZWxvY2F0aW9uLDxi
cj4NCiZndDsgcmVzZXR0aW5nIHRoZSBmbGFnIGNhdXNlZCBpdCB0byBmYWlsLjxicj4NCjxicj4N
Cjwvc3Bhbj5UaGlzIHVucmVsYXRlZCB0byB0aGUgZGV2aWNlIHRyZWUgYWRkaXRpb25zIGFuZCB0
aGVyZWZvcmUgc2hvdWxkIGJlIGluPGJyPg0KYSBzZXBhcmF0ZSBwYXRjaC48YnI+PC9ibG9ja3F1
b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhpcyBpcyByZWxhdGVkLCBiZWNhdXNlIHRoZSBkZXZp
Y2UgdHJlZSBjYW4mIzM5O3QgYmUgdXNlZCB3aXRob3V0IHRoaXMgZml4LjwvZGl2PjxkaXY+wqA8
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxicj4N
ClRoZSBkZXZpY2UgdHJlZSBhZGRpdGlvbnMgbG9vayBva2F5Ljxicj4NCjxkaXY+PGRpdiBjbGFz
cz0iaDUiPjxicj4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2R0cy9NYWtlZmlsZcKg
IMKgIMKgIMKgIMKgIHzCoCDCoDIgKzxicj4NCiZndDvCoCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1
LWV2Yi5kdHMgfMKgIDI4ICsrKzxicj4NCiZndDvCoCBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0
c2nCoCDCoCB8IDU0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8d2JyPisrKysrKysr
KysrPGJyPg0KJmd0O8KgIGJvYXJkL2FzcGVlZC9hc3QtZzUvYXN0LWc1LmPCoCDCoHzCoCDCoDEg
LTxicj4NCiZndDvCoCA0IGZpbGVzIGNoYW5nZWQsIDU3MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pPGJyPg0KJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXNwZWVk
LWc1LWV2Yi5kdHM8YnI+DQomZ3Q7wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9h
c3BlZWQtZzUuZHRzaTxicj4NCiZndDs8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9k
dHMvTWFrZWZpbGUgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGU8YnI+DQomZ3Q7IGluZGV4IGQxZjhl
MjIuLjA5ZWZhMGEgMTAwNjQ0PGJyPg0KJmd0OyAtLS0gYS9hcmNoL2FybS9kdHMvTWFrZWZpbGU8
YnI+DQomZ3Q7ICsrKyBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZTxicj4NCiZndDsgQEAgLTIzMyw2
ICsyMzMsOCBAQCBkdGItJChDT05GSUdfU09DX0tFWVNUT05FKSArPSBrMmhrLWV2bS5kdGIgXDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoGsyZS1ldm0uZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqBrMmctZXZtLmR0Yjxicj4NCiZndDs8YnI+DQomZ3Q7ICtkdGItJChDT05GSUdfVEFSR0VUX0FT
VF9HNSkgKz0gYXNwZWVkLWc1LWV2Yi5kdGI8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7wqAgdGFyZ2V0
cyArPSAkKGR0Yi15KTxicj4NCiZndDs8YnI+DQomZ3Q7wqAgIyBBZGQgYW55IHJlcXVpcmVkIGRl
dmljZSB0cmVlIGNvbXBpbGVyIGZsYWdzIGhlcmU8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9kdHMvYXNwZWVkLWc1LWV2Yi48d2JyPmR0cyBiL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUt
ZXZiLjx3YnI+ZHRzPGJyPg0KJmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCiZndDsgaW5k
ZXggMDAwMDAwMC4uOTVkYzc3YTxicj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysr
IGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS1ldmIuPHdicj5kdHM8YnI+DQomZ3Q7IEBAIC0wLDAg
KzEsMjggQEA8YnI+DQomZ3Q7ICsvZHRzLXYxLzs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsjaW5j
bHVkZSAmcXVvdDthc3BlZWQtZzUuZHRzaSZxdW90Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKy8g
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgbWVtb3J5IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7bWVtb3J5JnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAwMDAwMDAgMHgyMDAwMDAwMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgYWxpYXNlcyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxID0gJmFt
cDtpMmMwOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNCA9ICZhbXA7aTJj
Mzs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzggPSAmYW1wO2kyYzc7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArJmFtcDtpMmMwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkm
cXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzMgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7
ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJjNyB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpIGIvYXJjaC9hcm0vZHRzL2Fz
cGVlZC1nNS5kdHNpPGJyPg0KJmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCiZndDsgaW5k
ZXggMDAwMDAwMC4uZWI4MWEyZTxicj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysr
IGIvYXJjaC9hcm0vZHRzL2FzcGVlZC1nNS5kdHNpPGJyPg0KJmd0OyBAQCAtMCwwICsxLDU0MSBA
QDxicj4NCiZndDsgKy8qIFRoZSBkZXZpY2UgdHJlZSBpcyBjb3BpZWQgZnJvbTxicj4NCiZndDsg
KyAqIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvOWVjOWQw
OS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvPHdicj5saW51eC9ibG9iLzll
YzlkMDkvYXJjaC9hcm0vPHdicj5ib290L2R0cy9hc3BlZWQtZzUuZHRzaTwvYT48YnI+DQomZ3Q7
ICsgKi88YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDtza2VsZXRvbi5kdHNpJnF1b3Q7PGJyPg0K
Jmd0OyArPGJyPg0KJmd0OyArLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBtb2RlbCA9ICZxdW90
O0FzcGVlZCBCTUMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7YXNwZWVkLGFzdDI1MDAmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAjYWRkcmVzcy1j
ZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0
OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1w
O3ZpYyZndDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjcHVzIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVAMCB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0g
JnF1b3Q7YXJtLGFybTExNzZqemYtcyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7Y3B1JnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBhaGIgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3NpbXBsZS1idXMmcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsx
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0
OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2VzOzxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmljOiBpbnRlcnJ1cHQtY29u
dHJvbGxlckAxZTZjMDA4MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtdmljJnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRy
b2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50
ZXJydXB0LWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdmFsaWQtc291cmNlcyA9ICZsdDsweGZlZmZmN2ZmIDB4MDgwN2ZmZmYm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MWU2YzAwODAgMHg4MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFjMDog
ZXRoZXJuZXRAMWU2NjAwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2ZhcmFkYXksZnRnbWFjMTAwJnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2
NjAwMDAgMHgxODAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG5vLWh3LWNoZWNrc3VtOzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFjMTogZXRoZXJuZXRAMWU2ODAwMDAgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2ZhcmFkYXksZnRnbWFjMTAwJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ODAwMDAgMHgxODAmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWh3LWNo
ZWNrc3VtOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXBi
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJhbmdlczs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsa19jbGtpbjogY2xrX2Nsa2luQDFlNmUyMDcwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtY2xraW4tY2xvY2smcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcg
PSAmbHQ7MHgxZTZlMjA3MCAweDA0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzeXNjb246IHN5c2NvbkAxZTZlMjAwMCB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7YXNwZWVkLGc1LXNjdSZxdW90OywgJnF1b3Q7c3lzY29uJnF1b3Q7LCAmcXVvdDtz
aW1wbGUtbWZkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwMDAgMHgxYTgmZ3Q7Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGluY3RybDogcGluY3RybEAxZTZlMjAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7YXNwZWVkLGc1LXBpbmN0cmwmcXVvdDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsX2kyYzlfZGVmYXVsdDogaTJjOV9kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDOSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdyb3VwcyA9ICZxdW90O0kyQzkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybF9pMmMxMF9kZWZhdWx0OiBpMmMxMF9kZWZhdWx0IHs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTAmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMxMCZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzExX2RlZmF1bHQ6IGky
YzExX2RlZmF1bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJ
MkMxMSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzEx
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxf
aTJjMTJfZGVmYXVsdDogaTJjMTJfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
dW5jdGlvbiA9ICZxdW90O0kyQzEyJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Jv
dXBzID0gJnF1b3Q7STJDMTImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybF9pMmMxM19kZWZhdWx0OiBpMmMxM19kZWZhdWx0IHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7STJDMTMmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkMxMyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2dwaWQwX2RlZmF1bHQ6IGdwaWQwX2Rl
ZmF1bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtHUElEMCZx
dW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0dQSUQwJnF1b3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfZ3BpZDFf
ZGVmYXVsdDogZ3BpZDFfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlv
biA9ICZxdW90O0dQSUQxJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0g
JnF1b3Q7R1BJRDEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcGluY3RybF9zZDFfZGVmYXVsdDogc2QxX2RlZmF1bHQgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtTRDEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncm91cHMgPSAmcXVvdDtTRDEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybF9pMmM1X2RlZmF1bHQ6IGkyYzVfZGVmYXVsdCB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O0kyQzUmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtJMkM1JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfaTJjNl9kZWZhdWx0OiBpMmM2X2RlZmF1
bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM2JnF1b3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDNiZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzdfZGVmYXVs
dDogaTJjN19kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1
b3Q7STJDNyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0ky
QzcmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3Ry
bF9pMmM4X2RlZmF1bHQ6IGkyYzhfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
dW5jdGlvbiA9ICZxdW90O0kyQzgmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91
cHMgPSAmcXVvdDtJMkM4JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbmN0cmxfcHdtMF9kZWZhdWx0OiBwd20wX2RlZmF1bHQgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV00wJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7UFdNMCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3B3bTFfZGVmYXVsdDogcHdtMV9kZWZhdWx0IHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNMSZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O1BXTTEmcXVvdDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd20yX2RlZmF1bHQ6IHB3
bTJfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1BX
TTImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV00yJnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdt
M19kZWZhdWx0OiBwd20zX2RlZmF1bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rp
b24gPSAmcXVvdDtQV00zJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0g
JnF1b3Q7UFdNMyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsX3B3bTRfZGVmYXVsdDogcHdtNF9kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGZ1bmN0aW9uID0gJnF1b3Q7UFdNNCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdyb3VwcyA9ICZxdW90O1BXTTQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcGluY3RybF9wd201X2RlZmF1bHQ6IHB3bTVfZGVmYXVsdCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1BXTTUmcXVvdDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtQV001JnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcHdtNl9kZWZhdWx0OiBwd202X2Rl
ZmF1bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtQV002JnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7UFdNNiZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX3B3bTdfZGVm
YXVsdDogcHdtN19kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9uID0g
JnF1b3Q7UFdNNyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90
O1BXTTcmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlu
Y3RybF9pMmMzX2RlZmF1bHQ6IGkyYzNfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBmdW5jdGlvbiA9ICZxdW90O0kyQzMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBn
cm91cHMgPSAmcXVvdDtJMkMzJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmxfaTJjNF9kZWZhdWx0OiBpMmM0X2RlZmF1bHQgezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkM0JnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7STJDNCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsX2kyYzE0X2RlZmF1bHQ6IGkyYzE0X2RlZmF1
bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtJMkMxNCZxdW90
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdyb3VwcyA9ICZxdW90O0kyQzE0JnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmxfcmdtaWkxX2Rl
ZmF1bHQ6IHJnbWlpMV9kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9u
ID0gJnF1b3Q7UkdNSUkxJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3JvdXBzID0g
JnF1b3Q7UkdNSUkxJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBpbmN0cmxfcm1paTFfZGVmYXVsdDogcm1paTFfZGVmYXVsdCB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmdW5jdGlvbiA9ICZxdW90O1JNSUkxJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3JvdXBzID0gJnF1b3Q7Uk1JSTEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9yZ21paTJfZGVmYXVsdDogcmdtaWkyX2RlZmF1
bHQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnVuY3Rpb24gPSAmcXVvdDtSR01JSTImcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAmcXVvdDtSR01JSTImcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybF9ybWlpMl9k
ZWZhdWx0OiBybWlpMl9kZWZhdWx0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZ1bmN0aW9u
ID0gJnF1b3Q7Uk1JSTImcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHMgPSAm
cXVvdDtSTUlJMiZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa19ocGxsOiBjbGtfaHBsbEAxZTZlMjAy
NCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVk
LGc1LWhwbGwtY2xvY2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTZlMjAyNCAweDQmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2tzID0gJmx0OyZhbXA7Y2xrX2Nsa2luJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbGtfYWhiOiBjbGtfYWhiQDFlNmUyMDcwIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9j
ay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtYWhiLWNs
b2NrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ZTIwNzAgMHg0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsm
YW1wO2Nsa19ocGxsJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbGtfYXBiOiBjbGtfYXBiQDFlNmUyMDA4IHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZs
dDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsZzUtYXBiLWNsb2NrJnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4MWU2ZTIwMDggMHg0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19ocGxs
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
bGtfdWFydDogY2xrX3VhcnRAMWU2ZTIwMDggezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCx1YXJ0LWNsb2NrJnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MWU2ZTIwMmMgMHg0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzcmFtQDFlNzIwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDttbWlvLXNyYW0m
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWcgPSAmbHQ7MHgxZTcyMDAwMCAweDkwMDAmZ3Q7O8KgIMKgIMKgIC8vIDM2Szxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW86IGdw
aW9AMWU3ODAwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtZ3BpbyZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDFlNzgwMDAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzIwJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8t
cmFuZ2VzID0gJmx0OyZhbXA7cGluY3RybCAwIDAgMjIwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lcjogdGltZXJAMWU3ODIwMDAgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLXRpbWVyJnF1b3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MWU3ODIwMDAgMHg5MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvLyBUaGUgbW94YXJ0X3RpbWVyIGRyaXZlciByZWdpc3Rl
cnMgb25seSBvbmU8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8vIGludGVycnVwdCBhbmQgYXNzdW1lcyBpdCYjMzk7cyBmb3IgdGltZXIg
MTxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLy9pbnRlcnJ1cHRzID0gJmx0OzE2IDE3IDE4IDM1IDM2IDM3IDM4IDM5Jmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MTYmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX2FwYiZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWJ0OiBpYnRAMWU3
ODkxNDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxidC1ob3N0JnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MWU3ODkxNDAgMHgxOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzgmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdkdDE6IHdkdEAxZTc4
NTAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtd2R0JnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4MWU3ODUwMDAgMHgxYyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgd2R0Mjogd2R0QDFlNzg1MDIwIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsYXN0MjUwMC13ZHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NTAyMCAweDFj
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdkdDM6IHdkdEAxZTc4NTA0MCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7YXNwZWVkLHdkdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg1MDc0IDB4
MWMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDE6IHNlcmlhbEAxZTc4MzAwMCB7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4MzAw
MCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnLXNoaWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs5
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0Mjogc2VyaWFsQDFlNzhkMDAwIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBh
dGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhkMDAwIDB4MTAw
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMyJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0Mzogc2VyaWFsQDFlNzhlMDAwIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhlMDAwIDB4MTAwMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMzJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
cyA9ICZsdDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB1YXJ0NDogc2VyaWFsQDFlNzhmMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDtuczE2NTUwYSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhmMDAwIDB4MTAwMCZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWct
c2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzM0Jmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZs
dDsmYW1wO2Nsa191YXJ0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB1YXJ0NTogc2VyaWFsQDFlNzg0MDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtuczE2
NTUwYSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg0MDAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQg
PSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1w
O2Nsa191YXJ0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGN1cnJlbnQtc3BlZWQgPSAmbHQ7Mzg0MDAmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJh
Y2stdGVzdDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZ1YXJ0OiB2dWFydEAxZTc4NzAwMCB7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLHZ1YXJ0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3
ODcwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7OCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10
ZXN0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjOiBpMmNAMWU3OGEwMDAgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJl
c3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1
cHQtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNw
ZWVkLGFzdDI0MDAtaTJjLTx3YnI+Y29udHJvbGxlciZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhh
MDAwIDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmFuZ2VzID0gJmx0OzAgMHgxZTc4YTAwMCAweDEwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfYXBiJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNs
b2NrLXJhbmdlczs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMDogaTJj
LWJ1c0A0MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
NDAgMHg0MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0
MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzAm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2kyYyZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaTJjMTogaTJjLWJ1c0A4MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1j
ZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4ODAgMHg0MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1
cyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzI6IGkyYy1i
dXNAYzAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweEMw
IDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAw
LWkyYy1idXMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmMzX2RlZmF1bHQmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGkyYzM6IGkyYy1idXNAMTAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNz
LWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMDAgMHg0MCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGJ1cyA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAw
MDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1l
cyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFt
cDtwaW5jdHJsX2kyYzRfZGVmYXVsdCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNDogaTJjLWJ1
c0AxNDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDE0
MCAweDQwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQw
MC1pMmMtYnVzJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzQmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMg
PSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfaTJjNV9kZWZhdWx0Jmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpMmM1OiBpMmMtYnVzQDE4MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVz
cy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MTgwIDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBidXMgPSAmbHQ7NSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAw
MDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs1Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFt
ZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZh
bXA7cGluY3RybF9pMmM2X2RlZmF1bHQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzY6IGkyYy1i
dXNAMWMwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgx
QzAgMHg0MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0
MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDs2Jmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzYm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzdfZGVmYXVsdCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaTJjNzogaTJjLWJ1c0AzMDAgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJl
c3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDMwMCAweDQwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjQwMC1pMmMtYnVzJnF1b3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnVzID0gJmx0OzcmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEw
MDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5h
bWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsm
YW1wO3BpbmN0cmxfaTJjOF9kZWZhdWx0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmM4OiBpMmMt
YnVzQDM0MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MzQwIDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3Qy
NDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7OCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1
cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs4
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9pMmM5X2RlZmF1bHQmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGkyYzk6IGkyYy1idXNAMzgwIHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRy
ZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzODAgMHg0MCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI0MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJ1cyA9ICZsdDs5Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsx
MDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzkmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1u
YW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7
JmFtcDtwaW5jdHJsX2kyYzEwX2RlZmF1bHQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEwOiBp
MmMtYnVzQDNjMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4M2MwIDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxh
c3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAm
bHQ7MTAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzExX2RlZmF1
bHQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzExOiBpMmMtYnVzQDQwMCB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0g
Jmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDAwIDB4NDAmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBidXMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5
ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZx
dW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJs
LTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzEyX2RlZmF1bHQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGkyYzEyOiBpMmMtYnVzQDQ0MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsx
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4NDQwIDB4NDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTIm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MTImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2Rl
ZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2ky
YzEzX2RlZmF1bHQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEzOiBpMmMtYnVzQDQ4MCB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXpl
LWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDgwIDB4NDAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNDAwLWkyYy1idXMm
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7MTMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2st
ZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTMmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJsX2kyYzE0X2RlZmF1bHQmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2Jv
YXJkL2FzcGVlZC9hc3QtZzUvYXN0LWc1LmMgYi9ib2FyZC9hc3BlZWQvYXN0LWc1L2FzdC1nNS5j
PGJyPg0KJmd0OyBpbmRleCA4MWVhODhhLi42ZmExZTEyIDEwMDY0NDxicj4NCiZndDsgLS0tIGEv
Ym9hcmQvYXNwZWVkL2FzdC1nNS9hc3QtZzUuYzxicj4NCiZndDsgKysrIGIvYm9hcmQvYXNwZWVk
L2FzdC1nNS9hc3QtZzUuYzxicj4NCiZndDsgQEAgLTUyLDcgKzUyLDYgQEAgaW50IGJvYXJkX2lu
aXQodm9pZCk8YnI+DQomZ3Q7wqAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoC8qIGFkcmVzcyBv
ZiBib290IHBhcmFtZXRlcnMgKi88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBnZC0mZ3Q7YmQtJmd0
O2JpX2Jvb3RfcGFyYW1zID0gQ09ORklHX1NZU19TRFJBTV9CQVNFICsgMHgxMDA7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqBnZC0mZ3Q7ZmxhZ3MgPSAwOzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJl
dHVybiAwOzxicj4NCiZndDvCoCB9PGJyPg0KJmd0Ozxicj4NCiZndDsgLS08YnI+DQomZ3Q7IDIu
OC4wLnJjMy4yMjYuZzM5ZDQwMjA8YnI+DQomZ3Q7PGJyPg0KPC9kaXY+PC9kaXY+Jmd0OyBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX188d2JyPl9fX19fX19fX19fX19fX19fPGJyPg0KJmd0
OyBvcGVuYm1jIG1haWxpbmcgbGlzdDxicj4NCiZndDsgPGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPjxicj4NCiZndDsg
PGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL29wZW5ibWMiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy88d2Jy
Pmxpc3RpbmZvL29wZW5ibWM8L2E+PGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xl
YXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVy
ZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdj48Yj5NPC9iPmF4aW0gPGI+
UzwvYj5sb3lrbzwvZGl2PjwvZGl2Pg0KPC9kaXY+PC9kaXY+DQo=
--f403045dc30209619a053da871f7--
