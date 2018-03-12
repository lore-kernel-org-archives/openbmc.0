Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHj0bRmF"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400MFD0JYbzF09h
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 02:23:11 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id v6so11875561iog.7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=N2HnLtEdzFlmdstKUwU3h9O23JDPMcmUAy4C8DI7TFc=;
 b=CHj0bRmFIe7cxgQ68mKZ61NIddMfpBua5qhfJgmUkX6CflH7ekvkfNZUqEynTIa20g
 I+sNO3zjQM/Valc0z/PsTHavLt+45kqOqRdIeylkWn0jlOEXSdCbJLx7qMSs6LrEBQe/
 GQ3HaUhbJs6svomKxlZGC8cqidexxksYudw50k/SDKT38bDwi/g8J5Yc9ykiKxQ3jUbZ
 Bg9V2czFbiNkEkeL+JiT5QQ248DDQi4cN6EM0y+jPlB0JElMX/TFJz9tM15wENePeo/r
 wuiFuRR4eE6YdVJja27RfoSJqyLfaMyC2Dw5NKVmzDzUUlhe7eD6HCkWiOLPrBeU8f9t
 QT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=N2HnLtEdzFlmdstKUwU3h9O23JDPMcmUAy4C8DI7TFc=;
 b=iUOCrv8l6ULLvol+5K147r60fcNoA18nwmzWM5RvU4sn0XNUOy/h6Hdzh91zO/2e0S
 Koc4YFS14z3kOjERCGcD7o0rGGX/RBequ73H1pH/umGpesbDl2NyYG3JgJyK7btozP6W
 iqx3/4TcyFqn7dSKmo5EtMRYhMqgfffdlr2g6jhVVi47l9Wr+c7vRkxmIBraX/WMIisl
 8RHdPkbdpPt4nCGccTdTpALLlypPsRSV8sRUKkWhWfEww6bczvc7XRBbSHctrmnury7g
 ANd9egpXAFQLK7oqiMVw/8XHJW2g0K9RCpWQyaONsJ4KIvJTojbHRVyU6p17xf8L4jLL
 eJwA==
X-Gm-Message-State: AElRT7Ho1KzdWRM3lPAX2KOllY7HoKPWLF/emYGI5inawwWYNh0oZTEd
 SbIVHtVT1g5xXyijsWmXvDw5XJ5G9mYoWQSV7oQ=
X-Google-Smtp-Source: AG47ELs7k3GVh4CCS9YcBBbH7lH7D/gpkdvqWXn5zDsvZI5xT7zv3FFzTdkwFqa5FByIqr+mNeMZvhmDAMKC8w+064c=
X-Received: by 10.107.165.146 with SMTP id o140mr8696351ioe.52.1520868189155; 
 Mon, 12 Mar 2018 08:23:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Mon, 12 Mar 2018 08:23:08 -0700 (PDT)
In-Reply-To: <20180216024011.189157-3-brendanhiggins@google.com>
References: <20180216024011.189157-1-brendanhiggins@google.com>
 <20180216024011.189157-3-brendanhiggins@google.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 12 Mar 2018 17:23:08 +0200
Message-ID: <CAP6Zq1ioO6cGgEnH6niuYK0zP+aW05ykKUtkn8ckUKJvriu5wg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>,
 julien.thierry@arm.com, 
 pombredanne@nexb.com, Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
 khilman@kernel.org, devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 12 Mar 2018 15:23:13 -0000

On 16 February 2018 at 04:40, Brendan Higgins <brendanhiggins@google.com> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
> Tested-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../arm/cpu-enable-method/nuvoton,npcm750-smp |  42 +++++
>  .../devicetree/bindings/arm/npcm/npcm.txt     |   6 +
>  arch/arm/boot/dts/Makefile                    |   2 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |  35 ++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi        | 165 ++++++++++++++++++
>  5 files changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>
> diff --git a/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
> new file mode 100644
> index 000000000000..8e043301e28e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
> @@ -0,0 +1,42 @@
Rob,

if will like to add new chip to enable the SMP (NPCM730).
what will be the best way to add it to the binding documentation file?

1. Do I need to add new binding file nuvoton,npcm730-smp?
2. Add nuvoton,npcm730-smp option to the current nuvoton,npcm750-smp file?
3. Modify the nuvoton,npcm750-smp binding name to nuvoton,npcm7xx-smp
and to describe both chips in it.


