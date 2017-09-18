Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.223.196; helo=mail-io0-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
 [209.85.223.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwxMn4KxVzDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 05:46:29 +1000 (AEST)
Received: by mail-io0-f196.google.com with SMTP id d16so2240853ioj.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 12:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4lgfE3rtjfHa7tZ8rh0v/+gm5r1olQnp0MRKkRKt6Ug=;
 b=iA1kpoYhBQSmNv/9gUhBIssrsESUseHcIbdk1Eop/F9yDiLW9Qoxj09aS7CjahWBjk
 /9veua0+9JhG9t1m6jpe0rAGxTOMJc6RthIYlbmo/65tDwxhId3FNuUzXMrQO1WeVF7z
 I9DgZ9OA8MGta3XFeaWelKOQDz0OThPAkH0IYOBRMnwgRknwSwVXImg8hGSqGXk3oxWe
 bLTboljsS+NGjpRVWaz/bYI8gJEmIizP3eyzhJtMvtKHE8I03rJcqklCYJ+7Kvyy7Fvd
 wm58PcLSyWl6bW9wVPXUbY0srnm4f0+GRVp5f8Hkx/m51Z46u/HeSkhTMDiyomCWoFQQ
 Ua7w==
X-Gm-Message-State: AHPjjUjLhQvpA48XghQO8tutoSOGHf/f7SsASL+UdJCB3NEbSeWeY89U
 p/QcOI73haJ1qQ==
X-Google-Smtp-Source: AOwi7QDemTw/dh7jtxD/yjMxkNNpfJ+gzl/G/m0OpvaQPNz4Plr/Xd6o5xltLx2mCi08YHNmCOut2w==
X-Received: by 10.202.80.15 with SMTP id e15mr28301663oib.155.1505763986946;
 Mon, 18 Sep 2017 12:46:26 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id e65sm1316245oia.15.2017.09.18.12.46.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Sep 2017 12:46:26 -0700 (PDT)
Date: Mon, 18 Sep 2017 14:46:25 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com,
 tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 2/3] arm: dts: add Nuvoton NPCM750 device tree
Message-ID: <20170918194625.xz5y7tkemjnbwunh@rob-hp-laptop>
References: <20170909015308.30001-1-brendanhiggins@google.com>
 <20170909015308.30001-3-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170909015308.30001-3-brendanhiggins@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Mon, 18 Sep 2017 19:46:30 -0000

On Fri, Sep 08, 2017 at 06:53:07PM -0700, Brendan Higgins wrote:
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
>  .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 +++++
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  57 +++++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 177 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 +++++
>  5 files changed, 321 insertions(+)
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
> +Enable method name:	"nuvoton,npcm7xx-smp"
> +Compatible machines:	"nuvoton,npcm750"
> +Compatible CPUs:	"arm,cortex-a9"
> +Related properties:	(none)
> +
> +Note:
> +This enable method needs valid nodes compatible with "arm,cortex-a9-scu" and
> +"nuvoton,npcm750-gcr".
> +
> +Example:
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		enable-method = "nuvoton,npcm7xx-smp";
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <0>;
> +			next-level-cache = <&L2>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <1>;
> +			next-level-cache = <&L2>;
> +		};
> +	};
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
> +	- compatible = "nuvoton,npcm750";
> +
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> new file mode 100644
> index 000000000000..e54a870d3ee0
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -0,0 +1,57 @@
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
> +	model = "Nuvoton npcm750 Development Board (Device Tree)";
> +	compatible = "nuvoton,npcm750";
> +
> +	chosen {
> +		stdout-path = &serial3;

stdout-path is a path string, not a phandle.

> +		bootargs = "earlyprintk=serial,serial3,115200";

That's not valid bootargs with mainline.

> +	};
> +
> +	memory {
> +		reg = <0 0x40000000>;
> +	};
> +
> +	cpus {
> +		enable-method = "nuvoton,npcm7xx-smp";

This is not a board specific property. Belongs in the SoC dtsi.

> +	};
> +};
> +
> +&clk {
> +	status = "okay";

Pretty sure you'd always want the clock controller enabled.

> +};
> +
> +&watchdog1 {
> +	status = "okay";
> +};
> +
> +&serial0 {
> +	status = "okay";
> +};
> +
> +&serial1 {
> +	status = "okay";
> +};
> +
> +&serial2 {
> +	status = "okay";
> +};
> +
> +&serial3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> new file mode 100644
> index 000000000000..bca96b3ae9d3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -0,0 +1,177 @@
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
> +#include "skeleton.dtsi"

