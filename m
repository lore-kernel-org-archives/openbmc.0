Return-Path: <maxims@google.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sg50V3Z3hzDskL
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 04:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=PREcFTmA; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id u82so97361715ywc.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HmGGiD2tCtf5yjNlh0SBAclQFnqa2GdraLZg6UvsGIs=;
 b=PREcFTmAmSvfANve7VmgRMgrbKAYyYaKspnlJau1MT0Kf7rTqPz3U2fGk4At0SwvpK
 YTDbKBORx5opQG2PPosy0udsF043fRLla/Y0YvY9Sy825Pc2ZJ3M0G/PyngSBBv5vRKc
 PbJGNN7h+6GJZtJmtT39e7s3Mlsm17RhQZ+pfRI8u6IGkK6O0jb51NmU4gQMxvJd6NbJ
 9Awqmka7A3+Zz/cAe2UZ3NpRprY81QpmzW+LZwsW2ra9fxqTbpf2qXIhfSGamDMe7JMD
 BPeM7e4PR2ATi8yfObyyGOkIQTPxDIoA7QSgycEFVJnRfuGwXZ193MTHuxxa7eJRc3Qq
 yG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HmGGiD2tCtf5yjNlh0SBAclQFnqa2GdraLZg6UvsGIs=;
 b=gvc16i/A6fBmCl1vhFsfFfyo+r32Hn7uOMcLjhviXqGtigDjuUf+6HOZXVEjMoUvzy
 33Rx92Vj+OrtyWQLED982nuJPaXldRZoGPrPJiLNjBPGDcA7c3dv7yBq/tbazc0bLGg8
 ZESFqV6YwiSQiEZBqwFP/Xfiqzxepn8sGgBOknsSiLkQASH+i57gajAsJIOrBBEp3Jzq
 suTxskCZ2BDs32iZ6LAqmzd+3s9+xSHxGf67YIFoAtDiORkoaB9tLVTIl3apHkd5TqXp
 YMSdxQ4eTuRs/w5hPzGub2OmaW/SQAcGqaYdMXL7lbicn4MUX111tIz175/607wif5i5
 toJQ==
X-Gm-Message-State: AE9vXwMRS5xg7rJf2DXqJQMEQJ+IDOzU5HSdJapppwL6f1UasQOwv91i03l+XcS5Kk5w6WY5J4/ZfEMCKqQYXKPh
X-Received: by 10.129.78.196 with SMTP id c187mr2695160ywb.356.1474569638884; 
 Thu, 22 Sep 2016 11:40:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.34.86 with HTTP; Thu, 22 Sep 2016 11:40:38 -0700 (PDT)
In-Reply-To: <1474306018-101166-1-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 22 Sep 2016 11:40:38 -0700
Message-ID: <CAFR_W8o37Uk-3mspCz8_4Hx_1AOQRDHQo3M0GOWVs2NANTwGWg@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500 and eval board,
 I2C driver
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114d6d668631f5053d1cff8e
X-Mailman-Approved-At: Fri, 23 Sep 2016 06:58:51 +1000
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
X-List-Received-Date: Thu, 22 Sep 2016 18:40:45 -0000

--001a114d6d668631f5053d1cff8e
Content-Type: text/plain; charset=UTF-8

Ping!

On Mon, Sep 19, 2016 at 10:26 AM, <maxims@google.com> wrote:

