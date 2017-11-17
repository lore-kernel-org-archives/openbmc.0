Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O/1vuQKC"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydngg6zd6zDr6M
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:07:59 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id n89so2573199pfk.11
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1rtNWPZCI7Xf8nzkRGRdP2RGSvxLM3KackNpjrgH2vg=;
 b=O/1vuQKCgL81hASbJuKS4Z/h/8+sGk5Xpj5XHKrU/k/s5XMgwBwzuJ4XeCOu6i7pTo
 c1PTcooKt6kxqH1EZ+ppSAjqMRx3Un3HTGwrKbZItJDVA/IHTJQhWdTVVEX5re6otuzN
 UNDFnpqYPACbLvAhqjgUmHv2djw5TuFUiZBmE0owjvo0SGTM51DcoKFtIkEusuDtCscw
 AuUM8QbQOISSC8KpmnCjcfm4Z1lYAfv6GpC1rDMmG5AOAuupNFbzcGkbyViyOul65iJl
 hSLovps1RZffQ85lJWpn0CUgI8zEVBO+++3zkepFJX3YyFlxIaxkMi3hD5U8A090ntCF
 NTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1rtNWPZCI7Xf8nzkRGRdP2RGSvxLM3KackNpjrgH2vg=;
 b=iWeizfpcJqz0DTRn/KHLo30FAg+XHG3fPf2t/rmLuiB+RH5IuO/HFeAxsiMPpWBK6h
 x28oF4JJoPh70omos65dG36l1wsIZSqrDLQGQn2exGkUiqNLjduXW6cNgWWUYoEERAPI
 CwMyO5tYkFKK3oryN9lfQk9x62ikt6VnqTNHpoCo2++1CYPtKvDfGuMBUvSj+mr6h9S5
 EeYtKiheWSzRSPMXIhGNj2LBCDef+Buj7BHoUNyMTYxvFwf5aBzftOp6/GjcOao6cFYU
 vWAeaqjvgABYFVchQ95aQqDq/nct8UvQ5dhCumfCCqQcOq6SeDZYDtSiZnqJwoWDpck5
 wPwQ==
X-Gm-Message-State: AJaThX5Smn5Y/+P5kX3RADcFOEsGTrYxBxoMbh47CejBu8Ua8VP8rhXm
 hbJDiDMd3ED6XKflTUCv8BJh8Q==
X-Google-Smtp-Source: AGs4zMa9HqSY0oWLtzGNmVtkwKhvSDf3f4GjU7DnDeCgyQ4jIDN5VQjVtxnuPB2I6vaX2z1BoDou2g==
X-Received: by 10.98.94.194 with SMTP id s185mr3097052pfb.56.1510945677438;
 Fri, 17 Nov 2017 11:07:57 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id z71sm11626964pfi.172.2017.11.17.11.07.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 17 Nov 2017 11:07:56 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com, julien.thierry@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v8 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Fri, 17 Nov 2017 11:07:46 -0800
Message-Id: <20171117190747.21642-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.448.gf294e3d99a-goog
In-Reply-To: <20171117190747.21642-1-brendanhiggins@google.com>
References: <20171117190747.21642-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 19:08:00 -0000

Add a common device tree for all Nuvoton NPCM750 BMCs and a board
specific device tree for the NPCM750 (Poleg) evaluation board.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
---
Changes since v7:
  - Added arm,shared-override to l2 cache
  - Cleaned up node names
  - Cleaned up ranges properties
  - Fixed address for nuvoton,npcm750-timer
  - Dropped watchdog nodes for now since the properties in them are wrong
---
 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 +++++
 .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  44 ++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 171 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 +++++
 5 files changed, 302 insertions(+)
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
index 000000000000..9c1122a2c21c
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -0,0 +1,44 @@
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
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
new file mode 100644
index 000000000000..0dbea1195d7e
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,171 @@
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
+		enable-method = "nuvoton,npcm7xx-smp";
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
+/* external clock signal rg1refck, supplied by the phy */
+clk-rg1refck {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <125000000>;
+};
+
+/* external clock signal rg2refck, supplied by the phy */
+clk-rg2refck {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <125000000>;
+};
+
+clk-xin {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <50000000>;
+};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges = <0x0 0xf0000000 0x00900000>;
+
+		gcr: gcr@800000 {
+			compatible = "nuvoton,npcm750-gcr", "syscon",
+				"simple-mfd";
+			reg = <0x800000 0x1000>;
+		};
+
+		scu: scu@3fe000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0x3fe000 0x1000>;
+		};
+
+		l2: cache-controller@3fc000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x3fc000 0x1000>;
+			interrupts = <0 21 4>;
+			cache-unified;
+			cache-level = <2>;
+			clocks = <&clk NPCM7XX_CLK_AXI>;
+			arm,shared-override;
+		};
+
+		gic: interrupt-controller@3ff000 {
+			compatible = "arm,cortex-a9-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x3ff000 0x1000>,
+			    <0x3fe100 0x100>;
+		};
+
+		timer@3fe600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x3fe600 0x20>;
+			interrupts = <1 13 0x304>;
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+	};
+
+	ahb {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		clk: clock-controller@f0801000 {
+			compatible = "nuvoton,npcm750-clk";
+			#clock-cells = <1>;
+			reg = <0xf0801000 0x1000>;
+			status = "okay";
+		};
+
+		apb {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0x0 0xf0000000 0x00300000>;
+
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm750-timer";
+				interrupts = <0 32 4>;
+				reg = <0x8000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_TIMER>;
+			};
+
+			serial0: serial@1000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x1000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 2 4>;
+				status = "disabled";
+			};
+
+			serial1: serial@2000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x2000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 3 4>;
+				status = "disabled";
+			};
+
+			serial2: serial@3000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x3000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 4 4>;
+				status = "disabled";
+			};
+
+			serial3: serial@4000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x4000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 5 4>;
+				status = "disabled";
+			};
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
2.15.0.448.gf294e3d99a-goog
