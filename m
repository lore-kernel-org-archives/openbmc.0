Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nZEd8YZy"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJ40P5TtszDqJ6
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 09:51:01 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id k70so11632480itk.0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=39u6kEuZSpjdcP4WsZdINTnjSAmu1mzznONTS+S/ux4=;
 b=nZEd8YZyqJL7023zApfJ6rZ3HMVOtZM8RermcBK6LMnFxZWl8hGzOMn4i419bfUZSK
 La8zfdlM7rnD5cengT2zqLO57K+6NrBLD5uO6AN056/yfsYwABthyj3jkj9+ksCGaMiG
 Tc7ywxkYRd2Yu9A4WL0tiNsZ/DOXRpr/mO3cZzKvdiFY8Hb2zIerT7zG6ywz290zQjeI
 Bx02QJK/f+duQaGVOorWNcdd9rjMYcbMarfjme0KF2HYu3TDgug7ToeEssPHQW/kQ85A
 q+ct4ixyN6a42zzl7ADVHoV7+FmvmMVqwIQD62R1+KJlxBAiP3WYm29rWwIxMFhH1cC5
 IyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=39u6kEuZSpjdcP4WsZdINTnjSAmu1mzznONTS+S/ux4=;
 b=JZU1bw8LdmXRtDH/gVBH9RnQA+qlIeB43yrzryym8Cly6lFk/vPXn1XUj3tu8W7VtW
 +7AmrWMxa05AkuR2VdYypJA11qy3tUzLXC5JtlrS/rfyxlWpI3t4+H4brLiHnnLHRWUu
 1OLSKSDuR4Tgsz1rOEN4cii8VK24XVJ2PDD034DGj8jVOGn3n/dwbZfQUwSm65uO3cxo
 8J1HgJYzV77cVuGdwgRRiaJ3Jf/RE0kZ9m0t+K4wWbQtVuGbnEBfV5hdDzu64v0zR2Yf
 nFSpZoYXGNZMkFLPMHi0OGTjTFYdJAjzGRKpa0DqZfeiyQ1SH5DBWd/sAGieetMD23ou
 CB+w==
X-Gm-Message-State: AMCzsaWxYrjF9rZg8XoQGWkABtb8gor0ODtJCATlsaMEl+sjPfKsUoGl
 iUaPrGBC5JFUoFu8Fan6ZaSagg==
X-Google-Smtp-Source: ABhQp+Qw4TTA/eWCUkCAZvwOemgVXBRYgoApft6EyyMHn7PTMJPTDbmUhxmtv4d4Sfx0Cke0XD/PZw==
X-Received: by 10.36.98.20 with SMTP id d20mr29235itc.110.1508453459384;
 Thu, 19 Oct 2017 15:50:59 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f193sm521979ita.27.2017.10.19.15.50.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 19 Oct 2017 15:50:58 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Thu, 19 Oct 2017 15:50:49 -0700
Message-Id: <20171019225050.25410-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.rc0.271.g36b669edcc-goog
In-Reply-To: <20171019225050.25410-1-brendanhiggins@google.com>
References: <20171019225050.25410-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 19 Oct 2017 22:51:02 -0000

Add a common device tree for all Nuvoton NPCM750 BMCs and a board
specific device tree for the NPCM750 (Poleg) evaluation board.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
---
 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 +++++
 .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  48 +++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 198 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 ++++
 5 files changed, 333 insertions(+)
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
index 000000000000..a0675e584125
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -0,0 +1,48 @@
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
+&watchdog1 {
+	status = "okay";
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
index 000000000000..85506b3cdd39
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,198 @@
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
+		gcr: gcr@f0800000 {
+			compatible = "nuvoton,npcm750-gcr", "syscon",
+				"simple-mfd";
+			reg = <0x800000 0x1000>;
+		};
+
+		scu: scu@f03fe000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0x3fe000 0x1000>;
+		};
+
+		l2: cache-controller@f03fc000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x3fc000 0x1000>;
+			interrupts = <0 21 4>;
+			cache-unified;
+			cache-level = <2>;
+			clocks = <&clk NPCM7XX_CLK_AXI>;
+		};
+
+		gic: interrupt-controller@f03ff000 {
+			compatible = "arm,cortex-a9-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x3ff000 0x1000>,
+			    <0x3fe100 0x100>;
+		};
+
+		timer@f03fe600 {
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
+		ranges = <0x80000000 0x80000000 0x40010000
+			  0xe0800000 0xe0800000 0x0f800000
+			  0x00000000 0xf0000000 0x00900000
+			  0xf8000000 0xf8000000 0x02000000
+			  0xfb000000 0xfb000000 0x00002000>;
+
+		clk: clock-controller@f0801000 {
+			compatible = "nuvoton,npcm750-clk";
+			#clock-cells = <1>;
+			reg = <0x801000 0x1000>;
+			status = "okay";
+		};
+
+		apb {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0x0 0x0 0x00300000>;
+
+			timer0: timer@f0000000 {
+				compatible = "nuvoton,npcm750-timer";
+				interrupts = <0 32 4>;
+				reg = <0x0 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_TIMER>;
+			};
+
+			watchdog0: watchdog@f0008000 {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <0 47 4>;
+				reg = <0x8000 0x1000>;
+				status = "disabled";
+				clocks = <&clk NPCM7XX_CLK_TIMER>;
+			};
+
+			watchdog1: watchdog@f0009000 {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <0 48 4>;
+				reg = <0x9000 0x1000>;
+				status = "disabled";
+				clocks = <&clk NPCM7XX_CLK_TIMER>;
+			};
+
+			watchdog2: watchdog@f000a000 {
+				compatible = "nuvoton,npcm750-wdt";
+				interrupts = <0 49 4>;
+				reg = <0xa000 0x1000>;
+				status = "disabled";
+				clocks = <&clk NPCM7XX_CLK_TIMER>;
+			};
+
+			serial0: serial@f0001000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x1000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 2 4>;
+				status = "disabled";
+			};
+
+			serial1: serial@f0002000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x2000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 3 4>;
+				status = "disabled";
+			};
+
+			serial2: serial@f0003000 {
+				compatible = "nuvoton,npcm750-uart";
+				reg = <0x3000 0x1000>;
+				clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+				interrupts = <0 4 4>;
+				status = "disabled";
+			};
+
+			serial3: serial@f0004000 {
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
2.15.0.rc0.271.g36b669edcc-goog
