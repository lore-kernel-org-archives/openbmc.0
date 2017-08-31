Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjyNw3NWczDqGZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 08:54:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Bo3jjass"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id b8so2868678pgn.5
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 15:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L/HMq/Ry7hLBz4Lt22s3Ecew1z4s9xSiVQPrGlGREuk=;
 b=Bo3jjassc7D7PHF/l0JgJKeOHD/Xl5rVOsiow3k7/qZjjg0j1nixc5Le7nbWDpT4nA
 TvkTmQMmj1VEJsHlq9tV7BKlduBOls8SA1KMhb/u1ISRMsrJs1/RxSIr6fp8bLg/e8Zz
 O8P0L/VS1u+90DFCxI01rryfnVCkyyUA5hQJ0JGdBscSHXyIUQlMUgruTWNT0stsg5sk
 rQPKyRhIt/Kaaf1WnEgK+jaZrb7cNG6tQFbg3HflcJr2p14b76FSDxNI1dfW+BdMhujG
 c9Tf2tu/Tbf0F/dTAs8C9Qoxn2OsZ4ilE7/u2GjQCmq5YgTp5lE0dRsfdew5LZ50y0lF
 0REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L/HMq/Ry7hLBz4Lt22s3Ecew1z4s9xSiVQPrGlGREuk=;
 b=L8LNAowf6uLYZV0H9UKqwJE9fUQ6mY4/2csK2EEKMUTJBDbhDkJb0LREpXn1wplBI6
 ox4+X62CeRaEM24ht1pTo+wD8t6uT2Ad7tUqLdTMsCP6PKWc+duweQoNZNE7gDXXTY5q
 zfIiGfvDJ0lYR1KV19Al9QZK8E3zULVqLnW5SwZnMbDCfktYo4JyPFGoOatULuhVNuQl
 WnljY0p4SRltxg2mGDLGl99w8sfg4JDsIBWtCpJsb3HGxDPof5BiivCTtdZICawBWwCS
 V8lcTtQG6RSWPRDG4zYrBUNZ2TsX2eg/j3ZwuDiDWe0EKh27ClsXolJFkx+ZSxeZtqRV
 T5Jw==
X-Gm-Message-State: AHPjjUhPCROT3VwNht2EsZ+3IMY29dMe/BH7aFhX7nQ9WBJBHG0LMmlr
 3+Nc1Uv+XlJhmQYO
X-Google-Smtp-Source: ADKCNb5FBsKtwdLEC86x+9wg+OdCpU3dB3W7r3Uq1c+2An7gDNkCGO8uN5ZbOWTpxN0Vp3UdIIH/pA==
X-Received: by 10.84.229.69 with SMTP id d5mr43442pln.194.1504220062354;
 Thu, 31 Aug 2017 15:54:22 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id m66sm888461pfc.22.2017.08.31.15.54.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 31 Aug 2017 15:54:21 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Thu, 31 Aug 2017 15:53:59 -0700
Message-Id: <20170831225400.19756-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170831225400.19756-1-brendanhiggins@google.com>
References: <20170831225400.19756-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 31 Aug 2017 22:54:25 -0000

Add a common device tree for all Nuvoton NPCM750 BMCs and a board
specific device tree for the NPCM750 (Poleg) evaluation board.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 +++++
 .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  59 +++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 177 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 +++++
 5 files changed, 323 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h

