Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444pgX4DRgzDqPF
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 20:13:58 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x1L8hlUB017897;
 Thu, 21 Feb 2019 10:43:47 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 74DCB62DA4; Thu, 21 Feb 2019 11:13:44 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 v1] dts: npcm730: add npcm730 device tree support
Date: Thu, 21 Feb 2019 11:13:41 +0200
Message-Id: <20190221091341.159327-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 09:14:01 -0000

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
new file mode 100644
index 000000000000..20e13489b993
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
+// Copyright 2018 Google, Inc.
+
+#include "nuvoton-common-npcm7xx.dtsi"
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
+	soc {
+		timer@3fe600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x3fe600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+		};
+	};
+
+	ahb {
+		udc9:udc@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+	};
+};
-- 
2.14.1
