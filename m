Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AnVdiFZe"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQ8TP4zB7zDrcJ
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 07:33:45 +1100 (AEDT)
Received: by mail-io0-x242.google.com with SMTP id e89so22811741ioi.11
 for <openbmc@lists.ozlabs.org>; Sun, 29 Oct 2017 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9+VLfBuxumNYjB5XCWgd5t3EjNbnkdzHkrwLE5SBd0E=;
 b=AnVdiFZeW+X26jh3zEuVaAut/CUT9f1+kZKMbJkGJ7ghfCD9/+oTkv6jfjro2eSuTS
 t3LS0UgGUJ8MmVn2RuTLPgsgOpFdVfUnd6oCEWHPBhBq4rWckfNn+2aWZbWwd1faPt0P
 yoaSVk14oFDS/wnSW2mvg+KhRifN4USrTYuvbMgYnVM+4v+6kk5UBHXxu5XMq37f2JB9
 5BbxFkJZw1q16Lki1Yf+XY5j6O0hQTQ6wlpfhiWlrwFTmURgkXKfG5m8ixfYGCGzIhKd
 ZfUO7ww182ydNt+nr5RAyb8P5+HRkfU1enSyCsYvpc96ZJ8F2Qdgfgc3kfJ9QalFs+sn
 uR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9+VLfBuxumNYjB5XCWgd5t3EjNbnkdzHkrwLE5SBd0E=;
 b=WrPF2Ekfj3tEmAMXH+6/vlbLOx+x49ce1GIROzJCX0GYvAxq5Wjr6ZL/ioaomgDwrT
 OMlhvbnZlFRCi4oOOOZuUeigxZyegcen6YMEURZqPU4+JLAUO9g9foU5Oi1CX6LUIrKE
 ekDuuzA5UKyODKdQRXslLJqVOur7dAfYi8xUATe7KDlXhzqumrDbg5kLyV3CG2N8PZQv
 NGUqJEXy12Qd2yr0m3JQ8MKjC0a7jyzfKYtSqEzHlOpAX4w/qY1HLg8jA8z15GpAfQ3q
 yqRw3E+KDfXdUrKv4ti94Fr0EVxqMMhZYzUPYQLhTxHZtviqhjRtzEVakEwfhcCBEAzU
 I1fg==
X-Gm-Message-State: AMCzsaUafEGi6MtbU32QmVxK6rTKE4CdvwO/egyntvHMzjckLfKG8Z/j
 CMwwrzn7Qs19gCgGsK5sPgA0uKqE4t2Tazb2fPk=
X-Google-Smtp-Source: ABhQp+TF+DWoSJwGmtl6hgk68GJ3bw+aeUlrZoVqc1vdS5eh4nOuC+ziD8ZJpjXeyOwDQiMvgsHrU9gnSliNKwhfFUk=
X-Received: by 10.107.20.137 with SMTP id 131mr8205454iou.137.1509309221192;
 Sun, 29 Oct 2017 13:33:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.28.66 with HTTP; Sun, 29 Oct 2017 13:33:40 -0700 (PDT)
In-Reply-To: <20170919224001.22284-3-brendanhiggins@google.com>
References: <20170919224001.22284-1-brendanhiggins@google.com>
 <20170919224001.22284-3-brendanhiggins@google.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 29 Oct 2017 22:33:40 +0200
Message-ID: <CAP6Zq1jPva2sFMYaNoN6C_4sXL9q=W_Wyt9Hy3+OsG6UJUVd6w@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Oct 2017 20:33:47 -0000

