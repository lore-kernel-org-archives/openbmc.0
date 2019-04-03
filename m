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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZB276lZvzDq8X
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:13:01 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x33FgluW025903;
 Wed, 3 Apr 2019 18:42:47 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1F36563000; Wed,  3 Apr 2019 19:12:44 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-5.0 v1 1/4] dt-binding: peci: add NPCM PECI documentation
Date: Wed,  3 Apr 2019 19:12:39 +0300
Message-Id: <20190403161242.38159-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 16:13:05 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM Platform Environment Control Interface(PECI).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/peci/peci-npcm.txt         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.txt

diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.txt b/Documentation/devicetree/bindings/peci/peci-npcm.txt
new file mode 100644
index 000000000000..ea5bead7e76a
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-npcm.txt
@@ -0,0 +1,38 @@
+Nuvoton NPCM Platform Environment Control Interface (PECI) bus
+
+Required properties:
+- compatible        : "nuvoton,npcm750-peci" for the NPCM7XX BMC.
+- reg               : specifies PECI physical base address and size of the registers.
+- #address-cells    : Should be <1> required to define a client address.
+- #size-cells       : Should be <0> required to define a client address.
+- interrupts        : Contain the PECI interrupt with flags for falling edge.
+- clocks            : phandle of PECI reference clock.
+
+Optional properties:
+- cmd-timeout-ms    : Command timeout in units of ms.
+                      1 ~ 60000 (default: 1000)
+- pull-down         : Defines the PECI I/O internal pull down operation.
+		      0 - pull down always enable (default)
+		      1 - pull down only during transactions.
+		      2 - pull down always disable.
+- host-neg-bit-rate : Define host negotiation bit rate divider.
+                      the host negotiation bit rate calculate with formula:
+                      clock frequency[Hz] / [4 x {host-neg-bit-rate + 1}]
+		      7 ~ 31 (default: 15)
+- high-volt-range   : Adapts PECI I/O interface to voltage range, the property
+                      is a boolean parameter define as follow:
+		      false - PECI I/O interface voltage range of 0.8-1.06V. (default)
+		      true - PECI I/O interface voltage range of 0.95-1.26V.
+
+Example:
+	peci: peci-bus@100000 {
+		compatible = "nuvoton,npcm750-peci";
+		reg = <0x100000 0x200>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk NPCM7XX_CLK_APB3>;
+		cmd-timeout-ms = <1000>;
+		pull-down = <0>;
+		host-neg-bit-rate = <15>;
+	};
-- 
2.14.1