> From: Maxim Sloyko <maxims@google.com>
>
> The driver is limited: only single master mode is supported and only
> byte-by-byte reads and writes are supported, no DMA or Pool Buffers.
>
> Also, pin function configuration is performed by the I2C driver, because
> there is no pinctrl driver at the moment.
> ---
>  arch/arm/dts/Makefile                       |   2 +
>  arch/arm/dts/aspeed-g5-evb.dts              |  28 ++
>  arch/arm/dts/aspeed-g5.dtsi                 | 392
> ++++++++++++++++++++++++++++
>  arch/arm/include/asm/arch-aspeed/ast_scu.h  |   6 +
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |  74 +++---
>  arch/arm/mach-aspeed/ast-scu.c              |  31 ++-
>  board/aspeed/ast-g5/ast-g5.c                |   2 +-
>  configs/ast_g5_defconfig                    |   4 +-
>  drivers/i2c/Kconfig                         |   6 +
>  drivers/i2c/Makefile                        |   1 +
>  drivers/i2c/ast_i2c.c                       | 306 ++++++++++++++++++++++
>  drivers/i2c/ast_i2c.h                       | 155 +++++++++++
>  12 files changed, 970 insertions(+), 37 deletions(-)
>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>  create mode 100644 drivers/i2c/ast_i2c.c
>  create mode 100644 drivers/i2c/ast_i2c.h
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index d1f8e22..f1f1ab3 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
>         k2e-evm.dtb \
>         k2g-evm.dtb
>
> +dtb-y += aspeed-g5-evb.dtb
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
> index 0000000..f1ff9e3
> --- /dev/null
> +++ b/arch/arm/dts/aspeed-g5.dtsi
> @@ -0,0 +1,392 @@
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
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
> +                       compatible = "arm,arm1176", "arm,armv6";
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
> +               pinmux: pinmux@1e6e2000 {
> +                       reg= <0x1e6e2000 0x1000>;
> +                       compatible = "aspeed,ast2500-pinctrl";
> +               };
> +
> +               vic: interrupt-controller@1e6c0080 {
> +                       compatible = "aspeed,ast2500-vic";
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
> +                       aspeed-g5-interface;
> +                       no-hw-checksum;
> +                       status = "disabled";
> +               };
> +
> +               mac1: ethernet@1e680000 {
> +                       compatible = "faraday,ftgmac100";
> +                       reg = <0x1e680000 0x180>;
> +                       interrupts = <3>;
> +                       aspeed-g5-interface;
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
> +                       timer: timer@1e782000 {
> +                               compatible = "aspeed,ast2500-timer";
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
> +                       gpio: gpio@1e780000 {
> +                              #gpio-cells = <2>;
> +                              gpio-controller;
> +                              compatible = "aspeed,ast2500-gpio";
> +                              reg = <0x1e780000 0x1000>;
> +                              interrupts = <20>;
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
> +                       uart6: serial@1e787000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1e787000 0x1000>;
> +                               reg-shift = <2>;
> +                               interrupts = <10>;
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
> +                               compatible = "aspeed,ast2500-i2c-
> controller";
> +                               reg = <0x1e78a000 0x40>;
> +                               ranges = <0 0x1e78a000 0x1000>;
> +                               interrupts = <12>;
> +                               clocks = <&clk_apb>;
> +                               buffer = <0x1e78a200 0x10>;
> +                               clock-ranges;
> +                               interrupt-controller;
> +
> +                               i2c0: i2c-bus@40 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x40 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <0>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <0>;
> +                                       interrupt-parent = <&i2c>;
> +                                       buffer;
> +                               };
> +
> +                               i2c1: i2c-bus@80 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x80 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <1>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <1>;
> +                                       buffer = <0x10 0x10>;
> +                               };
> +
> +                               i2c2: i2c-bus@c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0xC0 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <2>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <2>;
> +                                       buffer = <0x20 0x10>;
> +                               };
> +
> +                               i2c3: i2c-bus@100 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x100 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <3>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <3>;
> +                                       buffer = <0x30 0x10>;
> +                               };
> +
> +                               i2c4: i2c-bus@140 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x140 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <4>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <4>;
> +                                       buffer = <0x40 0x10>;
> +                               };
> +
> +                               i2c5: i2c-bus@180 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x180 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <5>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <5>;
> +                                       buffer = <0x50 0x10>;
> +                               };
> +
> +                               i2c6: i2c-bus@1c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x1C0 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <6>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <6>;
> +                                       buffer = <0x60 0x10>;
> +                               };
> +
> +                               i2c7: i2c-bus@300 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x300 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <7>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <7>;
> +                                       buffer = <0x70 0x10>;
> +                               };
> +
> +                               i2c8: i2c-bus@340 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x340 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <8>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <8>;
> +                                       buffer = <0x80 0x10>;
> +                               };
> +
> +                               i2c9: i2c-bus@380 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x380 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <9>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <9>;
> +                                       buffer = <0x90 0x10>;
> +                               };
> +
> +                               i2c10: i2c-bus@3c0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x3c0 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <10>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <10>;
> +                                       buffer = <0xa0 0x10>;
> +                               };
> +
> +                               i2c11: i2c-bus@400 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x400 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <11>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <11>;
> +                                       buffer = <0xb0 0x10>;
> +                               };
> +
> +                               i2c12: i2c-bus@440 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x440 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <12>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <12>;
> +                                       buffer = <0xc0 0x10>;
> +                               };
> +
> +                               i2c13: i2c-bus@480 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x480 0x40>;
> +                                       compatible =
> "aspeed,ast2500-i2c-bus";
> +                                       bus = <13>;
> +                                       clock-frequency = <100000>;
> +                                       status = "disabled";
> +                                       interrupts = <13>;
> +                                       buffer = <0xd0 0x10>;
> +                               };
> +
> +                       };
> +               };
> +       };
> +};
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> index d248416..80ebd6f 100644
> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
>  extern u32 ast_get_clk_source(void);
>  extern u32 ast_get_h_pll_clk(void);
>  extern u32 ast_get_ahbclk(void);
> +extern u32 ast_get_apbclk(void);
>
>  extern u32 ast_scu_get_vga_memsize(void);
>
> @@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
>  extern void ast_scu_multi_func_eth(u8 num);
>  extern void ast_scu_multi_func_romcs(u8 num);
>
> +/* Enable I2C controller and pins for a particular device.
> + * Device numbering starts at 1
> + */
> +extern void ast_scu_enable_i2c(u8 num);
> +
>  #endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b89df82..92ce84a 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -10,8 +10,8 @@
>   *    1. 2012/12/29 Ryan Chen Create
>   *
>  ************************************************************
> ********************/
> -#ifndef __AST_SCU_H
> -#define __AST_SCU_H                     1
> +#ifndef __AST_REGS_SCU_H
> +#define __AST_REGS_SCU_H                     1
>
>  #include <asm/arch/aspeed.h>
>
> @@ -830,49 +830,50 @@
>  /* AST_SCU_FUN_PIN_CTRL5               0x90 - Multi-function Pin
> Control#5 */
>  #define SCU_FUN_PIN_SPICS1             (0x1 << 31)
>  #define SCU_FUN_PIN_LPC_PLUS           (0x1 << 30)
> -#define SCU_FUC_PIN_USB20_HOST         (0x1 << 29)
> -#define SCU_FUC_PIN_USB11_PORT4                (0x1 << 28)
> -#define SCU_FUC_PIN_I2C14              (0x1 << 27)
> -#define SCU_FUC_PIN_I2C13              (0x1 << 26)
> -#define SCU_FUC_PIN_I2C12              (0x1 << 25)
> -#define SCU_FUC_PIN_I2C11              (0x1 << 24)
> -#define SCU_FUC_PIN_I2C10              (0x1 << 23)
> -#define SCU_FUC_PIN_I2C9               (0x1 << 22)
> -#define SCU_FUC_PIN_I2C8               (0x1 << 21)
> -#define SCU_FUC_PIN_I2C7               (0x1 << 20)
> -#define SCU_FUC_PIN_I2C6               (0x1 << 19)
> -#define SCU_FUC_PIN_I2C5               (0x1 << 18)
> -#define SCU_FUC_PIN_I2C4               (0x1 << 17)
> -#define SCU_FUC_PIN_I2C3               (0x1 << 16)
> -#define SCU_FUC_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> -#define SCU_FUC_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> -#define SCU_FUC_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> -#define SCU_FUC_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> -
> -#define SCU_FUC_PIN_MII2_TX_DRIV(x)    (x << 10)
> -#define SCU_FUC_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> -#define SCU_FUC_PIN_MII1_TX_DRIV(x)    (x << 8)
> -#define SCU_FUC_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
> +#define SCU_FUN_PIN_USB20_HOST         (0x1 << 29)
> +#define SCU_FUN_PIN_USB11_PORT4                (0x1 << 28)
> +#define SCU_FUN_PIN_I2C14              (0x1 << 27)
> +#define SCU_FUN_PIN_I2C13              (0x1 << 26)
> +#define SCU_FUN_PIN_I2C12              (0x1 << 25)
> +#define SCU_FUN_PIN_I2C11              (0x1 << 24)
> +#define SCU_FUN_PIN_I2C10              (0x1 << 23)
> +#define SCU_FUN_PIN_I2C9               (0x1 << 22)
> +#define SCU_FUN_PIN_I2C8               (0x1 << 21)
> +#define SCU_FUN_PIN_I2C7               (0x1 << 20)
> +#define SCU_FUN_PIN_I2C6               (0x1 << 19)
> +#define SCU_FUN_PIN_I2C5               (0x1 << 18)
> +#define SCU_FUN_PIN_I2C4               (0x1 << 17)
> +#define SCU_FUN_PIN_I2C3               (0x1 << 16)
> +#define SCU_FUN_PIN_I2C(n)             (0x1 << (16 + (n) - 3))
> +#define SCU_FUN_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> +#define SCU_FUN_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> +#define SCU_FUN_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> +#define SCU_FUN_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> +
> +#define SCU_FUN_PIN_MII2_TX_DRIV(x)    (x << 10)
> +#define SCU_FUN_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> +#define SCU_FUN_PIN_MII1_TX_DRIV(x)    (x << 8)
> +#define SCU_FUN_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
>
>  #define MII_NORMAL_DRIV                        0x0
>  #define MII_HIGH_DRIV                  0x2
>
> -#define SCU_FUC_PIN_UART6              (0x1 << 7)
> -#define SCU_FUC_PIN_ROM_16BIT          (0x1 << 6)
> -#define SCU_FUC_PIN_DIGI_V_OUT(x)      (x)
> -#define SCU_FUC_PIN_DIGI_V_OUT_MASK    (0x3)
> +#define SCU_FUN_PIN_UART6              (0x1 << 7)
> +#define SCU_FUN_PIN_ROM_16BIT          (0x1 << 6)
> +#define SCU_FUN_PIN_DIGI_V_OUT(x)      (x)
> +#define SCU_FUN_PIN_DIGI_V_OUT_MASK    (0x3)
>
>  #define VIDEO_DISABLE                  0x0
>  #define VIDEO_12BITS                   0x1
>  #define VIDEO_24BITS                   0x2
>  //#define VIDEO_DISABLE                        0x3
>
> -#define SCU_FUC_PIN_USB11_PORT2                (0x1 << 3)
> -#define SCU_FUC_PIN_SD1_8BIT           (0x1 << 3)
> +#define SCU_FUN_PIN_USB11_PORT2                (0x1 << 3)
> +#define SCU_FUN_PIN_SD1_8BIT           (0x1 << 3)
>
> -#define SCU_FUC_PIN_MAC1_MDIO          (0x1 << 2)
> -#define SCU_FUC_PIN_SD2                        (0x1 << 1)
> -#define SCU_FUC_PIN_SD1                        (0x1 << 0)
> +#define SCU_FUN_PIN_MAC1_MDIO          (0x1 << 2)
> +#define SCU_FUN_PIN_SD2                        (0x1 << 1)
> +#define SCU_FUN_PIN_SD1                        (0x1 << 0)
>
>
>  /* AST_SCU_FUN_PIN_CTRL6               0x94 - Multi-function Pin
> Control#6*/
> @@ -914,6 +915,11 @@
>  #define SCU_FUN_PIN_ROMA4              (0x1 << 18)
>  #define SCU_FUN_PIN_ROMA3              (0x1 << 17)
>  #define SCU_FUN_PIN_ROMA2              (0x1 << 16)
> +/* AST2500 only */
> +#define SCU_FUN_PIN_SDA2               (0x1 << 15)
> +#define SCU_FUN_PIN_SCL2               (0x1 << 14)
> +#define SCU_FUN_PIN_SDA1               (0x1 << 13)
> +#define SCU_FUN_PIN_SCL1               (0x1 << 12)
>
>  /* AST_SCU_FUN_PIN_CTRL9               0xA8 - Multi-function Pin
> Control#9 */
>  #define SCU_FUN_PIN_ROMA21             (0x1 << 3)
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-
> scu.c
> index 0cc0d67..31cea60 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -250,6 +250,7 @@ u32 ast_get_ahbclk(void)
>         return ((hpll / axi_div) / ahb_div);
>  }
>
> +
>  #else /* ! AST_SOC_G5 */
>
>  u32 ast_get_h_pll_clk(void)
> @@ -318,6 +319,14 @@ u32 ast_get_ahbclk(void)
>
>  #endif /* AST_SOC_G5 */
>
> +u32 ast_get_apbclk(void)
> +{
> +       u32 h_pll = ast_get_h_pll_clk();
> +       u32 apb_div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
> +       return h_pll / apb_div;
> +}
> +
> +
>  void ast_scu_show_system_info(void)
>  {
>
> @@ -394,7 +403,7 @@ void ast_scu_multi_func_eth(u8 num)
>                               AST_SCU_FUN_PIN_CTRL1);
>
>                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -                             SCU_FUC_PIN_MAC1_MDIO,
> +                             SCU_FUN_PIN_MAC1_MDIO,
>                               AST_SCU_FUN_PIN_CTRL5);
>
>                 break;
> @@ -496,3 +505,23 @@ void ast_scu_get_who_init_dram(void)
>                 break;
>         }
>  }
> +
> +void ast_scu_enable_i2c(u8 num)
> +{
> +       /* Enable I2C Controllers */
> +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> +
> +       if (num < 3) {
> +#ifdef AST_SOC_G5
> +               if (num == 1) {
> +                       setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                                SCU_FUN_PIN_SDA1 |
> SCU_FUN_PIN_SCL1);
> +               } else {
> +                       setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                                SCU_FUN_PIN_SDA2 |
> SCU_FUN_PIN_SCL2);
> +               }
> +#endif
> +       } else {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
> SCU_FUN_PIN_I2C(num));
> +       }
> +}
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index 81ea88a..03ce0de 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -36,6 +36,7 @@
>  #include <common.h>
>  #include <netdev.h>
>  #include <asm/arch/ast_scu.h>
> +#include <asm/arch/regs-scu.h>
>  #include <asm/arch/ast-sdmc.h>
>  #include <asm/io.h>
>
> @@ -52,7 +53,6 @@ int board_init(void)
>  {
>         /* adress of boot parameters */
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> -       gd->flags = 0;
>         return 0;
>  }
>
> diff --git a/configs/ast_g5_defconfig b/configs/ast_g5_defconfig
> index b5f2b24..20b02a3 100644
> --- a/configs/ast_g5_defconfig
> +++ b/configs/ast_g5_defconfig
> @@ -1,4 +1,5 @@
>  CONFIG_ARM=y
> +CONFIG_DEFAULT_DEVICE_TREE="aspeed-g5"
>  CONFIG_TARGET_AST_G5=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> @@ -6,4 +7,5 @@ CONFIG_SYS_PROMPT="ast# "
>  CONFIG_CMD_SAVEENV=y
>  CONFIG_CMD_FLASH=y
>  CONFIG_CMD_PING=y
> -CONFIG_CMD_DHCP=y
> \ No newline at end of file
> +CONFIG_CMD_DHCP=y
> +CONFIG_SYS_I2C_ASPEED=y
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index 9324c6c..6501e91 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -65,6 +65,12 @@ config SYS_I2C_CADENCE
>           Say yes here to select Cadence I2C Host Controller. This
> controller is
>           e.g. used by Xilinx Zynq.
>
> +config SYS_I2C_AST
> +       tristate "Aspeed I2C Controller"
> +       depends on DM_I2C
> +       help
> +         Say yes here to select Aspeed I2C Host Controller.
> +
>  config SYS_I2C_INTEL
>         bool "Intel I2C/SMBUS driver"
>         depends on DM_I2C
> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
> index 167424d..89e046e 100644
> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) += pca9564_i2c.o
>  obj-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
>  obj-$(CONFIG_SH_SH7734_I2C) += sh_sh7734_i2c.o
>  obj-$(CONFIG_SYS_I2C) += i2c_core.o
> +obj-$(CONFIG_SYS_I2C_AST) += ast_i2c.o
>  obj-$(CONFIG_SYS_I2C_CADENCE) += i2c-cdns.o
>  obj-$(CONFIG_SYS_I2C_DAVINCI) += davinci_i2c.o
>  obj-$(CONFIG_SYS_I2C_DW) += designware_i2c.o
> diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
> new file mode 100644
> index 0000000..144bf02
> --- /dev/null
> +++ b/drivers/i2c/ast_i2c.c
> @@ -0,0 +1,306 @@
> +/*
> + * Copyright (C) 2016 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <fdtdec.h>
> +#include <i2c.h>
> +
> +#include <asm/arch/ast_scu.h>
> +#include <asm/arch/regs-scu.h>
> +#include <asm/io.h>
> +
> +#include "ast_i2c.h"
> +
> +#define I2C_TIMEOUT_US (100000)
> +#define I2C_SLEEP_STEP (20)
> +#define EI2C_TIMEOUT (1001)
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +struct ast_i2c {
> +       u32 id;
> +       struct ast_i2c_regs *regs;
> +       int speed;
> +};
> +
> +#define RETURN_IF_ERROR(expr) do {\
> +       int err = (expr);\
> +       if (err < 0) {\
> +               return err;\
> +       }\
> +} while (0)
> +
> +static u32 __get_clk_reg_val(u32 divider_ratio)
> +{
> +       unsigned int inc = 0, div;
> +       u32 scl_low, scl_high, data;
> +
> +       for (div = 0; divider_ratio >= 16; div++) {
> +               inc |= (divider_ratio & 1);
> +               divider_ratio >>= 1;
> +       }
> +       divider_ratio += inc;
> +       scl_low = (divider_ratio >> 1) - 1;
> +       scl_high = divider_ratio - scl_low - 2;
> +       data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
> +       return data;
> +}
> +
> +static inline void __ast_i2c_clear_interrupts(struct ast_i2c_regs
> *i2c_base)
> +{
> +       writel(~0, &i2c_base->isr);
> +}
> +
> +static int __ast_i2c_init_bus(struct ast_i2c *i2c_bus)
> +{
> +       /* Reset device */
> +       writel(0, &i2c_bus->regs->fcr);
> +       /* Enable Master Mode. Assuming single-master. */
> +       debug("Enable Master for %p\n", i2c_bus->regs);
> +       setbits_le32(&i2c_bus->regs->fcr,
> +                    AST_I2CD_MASTER_EN
> +                    | AST_I2CD_M_SDA_LOCK_EN
> +                    | AST_I2CD_MULTI_MASTER_DIS |
> AST_I2CD_M_SCL_DRIVE_EN);
> +       debug("FCR: %p\n", &i2c_bus->regs->fcr);
> +       /* Enable Interrupts */
> +       writel(AST_I2CD_INTR_TX_ACK
> +              | AST_I2CD_INTR_TX_NAK
> +              | AST_I2CD_INTR_RX_DONE
> +              | AST_I2CD_INTR_BUS_RECOVER_DONE
> +              | AST_I2CD_INTR_NORMAL_STOP
> +              | AST_I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
> +       return 0;
> +}
> +
> +static int ast_i2c_probe(struct udevice *dev)
> +{
> +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> +
> +       debug("Enabling I2C%u \n", dev->seq);
> +       ast_scu_enable_i2c(dev->seq);
> +
> +       i2c_bus->id = dev->seq;
> +       struct ast_i2c_regs *i2c_base =
> +           (struct ast_i2c_regs *)dev_get_addr(dev);
> +       i2c_bus->regs = i2c_base;
> +
> +       return __ast_i2c_init_bus(i2c_bus);
> +}
> +
> +static inline int __ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32
> flag)
> +{
> +       int timeout = I2C_TIMEOUT_US;
> +       while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
> +               udelay(I2C_SLEEP_STEP);
> +               timeout -= I2C_SLEEP_STEP;
> +       }
> +
> +       __ast_i2c_clear_interrupts(i2c_base);
> +       if (timeout <= 0)
> +               return -EI2C_TIMEOUT;
> +       return 0;
> +}
> +
> +static inline int __ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
> +{
> +       writel(AST_I2CD_M_STOP_CMD, &i2c_base->csr);
> +       RETURN_IF_ERROR(__ast_i2c_wait_isr
> +                       (i2c_base, AST_I2CD_INTR_NORMAL_STOP));
> +       return 0;
> +}
> +
> +static inline int __ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
> +{
> +       int timeout = I2C_TIMEOUT_US;
> +       u32 flag = AST_I2CD_INTR_TX_ACK | AST_I2CD_INTR_TX_NAK;
> +       u32 status = readl(&i2c_base->isr) & flag;
> +       while (!status && timeout > 0) {
> +               status = readl(&i2c_base->isr) & flag;
> +               udelay(I2C_SLEEP_STEP);
> +               timeout -= I2C_SLEEP_STEP;
> +       }
> +
> +       int ret = 0;
> +       if (status == AST_I2CD_INTR_TX_NAK) {
> +               ret = -EREMOTEIO;
> +       }
> +
> +       if (timeout <= 0) {
> +               ret = -EI2C_TIMEOUT;
> +       }
> +
> +       __ast_i2c_clear_interrupts(i2c_base);
> +       return ret;
> +}
> +
> +static inline int __ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, u8
> devaddr)
> +{
> +       /* Start and Send Device Address */
> +       writel(devaddr, &i2c_base->trbbr);
> +       writel(AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD, &i2c_base->csr);
> +       RETURN_IF_ERROR(__ast_i2c_wait_tx(i2c_base));
> +       return 0;
> +}
> +
> +static int __ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip, u8
> *buffer,
> +                              int len)
> +{
> +       int i2c_error = 0;
> +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> +
> +       i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1) | I2C_M_RD);
> +
> +       if (!i2c_error) {
> +               u32 i2c_cmd = AST_I2CD_M_RX_CMD;
> +               for (; len > 0; len--, buffer++) {
> +                       if (len == 1) {
> +                               i2c_cmd |= AST_I2CD_M_S_RX_CMD_LAST;
> +                       }
> +                       writel(i2c_cmd, &i2c_base->csr);
> +                       RETURN_IF_ERROR(__ast_i2c_wait_isr
> +                                       (i2c_base, AST_I2CD_INTR_RX_DONE));
> +                       *buffer = AST_I2CD_RX_DATA_BUF_GET(
> readl(&i2c_base->trbbr));
> +               }
> +               __ast_i2c_clear_interrupts(i2c_base);
> +       }
> +       RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
> +
> +       return i2c_error;
> +}
> +
> +static int __ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip, u8
> *buffer,
> +                               int len)
> +{
> +       int i2c_error = 0;
> +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> +
> +       i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1));
> +       for (; len > 0 && 0 == i2c_error; len--, buffer++) {
> +               writel(*buffer, &i2c_base->trbbr);
> +               writel(AST_I2CD_M_TX_CMD, &i2c_base->csr);
> +               i2c_error = __ast_i2c_wait_tx(i2c_base);
> +       }
> +       RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
> +       return i2c_error;
> +}
> +
> +static int ast_i2c_deblock(struct udevice *dev)
> +{
> +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> +
> +       u32 csr = readl(&i2c_base->csr);
> +       debug("Bus hung (%x), attempting recovery\n", csr);
> +
> +       bool sda_high = csr & AST_I2CD_SDA_LINE_STS;
> +       bool scl_high = csr & AST_I2CD_SCL_LINE_STS;
> +       if (sda_high && scl_high) {
> +               /* Bus is idle, no deblocking needed. */
> +               return 0;
> +       } else if (sda_high) {
> +               /* Send stop command */
> +               RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
> +       } else if (scl_high) {
> +               /* Possibly stuck slave */
> +               writel(AST_I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
> +               RETURN_IF_ERROR(__ast_i2c_wait_isr
> +                               (i2c_base, AST_I2CD_INTR_BUS_RECOVER_
> DONE));
> +       } else {
> +               /* Just try to reinit the device. */
> +               RETURN_IF_ERROR(__ast_i2c_init_bus(i2c_bus));
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int
> nmsgs)
> +{
> +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> +       int ret;
> +
> +       debug("i2c_xfer: %d messages\n", nmsgs);
> +       for (; nmsgs > 0; nmsgs--, msg++) {
> +               /* TODO: use this for repeated start */
> +               bool next_is_read = nmsgs > 1 && (msg[1].flags & I2C_M_RD);
> +
> +               if (msg->flags & I2C_M_RD) {
> +                       debug("i2c_read: chip=0x%x, len=0x%x,
> flags=0x%x\n",
> +                             msg->addr, msg->len, msg->flags);
> +                       ret =
> +                           __ast_i2c_read_data(i2c_bus, msg->addr,
> msg->buf,
> +                                               msg->len);
> +               } else {
> +                       debug("i2c_write: chip=0x%x, len=0x%x,
> flags=0x%x\n",
> +                             msg->addr, msg->len, msg->flags);
> +                       ret =
> +                           __ast_i2c_write_data(i2c_bus, msg->addr,
> msg->buf,
> +                                                msg->len);
> +               }
> +               if (ret) {
> +                       debug("%s: error (%d)\n", __func__, ret);
> +                       return -EREMOTEIO;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)
> +{
> +       debug("Setting speed ofr I2C%d to <%u>\n", dev->seq, speed);
> +       if (!speed) {
> +               debug("No valid speed specified.\n");
> +               return -EINVAL;
> +       }
> +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> +
> +       i2c_bus->speed = speed;
> +       /* TODO: get this from device tree */
> +       u32 pclk = ast_get_apbclk();
> +       u32 divider = pclk / speed;
> +
> +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> +       if (speed > 400000) {
> +               debug("Enabling High Speed\n");
> +               setbits_le32(&i2c_base->fcr, AST_I2CD_M_HIGH_SPEED_EN
> +                            | AST_I2CD_M_SDA_DRIVE_1T_EN
> +                            | AST_I2CD_SDA_DRIVE_1T_EN);
> +               writel(0x3, &i2c_base->cactcr2);
> +               writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
> +       } else {
> +               debug("Enabling Normal Speed\n");
> +               writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
> +               writel(AST_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
> +       }
> +
> +       __ast_i2c_clear_interrupts(i2c_base);
> +       return 0;
> +}
> +
> +static const struct dm_i2c_ops ast_i2c_ops = {
> +       .xfer = ast_i2c_xfer,
> +       .set_bus_speed = ast_i2c_set_speed,
> +       .deblock = ast_i2c_deblock,
> +};
> +
> +static const struct udevice_id ast_i2c_ids[] = {
> +       {.compatible = "aspeed,ast2500-i2c-controller",},
> +       {.compatible = "aspeed,ast2500-i2c-bus",},
> +       {},
> +};
> +
> +/* Tell GNU Indent to keep this as is: */
> +/* *INDENT-OFF* */
> +U_BOOT_DRIVER(i2c_aspeed) = {
> +       .name = "i2c_aspeed",
> +       .id = UCLASS_I2C,
> +       .of_match = ast_i2c_ids,
> +       .probe = ast_i2c_probe,
> +       .priv_auto_alloc_size = sizeof(struct ast_i2c),
> +       .ops = &ast_i2c_ops,
> +};
> +/* *INDENT-ON* */
> diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
> new file mode 100644
> index 0000000..e221b41
> --- /dev/null
> +++ b/drivers/i2c/ast_i2c.h
> @@ -0,0 +1,155 @@
> +/*
> + * Copyright (C) 2016 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +#ifndef __AST_I2C_H_
> +#define __AST_I2C_H_
> +
> +struct ast_i2c_regs {
> +       uint32_t fcr;
> +       uint32_t cactcr1;
> +       uint32_t cactcr2;
> +       uint32_t icr;
> +       uint32_t isr;
> +       uint32_t csr;
> +       uint32_t sdar;
> +       uint32_t pbcr;
> +       uint32_t trbbr;
> +#ifdef CONFIG_TARGET_AST_G5
> +       uint32_t dma_mbar;
> +       uint32_t dma_tlr;
> +#endif
> +};
> +
> +/* Device Register Definition */
> +/* 0x00 : I2CD Function Control Register  */
> +#define AST_I2CD_BUFF_SEL_MASK                         (0x7 << 20)
> +#define AST_I2CD_BUFF_SEL(x)                           (x << 20)       //
> page 0 ~ 7
> +#define AST_I2CD_M_SDA_LOCK_EN                 (0x1 << 16)
> +#define AST_I2CD_MULTI_MASTER_DIS                      (0x1 << 15)
> +#define AST_I2CD_M_SCL_DRIVE_EN                (0x1 << 14)
> +#define AST_I2CD_MSB_STS                                       (0x1 << 9)
> +#define AST_I2CD_SDA_DRIVE_1T_EN                       (0x1 << 8)
> +#define AST_I2CD_M_SDA_DRIVE_1T_EN             (0x1 << 7)
> +#define AST_I2CD_M_HIGH_SPEED_EN               (0x1 << 6)
> +#define AST_I2CD_DEF_ADDR_EN                           (0x1 << 5)
> +#define AST_I2CD_DEF_ALERT_EN                          (0x1 << 4)
> +#define AST_I2CD_DEF_ARP_EN                                    (0x1 << 3)
> +#define AST_I2CD_DEF_GCALL_EN                          (0x1 << 2)
> +#define AST_I2CD_SLAVE_EN                                      (0x1 << 1)
> +#define AST_I2CD_MASTER_EN                                     (0x1 )
> +
> +/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
> +#define AST_I2CD_tBUF                                          (0x1 <<
> 28)     // 0~7
> +#define AST_I2CD_tHDSTA
> (0x1 << 24)     // 0~7
> +#define AST_I2CD_tACST                                         (0x1 <<
> 20)     // 0~7
> +#define AST_I2CD_tCKHIGH                                       (0x1 <<
> 16)     // 0~7
> +#define AST_I2CD_tCKLOW
> (0x1 << 12)     // 0~7
> +#define AST_I2CD_tHDDAT
> (0x1 << 10)     // 0~7
> +#define AST_I2CD_CLK_TO_BASE_DIV                       (0x1 << 8)      //
> 0~3
> +#define AST_I2CD_CLK_BASE_DIV                          (0x1 )  // 0~0xf
> +
> +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
> +#define AST_I2CD_tTIMEOUT                                      (0x1 )  //
> 0~7
> +#define AST_NO_TIMEOUT_CTRL                                    0x0
> +
> +/* 0x0c : I2CD Interrupt Control Register &
> + * 0x10 : I2CD Interrupt Status Register
> + *
> + * These share bit definitions, so use the same values for the enable &
> + * status bits.
> + */
> +#define AST_I2CD_INTR_SDA_DL_TIMEOUT                   (0x1 << 14)
> +#define AST_I2CD_INTR_BUS_RECOVER_DONE                 (0x1 << 13)
> +#define AST_I2CD_INTR_SMBUS_ALERT                      (0x1 << 12)
> +#define AST_I2CD_INTR_SMBUS_ARP_ADDR                   (0x1 << 11)
> +#define AST_I2CD_INTR_SMBUS_DEV_ALERT_ADDR             (0x1 << 10)
> +#define AST_I2CD_INTR_SMBUS_DEF_ADDR                   (0x1 << 9)
> +#define AST_I2CD_INTR_GCALL_ADDR                       (0x1 << 8)
> +#define AST_I2CD_INTR_SLAVE_MATCH                      (0x1 << 7)
> +#define AST_I2CD_INTR_SCL_TIMEOUT                      (0x1 << 6)
> +#define AST_I2CD_INTR_ABNORMAL                         (0x1 << 5)
> +#define AST_I2CD_INTR_NORMAL_STOP                      (0x1 << 4)
> +#define AST_I2CD_INTR_ARBIT_LOSS                       (0x1 << 3)
> +#define AST_I2CD_INTR_RX_DONE                          (0x1 << 2)
> +#define AST_I2CD_INTR_TX_NAK                           (0x1 << 1)
> +#define AST_I2CD_INTR_TX_ACK                           (0x1 << 0)
> +
> +/* 0x14 : I2CD Command/Status Register   */
> +#define AST_I2CD_SDA_OE                                        (0x1 << 28)
> +#define AST_I2CD_SDA_O                                 (0x1 << 27)
> +#define AST_I2CD_SCL_OE                                        (0x1 << 26)
> +#define AST_I2CD_SCL_O                                 (0x1 << 25)
> +#define AST_I2CD_TX_TIMING                             (0x1 << 24)     //
> 0 ~3
> +#define AST_I2CD_TX_STATUS                             (0x1 << 23)
> +
> +// Tx State Machine
> +#define AST_I2CD_IDLE                                  0x0
> +#define AST_I2CD_MACTIVE                               0x8
> +#define AST_I2CD_MSTART                                        0x9
> +#define AST_I2CD_MSTARTR                               0xa
> +#define AST_I2CD_MSTOP                                 0xb
> +#define AST_I2CD_MTXD                                  0xc
> +#define AST_I2CD_MRXACK                                        0xd
> +#define AST_I2CD_MRXD                                  0xe
> +#define AST_I2CD_MTXACK                                0xf
> +#define AST_I2CD_SWAIT                                 0x1
> +#define AST_I2CD_SRXD                                  0x4
> +#define AST_I2CD_STXACK                                0x5
> +#define AST_I2CD_STXD                                  0x6
> +#define AST_I2CD_SRXACK                                0x7
> +#define AST_I2CD_RECOVER                               0x3
> +
> +#define AST_I2CD_SCL_LINE_STS                          (0x1 << 18)
> +#define AST_I2CD_SDA_LINE_STS                          (0x1 << 17)
> +#define AST_I2CD_BUS_BUSY_STS                          (0x1 << 16)
> +#define AST_I2CD_SDA_OE_OUT_DIR                                (0x1 << 15)
> +#define AST_I2CD_SDA_O_OUT_DIR                         (0x1 << 14)
> +#define AST_I2CD_SCL_OE_OUT_DIR                                (0x1 << 13)
> +#define AST_I2CD_SCL_O_OUT_DIR                         (0x1 << 12)
> +#define AST_I2CD_BUS_RECOVER_CMD                       (0x1 << 11)
> +#define AST_I2CD_S_ALT_EN                              (0x1 << 10)
> +// 0 : DMA Buffer, 1: Pool Buffer
> +//AST1070 DMA register
> +#define AST_I2CD_RX_DMA_ENABLE                         (0x1 << 9)
> +#define AST_I2CD_TX_DMA_ENABLE                         (0x1 << 8)
> +
> +/* Command Bit */
> +#define AST_I2CD_RX_BUFF_ENABLE                                (0x1 << 7)
> +#define AST_I2CD_TX_BUFF_ENABLE                                (0x1 << 6)
> +#define AST_I2CD_M_STOP_CMD                                    (0x1 << 5)
> +#define AST_I2CD_M_S_RX_CMD_LAST                       (0x1 << 4)
> +#define AST_I2CD_M_RX_CMD                                      (0x1 << 3)
> +#define AST_I2CD_S_TX_CMD                                      (0x1 << 2)
> +#define AST_I2CD_M_TX_CMD                                      (0x1 << 1)
> +#define AST_I2CD_M_START_CMD                           (0x1 )
> +
> +/* 0x18 : I2CD Slave Device Address Register   */
> +
> +/* 0x1C : I2CD Pool Buffer Control Register   */
> +#define AST_I2CD_RX_BUF_ADDR_GET(x)                            (((x) >>
> 24) & 0xff)
> +#define AST_I2CD_RX_BUF_END_ADDR_SET(x)                        ((x) <<
> 16)
> +#define AST_I2CD_TX_DATA_BUF_END_SET(x)                        (((x) &
> 0xff) << 8)
> +#define AST_I2CD_RX_DATA_BUF_GET(x)                    (((x) >> 8) & 0xff)
> +#define AST_I2CD_BUF_BASE_ADDR_SET(x)                  ((x) & 0x3f)
> +
> +/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
> +#define AST_I2CD_GET_MODE(x)                                   (((x) >>
> 8) & 0x1)
> +
> +#define AST_I2CD_RX_BYTE_BUFFER
> (0xff << 8)
> +#define AST_I2CD_TX_BYTE_BUFFER
> (0xff )
> +
> +//1. usage flag , 2 size,       3. request address
> +/* Use platform_data instead of module parameters */
> +/* Fast Mode = 400 kHz, Standard = 100 kHz */
> +//static int clock = 100; /* Default: 100 kHz */
> +
> +#define AST_I2CD_CMDS  (AST_I2CD_BUS_RECOVER_CMD_EN | \
> +                        AST_I2CD_M_STOP_CMD | \
> +                        AST_I2CD_M_S_RX_CMD_LAST | \
> +                        AST_I2CD_M_RX_CMD | \
> +                        AST_I2CD_M_TX_CMD | \
> +                        AST_I2CD_M_START_CMD)
> +
> +#endif                         /* _ASPEED_REGS_I2C_H_ */
> --
> 2.8.0.rc3.226.g39d4020
>
>


