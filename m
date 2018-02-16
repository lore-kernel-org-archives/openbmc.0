Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kXOtgbtP"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjHS74XCqzF1JY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:40:23 +1100 (AEDT)
Received: by mail-pl0-x244.google.com with SMTP id p5so933057plo.12
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SzGCmWCA/lZuPU23yLLchIRCLWVBdINVlaZ3vNoujQo=;
 b=kXOtgbtPvH0/BTkG1fIt0loRRxTaZfO+OTidF+9s2SaqcTMcyuXscZKO14xtTIFC+Y
 CoEVy2bPwEmAZuthwaiI5z7Yq0E/IEe6IdK2B0LnHzI9VvzHIXpn4smFUakl6VmKwj4R
 akkXziLi2YknwtMLYE4RKp4owhMW2Ffi6VUnYPL9sWeZzPwQwu0iO84xNTRaw4rzaSrf
 FXdy342XhGtiimImxbMBJJsnsqacMwzrglEaibFwRTymxIItirgvfKMKKRlGbYSD9pMz
 q6Y9RyTOmye/pS4vGg5jWGsVz9K8lQgMaq7K/AWliePgdy+2n1ZPJmL2+F4L7OwfgJfs
 PDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SzGCmWCA/lZuPU23yLLchIRCLWVBdINVlaZ3vNoujQo=;
 b=r61Cv98//FO3uvfj3cKQ/zA9T/rsdkb9ZYvaF6VbhtGqbkhLwjk7/DyP/KANecIVzd
 VkmyFom18VsEgkMnJNOFL2bm7O2tg2p4FTdvN0DJGECweAY3omZ9sZDKc7+BiLstlVry
 nUVR2PhILGaIhSnBwUq5qMIEpesXMnQdhPcbarYq6GV4EXtNMrUxQAuWDm59ZdVbvs9d
 i56ZDm6Dg0BN/vXeJuv0PBuXqKw6P/flvYzVm0Ru055Tf/7eat5S7IfDtOmCA7+rRcVx
 lyPQDzzEeYVSIDOCSUaKkVbqfHzDJvv2WeRTydgum23LMS6yaY+Ksog3c+5P6JxPO7xG
 /O9A==
X-Gm-Message-State: APf1xPAi2uHQqSpu+veCMusKBt+PJR1yjJdr598LbhVDcB4QyzCeyhYV
 udsNSpSKqI3iG8KvU0es9nv37g==
X-Google-Smtp-Source: AH8x225JIvKK4ocHvGHgjHObINF6cqTnh5303VQoNR64/rwqGuFW0ftPaajRbhxxaD5KME1+XsTmUQ==
X-Received: by 2002:a17:902:3124:: with SMTP id
 w33-v6mr4369220plb.356.1518748821047; 
 Thu, 15 Feb 2018 18:40:21 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g16sm9094041pfd.23.2018.02.15.18.40.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 15 Feb 2018 18:40:20 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com,
 pombredanne@nexb.com, arnd@arndb.de, olof@lixom.net, khilman@kernel.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Thu, 15 Feb 2018 18:40:10 -0800
Message-Id: <20180216024011.189157-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.1.291.g4437f3f132-goog
In-Reply-To: <20180216024011.189157-1-brendanhiggins@google.com>
References: <20180216024011.189157-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 16 Feb 2018 02:40:24 -0000

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
 .../arm/cpu-enable-method/nuvoton,npcm750-smp |  42 +++++
 .../devicetree/bindings/arm/npcm/npcm.txt     |   6 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |  35 ++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        | 165 ++++++++++++++++++
 5 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi

diff --git a/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
new file mode 100644
index 000000000000..8e043301e28e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
@@ -0,0 +1,42 @@
+=========================================================
+Secondary CPU enable-method "nuvoton,npcm750-smp" binding
+=========================================================
+
+To apply to all CPUs, a single "nuvoton,npcm750-smp" enable method should be
+defined in the "cpus" node.
+
+Enable method name:	"nuvoton,npcm750-smp"
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
+		enable-method = "nuvoton,npcm750-smp";
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
index ade7a38543dc..eeab5dac50ab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -304,6 +304,8 @@ dtb-$(CONFIG_ARCH_LPC18XX) += \
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
index 000000000000..839e45cfd695
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
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
+			clocks = <&clk 10>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk 10>;
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
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			cache-unified;
+			cache-level = <2>;
+			clocks = <&clk 22>;
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
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&clk 15>;
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
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1000>;
+				clocks = <&clk 15>;
+			};
+
+			serial0: serial@1000 {
+				compatible = "ns16550a";
+				reg = <0x1000 0x1000>;
+				clocks = <&clk 14>;
+				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial1: serial@2000 {
+				compatible = "ns16550a";
+				reg = <0x2000 0x1000>;
+				clocks = <&clk 14>;
+				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial2: serial@3000 {
+				compatible = "ns16550a";
+				reg = <0x3000 0x1000>;
+				clocks = <&clk 14>;
+				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial3: serial@4000 {
+				compatible = "ns16550a";
+				reg = <0x4000 0x1000>;
+				clocks = <&clk 14>;
+				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+		};
+	};
+};
-- 
2.16.1.291.g4437f3f132-goog
