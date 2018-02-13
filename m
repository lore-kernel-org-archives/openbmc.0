Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JWclhq9n"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgttt3TBMzDq8f
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 07:10:14 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id j9so621155pgp.11
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YjwSweBs5oe/9QGQK/oXP8f8v02fGvVRNuBvSnLn0uw=;
 b=JWclhq9nUJTeT58rgLsMBLEIR9hnUV3vcmhaTbEWz3le8SLwSLLZkru7FxuI6qKKHK
 fXcvtQD5irtn6Rg8+kIKVuczH3Z9gk9i8y8drrQ2ca5tbyeM2agFtHSkZnRbHr6VnEzX
 kr1KN2KLm2uaKNmidmgho5rs+hEwXoQKsM/7b4gfmZ1LdBVdv72J9ptZ5rZCNYAcZ3S6
 H+VVjdaxu4NN2gdgwA/N8RTztLGm79v+8nSyeT0d0GL4IaoQ4RjcPO6RdFYR8B2LCOr6
 AH24tEfpEkXZ9B6Z/SMAEwaEAF52BcWO3ErPEEzTU1D8lXis3hLyFVFkZjI8mRItr9ZC
 A5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YjwSweBs5oe/9QGQK/oXP8f8v02fGvVRNuBvSnLn0uw=;
 b=skm/L33G3u+Z83VcuaLMeHdFr3zFLm2J6SQJPDTE7mTscv1xfsabRlSEYnMte7ez59
 uRsGvl9m5EcbONZHIwSl2khlk3j/himMJULiB3uVpt81PIfTthwTKHLDieOFRY56aPZ3
 Bl2EQ17z+diJPepWFKDHXvjzopi0csln5uuoWf2XpnSjrj9uUGjypM4r6jJ2E0DvVZPZ
 dlMOuMXpE84rX8dHqG+B2U1iEAk5OmQ2E26Hz8ylnlbe6m0ICe5LEfrohBv+Lpmf+lZN
 0J5WLHHzvKLyATv3mKJ7d2ycufpjz1OJpg4Y+08G1d/ywaJeIVMENT4znNuIZXSWGHxG
 c4Vg==
X-Gm-Message-State: APf1xPCjPBT/tKiXztxORv+4ep3pcjn8Nik6B0SXRX88//nHj3M/WAHG
 SRhlR9XqVeav1JGEHHbBMOpy0A==
X-Google-Smtp-Source: AH8x225ZfRZkXJvIJmWxVLvnWwEAqn9jveLAPp5ZaoCI0vtpmXKgOVmVoLE2yDy1nS89PC81Us70YA==
X-Received: by 10.98.231.25 with SMTP id s25mr2341489pfh.177.1518552612199;
 Tue, 13 Feb 2018 12:10:12 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id y17sm35166894pfk.67.2018.02.13.12.10.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Feb 2018 12:10:11 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v10 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Tue, 13 Feb 2018 12:09:58 -0800
Message-Id: <20180213200959.160157-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180213200959.160157-1-brendanhiggins@google.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 13 Feb 2018 20:10:15 -0000

Add a common device tree for all Nuvoton NPCM750 BMCs and a board
specific device tree for the NPCM750 (Poleg) evaluation board.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
Tested-by: Joel Stanley <joel@jms.id.au>
---
 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 ++++++
 .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  35 +++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 162 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  35 +++++
 6 files changed, 282 insertions(+)
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
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4b17f35dc9a7..087bcd7401c9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -291,6 +291,8 @@ dtb-$(CONFIG_ARCH_LPC18XX) += \
 dtb-$(CONFIG_ARCH_LPC32XX) += \
 	lpc3250-ea3250.dtb \
 	lpc3250-phy3250.dtb
+dtb-$(CONFIG_ARCH_NPCM750) += \
+	nuvoton-npcm750-evb.dtb
 dtb-$(CONFIG_MACH_MESON6) += \
 	meson6-atv1200.dtb
 dtb-$(CONFIG_MACH_MESON8) += \
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
new file mode 100644
index 000000000000..cabde3d5be8a
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
index 000000000000..51329b671ced
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
+		enable-method = "nuvoton,npcm750-smp";
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
index 000000000000..93918714f16c
--- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
2.16.0.rc1.238.g530d649a79-goog