-- 
*M*axim *S*loyko

--001a114d6d668631f5053d1cff8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+UGluZyE8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBNb24sIFNlcCAxOSwgMjAxNiBhdCAxMDoyNiBBTSwg
IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOm1heGltc0Bnb29nbGUuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bWF4aW1zQGdvb2dsZS5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJy
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkZyb206IE1heGlt
IFNsb3lrbyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1heGltc0Bnb29nbGUuY29tIj5tYXhpbXNAZ29v
Z2xlLmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0KVGhlIGRyaXZlciBpcyBsaW1pdGVkOiBvbmx5IHNp
bmdsZSBtYXN0ZXIgbW9kZSBpcyBzdXBwb3J0ZWQgYW5kIG9ubHk8YnI+DQpieXRlLWJ5LWJ5dGUg
cmVhZHMgYW5kIHdyaXRlcyBhcmUgc3VwcG9ydGVkLCBubyBETUEgb3IgUG9vbCBCdWZmZXJzLjxi
cj4NCjxicj4NCkFsc28sIHBpbiBmdW5jdGlvbiBjb25maWd1cmF0aW9uIGlzIHBlcmZvcm1lZCBi
eSB0aGUgSTJDIGRyaXZlciwgYmVjYXVzZTxicj4NCnRoZXJlIGlzIG5vIHBpbmN0cmwgZHJpdmVy
IGF0IHRoZSBtb21lbnQuPGJyPg0KLS0tPGJyPg0KwqBhcmNoL2FybS9kdHMvTWFrZWZpbGXCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKzxicj4NCsKgYXJjaC9hcm0v
ZHRzL2FzcGVlZC1nNS1ldmIuZHRzwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDI4ICsrPGJyPg0K
wqBhcmNoL2FybS9kdHMvYXNwZWVkLWc1LmR0c2nCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwg
MzkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+DQrCoGFyY2gvYXJtL2luY2x1ZGUv
YXNtL2FyY2gtPHdicj5hc3BlZWQvYXN0X3NjdS5owqAgfMKgIMKgNiArPGJyPg0KwqBhcmNoL2Fy
bS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL3JlZ3Mtc2N1LmggfMKgIDc0ICsrKy0tLTxi
cj4NCsKgYXJjaC9hcm0vbWFjaC1hc3BlZWQvYXN0LXNjdS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fMKgIDMxICsrLTxicj4NCsKgYm9hcmQvYXNwZWVkL2FzdC1nNS9hc3QtZzUuY8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoGNvbmZpZ3MvYXN0X2c1X2RlZmNvbmZpZ8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDQgKy08YnI+DQrCoGRyaXZlcnMvaTJj
L0tjb25maWfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDYgKzxi
cj4NCsKgZHJpdmVycy9pMmMvTWFrZWZpbGXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgwqAxICs8YnI+DQrCoGRyaXZlcnMvaTJjL2FzdF9pMmMuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAzMDYgKysrKysrKysrKysrKysrKysrKysrKzxicj4NCsKg
ZHJpdmVycy9pMmMvYXN0X2kyYy5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
IDE1NSArKysrKysrKysrKzxicj4NCsKgMTIgZmlsZXMgY2hhbmdlZCwgOTcwIGluc2VydGlvbnMo
KyksIDM3IGRlbGV0aW9ucygtKTxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0
cy9hc3BlZWQtZzUtZXZiLmR0czxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0
cy9hc3BlZWQtZzUuZHRzaTxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTJjL2Fz
dF9pMmMuYzxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTJjL2FzdF9pMmMuaDxi
cj4NCjxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9k
dHMvTWFrZWZpbGU8YnI+DQppbmRleCBkMWY4ZTIyLi5mMWYxYWIzIDEwMDY0NDxicj4NCi0tLSBh
L2FyY2gvYXJtL2R0cy9NYWtlZmlsZTxicj4NCisrKyBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZTxi
cj4NCkBAIC0yMzMsNiArMjMzLDggQEAgZHRiLSQoQ09ORklHX1NPQ19LRVlTVE9ORSkgKz0gazJo
ay1ldm0uZHRiIFw8YnI+DQrCoCDCoCDCoCDCoCBrMmUtZXZtLmR0YiBcPGJyPg0KwqAgwqAgwqAg
wqAgazJnLWV2bS5kdGI8YnI+DQo8YnI+DQorZHRiLXkgKz0gYXNwZWVkLWc1LWV2Yi5kdGI8YnI+
DQorPGJyPg0KwqB0YXJnZXRzICs9ICQoZHRiLXkpPGJyPg0KPGJyPg0KwqAjIEFkZCBhbnkgcmVx
dWlyZWQgZGV2aWNlIHRyZWUgY29tcGlsZXIgZmxhZ3MgaGVyZTxicj4NCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9kdHMvYXNwZWVkLWc1LWV2Yi48d2JyPmR0cyBiL2FyY2gvYXJtL2R0cy9hc3BlZWQt
ZzUtZXZiLjx3YnI+ZHRzPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAw
MDAwLi45NWRjNzdhPGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL2FyY2gvYXJtL2R0cy9h
c3BlZWQtZzUtZXZiLjx3YnI+ZHRzPGJyPg0KQEAgLTAsMCArMSwyOCBAQDxicj4NCisvZHRzLXYx
Lzs8YnI+DQorPGJyPg0KKyNpbmNsdWRlICZxdW90O2FzcGVlZC1nNS5kdHNpJnF1b3Q7PGJyPg0K
Kzxicj4NCisvIHs8YnI+DQorwqAgwqAgwqAgwqBtZW1vcnkgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7bWVtb3J5JnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDgwMDAwMDAwIDB4MjAwMDAwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFsaWFzZXMgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzEgPSAmYW1wO2kyYzA7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaTJjNCA9ICZhbXA7aTJjMzs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpMmM4ID0gJmFtcDtpMmM3Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KK307PGJyPg0KKzxi
cj4NCismYW1wO2kyYzAgezxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVv
dDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO2kyYzMgezxicj4NCivCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJyPg0KKzxicj4NCismYW1wO2kyYzcg
ezxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK307PGJy
Pg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9hc3BlZWQtZzUuZHRzaSBiL2FyY2gvYXJtL2R0
cy9hc3BlZWQtZzUuZHRzaTxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAw
MDAwMC4uZjFmZjllMzxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9hcmNoL2FybS9kdHMv
YXNwZWVkLWc1LmR0c2k8YnI+DQpAQCAtMCwwICsxLDM5MiBAQDxicj4NCisjaW5jbHVkZSAmbHQ7
ZHQtYmluZGluZ3MvaW50ZXJydXB0LTx3YnI+Y29udHJvbGxlci9hcm0tZ2ljLmgmZ3Q7PGJyPg0K
Kzxicj4NCisjaW5jbHVkZSAmcXVvdDtza2VsZXRvbi5kdHNpJnF1b3Q7PGJyPg0KKzxicj4NCisv
IHs8YnI+DQorwqAgwqAgwqAgwqBtb2RlbCA9ICZxdW90O0FzcGVlZCBCTUMmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwJnF1b3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoGludGVycnVwdC1wYXJl
bnQgPSAmbHQ7JmFtcDt2aWMmZ3Q7Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjcHVzIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1QDAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0sYXJtMTE3NiZxdW90
OywgJnF1b3Q7YXJtLGFybXY2JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRldmljZV90eXBlID0gJnF1b3Q7Y3B1JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoGFoYiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O3NpbXBsZS1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3Mt
Y2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2Vs
bHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2VzOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5tdXg6IHBpbm11eEAxZTZlMjAwMCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnPSAmbHQ7MHgxZTZl
MjAwMCAweDEwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjUwMC1waW5jdHJsJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHZpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMWU2YzAwODAgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjUw
MC12aWMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB2YWxpZC1zb3VyY2VzID0gJmx0OzB4ZmVmZmY3ZmYgMHgwODA3ZmZm
ZiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MWU2YzAwODAgMHg4MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFjMDogZXRoZXJuZXRAMWU2NjAwMDAg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDtmYXJhZGF5LGZ0Z21hYzEwMCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTY2MDAwMCAweDE4MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsyJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQtZzUtaW50ZXJmYWNl
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLWh3LWNoZWNrc3Vt
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hYzE6IGV0aGVybmV0QDFlNjgwMDAwIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
ZmFyYWRheSxmdGdtYWMxMDAmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVnID0gJmx0OzB4MWU2ODAwMDAgMHgxODAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MyZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXNwZWVkLWc1LWludGVyZmFjZTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1ody1jaGVja3N1bTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNh
YmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcGIgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxz
ID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJh
bmdlczs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xr
X2Nsa2luOiBjbGtfY2xraW5AMWU2ZTIwNzAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7YXNwZWVkLGc1LWNsa2luLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4
MDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsa19ocGxsOiBjbGtf
aHBsbEAxZTZlMjAyNCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3Bl
ZWQsZzUtaHBsbC1jbG9jayZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTZlMjAyNCAweDQmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZs
dDsmYW1wO2Nsa19jbGtpbiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xrX2FoYjogY2xrX2FoYkAxZTZlMjA3MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDthc3BlZWQsZzUtYWhiLWNsb2NrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDcwIDB4NCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2tzID0gJmx0OyZhbXA7Y2xrX2hwbGwmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsa19hcGI6IGNsa19hcGJAMWU2ZTIwMDggezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGc1LWFwYi1jbG9jayZxdW90Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTZl
MjAwOCAweDQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19ocGxsJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbGtfdWFydDogY2xrX3VhcnRAMWU2ZTIwMDggezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxs
cyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLHVhcnQtY2xvY2smcXVvdDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzB4MWU2ZTIwMmMgMHg0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzcmFtQDFlNzIwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bW1pby1zcmFtJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsw
eDFlNzIwMDAwIDB4OTAwMCZndDs7wqAgwqAgwqAgLy8gMzZLPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdGltZXI6IHRpbWVyQDFlNzgyMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNw
ZWVkLGFzdDI1MDAtdGltZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3ODIwMDAgMHg5MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8gVGhlIG1v
eGFydF90aW1lciBkcml2ZXIgcmVnaXN0ZXJzIG9ubHkgb25lPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLy8gaW50ZXJydXB0IGFuZCBhc3N1bWVz
IGl0JiMzOTtzIGZvciB0aW1lciAxPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLy9pbnRlcnJ1cHRzID0gJmx0OzE2IDE3IDE4IDM1IDM2IDM3IDM4
IDM5Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpbnRlcnJ1cHRzID0gJmx0OzE2Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfYXBiJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpYnQ6IGlidEAxZTc4OTE0MCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O2FzcGVlZCxidC1ob3N0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg5MTQwIDB4MTgm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7OCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgd2R0MTogd2R0QDFlNzg1MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtd2R0
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDFlNzg1MDAwIDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHdkdDI6IHdkdEAxZTc4NTAyMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxh
c3QyNTAwLXdkdCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4NTAyMCAweDFjJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3ZHQzOiB3
ZHRAMWU3ODUwNDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsd2R0JnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
Nzg1MDc0IDB4MWMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW86IGdwaW9AMWU3ODAwMDAgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjZ3Bpby1jZWxscyA9ICZsdDsy
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Z3Bpby1jb250cm9sbGVyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtZ3BpbyZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0g
Jmx0OzB4MWU3ODAwMDAgMHgxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0cyA9ICZsdDsyMCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDE6IHNlcmlhbEAxZTc4MzAwMCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzgzMDAwIDB4MTAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLXNoaWZ0
ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX3VhcnQm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDI6IHNlcmlhbEAxZTc4ZDAwMCB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzhkMDAwIDB4MTAwMCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLXNoaWZ0
ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191YXJ0
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVhcnQzOiBzZXJpYWxAMWU3OGUwMDAgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTc4ZTAwMCAweDEwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlm
dCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzMzJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFy
dCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0NDogc2VyaWFsQDFlNzhmMDAwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxl
ID0gJnF1b3Q7bnMxNjU1MGEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3OGYwMDAgMHgxMDAwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hp
ZnQgPSAmbHQ7MiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDszNCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y2xrX3Vh
cnQmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG5vLWxvb3BiYWNrLXRlc3Q7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFydDU6IHNlcmlhbEAxZTc4NDAwMCB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O25zMTY1NTBhJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNzg0MDAwIDB4MTAwMCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLXNo
aWZ0ID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa191
YXJ0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjdXJyZW50LXNwZWVkID0gJmx0OzM4NDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1sb29wYmFjay10ZXN0Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZx
dW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVh
cnQ2OiBzZXJpYWxAMWU3ODcwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtuczE2NTUwYSZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAm
bHQ7MHgxZTc4NzAwMCAweDEwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZy1zaGlmdCA9ICZsdDsyJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0
OzEwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfdWFydCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbm8tbG9vcGJhY2stdGVzdDs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
MmM6IGkyY0AxZTc4YTAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7
MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2Fz
cGVlZCxhc3QyNTAwLWkyYy08d2JyPmNvbnRyb2xsZXImcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MWU3OGEwMDAg
MHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmFuZ2VzID0gJmx0OzAgMHgxZTc4YTAwMCAweDEwMDAmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7
MTImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrcyA9ICZsdDsmYW1wO2Nsa19hcGImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1ZmZlciA9ICZsdDsweDFlNzhhMjAwIDB4
MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrLXJhbmdlczs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMDogaTJjLWJ1c0A0MCB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMg
PSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDAgMHg0MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVz
ID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2kyYyZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnVmZmVyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGkyYzE6IGkyYy1idXNAODAgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNl
bGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDgwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3Bl
ZWQsYXN0MjUwMC1pMmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGJ1ZmZlciA9ICZsdDsweDEwIDB4MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzI6IGkyYy1idXNAYzAgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweEMwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDthc3BlZWQsYXN0MjUwMC1pMmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsy
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzIm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJ1ZmZlciA9ICZsdDsweDIwIDB4MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzM6IGkyYy1idXNA
MTAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1j
ZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMDAgMHg0MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxhc3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnVzID0gJmx0OzMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVy
cnVwdHMgPSAmbHQ7MyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVmZmVyID0gJmx0OzB4MzAgMHgxMCZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aTJjNDogaTJjLWJ1c0AxNDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDE0MCAw
eDQwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtaTJjLWJ1
cyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBidXMgPSAmbHQ7NCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5
ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs0Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidWZmZXIgPSAmbHQ7MHg0
MCAweDEwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpMmM1OiBpMmMtYnVzQDE4MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMg
PSAmbHQ7MSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4MTgwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQs
YXN0MjUwMC1pMmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDs1Jmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
bG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzUmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1
ZmZlciA9ICZsdDsweDUwIDB4MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzY6IGkyYy1idXNAMWMwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
YWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxQzAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O2FzcGVlZCxhc3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzYm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7NiZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnVmZmVyID0gJmx0OzB4NjAgMHgxMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjNzogaTJjLWJ1c0Az
MDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNl
bGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDMwMCAweDQwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtaTJjLWJ1cyZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBidXMgPSAmbHQ7NyZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzEwMDAwMCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJy
dXB0cyA9ICZsdDs3Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidWZmZXIgPSAmbHQ7MHg3MCAweDEwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
MmM4OiBpMmMtYnVzQDM0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MzQwIDB4
NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjUwMC1pMmMtYnVz
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDs4Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kg
PSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzgmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1ZmZlciA9ICZsdDsweDgw
IDB4MTAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGkyYzk6IGkyYy1idXNAMzgwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9
ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcg
PSAmbHQ7MHgzODAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FzcGVlZCxh
c3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzkmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNs
b2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rp
c2FibGVkJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7OSZndDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVm
ZmVyID0gJmx0OzB4OTAgMHgxMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTA6IGkyYy1idXNAM2MwIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
YWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgzYzAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9
ICZxdW90O2FzcGVlZCxhc3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzEw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEw
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBidWZmZXIgPSAmbHQ7MHhhMCAweDEwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMxMTogaTJjLWJ1
c0A0MDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXpl
LWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwMCAweDQwJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtaTJjLWJ1cyZxdW90Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBidXMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsxMDAw
MDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVycnVwdHMgPSAmbHQ7MTEmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1ZmZlciA9ICZsdDsweGIwIDB4MTAmZ3Q7
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGkyYzEyOiBpMmMtYnVzQDQ0MCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
NDQwIDB4NDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthc3BlZWQsYXN0MjUwMC1p
MmMtYnVzJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stZnJl
cXVlbmN5ID0gJmx0OzEwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQm
cXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVmZmVyID0g
Jmx0OzB4YzAgMHgxMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjMTM6IGkyYy1idXNANDgwIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVz
cy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHg0ODAgMHg0MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FzcGVlZCxhc3QyNTAwLWkyYy1idXMmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnVzID0gJmx0OzEzJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMg
PSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzEzJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBidWZmZXIgPSAmbHQ7MHhkMCAweDEwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KK8KgIMKgIMKgIMKgfTs8YnI+DQorfTs8YnI+DQpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vaW5jbHVkZS9hc20vYXJjaC08d2JyPmFzcGVlZC9hc3Rfc2N1LmggYi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL2FzdF9zY3UuaDxicj4NCmluZGV4IGQyNDg0MTYuLjgw
ZWJkNmYgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJjaC08d2JyPmFz
cGVlZC9hc3Rfc2N1Lmg8YnI+DQorKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+
YXNwZWVkL2FzdF9zY3UuaDxicj4NCkBAIC0zOCw2ICszOCw3IEBAIGV4dGVybiB2b2lkIGFzdF9z
Y3VfZ2V0X3dob19pbml0X2RyYW0oPHdicj52b2lkKTs8YnI+DQrCoGV4dGVybiB1MzIgYXN0X2dl
dF9jbGtfc291cmNlKHZvaWQpOzxicj4NCsKgZXh0ZXJuIHUzMiBhc3RfZ2V0X2hfcGxsX2Nsayh2
b2lkKTs8YnI+DQrCoGV4dGVybiB1MzIgYXN0X2dldF9haGJjbGsodm9pZCk7PGJyPg0KK2V4dGVy
biB1MzIgYXN0X2dldF9hcGJjbGsodm9pZCk7PGJyPg0KPGJyPg0KwqBleHRlcm4gdTMyIGFzdF9z
Y3VfZ2V0X3ZnYV9tZW1zaXplKHZvaWQpOzxicj4NCjxicj4NCkBAIC00NSw0ICs0Niw5IEBAIGV4
dGVybiB2b2lkIGFzdF9zY3VfaW5pdF9ldGgodTggbnVtKTs8YnI+DQrCoGV4dGVybiB2b2lkIGFz
dF9zY3VfbXVsdGlfZnVuY19ldGgodTggbnVtKTs8YnI+DQrCoGV4dGVybiB2b2lkIGFzdF9zY3Vf
bXVsdGlfZnVuY19yb21jcyh1OCBudW0pOzxicj4NCjxicj4NCisvKiBFbmFibGUgSTJDIGNvbnRy
b2xsZXIgYW5kIHBpbnMgZm9yIGEgcGFydGljdWxhciBkZXZpY2UuPGJyPg0KKyAqIERldmljZSBu
dW1iZXJpbmcgc3RhcnRzIGF0IDE8YnI+DQorICovPGJyPg0KK2V4dGVybiB2b2lkIGFzdF9zY3Vf
ZW5hYmxlX2kyYyh1OCBudW0pOzxicj4NCis8YnI+DQrCoCNlbmRpZjxicj4NCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL3JlZ3Mtc2N1LmggYi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9hcmNoLTx3YnI+YXNwZWVkL3JlZ3Mtc2N1Lmg8YnI+DQppbmRleCBi
ODlkZjgyLi45MmNlODRhIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
Y2gtPHdicj5hc3BlZWQvcmVncy1zY3UuaDxicj4NCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2FyY2gtPHdicj5hc3BlZWQvcmVncy1zY3UuaDxicj4NCkBAIC0xMCw4ICsxMCw4IEBAPGJyPg0K
wqAgKsKgIMKgIDEuIDIwMTIvMTIvMjkgUnlhbiBDaGVuIENyZWF0ZTxicj4NCsKgICo8YnI+DQrC
oCoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjx3YnI+KioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqPHdicj4qKioqKioqKioqKioqKioqKioqKi88YnI+DQotI2lmbmRlZiBfX0FTVF9T
Q1VfSDxicj4NCi0jZGVmaW5lIF9fQVNUX1NDVV9IwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAxPGJyPg0KKyNpZm5kZWYgX19BU1RfUkVHU19TQ1VfSDxicj4NCisjZGVmaW5lIF9fQVNU
X1JFR1NfU0NVX0jCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDE8YnI+DQo8YnI+DQrC
oCNpbmNsdWRlICZsdDthc20vYXJjaC9hc3BlZWQuaCZndDs8YnI+DQo8YnI+DQpAQCAtODMwLDQ5
ICs4MzAsNTAgQEA8YnI+DQrCoC8qIEFTVF9TQ1VfRlVOX1BJTl9DVFJMNcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgMHg5MCAtIE11bHRpLWZ1bmN0aW9uIFBpbiBDb250cm9sIzUgKi88YnI+DQrCoCNk
ZWZpbmUgU0NVX0ZVTl9QSU5fU1BJQ1MxwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7
IDMxKTxicj4NCsKgI2RlZmluZSBTQ1VfRlVOX1BJTl9MUENfUExVU8KgIMKgIMKgIMKgIMKgIMKg
KDB4MSAmbHQ7Jmx0OyAzMCk8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJTl9VU0IyMF9IT1NUwqAg
wqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDI5KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX1VT
QjExX1BPUlQ0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyOCk8YnI+DQot
I2RlZmluZSBTQ1VfRlVDX1BJTl9JMkMxNMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZs
dDsgMjcpPGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5fSTJDMTPCoCDCoCDCoCDCoCDCoCDCoCDC
oCAoMHgxICZsdDsmbHQ7IDI2KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX0kyQzEywqAgwqAg
wqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyNSk8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJ
Tl9JMkMxMcKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMjQpPGJyPg0KLSNkZWZp
bmUgU0NVX0ZVQ19QSU5fSTJDMTDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDIz
KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX0kyQznCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgw
eDEgJmx0OyZsdDsgMjIpPGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5fSTJDOMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAyMSk8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJTl9J
MkM3wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDIwKTxicj4NCi0jZGVmaW5l
IFNDVV9GVUNfUElOX0kyQzbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMTkp
PGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5fSTJDNcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4
MSAmbHQ7Jmx0OyAxOCk8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJTl9JMkM0wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDE3KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX0ky
QzPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMTYpPGJyPg0KLSNkZWZpbmUg
U0NVX0ZVQ19QSU5fTUlJMl9SWF9EV05fRElTwqAgwqAgKDB4MSAmbHQ7Jmx0OyAxNSk8YnI+DQot
I2RlZmluZSBTQ1VfRlVDX1BJTl9NSUkyX1RYX0RXTl9ESVPCoCDCoCAoMHgxICZsdDsmbHQ7IDE0
KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX01JSTFfUlhfRFdOX0RJU8KgIMKgICgweDEgJmx0
OyZsdDsgMTMpPGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5fTUlJMV9UWF9EV05fRElTwqAgwqAg
KDB4MSAmbHQ7Jmx0OyAxMik8YnI+DQotPGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5fTUlJMl9U
WF9EUklWKHgpwqAgwqAgKHggJmx0OyZsdDsgMTApPGJyPg0KLSNkZWZpbmUgU0NVX0ZVQ19QSU5f
TUlJMl9UWF9EUklWX01BU0vCoCAoMHgzICZsdDsmbHQ7IDEwKTxicj4NCi0jZGVmaW5lIFNDVV9G
VUNfUElOX01JSTFfVFhfRFJJVih4KcKgIMKgICh4ICZsdDsmbHQ7IDgpPGJyPg0KLSNkZWZpbmUg
U0NVX0ZVQ19QSU5fTUlJMV9UWF9EUklWX01BU0vCoCAoMHgzICZsdDsmbHQ7IDgpPGJyPg0KKyNk
ZWZpbmUgU0NVX0ZVTl9QSU5fVVNCMjBfSE9TVMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAy
OSk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9VU0IxMV9QT1JUNMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICgweDEgJmx0OyZsdDsgMjgpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fSTJDMTTC
oCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDI3KTxicj4NCisjZGVmaW5lIFNDVV9G
VU5fUElOX0kyQzEzwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyNik8YnI+DQor
I2RlZmluZSBTQ1VfRlVOX1BJTl9JMkMxMsKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZs
dDsgMjUpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fSTJDMTHCoCDCoCDCoCDCoCDCoCDCoCDC
oCAoMHgxICZsdDsmbHQ7IDI0KTxicj4NCisjZGVmaW5lIFNDVV9GVU5fUElOX0kyQzEwwqAgwqAg
wqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyMyk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJ
Tl9JMkM5wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDIyKTxicj4NCisjZGVm
aW5lIFNDVV9GVU5fUElOX0kyQzjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsg
MjEpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fSTJDN8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
KDB4MSAmbHQ7Jmx0OyAyMCk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9JMkM2wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDE5KTxicj4NCisjZGVmaW5lIFNDVV9GVU5fUElO
X0kyQzXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMTgpPGJyPg0KKyNkZWZp
bmUgU0NVX0ZVTl9QSU5fSTJDNMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAx
Nyk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9JMkMzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAo
MHgxICZsdDsmbHQ7IDE2KTxicj4NCisjZGVmaW5lIFNDVV9GVU5fUElOX0kyQyhuKcKgIMKgIMKg
IMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAoMTYgKyAobikgLSAzKSk8YnI+DQorI2RlZmluZSBT
Q1VfRlVOX1BJTl9NSUkyX1JYX0RXTl9ESVPCoCDCoCAoMHgxICZsdDsmbHQ7IDE1KTxicj4NCisj
ZGVmaW5lIFNDVV9GVU5fUElOX01JSTJfVFhfRFdOX0RJU8KgIMKgICgweDEgJmx0OyZsdDsgMTQp
PGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fTUlJMV9SWF9EV05fRElTwqAgwqAgKDB4MSAmbHQ7
Jmx0OyAxMyk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9NSUkxX1RYX0RXTl9ESVPCoCDCoCAo
MHgxICZsdDsmbHQ7IDEyKTxicj4NCis8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9NSUkyX1RY
X0RSSVYoeCnCoCDCoCAoeCAmbHQ7Jmx0OyAxMCk8YnI+DQorI2RlZmluZSBTQ1VfRlVOX1BJTl9N
SUkyX1RYX0RSSVZfTUFTS8KgICgweDMgJmx0OyZsdDsgMTApPGJyPg0KKyNkZWZpbmUgU0NVX0ZV
Tl9QSU5fTUlJMV9UWF9EUklWKHgpwqAgwqAgKHggJmx0OyZsdDsgOCk8YnI+DQorI2RlZmluZSBT
Q1VfRlVOX1BJTl9NSUkxX1RYX0RSSVZfTUFTS8KgICgweDMgJmx0OyZsdDsgOCk8YnI+DQo8YnI+
DQrCoCNkZWZpbmUgTUlJX05PUk1BTF9EUklWwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgMHgwPGJyPg0KwqAjZGVmaW5lIE1JSV9ISUdIX0RSSVbCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAweDI8YnI+DQo8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJTl9VQVJUNsKgIMKgIMKg
IMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgNyk8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJTl9S
T01fMTZCSVTCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDYpPGJyPg0KLSNkZWZpbmUgU0NV
X0ZVQ19QSU5fRElHSV9WX09VVCh4KcKgIMKgIMKgICh4KTxicj4NCi0jZGVmaW5lIFNDVV9GVUNf
UElOX0RJR0lfVl9PVVRfTUFTS8KgIMKgICgweDMpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5f
VUFSVDbCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDcpPGJyPg0KKyNkZWZpbmUg
U0NVX0ZVTl9QSU5fUk9NXzE2QklUwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyA2KTxicj4N
CisjZGVmaW5lIFNDVV9GVU5fUElOX0RJR0lfVl9PVVQoeCnCoCDCoCDCoCAoeCk8YnI+DQorI2Rl
ZmluZSBTQ1VfRlVOX1BJTl9ESUdJX1ZfT1VUX01BU0vCoCDCoCAoMHgzKTxicj4NCjxicj4NCsKg
I2RlZmluZSBWSURFT19ESVNBQkxFwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwPGJyPg0K
wqAjZGVmaW5lIFZJREVPXzEyQklUU8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgxPGJy
Pg0KwqAjZGVmaW5lIFZJREVPXzI0QklUU8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgy
PGJyPg0KwqAvLyNkZWZpbmUgVklERU9fRElTQUJMRcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIDB4Mzxicj4NCjxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX1VTQjExX1BPUlQy
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAzKTxicj4NCi0jZGVmaW5lIFND
VV9GVUNfUElOX1NEMV84QklUwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDMpPGJyPg0K
KyNkZWZpbmUgU0NVX0ZVTl9QSU5fVVNCMTFfUE9SVDLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAo
MHgxICZsdDsmbHQ7IDMpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fU0QxXzhCSVTCoCDCoCDC
oCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMyk8YnI+DQo8YnI+DQotI2RlZmluZSBTQ1VfRlVDX1BJ
Tl9NQUMxX01ESU/CoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDIpPGJyPg0KLSNkZWZpbmUg
U0NVX0ZVQ19QSU5fU0QywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAm
bHQ7Jmx0OyAxKTxicj4NCi0jZGVmaW5lIFNDVV9GVUNfUElOX1NEMcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMCk8YnI+DQorI2RlZmluZSBTQ1VfRlVO
X1BJTl9NQUMxX01ESU/CoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDIpPGJyPg0KKyNkZWZp
bmUgU0NVX0ZVTl9QSU5fU0QywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4
MSAmbHQ7Jmx0OyAxKTxicj4NCisjZGVmaW5lIFNDVV9GVU5fUElOX1NEMcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMCk8YnI+DQo8YnI+DQo8YnI+DQrC
oC8qIEFTVF9TQ1VfRlVOX1BJTl9DVFJMNsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHg5NCAtIE11
bHRpLWZ1bmN0aW9uIFBpbiBDb250cm9sIzYqLzxicj4NCkBAIC05MTQsNiArOTE1LDExIEBAPGJy
Pg0KwqAjZGVmaW5lIFNDVV9GVU5fUElOX1JPTUE0wqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAm
bHQ7Jmx0OyAxOCk8YnI+DQrCoCNkZWZpbmUgU0NVX0ZVTl9QSU5fUk9NQTPCoCDCoCDCoCDCoCDC
oCDCoCDCoCAoMHgxICZsdDsmbHQ7IDE3KTxicj4NCsKgI2RlZmluZSBTQ1VfRlVOX1BJTl9ST01B
MsKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMTYpPGJyPg0KKy8qIEFTVDI1MDAg
b25seSAqLzxicj4NCisjZGVmaW5lIFNDVV9GVU5fUElOX1NEQTLCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCgweDEgJmx0OyZsdDsgMTUpPGJyPg0KKyNkZWZpbmUgU0NVX0ZVTl9QSU5fU0NMMsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAxNCk8YnI+DQorI2RlZmluZSBTQ1VfRlVO
X1BJTl9TREExwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDEzKTxicj4NCisj
ZGVmaW5lIFNDVV9GVU5fUElOX1NDTDHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZs
dDsgMTIpPGJyPg0KPGJyPg0KwqAvKiBBU1RfU0NVX0ZVTl9QSU5fQ1RSTDnCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDB4QTggLSBNdWx0aS1mdW5jdGlvbiBQaW4gQ29udHJvbCM5ICovPGJyPg0KwqAj
ZGVmaW5lIFNDVV9GVU5fUElOX1JPTUEyMcKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0
OyAzKTxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWFzcGVlZC9hc3QtPHdicj5zY3Uu
YyBiL2FyY2gvYXJtL21hY2gtYXNwZWVkL2FzdC08d2JyPnNjdS5jPGJyPg0KaW5kZXggMGNjMGQ2
Ny4uMzFjZWE2MCAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9tYWNoLWFzcGVlZC9hc3QtPHdi
cj5zY3UuYzxicj4NCisrKyBiL2FyY2gvYXJtL21hY2gtYXNwZWVkL2FzdC08d2JyPnNjdS5jPGJy
Pg0KQEAgLTI1MCw2ICsyNTAsNyBAQCB1MzIgYXN0X2dldF9haGJjbGsodm9pZCk8YnI+DQrCoCDC
oCDCoCDCoCByZXR1cm4gKChocGxsIC8gYXhpX2RpdikgLyBhaGJfZGl2KTs8YnI+DQrCoH08YnI+
DQo8YnI+DQorPGJyPg0KwqAjZWxzZSAvKiAhIEFTVF9TT0NfRzUgKi88YnI+DQo8YnI+DQrCoHUz
MiBhc3RfZ2V0X2hfcGxsX2Nsayh2b2lkKTxicj4NCkBAIC0zMTgsNiArMzE5LDE0IEBAIHUzMiBh
c3RfZ2V0X2FoYmNsayh2b2lkKTxicj4NCjxicj4NCsKgI2VuZGlmIC8qIEFTVF9TT0NfRzUgKi88
YnI+DQo8YnI+DQordTMyIGFzdF9nZXRfYXBiY2xrKHZvaWQpPGJyPg0KK3s8YnI+DQorwqAgwqAg
wqAgwqB1MzIgaF9wbGwgPSBhc3RfZ2V0X2hfcGxsX2NsaygpOzxicj4NCivCoCDCoCDCoCDCoHUz
MiBhcGJfZGl2ID0gU0NVX0dFVF9QQ0xLX0RJVihhc3Rfc2N1X3JlYWQoPHdicj5BU1RfU0NVX0NM
S19TRUwpKTs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gaF9wbGwgLyBhcGJfZGl2Ozxicj4NCit9
PGJyPg0KKzxicj4NCis8YnI+DQrCoHZvaWQgYXN0X3NjdV9zaG93X3N5c3RlbV9pbmZvKHZvaWQp
PGJyPg0KwqB7PGJyPg0KPGJyPg0KQEAgLTM5NCw3ICs0MDMsNyBAQCB2b2lkIGFzdF9zY3VfbXVs
dGlfZnVuY19ldGgodTggbnVtKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIEFTVF9TQ1VfRlVOX1BJTl9DVFJMMSk7PGJyPg0KPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgYXN0X3NjdV93cml0ZShhc3Rfc2N1X3JlYWQoPHdicj5BU1RfU0NVX0ZV
Tl9QSU5fQ1RSTDUpIHw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBTQ1VfRlVDX1BJTl9NQUMxX01ESU8sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU0NVX0ZVTl9QSU5fTUFDMV9NRElPLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEFTVF9TQ1VfRlVOX1BJTl9D
VFJMNSk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KQEAg
LTQ5NiwzICs1MDUsMjMgQEAgdm9pZCBhc3Rfc2N1X2dldF93aG9faW5pdF9kcmFtKDx3YnI+dm9p
ZCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQrCoCDCoCDCoCDCoCB9
PGJyPg0KwqB9PGJyPg0KKzxicj4NCit2b2lkIGFzdF9zY3VfZW5hYmxlX2kyYyh1OCBudW0pPGJy
Pg0KK3s8YnI+DQorwqAgwqAgwqAgwqAvKiBFbmFibGUgSTJDIENvbnRyb2xsZXJzICovPGJyPg0K
K8KgIMKgIMKgIMKgY2xyYml0c19sZTMyKEFTVF9TQ1VfQkFTRSArIEFTVF9TQ1VfUkVTRVQsIFND
VV9SRVNFVF9JMkMpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAobnVtICZsdDsgMykgezxi
cj4NCisjaWZkZWYgQVNUX1NPQ19HNTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChu
dW0gPT0gMSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNldGJp
dHNfbGUzMihBU1RfU0NVX0JBU0UgKyBBU1RfU0NVX0ZVTl9QSU5fQ1RSTDgsPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIFNDVV9GVU5fUElOX1NEQTEgfCBTQ1VfRlVOX1BJTl9TQ0wxKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9IGVsc2Ugezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHNldGJpdHNfbGUzMihBU1RfU0NVX0JBU0UgKyBBU1RfU0NVX0ZVTl9QSU5f
Q1RSTDgsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNDVV9GVU5fUElOX1NEQTIgfCBTQ1VfRlVOX1BJ
Tl9TQ0wyKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKyNlbmRpZjxicj4N
CivCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2V0Yml0
c19sZTMyKEFTVF9TQ1VfQkFTRSArIEFTVF9TQ1VfRlVOX1BJTl9DVFJMNSwgU0NVX0ZVTl9QSU5f
STJDKG51bSkpOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorfTxicj4NCmRpZmYgLS1naXQgYS9i
b2FyZC9hc3BlZWQvYXN0LWc1L2FzdC1nNS5jIGIvYm9hcmQvYXNwZWVkL2FzdC1nNS9hc3QtZzUu
Yzxicj4NCmluZGV4IDgxZWE4OGEuLjAzY2UwZGUgMTAwNjQ0PGJyPg0KLS0tIGEvYm9hcmQvYXNw
ZWVkL2FzdC1nNS9hc3QtZzUuYzxicj4NCisrKyBiL2JvYXJkL2FzcGVlZC9hc3QtZzUvYXN0LWc1
LmM8YnI+DQpAQCAtMzYsNiArMzYsNyBAQDxicj4NCsKgI2luY2x1ZGUgJmx0O2NvbW1vbi5oJmd0
Ozxicj4NCsKgI2luY2x1ZGUgJmx0O25ldGRldi5oJmd0Ozxicj4NCsKgI2luY2x1ZGUgJmx0O2Fz
bS9hcmNoL2FzdF9zY3UuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2FzbS9hcmNoL3JlZ3Mtc2N1
LmgmZ3Q7PGJyPg0KwqAjaW5jbHVkZSAmbHQ7YXNtL2FyY2gvYXN0LXNkbWMuaCZndDs8YnI+DQrC
oCNpbmNsdWRlICZsdDthc20vaW8uaCZndDs8YnI+DQo8YnI+DQpAQCAtNTIsNyArNTMsNiBAQCBp
bnQgYm9hcmRfaW5pdCh2b2lkKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIC8qIGFkcmVzcyBv
ZiBib290IHBhcmFtZXRlcnMgKi88YnI+DQrCoCDCoCDCoCDCoCBnZC0mZ3Q7YmQtJmd0O2JpX2Jv
b3RfcGFyYW1zID0gQ09ORklHX1NZU19TRFJBTV9CQVNFICsgMHgxMDA7PGJyPg0KLcKgIMKgIMKg
IMKgZ2QtJmd0O2ZsYWdzID0gMDs8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gMDs8YnI+DQrCoH08
YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvY29uZmlncy9hc3RfZzVfZGVmY29uZmlnIGIvY29uZmln
cy9hc3RfZzVfZGVmY29uZmlnPGJyPg0KaW5kZXggYjVmMmIyNC4uMjBiMDJhMyAxMDA2NDQ8YnI+
DQotLS0gYS9jb25maWdzL2FzdF9nNV9kZWZjb25maWc8YnI+DQorKysgYi9jb25maWdzL2FzdF9n
NV9kZWZjb25maWc8YnI+DQpAQCAtMSw0ICsxLDUgQEA8YnI+DQrCoENPTkZJR19BUk09eTxicj4N
CitDT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRT0mcXVvdDs8d2JyPmFzcGVlZC1nNSZxdW90Ozxi
cj4NCsKgQ09ORklHX1RBUkdFVF9BU1RfRzU9eTxicj4NCsKgQ09ORklHX1NQSV9GTEFTSD15PGJy
Pg0KwqBDT05GSUdfU1lTX05TMTY1NTA9eTxicj4NCkBAIC02LDQgKzcsNSBAQCBDT05GSUdfU1lT
X1BST01QVD0mcXVvdDthc3QjICZxdW90Ozxicj4NCsKgQ09ORklHX0NNRF9TQVZFRU5WPXk8YnI+
DQrCoENPTkZJR19DTURfRkxBU0g9eTxicj4NCsKgQ09ORklHX0NNRF9QSU5HPXk8YnI+DQotQ09O
RklHX0NNRF9ESENQPXk8YnI+DQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGU8YnI+DQorQ09O
RklHX0NNRF9ESENQPXk8YnI+DQorQ09ORklHX1NZU19JMkNfQVNQRUVEPXk8YnI+DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvS2NvbmZpZyBiL2RyaXZlcnMvaTJjL0tjb25maWc8YnI+DQppbmRl
eCA5MzI0YzZjLi42NTAxZTkxIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvaTJjL0tjb25maWc8
YnI+DQorKysgYi9kcml2ZXJzL2kyYy9LY29uZmlnPGJyPg0KQEAgLTY1LDYgKzY1LDEyIEBAIGNv
bmZpZyBTWVNfSTJDX0NBREVOQ0U8YnI+DQrCoCDCoCDCoCDCoCDCoCBTYXkgeWVzIGhlcmUgdG8g
c2VsZWN0IENhZGVuY2UgSTJDIEhvc3QgQ29udHJvbGxlci4gVGhpcyBjb250cm9sbGVyIGlzPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgZS5nLiB1c2VkIGJ5IFhpbGlueCBaeW5xLjxicj4NCjxicj4NCitj
b25maWcgU1lTX0kyQ19BU1Q8YnI+DQorwqAgwqAgwqAgwqB0cmlzdGF0ZSAmcXVvdDtBc3BlZWQg
STJDIENvbnRyb2xsZXImcXVvdDs8YnI+DQorwqAgwqAgwqAgwqBkZXBlbmRzIG9uIERNX0kyQzxi
cj4NCivCoCDCoCDCoCDCoGhlbHA8YnI+DQorwqAgwqAgwqAgwqAgwqBTYXkgeWVzIGhlcmUgdG8g
c2VsZWN0IEFzcGVlZCBJMkMgSG9zdCBDb250cm9sbGVyLjxicj4NCis8YnI+DQrCoGNvbmZpZyBT
WVNfSTJDX0lOVEVMPGJyPg0KwqAgwqAgwqAgwqAgYm9vbCAmcXVvdDtJbnRlbCBJMkMvU01CVVMg
ZHJpdmVyJnF1b3Q7PGJyPg0KwqAgwqAgwqAgwqAgZGVwZW5kcyBvbiBETV9JMkM8YnI+DQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pMmMvTWFrZWZpbGUgYi9kcml2ZXJzL2kyYy9NYWtlZmlsZTxicj4N
CmluZGV4IDE2NzQyNGQuLjg5ZTA0NmUgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9pMmMvTWFr
ZWZpbGU8YnI+DQorKysgYi9kcml2ZXJzL2kyYy9NYWtlZmlsZTxicj4NCkBAIC0xNiw2ICsxNiw3
IEBAIG9iai0kKENPTkZJR19QQ0E5NTY0X0kyQykgKz0gcGNhOTU2NF9pMmMubzxicj4NCsKgb2Jq
LSQoQ09ORklHX1RTSTEwOF9JMkMpICs9IHRzaTEwOF9pMmMubzxicj4NCsKgb2JqLSQoQ09ORklH
X1NIX1NINzczNF9JMkMpICs9IHNoX3NoNzczNF9pMmMubzxicj4NCsKgb2JqLSQoQ09ORklHX1NZ
U19JMkMpICs9IGkyY19jb3JlLm88YnI+DQorb2JqLSQoQ09ORklHX1NZU19JMkNfQVNUKSArPSBh
c3RfaTJjLm88YnI+DQrCoG9iai0kKENPTkZJR19TWVNfSTJDX0NBREVOQ0UpICs9IGkyYy1jZG5z
Lm88YnI+DQrCoG9iai0kKENPTkZJR19TWVNfSTJDX0RBVklOQ0kpICs9IGRhdmluY2lfaTJjLm88
YnI+DQrCoG9iai0kKENPTkZJR19TWVNfSTJDX0RXKSArPSBkZXNpZ253YXJlX2kyYy5vPGJyPg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2FzdF9pMmMuYyBiL2RyaXZlcnMvaTJjL2FzdF9pMmMu
Yzxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAwMDAwMC4uMTQ0YmYwMjxi
cj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2kyYy9hc3RfaTJjLmM8YnI+DQpA
QCAtMCwwICsxLDMwNiBAQDxicj4NCisvKjxicj4NCisgKiBDb3B5cmlnaHQgKEMpIDIwMTYgR29v
Z2xlLCBJbmM8YnI+DQorICo8YnI+DQorICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6wqAgwqAg
R1BMLTIuMCs8YnI+DQorICovPGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7Y29tbW9uLmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtkbS5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7ZmR0ZGVjLmgm
Z3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtpMmMuaCZndDs8YnI+DQorPGJyPg0KKyNpbmNsdWRlICZs
dDthc20vYXJjaC9hc3Rfc2N1LmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDthc20vYXJjaC9yZWdz
LXNjdS5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7YXNtL2lvLmgmZ3Q7PGJyPg0KKzxicj4NCisj
aW5jbHVkZSAmcXVvdDthc3RfaTJjLmgmcXVvdDs8YnI+DQorPGJyPg0KKyNkZWZpbmUgSTJDX1RJ
TUVPVVRfVVMgKDEwMDAwMCk8YnI+DQorI2RlZmluZSBJMkNfU0xFRVBfU1RFUCAoMjApPGJyPg0K
KyNkZWZpbmUgRUkyQ19USU1FT1VUICgxMDAxKTxicj4NCis8YnI+DQorREVDTEFSRV9HTE9CQUxf
REFUQV9QVFI7PGJyPg0KKzxicj4NCitzdHJ1Y3QgYXN0X2kyYyB7PGJyPg0KK8KgIMKgIMKgIMKg
dTMyIGlkOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBhc3RfaTJjX3JlZ3MgKnJlZ3M7PGJyPg0K
K8KgIMKgIMKgIMKgaW50IHNwZWVkOzxicj4NCit9Ozxicj4NCis8YnI+DQorI2RlZmluZSBSRVRV
Uk5fSUZfRVJST1IoZXhwcikgZG8ge1w8YnI+DQorwqAgwqAgwqAgwqBpbnQgZXJyID0gKGV4cHIp
O1w8YnI+DQorwqAgwqAgwqAgwqBpZiAoZXJyICZsdDsgMCkge1w8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gZXJyO1w8YnI+DQorwqAgwqAgwqAgwqB9XDxicj4NCit9IHdoaWxl
ICgwKTxicj4NCis8YnI+DQorc3RhdGljIHUzMiBfX2dldF9jbGtfcmVnX3ZhbCh1MzIgZGl2aWRl
cl9yYXRpbyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBpbmMgPSAwLCBk
aXY7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHNjbF9sb3csIHNjbF9oaWdoLCBkYXRhOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBmb3IgKGRpdiA9IDA7IGRpdmlkZXJfcmF0aW8gJmd0Oz0gMTY7IGRp
disrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW5jIHw9IChkaXZpZGVyX3JhdGlv
ICZhbXA7IDEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRpdmlkZXJfcmF0aW8gJmd0
OyZndDs9IDE7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoGRpdmlkZXJfcmF0
aW8gKz0gaW5jOzxicj4NCivCoCDCoCDCoCDCoHNjbF9sb3cgPSAoZGl2aWRlcl9yYXRpbyAmZ3Q7
Jmd0OyAxKSAtIDE7PGJyPg0KK8KgIMKgIMKgIMKgc2NsX2hpZ2ggPSBkaXZpZGVyX3JhdGlvIC0g
c2NsX2xvdyAtIDI7PGJyPg0KK8KgIMKgIMKgIMKgZGF0YSA9IDB4Nzc3MDAzMDAgfCAoc2NsX2hp
Z2ggJmx0OyZsdDsgMTYpIHwgKHNjbF9sb3cgJmx0OyZsdDsgMTIpIHwgZGl2Ozxicj4NCivCoCDC
oCDCoCDCoHJldHVybiBkYXRhOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW5saW5lIHZv
aWQgX19hc3RfaTJjX2NsZWFyX2ludGVycnVwdHMoPHdicj5zdHJ1Y3QgYXN0X2kyY19yZWdzICpp
MmNfYmFzZSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHdyaXRlbCh+MCwgJmFtcDtpMmNfYmFz
ZS0mZ3Q7aXNyKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCBfX2FzdF9pMmNfaW5p
dF9idXMoc3RydWN0IGFzdF9pMmMgKmkyY19idXMpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqAv
KiBSZXNldCBkZXZpY2UgKi88YnI+DQorwqAgwqAgwqAgwqB3cml0ZWwoMCwgJmFtcDtpMmNfYnVz
LSZndDtyZWdzLSZndDtmY3IpOzxicj4NCivCoCDCoCDCoCDCoC8qIEVuYWJsZSBNYXN0ZXIgTW9k
ZS4gQXNzdW1pbmcgc2luZ2xlLW1hc3Rlci4gKi88YnI+DQorwqAgwqAgwqAgwqBkZWJ1ZygmcXVv
dDtFbmFibGUgTWFzdGVyIGZvciAlcFxuJnF1b3Q7LCBpMmNfYnVzLSZndDtyZWdzKTs8YnI+DQor
wqAgwqAgwqAgwqBzZXRiaXRzX2xlMzIoJmFtcDtpMmNfYnVzLSZndDtyZWdzLSZndDs8d2JyPmZj
ciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQVNUX0kyQ0RfTUFTVEVSX0VO
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgQVNUX0kyQ0RfTV9TREFfTE9D
S19FTjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IEFTVF9JMkNEX01VTFRJ
X01BU1RFUl9ESVMgfCBBU1RfSTJDRF9NX1NDTF9EUklWRV9FTik7PGJyPg0KK8KgIMKgIMKgIMKg
ZGVidWcoJnF1b3Q7RkNSOiAlcFxuJnF1b3Q7LCAmYW1wO2kyY19idXMtJmd0O3JlZ3MtJmd0O2Zj
cik7PGJyPg0KK8KgIMKgIMKgIMKgLyogRW5hYmxlIEludGVycnVwdHMgKi88YnI+DQorwqAgwqAg
wqAgwqB3cml0ZWwoQVNUX0kyQ0RfSU5UUl9UWF9BQ0s8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfCBBU1RfSTJDRF9JTlRSX1RYX05BSzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IEFT
VF9JMkNEX0lOVFJfUlhfRE9ORTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IEFTVF9JMkNE
X0lOVFJfQlVTX1JFQ09WRVJfRE9ORTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IEFTVF9J
MkNEX0lOVFJfTk9STUFMX1NUT1A8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBBU1RfSTJD
RF9JTlRSX0FCTk9STUFMLCAmYW1wO2kyY19idXMtJmd0O3JlZ3MtJmd0O2ljcik7PGJyPg0KK8Kg
IMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQgYXN0X2ky
Y19wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IGFzdF9pMmMgKmkyY19idXMgPSBkZXZfZ2V0X3ByaXYoZGV2KTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgZGVidWcoJnF1b3Q7RW5hYmxpbmcgSTJDJXUgXG4mcXVvdDssIGRldi0mZ3Q7c2Vx
KTs8YnI+DQorwqAgwqAgwqAgwqBhc3Rfc2N1X2VuYWJsZV9pMmMoZGV2LSZndDtzZXEpOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBpMmNfYnVzLSZndDtpZCA9IGRldi0mZ3Q7c2VxOzxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBhc3RfaTJjX3JlZ3MgKmkyY19iYXNlID08YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAoc3RydWN0IGFzdF9pMmNfcmVncyAqKWRldl9nZXRfYWRkcihkZXYpOzxicj4NCivC
oCDCoCDCoCDCoGkyY19idXMtJmd0O3JlZ3MgPSBpMmNfYmFzZTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIF9fYXN0X2kyY19pbml0X2J1cyhpMmNfYnVzKTs8YnI+DQorfTxicj4NCis8
YnI+DQorc3RhdGljIGlubGluZSBpbnQgX19hc3RfaTJjX3dhaXRfaXNyKHN0cnVjdCBhc3RfaTJj
X3JlZ3MgKmkyY19iYXNlLCB1MzIgZmxhZyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoGludCB0
aW1lb3V0ID0gSTJDX1RJTUVPVVRfVVM7PGJyPg0KK8KgIMKgIMKgIMKgd2hpbGUgKCEocmVhZGwo
JmFtcDtpMmNfYmFzZS0mZ3Q7aXNyKSAmYW1wOyBmbGFnKSAmYW1wOyZhbXA7IHRpbWVvdXQgJmd0
OyAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWRlbGF5KEkyQ19TTEVFUF9TVEVQ
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lb3V0IC09IEkyQ19TTEVFUF9TVEVQ
Ozxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgX19hc3RfaTJjX2Ns
ZWFyX2ludGVycnVwdHMoPHdicj5pMmNfYmFzZSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHRpbWVv
dXQgJmx0Oz0gMCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJMkNfVElN
RU9VVDs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3Rh
dGljIGlubGluZSBpbnQgX19hc3RfaTJjX3NlbmRfc3RvcChzdHJ1Y3QgYXN0X2kyY19yZWdzICpp
MmNfYmFzZSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHdyaXRlbChBU1RfSTJDRF9NX1NUT1Bf
Q01ELCAmYW1wO2kyY19iYXNlLSZndDtjc3IpOzxicj4NCivCoCDCoCDCoCDCoFJFVFVSTl9JRl9F
UlJPUihfX2FzdF9pMmNfPHdicj53YWl0X2lzcjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoChpMmNfYmFzZSwgQVNUX0kyQ0RfSU5UUl9OT1JNQUxfU1RPUCkpOzxicj4N
CivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW5saW5l
IGludCBfX2FzdF9pMmNfd2FpdF90eChzdHJ1Y3QgYXN0X2kyY19yZWdzICppMmNfYmFzZSk8YnI+
DQorezxicj4NCivCoCDCoCDCoCDCoGludCB0aW1lb3V0ID0gSTJDX1RJTUVPVVRfVVM7PGJyPg0K
K8KgIMKgIMKgIMKgdTMyIGZsYWcgPSBBU1RfSTJDRF9JTlRSX1RYX0FDSyB8IEFTVF9JMkNEX0lO
VFJfVFhfTkFLOzxicj4NCivCoCDCoCDCoCDCoHUzMiBzdGF0dXMgPSByZWFkbCgmYW1wO2kyY19i
YXNlLSZndDtpc3IpICZhbXA7IGZsYWc7PGJyPg0KK8KgIMKgIMKgIMKgd2hpbGUgKCFzdGF0dXMg
JmFtcDsmYW1wOyB0aW1lb3V0ICZndDsgMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0YXR1cyA9IHJlYWRsKCZhbXA7aTJjX2Jhc2UtJmd0O2lzcikgJmFtcDsgZmxhZzs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1ZGVsYXkoSTJDX1NMRUVQX1NURVApOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRpbWVvdXQgLT0gSTJDX1NMRUVQX1NURVA7PGJyPg0KK8KgIMKg
IMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0ID0gMDs8YnI+DQorwqAgwqAg
wqAgwqBpZiAoc3RhdHVzID09IEFTVF9JMkNEX0lOVFJfVFhfTkFLKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0ID0gLUVSRU1PVEVJTzs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGlmICh0aW1lb3V0ICZsdDs9IDApIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXQgPSAtRUkyQ19USU1FT1VUOzxicj4NCivCoCDCoCDCoCDCoH08YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgX19hc3RfaTJjX2NsZWFyX2ludGVycnVwdHMoPHdicj5pMmNf
YmFzZSk7PGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorfTxicj4NCis8YnI+DQor
c3RhdGljIGlubGluZSBpbnQgX19hc3RfaTJjX3N0YXJ0X3R4bihzdHJ1Y3QgYXN0X2kyY19yZWdz
ICppMmNfYmFzZSwgdTggZGV2YWRkcik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoC8qIFN0YXJ0
IGFuZCBTZW5kIERldmljZSBBZGRyZXNzICovPGJyPg0KK8KgIMKgIMKgIMKgd3JpdGVsKGRldmFk
ZHIsICZhbXA7aTJjX2Jhc2UtJmd0O3RyYmJyKTs8YnI+DQorwqAgwqAgwqAgwqB3cml0ZWwoQVNU
X0kyQ0RfTV9TVEFSVF9DTUQgfCBBU1RfSTJDRF9NX1RYX0NNRCwgJmFtcDtpMmNfYmFzZS0mZ3Q7
Y3NyKTs8YnI+DQorwqAgwqAgwqAgwqBSRVRVUk5fSUZfRVJST1IoX19hc3RfaTJjXzx3YnI+d2Fp
dF90eChpMmNfYmFzZSkpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0K
Kzxicj4NCitzdGF0aWMgaW50IF9fYXN0X2kyY19yZWFkX2RhdGEoc3RydWN0IGFzdF9pMmMgKmky
Y19idXMsIHU4IGNoaXAsIHU4ICpidWZmZXIsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludCBsZW4pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBp
bnQgaTJjX2Vycm9yID0gMDs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgYXN0X2kyY19yZWdzICpp
MmNfYmFzZSA9IGkyY19idXMtJmd0O3JlZ3M7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGkyY19l
cnJvciA9IF9fYXN0X2kyY19zdGFydF90eG4oaTJjX2Jhc2UsIChjaGlwICZsdDsmbHQ7IDEpIHwg
STJDX01fUkQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWkyY19lcnJvcikgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHUzMiBpMmNfY21kID0gQVNUX0kyQ0RfTV9SWF9DTUQ7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9yICg7IGxlbiAmZ3Q7IDA7IGxlbi0tLCBi
dWZmZXIrKykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChs
ZW4gPT0gMSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGkyY19jbWQgfD0gQVNUX0kyQ0RfTV9TX1JYX0NNRF9MQVNUOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB3cml0ZWwoaTJjX2NtZCwgJmFtcDtpMmNfYmFzZS0mZ3Q7Y3NyKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBSRVRVUk5fSUZfRVJST1IoX19h
c3RfaTJjXzx3YnI+d2FpdF9pc3I8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoaTJjX2Jhc2UsIEFTVF9JMkNEX0lOVFJfUlhf
RE9ORSkpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCpidWZmZXIg
PSBBU1RfSTJDRF9SWF9EQVRBX0JVRl9HRVQoPHdicj5yZWFkbCgmYW1wO2kyY19iYXNlLSZndDt0
cmJicikpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBfX2FzdF9pMmNfY2xlYXJfaW50ZXJydXB0cyg8d2JyPmkyY19iYXNlKTs8YnI+
DQorwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgUkVUVVJOX0lGX0VSUk9SKF9fYXN0X2ky
Y188d2JyPnNlbmRfc3RvcChpMmNfYmFzZSkpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1
cm4gaTJjX2Vycm9yOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IF9fYXN0X2kyY193
cml0ZV9kYXRhKHN0cnVjdCBhc3RfaTJjICppMmNfYnVzLCB1OCBjaGlwLCB1OCAqYnVmZmVyLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBs
ZW4pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBpbnQgaTJjX2Vycm9yID0gMDs8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3QgYXN0X2kyY19yZWdzICppMmNfYmFzZSA9IGkyY19idXMtJmd0O3JlZ3M7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGkyY19lcnJvciA9IF9fYXN0X2kyY19zdGFydF90eG4o
aTJjX2Jhc2UsIChjaGlwICZsdDsmbHQ7IDEpKTs8YnI+DQorwqAgwqAgwqAgwqBmb3IgKDsgbGVu
ICZndDsgMCAmYW1wOyZhbXA7IDAgPT0gaTJjX2Vycm9yOyBsZW4tLSwgYnVmZmVyKyspIHs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZWwoKmJ1ZmZlciwgJmFtcDtpMmNfYmFzZS0m
Z3Q7dHJiYnIpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdyaXRlbChBU1RfSTJDRF9N
X1RYX0NNRCwgJmFtcDtpMmNfYmFzZS0mZ3Q7Y3NyKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpMmNfZXJyb3IgPSBfX2FzdF9pMmNfd2FpdF90eChpMmNfYmFzZSk7PGJyPg0KK8KgIMKg
IMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoFJFVFVSTl9JRl9FUlJPUihfX2FzdF9pMmNfPHdicj5z
ZW5kX3N0b3AoaTJjX2Jhc2UpKTs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gaTJjX2Vycm9yOzxi
cj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IGFzdF9pMmNfZGVibG9jayhzdHJ1Y3QgdWRl
dmljZSAqZGV2KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFzdF9pMmMgKmkyY19i
dXMgPSBkZXZfZ2V0X3ByaXYoZGV2KTs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgYXN0X2kyY19y
ZWdzICppMmNfYmFzZSA9IGkyY19idXMtJmd0O3JlZ3M7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHUzMiBjc3IgPSByZWFkbCgmYW1wO2kyY19iYXNlLSZndDtjc3IpOzxicj4NCivCoCDCoCDCoCDC
oGRlYnVnKCZxdW90O0J1cyBodW5nICgleCksIGF0dGVtcHRpbmcgcmVjb3ZlcnlcbiZxdW90Oywg
Y3NyKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYm9vbCBzZGFfaGlnaCA9IGNzciAmYW1wOyBB
U1RfSTJDRF9TREFfTElORV9TVFM7PGJyPg0KK8KgIMKgIMKgIMKgYm9vbCBzY2xfaGlnaCA9IGNz
ciAmYW1wOyBBU1RfSTJDRF9TQ0xfTElORV9TVFM7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHNkYV9o
aWdoICZhbXA7JmFtcDsgc2NsX2hpZ2gpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
KiBCdXMgaXMgaWRsZSwgbm8gZGVibG9ja2luZyBuZWVkZWQuICovPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK8KgIMKgIMKgIMKgfSBlbHNlIGlmIChzZGFfaGln
aCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFNlbmQgc3RvcCBjb21tYW5kICov
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUkVUVVJOX0lGX0VSUk9SKF9fYXN0X2kyY188
d2JyPnNlbmRfc3RvcChpMmNfYmFzZSkpOzxicj4NCivCoCDCoCDCoCDCoH0gZWxzZSBpZiAoc2Ns
X2hpZ2gpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBQb3NzaWJseSBzdHVjayBz
bGF2ZSAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdyaXRlbChBU1RfSTJDRF9CVVNf
UkVDT1ZFUl88d2JyPkNNRCwgJmFtcDtpMmNfYmFzZS0mZ3Q7Y3NyKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBSRVRVUk5fSUZfRVJST1IoX19hc3RfaTJjXzx3YnI+d2FpdF9pc3I8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoaTJjX2Jh
c2UsIEFTVF9JMkNEX0lOVFJfQlVTX1JFQ09WRVJfPHdicj5ET05FKSk7PGJyPg0KK8KgIMKgIMKg
IMKgfSBlbHNlIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBKdXN0IHRyeSB0byBy
ZWluaXQgdGhlIGRldmljZS4gKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBSRVRVUk5f
SUZfRVJST1IoX19hc3RfaTJjXzx3YnI+aW5pdF9idXMoaTJjX2J1cykpOzxicj4NCivCoCDCoCDC
oCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJy
Pg0KK3N0YXRpYyBpbnQgYXN0X2kyY194ZmVyKHN0cnVjdCB1ZGV2aWNlICpkZXYsIHN0cnVjdCBp
MmNfbXNnICptc2csIGludCBubXNncyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBh
c3RfaTJjICppMmNfYnVzID0gZGV2X2dldF9wcml2KGRldik7PGJyPg0KK8KgIMKgIMKgIMKgaW50
IHJldDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZGVidWcoJnF1b3Q7aTJjX3hmZXI6ICVkIG1l
c3NhZ2VzXG4mcXVvdDssIG5tc2dzKTs8YnI+DQorwqAgwqAgwqAgwqBmb3IgKDsgbm1zZ3MgJmd0
OyAwOyBubXNncy0tLCBtc2crKykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFRP
RE86IHVzZSB0aGlzIGZvciByZXBlYXRlZCBzdGFydCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGJvb2wgbmV4dF9pc19yZWFkID0gbm1zZ3MgJmd0OyAxICZhbXA7JmFtcDsgKG1zZ1sx
XS5mbGFncyAmYW1wOyBJMkNfTV9SRCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChtc2ctJmd0O2ZsYWdzICZhbXA7IEkyQ19NX1JEKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVidWcoJnF1b3Q7aTJjX3JlYWQ6IGNoaXA9MHgleCwg
bGVuPTB4JXgsIGZsYWdzPTB4JXhcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtc2ctJmd0O2FkZHIsIG1zZy0mZ3Q7bGVuLCBtc2ctJmd0
O2ZsYWdzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fYXN0X2kyY19y
ZWFkX2RhdGEoaTJjX2J1cywgbXNnLSZndDthZGRyLCBtc2ctJmd0O2J1Ziw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBtc2ctJmd0O2xlbik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfSBlbHNl
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWJ1ZygmcXVvdDtp
MmNfd3JpdGU6IGNoaXA9MHgleCwgbGVuPTB4JXgsIGZsYWdzPTB4JXhcbiZxdW90Oyw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtc2ctJmd0O2FkZHIs
IG1zZy0mZ3Q7bGVuLCBtc2ctJmd0O2ZsYWdzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXQgPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoF9fYXN0X2kyY193cml0ZV9kYXRhKGkyY19idXMsIG1zZy0mZ3Q7YWRkciwgbXNn
LSZndDtidWYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1zZy0mZ3Q7bGVuKTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlYnVnKCZxdW90OyVz
OiBlcnJvciAoJWQpXG4mcXVvdDssIF9fZnVuY19fLCByZXQpOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRVJFTU9URUlPOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IGFzdF9pMmNfc2V0X3Nw
ZWVkKHN0cnVjdCB1ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBzcGVlZCk8YnI+DQorezxicj4N
CivCoCDCoCDCoCDCoGRlYnVnKCZxdW90O1NldHRpbmcgc3BlZWQgb2ZyIEkyQyVkIHRvICZsdDsl
dSZndDtcbiZxdW90OywgZGV2LSZndDtzZXEsIHNwZWVkKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAo
IXNwZWVkKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVidWcoJnF1b3Q7Tm8gdmFs
aWQgc3BlZWQgc3BlY2lmaWVkLlxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IGFzdF9pMmMgKmkyY19idXMgPSBkZXZfZ2V0X3ByaXYoZGV2KTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaTJjX2J1cy0mZ3Q7c3BlZWQgPSBzcGVlZDs8YnI+DQorwqAgwqAgwqAgwqAvKiBU
T0RPOiBnZXQgdGhpcyBmcm9tIGRldmljZSB0cmVlICovPGJyPg0KK8KgIMKgIMKgIMKgdTMyIHBj
bGsgPSBhc3RfZ2V0X2FwYmNsaygpOzxicj4NCivCoCDCoCDCoCDCoHUzMiBkaXZpZGVyID0gcGNs
ayAvIHNwZWVkOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgYXN0X2kyY19yZWdzICpp
MmNfYmFzZSA9IGkyY19idXMtJmd0O3JlZ3M7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHNwZWVkICZn
dDsgNDAwMDAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVidWcoJnF1b3Q7RW5h
YmxpbmcgSGlnaCBTcGVlZFxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
ZXRiaXRzX2xlMzIoJmFtcDtpMmNfYmFzZS0mZ3Q7ZmNyLCBBU1RfSTJDRF9NX0hJR0hfU1BFRURf
RU48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBBU1Rf
STJDRF9NX1NEQV9EUklWRV8xVF9FTjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8IEFTVF9JMkNEX1NEQV9EUklWRV8xVF9FTik7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgd3JpdGVsKDB4MywgJmFtcDtpMmNfYmFzZS0mZ3Q7Y2FjdGNyMik7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd3JpdGVsKF9fZ2V0X2Nsa19yZWdfdmFsKDx3YnI+
ZGl2aWRlciksICZhbXA7aTJjX2Jhc2UtJmd0O2NhY3RjcjEpOzxicj4NCivCoCDCoCDCoCDCoH0g
ZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVidWcoJnF1b3Q7RW5hYmxpbmcg
Tm9ybWFsIFNwZWVkXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdyaXRl
bChfX2dldF9jbGtfcmVnX3ZhbCg8d2JyPmRpdmlkZXIpLCAmYW1wO2kyY19iYXNlLSZndDtjYWN0
Y3IxKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3cml0ZWwoQVNUX05PX1RJTUVPVVRf
Q1RSTCwgJmFtcDtpMmNfYmFzZS0mZ3Q7Y2FjdGNyMik7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBfX2FzdF9pMmNfY2xlYXJfaW50ZXJydXB0cyg8d2JyPmkyY19i
YXNlKTs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3Rh
dGljIGNvbnN0IHN0cnVjdCBkbV9pMmNfb3BzIGFzdF9pMmNfb3BzID0gezxicj4NCivCoCDCoCDC
oCDCoC54ZmVyID0gYXN0X2kyY194ZmVyLDxicj4NCivCoCDCoCDCoCDCoC5zZXRfYnVzX3NwZWVk
ID0gYXN0X2kyY19zZXRfc3BlZWQsPGJyPg0KK8KgIMKgIMKgIMKgLmRlYmxvY2sgPSBhc3RfaTJj
X2RlYmxvY2ssPGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMgY29uc3Qgc3RydWN0IHVkZXZp
Y2VfaWQgYXN0X2kyY19pZHNbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqB7LmNvbXBhdGlibGUgPSAm
cXVvdDthc3BlZWQsYXN0MjUwMC1pMmMtPHdicj5jb250cm9sbGVyJnF1b3Q7LH0sPGJyPg0KK8Kg
IMKgIMKgIMKgey5jb21wYXRpYmxlID0gJnF1b3Q7YXNwZWVkLGFzdDI1MDAtaTJjLWJ1cyZxdW90
Oyx9LDxicj4NCivCoCDCoCDCoCDCoHt9LDxicj4NCit9Ozxicj4NCis8YnI+DQorLyogVGVsbCBH
TlUgSW5kZW50IHRvIGtlZXAgdGhpcyBhcyBpczogKi88YnI+DQorLyogKklOREVOVC1PRkYqICov
PGJyPg0KK1VfQk9PVF9EUklWRVIoaTJjX2FzcGVlZCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgLm5h
bWUgPSAmcXVvdDtpMmNfYXNwZWVkJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoC5pZCA9IFVDTEFT
U19JMkMsPGJyPg0KK8KgIMKgIMKgIMKgLm9mX21hdGNoID0gYXN0X2kyY19pZHMsPGJyPg0KK8Kg
IMKgIMKgIMKgLnByb2JlID0gYXN0X2kyY19wcm9iZSw8YnI+DQorwqAgwqAgwqAgwqAucHJpdl9h
dXRvX2FsbG9jX3NpemUgPSBzaXplb2Yoc3RydWN0IGFzdF9pMmMpLDxicj4NCivCoCDCoCDCoCDC
oC5vcHMgPSAmYW1wO2FzdF9pMmNfb3BzLDxicj4NCit9Ozxicj4NCisvKiAqSU5ERU5ULU9OKiAq
Lzxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9hc3RfaTJjLmggYi9kcml2ZXJzL2kyYy9h
c3RfaTJjLmg8YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAuLmUy
MjFiNDE8YnI+DQotLS0gL2Rldi9udWxsPGJyPg0KKysrIGIvZHJpdmVycy9pMmMvYXN0X2kyYy5o
PGJyPg0KQEAgLTAsMCArMSwxNTUgQEA8YnI+DQorLyo8YnI+DQorICogQ29weXJpZ2h0IChDKSAy
MDE2IEdvb2dsZSwgSW5jPGJyPg0KKyAqPGJyPg0KKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OsKgIMKgIEdQTC0yLjArPGJyPg0KKyAqLzxicj4NCisjaWZuZGVmIF9fQVNUX0kyQ19IXzxicj4N
CisjZGVmaW5lIF9fQVNUX0kyQ19IXzxicj4NCis8YnI+DQorc3RydWN0IGFzdF9pMmNfcmVncyB7
PGJyPg0KK8KgIMKgIMKgIMKgdWludDMyX3QgZmNyOzxicj4NCivCoCDCoCDCoCDCoHVpbnQzMl90
IGNhY3RjcjE7PGJyPg0KK8KgIMKgIMKgIMKgdWludDMyX3QgY2FjdGNyMjs8YnI+DQorwqAgwqAg
wqAgwqB1aW50MzJfdCBpY3I7PGJyPg0KK8KgIMKgIMKgIMKgdWludDMyX3QgaXNyOzxicj4NCivC
oCDCoCDCoCDCoHVpbnQzMl90IGNzcjs8YnI+DQorwqAgwqAgwqAgwqB1aW50MzJfdCBzZGFyOzxi
cj4NCivCoCDCoCDCoCDCoHVpbnQzMl90IHBiY3I7PGJyPg0KK8KgIMKgIMKgIMKgdWludDMyX3Qg
dHJiYnI7PGJyPg0KKyNpZmRlZiBDT05GSUdfVEFSR0VUX0FTVF9HNTxicj4NCivCoCDCoCDCoCDC
oHVpbnQzMl90IGRtYV9tYmFyOzxicj4NCivCoCDCoCDCoCDCoHVpbnQzMl90IGRtYV90bHI7PGJy
Pg0KKyNlbmRpZjxicj4NCit9Ozxicj4NCis8YnI+DQorLyogRGV2aWNlIFJlZ2lzdGVyIERlZmlu
aXRpb24gKi88YnI+DQorLyogMHgwMCA6IEkyQ0QgRnVuY3Rpb24gQ29udHJvbCBSZWdpc3RlcsKg
ICovPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfQlVGRl9TRUxfTUFTS8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4NyAmbHQ7Jmx0OyAyMCk8YnI+DQorI2RlZmluZSBBU1Rf
STJDRF9CVUZGX1NFTCh4KcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
KHggJmx0OyZsdDsgMjApwqAgwqAgwqAgwqAvLyBwYWdlIDAgfiA3PGJyPg0KKyNkZWZpbmUgQVNU
X0kyQ0RfTV9TREFfTE9DS19FTsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0
OyAxNik8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9NVUxUSV9NQVNURVJfRElTwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAxNSk8YnI+DQorI2RlZmluZSBBU1Rf
STJDRF9NX1NDTF9EUklWRV9FTsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsg
MTQpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfTVNCX1NUU8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyA5KTxicj4N
CisjZGVmaW5lIEFTVF9JMkNEX1NEQV9EUklWRV8xVF9FTsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyA4KTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX01fU0RB
X0RSSVZFXzFUX0VOwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDcpPGJyPg0KKyNk
ZWZpbmUgQVNUX0kyQ0RfTV9ISUdIX1NQRUVEX0VOwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgx
ICZsdDsmbHQ7IDYpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfREVGX0FERFJfRU7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgNSk8YnI+DQorI2Rl
ZmluZSBBU1RfSTJDRF9ERUZfQUxFUlRfRU7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAoMHgxICZsdDsmbHQ7IDQpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfREVGX0FSUF9F
TsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgw
eDEgJmx0OyZsdDsgMyk8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9ERUZfR0NBTExfRU7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDIpPGJyPg0KKyNk
ZWZpbmUgQVNUX0kyQ0RfU0xBVkVfRU7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDEpPGJyPg0KKyNkZWZpbmUgQVNU
X0kyQ0RfTUFTVEVSX0VOwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAoMHgxICk8YnI+DQorPGJyPg0KKy8qIDB4MDQgOiBJMkNEIENsb2NrIGFu
ZCBBQyBUaW1pbmcgQ29udHJvbCBSZWdpc3RlciAjMSAqLzxicj4NCisjZGVmaW5lIEFTVF9JMkNE
X3RCVUbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDI4KcKgIMKgIMKgLy8gMH43PGJyPg0KKyNkZWZpbmUg
QVNUX0kyQ0RfdEhEU1RBwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyNCnCoCDCoCDCoC8v
IDB+Nzxicj4NCisjZGVmaW5lIEFTVF9JMkNEX3RBQ1NUwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDIwKcKg
IMKgIMKgLy8gMH43PGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfdENLSElHSMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0
OyAxNinCoCDCoCDCoC8vIDB+Nzxicj4NCisjZGVmaW5lIEFTVF9JMkNEX3RDS0xPV8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICgweDEgJmx0OyZsdDsgMTIpwqAgwqAgwqAvLyAwfjc8YnI+DQorI2RlZmluZSBBU1Rf
STJDRF90SEREQVTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDEwKcKgIMKgIMKgLy8gMH43
PGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfQ0xLX1RPX0JBU0VfRElWwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDgpwqAgwqAgwqAgLy8gMH4zPGJyPg0KKyNk
ZWZpbmUgQVNUX0kyQ0RfQ0xLX0JBU0VfRElWwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKDB4MSApwqAgLy8gMH4weGY8YnI+DQorPGJyPg0KKy8qIDB4MDggOiBJMkNEIENs
b2NrIGFuZCBBQyBUaW1pbmcgQ29udHJvbCBSZWdpc3RlciAjMiAqLzxicj4NCisjZGVmaW5lIEFT
VF9JMkNEX3RUSU1FT1VUwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgKDB4MSApwqAgLy8gMH43PGJyPg0KKyNkZWZpbmUgQVNUX05PX1RJTUVP
VVRfQ1RSTMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDB4MDxicj4NCis8YnI+DQorLyogMHgwYyA6IEkyQ0QgSW50ZXJydXB0IENvbnRyb2wgUmVn
aXN0ZXIgJmFtcDs8YnI+DQorICogMHgxMCA6IEkyQ0QgSW50ZXJydXB0IFN0YXR1cyBSZWdpc3Rl
cjxicj4NCisgKjxicj4NCisgKiBUaGVzZSBzaGFyZSBiaXQgZGVmaW5pdGlvbnMsIHNvIHVzZSB0
aGUgc2FtZSB2YWx1ZXMgZm9yIHRoZSBlbmFibGUgJmFtcDs8YnI+DQorICogc3RhdHVzIGJpdHMu
PGJyPg0KKyAqLzxicj4NCisjZGVmaW5lIEFTVF9JMkNEX0lOVFJfU0RBX0RMX1RJTUVPVVTCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMTQpPGJyPg0KKyNkZWZpbmUg
QVNUX0kyQ0RfSU5UUl9CVVNfUkVDT1ZFUl9ET05FwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAo
MHgxICZsdDsmbHQ7IDEzKTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX0lOVFJfU01CVVNfQUxFUlTC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDEyKTxicj4NCisj
ZGVmaW5lIEFTVF9JMkNEX0lOVFJfU01CVVNfQVJQX0FERFLCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCgweDEgJmx0OyZsdDsgMTEpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfSU5UUl9TTUJV
U19ERVZfQUxFUlRfPHdicj5BRERSwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDEw
KTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX0lOVFJfU01CVVNfREVGX0FERFLCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgOSk8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9J
TlRSX0dDQUxMX0FERFLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0
OyZsdDsgOCk8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9JTlRSX1NMQVZFX01BVENIwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyA3KTxicj4NCisjZGVmaW5lIEFT
VF9JMkNEX0lOVFJfU0NMX1RJTUVPVVTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAo
MHgxICZsdDsmbHQ7IDYpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfSU5UUl9BQk5PUk1BTMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyA1KTxicj4NCisj
ZGVmaW5lIEFTVF9JMkNEX0lOVFJfTk9STUFMX1NUT1DCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAoMHgxICZsdDsmbHQ7IDQpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfSU5UUl9BUkJJ
VF9MT1NTwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDMp
PGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfSU5UUl9SWF9ET05FwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyKTxicj4NCisjZGVmaW5lIEFTVF9JMkNE
X0lOVFJfVFhfTkFLwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgx
ICZsdDsmbHQ7IDEpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfSU5UUl9UWF9BQ0vCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMCk8YnI+DQorPGJy
Pg0KKy8qIDB4MTQgOiBJMkNEIENvbW1hbmQvU3RhdHVzIFJlZ2lzdGVywqAgwqAqLzxicj4NCisj
ZGVmaW5lIEFTVF9JMkNEX1NEQV9PRcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMjgpPGJyPg0KKyNkZWZpbmUg
QVNUX0kyQ0RfU0RBX0/CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCgweDEgJmx0OyZsdDsgMjcpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfU0NMX09FwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
KDB4MSAmbHQ7Jmx0OyAyNik8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9TQ0xfT8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyAyNSk8
YnI+DQorI2RlZmluZSBBU1RfSTJDRF9UWF9USU1JTkfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMjQpwqAgwqAgwqAvLyAwIH4zPGJyPg0K
KyNkZWZpbmUgQVNUX0kyQ0RfVFhfU1RBVFVTwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDIzKTxicj4NCis8YnI+DQorLy8gVHggU3RhdGUg
TWFjaGluZTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX0lETEXCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9N
QUNUSVZFwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDg8
YnI+DQorI2RlZmluZSBBU1RfSTJDRF9NU1RBUlTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDk8YnI+DQorI2RlZmluZSBBU1RfSTJD
RF9NU1RBUlRSwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAw
eGE8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9NU1RPUMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHhiPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfTVRYRMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4Yzxicj4N
CisjZGVmaW5lIEFTVF9JMkNEX01SWEFDS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4ZDxicj4NCisjZGVmaW5lIEFTVF9JMkNEX01S
WETCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweGU8
YnI+DQorI2RlZmluZSBBU1RfSTJDRF9NVFhBQ0vCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAweGY8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9TV0FJVMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgxPGJyPg0KKyNk
ZWZpbmUgQVNUX0kyQ0RfU1JYRMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDB4NDxicj4NCisjZGVmaW5lIEFTVF9JMkNEX1NUWEFDS8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4NTxicj4NCisjZGVmaW5lIEFT
VF9JMkNEX1NUWETCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAweDY8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9TUlhBQ0vCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDc8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9S
RUNPVkVSwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDM8
YnI+DQorPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfU0NMX0xJTkVfU1RTwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAxOCk8YnI+DQorI2RlZmluZSBB
U1RfSTJDRF9TREFfTElORV9TVFPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAoMHgxICZsdDsmbHQ7IDE3KTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX0JVU19CVVNZX1NUU8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgMTYpPGJy
Pg0KKyNkZWZpbmUgQVNUX0kyQ0RfU0RBX09FX09VVF9ESVLCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZsdDsmbHQ7IDE1KTxicj4NCisjZGVmaW5l
IEFTVF9JMkNEX1NEQV9PX09VVF9ESVLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCgweDEgJmx0OyZsdDsgMTQpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfU0NMX09FX09VVF9E
SVLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHgxICZs
dDsmbHQ7IDEzKTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX1NDTF9PX09VVF9ESVLCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgweDEgJmx0OyZsdDsgMTIpPGJyPg0KKyNkZWZp
bmUgQVNUX0kyQ0RfQlVTX1JFQ09WRVJfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAoMHgxICZsdDsmbHQ7IDExKTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX1NfQUxUX0VOwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAx
MCk8YnI+DQorLy8gMCA6IERNQSBCdWZmZXIsIDE6IFBvb2wgQnVmZmVyPGJyPg0KKy8vQVNUMTA3
MCBETUEgcmVnaXN0ZXI8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9SWF9ETUFfRU5BQkxFwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICZsdDsmbHQ7IDkpPGJyPg0KKyNk
ZWZpbmUgQVNUX0kyQ0RfVFhfRE1BX0VOQUJMRcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyA4KTxicj4NCis8YnI+DQorLyogQ29tbWFuZCBCaXQgKi88
YnI+DQorI2RlZmluZSBBU1RfSTJDRF9SWF9CVUZGX0VOQUJMRcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgNyk8YnI+DQorI2RlZmlu
ZSBBU1RfSTJDRF9UWF9CVUZGX0VOQUJMRcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICgweDEgJmx0OyZsdDsgNik8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9N
X1NUT1BfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgKDB4MSAmbHQ7Jmx0OyA1KTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX01fU19SWF9DTURf
TEFTVMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKDB4MSAmbHQ7Jmx0OyA0KTxi
cj4NCisjZGVmaW5lIEFTVF9JMkNEX01fUlhfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAzKTxicj4NCisjZGVm
aW5lIEFTVF9JMkNEX1NfVFhfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAyKTxicj4NCisjZGVmaW5lIEFTVF9J
MkNEX01fVFhfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKDB4MSAmbHQ7Jmx0OyAxKTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX01fU1RB
UlRfQ01EwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoMHgxICk8YnI+
DQorPGJyPg0KKy8qIDB4MTggOiBJMkNEIFNsYXZlIERldmljZSBBZGRyZXNzIFJlZ2lzdGVywqAg
wqAqLzxicj4NCis8YnI+DQorLyogMHgxQyA6IEkyQ0QgUG9vbCBCdWZmZXIgQ29udHJvbCBSZWdp
c3RlcsKgIMKgKi88YnI+DQorI2RlZmluZSBBU1RfSTJDRF9SWF9CVUZfQUREUl9HRVQoeCnCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoKCh4KSAmZ3Q7Jmd0OyAyNCkg
JmFtcDsgMHhmZik8YnI+DQorI2RlZmluZSBBU1RfSTJDRF9SWF9CVUZfRU5EX0FERFJfU0VUKDx3
YnI+eCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoKHgpICZsdDsmbHQ7IDE2
KTxicj4NCisjZGVmaW5lIEFTVF9JMkNEX1RYX0RBVEFfQlVGX0VORF9TRVQoPHdicj54KcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICgoKHgpICZhbXA7IDB4ZmYpICZsdDsmbHQ7
IDgpPGJyPg0KKyNkZWZpbmUgQVNUX0kyQ0RfUlhfREFUQV9CVUZfR0VUKHgpwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKCgoeCkgJmd0OyZndDsgOCkgJmFtcDsgMHhmZik8YnI+DQorI2Rl
ZmluZSBBU1RfSTJDRF9CVUZfQkFTRV9BRERSX1NFVCh4KcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICgoeCkgJmFtcDsgMHgzZik8YnI+DQorPGJyPg0KKy8qIDB4MjAgOiBJMkNEIFRyYW5zbWl0
L1JlY2VpdmUgQnl0ZSBCdWZmZXIgUmVnaXN0ZXLCoCDCoCovPGJyPg0KKyNkZWZpbmUgQVNUX0ky
Q0RfR0VUX01PREUoeCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCgoKHgpICZndDsmZ3Q7IDgpICZhbXA7IDB4MSk8YnI+DQorPGJyPg0KKyNkZWZp
bmUgQVNUX0kyQ0RfUlhfQllURV9CVUZGRVLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoMHhmZiAmbHQ7Jmx0OyA4KTxicj4NCisjZGVm
aW5lIEFTVF9JMkNEX1RYX0JZVEVfQlVGRkVSwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKDB4ZmYgKTxicj4NCis8YnI+DQorLy8xLiB1
c2FnZSBmbGFnICwgMiBzaXplLMKgIMKgIMKgIMKgMy4gcmVxdWVzdCBhZGRyZXNzPGJyPg0KKy8q
IFVzZSBwbGF0Zm9ybV9kYXRhIGluc3RlYWQgb2YgbW9kdWxlIHBhcmFtZXRlcnMgKi88YnI+DQor
LyogRmFzdCBNb2RlID0gNDAwIGtIeiwgU3RhbmRhcmQgPSAxMDAga0h6ICovPGJyPg0KKy8vc3Rh
dGljIGludCBjbG9jayA9IDEwMDsgLyogRGVmYXVsdDogMTAwIGtIeiAqLzxicj4NCis8YnI+DQor
I2RlZmluZSBBU1RfSTJDRF9DTURTwqAgKEFTVF9JMkNEX0JVU19SRUNPVkVSX0NNRF9FTiB8IFw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQVNUX0kyQ0RfTV9TVE9Q
X0NNRCB8IFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQVNUX0ky
Q0RfTV9TX1JYX0NNRF9MQVNUIHwgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBBU1RfSTJDRF9NX1JYX0NNRCB8IFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgQVNUX0kyQ0RfTV9UWF9DTUQgfCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIEFTVF9JMkNEX01fU1RBUlRfQ01EKTxicj4NCis8YnI+DQor
I2VuZGlmwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBfQVNQRUVEX1JF
R1NfSTJDX0hfICovPGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4ODg4
ODgiPi0tPGJyPg0KMi44LjAucmMzLjIyNi5nMzlkNDAyMDxicj4NCjxicj4NCjwvZm9udD48L3Nw
YW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+
LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWls
X3NpZ25hdHVyZSI+PGRpdj48Yj5NPC9iPmF4aW0gPGI+UzwvYj5sb3lrbzwvZGl2PjwvZGl2Pg0K
PC9kaXY+DQo=
--001a114d6d668631f5053d1cff8e--