Don't use skeleton.dtsi. We want to remove it.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <0>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			clocks = <&clk NPCM7XX_CLK_CPU>;
> +			clock-names = "clk_cpu";
> +			reg = <1>;
> +			next-level-cache = <&l2>;
> +		};
> +	};
> +
> +	gcr: gcr@f0800000 {
> +		compatible = "nuvoton,npcm750-gcr", "syscon",
> +			"simple-mfd";
> +		reg = <0xf0800000 0x1000>;
> +	};
> +
> +	scu: scu@f03fe000 {
> +		compatible = "arm,cortex-a9-scu";
> +		reg = <0xf03fe000 0x1000>;
> +	};
> +
> +	l2: l2-cache@f03fc000 {

cache-controller@...

> +		compatible = "arm,pl310-cache";
> +		reg = <0xf03fc000 0x1000>;
> +		interrupts = <0 21 4>;
> +		cache-unified;
> +		cache-level = <2>;
> +		clocks = <&clk NPCM7XX_CLK_AXI>;
> +	};
> +
> +	gic: interrupt-controller@f03ff000 {
> +		compatible = "arm,cortex-a9-gic";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = <0xf03ff000 0x1000>,
> +		    <0xf03fe100 0x100>;
> +	};
> +
> +	clk: clock-controller@f0801000 {
> +		compatible = "nuvoton,npcm750-clk";
> +		#clock-cells = <1>;
> +		reg = <0xf0801000 0x1000>;
> +	};

All these memory mapped peripherals should be under a bus/soc node

> +
> +	/* external clock signal rg1refck, supplied by the phy */
> +	clk-rg1refck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	/* external clock signal rg2refck, supplied by the phy */
> +	clk-rg2refck {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	clk-xin {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +
> +	timer@f03fe600 {
> +		compatible = "arm,cortex-a9-twd-timer";
> +		reg = <0xf03fe600 0x20>;
> +		interrupts = <1 13 0x304>;
> +		clocks = <&clk NPCM7XX_CLK_TIMER>;
> +	};
> +
> +	apb {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		ranges;

It's preferred to have actual values here and limit the address range of 
the bus.

> +
> +		timer0: timer@f0000000 {
> +			compatible = "nuvoton,npcm750-timer";
> +			interrupts = <0 32 4>;
> +			reg = <0xf0000000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +		};
> +
> +		watchdog0: watchdog@f0008000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 47 4>;
> +			reg = <0xf0008000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +		};
> +
> +		watchdog1: watchdog@f0009000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 48 4>;
> +			reg = <0xf0009000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +		};
> +
> +		watchdog2: watchdog@f000a000 {
> +			compatible = "nuvoton,npcm750-wdt";
> +			interrupts = <0 49 4>;
> +			reg = <0xf000a000 0x1000>;
> +			status = "disabled";
> +			clocks = <&clk NPCM7XX_CLK_TIMER>;
> +		};
> +
> +		serial0: serial0@f0001000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0001000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			interrupts = <0 2 4>;
> +			status = "disabled";
> +		};
> +
> +		serial1: serial1@f0002000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0002000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			interrupts = <0 3 4>;
> +			status = "disabled";
> +		};
> +
> +		serial2: serial2@f0003000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0003000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			interrupts = <0 4 4>;
> +			status = "disabled";
> +		};
> +
> +		serial3: serial3@f0004000 {
> +			compatible = "nuvoton,npcm750-uart";
> +			reg = <0xf0004000 0x1000>;
> +			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
> +			interrupts = <0 5 4>;
> +			status = "disabled";
> +		};
> +	};
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
> +#define NPCM7XX_CLK_PLL0	0
> +#define NPCM7XX_CLK_PLL1	1
> +#define NPCM7XX_CLK_PLL2	2
> +#define NPCM7XX_CLK_GFX		3
> +#define NPCM7XX_CLK_APB1	4
> +#define NPCM7XX_CLK_APB2	5
> +#define NPCM7XX_CLK_APB3	6
> +#define NPCM7XX_CLK_APB4	7
> +#define NPCM7XX_CLK_APB5	8
> +#define NPCM7XX_CLK_MC		9
> +#define NPCM7XX_CLK_CPU		10
> +#define NPCM7XX_CLK_SPI0	11
> +#define NPCM7XX_CLK_SPI3	12
> +#define NPCM7XX_CLK_SPIX	13
> +#define NPCM7XX_CLK_UART_CORE	14
> +#define NPCM7XX_CLK_TIMER	15
> +#define NPCM7XX_CLK_HOST_UART	16
> +#define NPCM7XX_CLK_MMC		17
> +#define NPCM7XX_CLK_SDHC	18
> +#define NPCM7XX_CLK_ADC		19
> +#define NPCM7XX_CLK_GFX_MEM	20
> +#define NPCM7XX_CLK_USB_BRIDGE	21
> +#define NPCM7XX_CLK_AXI		22
> +#define NPCM7XX_CLK_AHB		23
> +#define NPCM7XX_CLK_EMC		24
> +#define NPCM7XX_CLK_GMAC	25
> +
> +#endif
> -- 
> 2.14.1.581.gf28d330327-goog
> 