On 20 September 2017 at 00:40, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 ++++
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  48 +++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 211 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 ++++
>  5 files changed, 346 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>
> diff --git a/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
> new file mode 100644
> index 000000000000..e81f85b400cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
> @@ -0,0 +1,42 @@
> +=========================================================
> +Secondary CPU enable-method "nuvoton,npcm7xx-smp" binding
> +=========================================================
> +
> +To apply to all CPUs, a single "nuvoton,npcm7xx-smp" enable method should be
> +defined in the "cpus" node.
> +
> +Enable method name:    "nuvoton,npcm7xx-smp"
> +Compatible machines:   "nuvoton,npcm750"
> +Compatible CPUs:       "arm,cortex-a9"
> +Related properties:    (none)
> +
> +Note:
> +This enable method needs valid nodes compatible with "arm,cortex-a9-scu" and
> +"nuvoton,npcm750-gcr".
> +
> +Example:
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm7xx-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&L2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&L2>;
> +               };
> +       };
> +
> diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.txt b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> new file mode 100644
> index 000000000000..2d87d9ecea85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> @@ -0,0 +1,6 @@
> +NPCM Platforms Device Tree Bindings
> +-----------------------------------
> +NPCM750 SoC
> +Required root node properties:
> +       - compatible = "nuvoton,npcm750";
> +
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> new file mode 100644
> index 000000000000..a0675e584125
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -0,0 +1,48 @@
> +/*
> + * DTS file for all NPCM750 SoCs
> + *
> + * Copyright 2012 Tomer Maimon <tomer.maimon@nuvoton.com>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "nuvoton-npcm750.dtsi"
> +
> +/ {
> +       model = "Nuvoton npcm750 Development Board (Device Tree)";
> +       compatible = "nuvoton,npcm750";
> +
> +       chosen {
> +               stdout-path = &serial3;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +};
> +
> +&watchdog1 {
> +       status = "okay";
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..5d8a48e44274
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,211 @@
> +/*
> + * DTSi file for the NPCM750 SoC
> + *
> + * Copyright 2012 Tomer Maimon <tomer.maimon@nuvoton.com>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm7xx-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +       gcr: gcr@f0800000 {
> +               compatible = "nuvoton,npcm750-gcr", "syscon",
> +                       "simple-mfd";
> +               reg = <0xf0800000 0x1000>;
> +       };
> +
> +       scu: scu@f03fe000 {
> +               compatible = "arm,cortex-a9-scu";
> +               reg = <0xf03fe000 0x1000>;
> +       };
> +
> +       l2: cache-controller@f03fc000 {
> +               compatible = "arm,pl310-cache";
> +               reg = <0xf03fc000 0x1000>;
> +               interrupts = <0 21 4>;
> +               cache-unified;
> +               cache-level = <2>;
> +               clocks = <&clk NPCM7XX_CLK_AXI>;
> +       };
> +
> +       gic: interrupt-controller@f03ff000 {
> +               compatible = "arm,cortex-a9-gic";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               reg = <0xf03ff000 0x1000>,
> +                   <0xf03fe100 0x100>;
> +       };
> +
> +       timer@f03fe600 {
> +               compatible = "arm,cortex-a9-twd-timer";
> +               reg = <0xf03fe600 0x20>;
> +               interrupts = <1 13 0x304>;
> +               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +       };
> +
> +       ahb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges = <0x80000000 0x80000000 0x40000000
> +                         0xc0000000 0xc0000000 0x00002000
> +                         0xc0008000 0xc0008000 0x00001000
> +                         0xe0800000 0xe0800000 0x00001000
> +                         0xe1000000 0xe1000000 0x00001000
> +                         0xe8000000 0xe8000000 0x08000000
> +                         /* APB start */
> +                         0xf0000000 0xf0000000 0x00005000
> +                         0xf0007000 0xf0007000 0x00005000
> +                         0xf0010000 0xf0010000 0x00008000
> +                         0xf0080000 0xf0080000 0x00010000
> +                         0xf009f000 0xf009f000 0x00001000
> +                         0xf0100000 0xf0100000 0x00005000
> +                         0xf0180000 0xf0180000 0x0000b000
> +                         0xf0200000 0xf0200000 0x00002000
> +                         /* APB end */
> +                         0xf0800000 0xf0800000 0x000fc000
> +                         0xf8000000 0xf8000000 0x02000000
> +                         0xfb000000 0xfb000000 0x00002000>;
> +
> +               clk: clock-controller@f0801000 {
> +                       compatible = "nuvoton,npcm750-clk";
> +                       #clock-cells = <1>;
> +                       reg = <0xf0801000 0x1000>;
> +                       status = "okay";
> +               };
> +
> +               /* external clock signal rg1refck, supplied by the phy */
> +               clk-rg1refck {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <125000000>;
> +               };
> +
> +               /* external clock signal rg2refck, supplied by the phy */
> +               clk-rg2refck {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <125000000>;
> +               };
> +
> +               clk-xin {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <50000000>;
> +               };
> +
> +               apb {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-bus";
> +                       interrupt-parent = <&gic>;
> +                       ranges = <0xf0000000 0xf0000000 0x00005000
> +                                 0xf0007000 0xf0007000 0x00005000
> +                                 0xf0010000 0xf0010000 0x00008000
> +                                 0xf0080000 0xf0080000 0x00010000
> +                                 0xf009f000 0xf009f000 0x00001000
> +                                 0xf0100000 0xf0100000 0x00005000
> +                                 0xf0180000 0xf0180000 0x0000b000
> +                                 0xf0200000 0xf0200000 0x00002000>;
> +
> +                       timer0: timer@f0000000 {
> +                               compatible = "nuvoton,npcm750-timer";
> +                               interrupts = <0 32 4>;
> +                               reg = <0xf0000000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };

I started the upstream process of NPCM7xx clocksource driver, I got
the following comment:
https://www.spinics.net/lists/devicetree/msg197916.html

Is it possible to modify the the timer DT entry to:

timer0: timer@f0008000 {
        compatible = "nuvoton,npcm7xx-timer";
        interrupts = <0 32 4>;
        reg = <0xf0008000 0x1000>;
        clocks = <&clk NPCM7XX_CLK_TIMER>;
};

> +
> +                       watchdog0: watchdog@f0008000 {
> +                               compatible = "nuvoton,npcm750-wdt";
> +                               interrupts = <0 47 4>;
> +                               reg = <0xf0008000 0x1000>;
> +                               status = "disabled";
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };
> +
> +                       watchdog1: watchdog@f0009000 {
> +                               compatible = "nuvoton,npcm750-wdt";
> +                               interrupts = <0 48 4>;
> +                               reg = <0xf0009000 0x1000>;
> +                               status = "disabled";
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };
> +
> +                       watchdog2: watchdog@f000a000 {
> +                               compatible = "nuvoton,npcm750-wdt";
> +                               interrupts = <0 49 4>;
> +                               reg = <0xf000a000 0x1000>;
> +                               status = "disabled";
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };
> +
> +                       serial0: serial0@f0001000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0xf0001000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +                               interrupts = <0 2 4>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial1: serial1@f0002000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0xf0002000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +                               interrupts = <0 3 4>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial2: serial2@f0003000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0xf0003000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +                               interrupts = <0 4 4>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial3: serial3@f0004000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0xf0004000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +                               interrupts = <0 5 4>;
> +                               status = "disabled";
> +                       };
> +               };
> +       };
> +};
> diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> new file mode 100644
> index 000000000000..c69d3bbf7e42
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (C) 2016 Nuvoton Technologies,  tali.perry@nuvoton.com
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
> +#define _DT_BINDINGS_CLK_NPCM7XX_H
> +
> +#define NPCM7XX_CLK_PLL0       0
> +#define NPCM7XX_CLK_PLL1       1
> +#define NPCM7XX_CLK_PLL2       2
> +#define NPCM7XX_CLK_GFX                3
> +#define NPCM7XX_CLK_APB1       4
> +#define NPCM7XX_CLK_APB2       5
> +#define NPCM7XX_CLK_APB3       6
> +#define NPCM7XX_CLK_APB4       7
> +#define NPCM7XX_CLK_APB5       8
> +#define NPCM7XX_CLK_MC         9
> +#define NPCM7XX_CLK_CPU                10
> +#define NPCM7XX_CLK_SPI0       11
> +#define NPCM7XX_CLK_SPI3       12
> +#define NPCM7XX_CLK_SPIX       13
> +#define NPCM7XX_CLK_UART_CORE  14
> +#define NPCM7XX_CLK_TIMER      15
> +#define NPCM7XX_CLK_HOST_UART  16
> +#define NPCM7XX_CLK_MMC                17
> +#define NPCM7XX_CLK_SDHC       18
> +#define NPCM7XX_CLK_ADC                19
> +#define NPCM7XX_CLK_GFX_MEM    20
> +#define NPCM7XX_CLK_USB_BRIDGE 21
> +#define NPCM7XX_CLK_AXI                22
> +#define NPCM7XX_CLK_AHB                23
> +#define NPCM7XX_CLK_EMC                24
> +#define NPCM7XX_CLK_GMAC       25
> +
> +#endif
> --
> 2.14.1.690.gbb1197296e-goog
>

Thanks!