diff --git a/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
new file mode 100644
index 000000000000..e81f85b400cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
@@ -0,0 +1,42 @@
+=========================================================
+Secondary CPU enable-method "nuvoton,npcm7xx-smp" binding
+=========================================================
+
+To apply to all CPUs, a single "nuvoton,npcm7xx-smp" enable method should be
+defined in the "cpus" node.
+
+Enable method name:	"nuvoton,npcm7xx-smp"
+Compatible machines:	"nuvoton,npcm750"
+Compatible CPUs:	"arm,cortex-a9"
+Related properties:	(none)
+
+Note:
+This enable method needs valid nodes compatible with "arm,cortex-a9-scu" and
+"nuvoton,npcm750-gcr".
+
+Example:
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "nuvoton,npcm7xx-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&L2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <1>;
+			next-level-cache = <&L2>;
+		};
+	};
+
diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.txt b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
new file mode 100644
index 000000000000..2d87d9ecea85
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
@@ -0,0 +1,6 @@
+NPCM Platforms Device Tree Bindings
+-----------------------------------
+NPCM750 SoC
+Required root node properties:
+	- compatible = "nuvoton,npcm750";
+
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
new file mode 100644
index 000000000000..54df32cff21b
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -0,0 +1,59 @@
+/*
+ * DTS file for all NPCM750 SoCs
+ *
+ * Copyright 2012 Tomer Maimon <tomer.maimon@nuvoton.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 Development Board (Device Tree)";
+	compatible = "nuvoton,npcm750";
+
+	chosen {
+		stdout-path = &serial3;
+		bootargs = "earlyprintk=serial,serial3,115200";
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	cpus {
+		enable-method = "nuvoton,npcm7xx-smp";
+	};
+
+	clk: clock-controller@f0801000 {
+		status = "okay";
+	};
+
+	apb {
+		watchdog1: watchdog@f0009000 {
+			status = "okay";
+		};
+
+		serial0: serial0@f0001000 {
+			status = "okay";
+		};
+
+		serial1: serial1@f0002000 {
+			status = "okay";
+		};
+
+		serial2: serial2@f0003000 {
+			status = "okay";
+		};
+
+		serial3: serial3@f0004000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
new file mode 100644
index 000000000000..bca96b3ae9d3
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,177 @@
+/*
+ * DTSi file for the NPCM750 SoC
+ *
+ * Copyright 2012 Tomer Maimon <tomer.maimon@nuvoton.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "skeleton.dtsi"
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <1>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	gcr: gcr@f0800000 {
+		compatible = "nuvoton,npcm750-gcr", "syscon",
+			"simple-mfd";
+		reg = <0xf0800000 0x1000>;
+	};
+
+	scu: scu@f03fe000 {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0xf03fe000 0x1000>;
+	};
+
+	l2: l2-cache@f03fc000 {
+		compatible = "arm,pl310-cache";
+		reg = <0xf03fc000 0x1000>;
+		interrupts = <0 21 4>;
+		cache-unified;
+		cache-level = <2>;
+		clocks = <&clk NPCM7XX_CLK_AXI>;
+	};
+
+	gic: interrupt-controller@f03ff000 {
+		compatible = "arm,cortex-a9-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0xf03ff000 0x1000>,
+		    <0xf03fe100 0x100>;
+	};
+
+	clk: clock-controller@f0801000 {
+		compatible = "nuvoton,npcm750-clk";
+		#clock-cells = <1>;
+		reg = <0xf0801000 0x1000>;
+	};
+
+	/* external clock signal rg1refck, supplied by the phy */
+	clk-rg1refck {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	/* external clock signal rg2refck, supplied by the phy */
+	clk-rg2refck {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+
+	clk-xin {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
+
+	timer@f03fe600 {
+		compatible = "arm,cortex-a9-twd-timer";
+		reg = <0xf03fe600 0x20>;
+		interrupts = <1 13 0x304>;
+		clocks = <&clk NPCM7XX_CLK_TIMER>;
+	};
+
+	apb {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		timer0: timer@f0000000 {
+			compatible = "nuvoton,npcm750-timer";
+			interrupts = <0 32 4>;
+			reg = <0xf0000000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog0: watchdog@f0008000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 47 4>;
+			reg = <0xf0008000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog1: watchdog@f0009000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 48 4>;
+			reg = <0xf0009000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog2: watchdog@f000a000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 49 4>;
+			reg = <0xf000a000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		serial0: serial0@f0001000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0001000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 2 4>;
+			status = "disabled";
+		};
+
+		serial1: serial1@f0002000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0002000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 3 4>;
+			status = "disabled";
+		};
+
+		serial2: serial2@f0003000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0003000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 4 4>;
+			status = "disabled";
+		};
+
+		serial3: serial3@f0004000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0004000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 5 4>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
new file mode 100644
index 000000000000..c69d3bbf7e42
--- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright (C) 2016 Nuvoton Technologies,  tali.perry@nuvoton.com
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ */
+
+#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
+#define _DT_BINDINGS_CLK_NPCM7XX_H
+
+#define NPCM7XX_CLK_PLL0	0
+#define NPCM7XX_CLK_PLL1	1
+#define NPCM7XX_CLK_PLL2	2
+#define NPCM7XX_CLK_GFX		3
+#define NPCM7XX_CLK_APB1	4
+#define NPCM7XX_CLK_APB2	5
+#define NPCM7XX_CLK_APB3	6
+#define NPCM7XX_CLK_APB4	7
+#define NPCM7XX_CLK_APB5	8
+#define NPCM7XX_CLK_MC		9
+#define NPCM7XX_CLK_CPU		10
+#define NPCM7XX_CLK_SPI0	11
+#define NPCM7XX_CLK_SPI3	12
+#define NPCM7XX_CLK_SPIX	13
+#define NPCM7XX_CLK_UART_CORE	14
+#define NPCM7XX_CLK_TIMER	15
+#define NPCM7XX_CLK_HOST_UART	16
+#define NPCM7XX_CLK_MMC		17
+#define NPCM7XX_CLK_SDHC	18
+#define NPCM7XX_CLK_ADC		19
+#define NPCM7XX_CLK_GFX_MEM	20
+#define NPCM7XX_CLK_USB_BRIDGE	21
+#define NPCM7XX_CLK_AXI		22
+#define NPCM7XX_CLK_AHB		23
+#define NPCM7XX_CLK_EMC		24
+#define NPCM7XX_CLK_GMAC	25
+
+#endif
-- 
2.14.1.581.gf28d330327-goog
