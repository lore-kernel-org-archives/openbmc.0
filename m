Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZgb30PM1zDrHh
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 19:23:24 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w1584uX9030761;
 Mon, 5 Feb 2018 10:04:56 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8CF955A90A; Mon,  5 Feb 2018 10:22:59 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
 mark.rutland@arm.com, tali.perry1@gmail.com, avifishman70@gmail.com,
 brendanhiggins@google.com, joel@jms.id.au
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] dt-binding: clock: document NPCM7xx clock DT bindings
Date: Mon,  5 Feb 2018 10:22:54 +0200
Message-Id: <1517818975-11427-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
References: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 08:23:27 -0000

Added device tree binding documentation for Nuvoton NPCM7xx clocks.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/clock/nuvoton,npcm7xx-clk.txt         | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt b/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
new file mode 100644
index 000000000000..1ba1945d3616
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
@@ -0,0 +1,84 @@
+* Nuvoton NPCM7XX Clock Controller
+
+Nuvoton Poleg BMC NPCM7XX contain integrated clock
+controller, which generates and supplies clock to all modules within the BMC.
+
+Required Properties:
+
+- compatible: should be one of following:
+	- "nuvoton,npcm750-clk" : for clock controller of Nuvoton
+	  Poleg BMC NPCM750
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+
+- #clock-cells: should be 1.
+
+All available clocks are defined as preprocessor macros in
+dt-bindings/clock/nuvoton,npcm7xx-clock.h header and can beused in device tree
+sources.
+
+External clocks:
+
+There are several clocks that are generated outside the BMC. All clocks are of
+a known fixed value that cannot be chagned. Therefor these values are hard coded
+inside the driver and registered on init.
+
+The clock modules contains 4 PLL, 20 dividers and 11 muxes. All these settings
+are set before Linux boot and are not to be altered by the Linux. This driver is
+used only to read the values clocks, not to set them.
+
+In addition to the clock driver, there are 3 external clocks suppling the
+network, which are of fixed values, set on on the device tree, but not used by
+ the clock module. Example can be found below.
+
+Example: Clock controller node:
+
+	clk: clock-controller@f0801000 {
+		compatible = "nuvoton,npcm750-clk";
+		#clock-cells = <1>;
+		clock-controller;
+		reg = <0xf0801000 0x1000>;
+		status = "okay";
+	};
+
+Example: Required external clocks for network:
+
+		/* external clock signal rg1refck, supplied by the phy */
+		clk_rg1refck: clk_rg1refck {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+			clock-output-names = "clk_rg1refck";
+		};
+
+		/* external clock signal rg2refck, supplied by the phy */
+		clk_rg2refck: clk_rg2refck {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+			clock-output-names = "clk_rg2refck";
+		};
+
+		clk_xin: clk_xin {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+			clock-output-names = "clk_xin";
+		};
+
+Example: UART controller node that consumes the clock generated by the clock
+  controller (refer to the standard clock bindings for information about
+  "clocks" and "clock-names" properties):
+
+	uart0: serial@e2900000 {
+		compatible = "Nuvoton,s5pv210-uart";
+		reg = <0xe2900000 0x400>;
+		interrupt-parent = <&vic1>;
+		interrupts = <10>;
+		clock-names = "uart", "clk_uart_baud0",
+				"clk_uart_baud1";
+		clocks = <&clocks UART0>, <&clocks UART0>,
+				<&clocks SCLK_UART0>;
+	};
-- 
2.14.1