> +=========================================================
> +Secondary CPU enable-method "nuvoton,npcm750-smp" binding
> +=========================================================
> +
> +To apply to all CPUs, a single "nuvoton,npcm750-smp" enable method should be
> +defined in the "cpus" node.
> +
> +Enable method name:    "nuvoton,npcm750-smp"
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
> +               enable-method = "nuvoton,npcm750-smp";
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
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ade7a38543dc..eeab5dac50ab 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -304,6 +304,8 @@ dtb-$(CONFIG_ARCH_LPC18XX) += \
>  dtb-$(CONFIG_ARCH_LPC32XX) += \
>         lpc3250-ea3250.dtb \
>         lpc3250-phy3250.dtb
> +dtb-$(CONFIG_ARCH_NPCM750) += \
> +       nuvoton-npcm750-evb.dtb
>  dtb-$(CONFIG_MACH_MESON6) += \
>         meson6-atv1200.dtb
>  dtb-$(CONFIG_MACH_MESON8) += \
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> new file mode 100644
> index 000000000000..cabde3d5be8a
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
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
> index 000000000000..839e45cfd695
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm750-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk 10>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk 10>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +       /* external clock signal rg1refck, supplied by the phy */
> +       clk-rg1refck {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <125000000>;
> +       };
> +
> +       /* external clock signal rg2refck, supplied by the phy */
> +       clk-rg2refck {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <125000000>;
> +       };
> +
> +       clk-xin {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <50000000>;
> +       };
> +
> +       soc {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges = <0x0 0xf0000000 0x00900000>;
> +
> +               gcr: gcr@800000 {
> +                       compatible = "nuvoton,npcm750-gcr", "syscon",
> +                               "simple-mfd";
> +                       reg = <0x800000 0x1000>;
> +               };
> +
> +               scu: scu@3fe000 {
> +                       compatible = "arm,cortex-a9-scu";
> +                       reg = <0x3fe000 0x1000>;
> +               };
> +
> +               l2: cache-controller@3fc000 {
> +                       compatible = "arm,pl310-cache";
> +                       reg = <0x3fc000 0x1000>;
> +                       interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +                       cache-unified;
> +                       cache-level = <2>;
> +                       clocks = <&clk 22>;
> +                       arm,shared-override;
> +               };
> +
> +               gic: interrupt-controller@3ff000 {
> +                       compatible = "arm,cortex-a9-gic";
> +                       interrupt-controller;
> +                       #interrupt-cells = <3>;
> +                       reg = <0x3ff000 0x1000>,
> +                           <0x3fe100 0x100>;
> +               };
> +
> +               timer@3fe600 {
> +                       compatible = "arm,cortex-a9-twd-timer";
> +                       reg = <0x3fe600 0x20>;
> +                       interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +                                                 IRQ_TYPE_LEVEL_HIGH)>;
> +                       clocks = <&clk 15>;
> +               };
> +       };
> +
> +       ahb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges;
> +
> +               clk: clock-controller@f0801000 {
> +                       compatible = "nuvoton,npcm750-clk";
> +                       #clock-cells = <1>;
> +                       reg = <0xf0801000 0x1000>;
> +               };
> +
> +               apb {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-bus";
> +                       interrupt-parent = <&gic>;
> +                       ranges = <0x0 0xf0000000 0x00300000>;
> +
> +                       timer0: timer@8000 {
> +                               compatible = "nuvoton,npcm750-timer";
> +                               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg = <0x8000 0x1000>;
> +                               clocks = <&clk 15>;
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x1000 0x1000>;
> +                               clocks = <&clk 14>;
> +                               interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg-shift = <2>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial1: serial@2000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x2000 0x1000>;
> +                               clocks = <&clk 14>;
> +                               interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg-shift = <2>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial2: serial@3000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x3000 0x1000>;
> +                               clocks = <&clk 14>;
> +                               interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg-shift = <2>;
> +                               status = "disabled";
> +                       };
> +
> +                       serial3: serial@4000 {
> +                               compatible = "ns16550a";
> +                               reg = <0x4000 0x1000>;
> +                               clocks = <&clk 14>;
> +                               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                               reg-shift = <2>;
> +                               status = "disabled";
> +                       };
> +               };
> +       };
> +};
> --
> 2.16.1.291.g4437f3f132-goog
>

Thanks,

Tomer
