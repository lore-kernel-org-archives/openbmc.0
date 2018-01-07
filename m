Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zDtKW152pzF0RW
 for <openbmc@lists.ozlabs.org>; Sun,  7 Jan 2018 20:25:02 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0797743013603;
 Sun, 7 Jan 2018 11:07:07 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id EA4D459CAA; Sun,  7 Jan 2018 11:24:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 1/2] dt-binding: mtd: document NPCM7xx SPI
 DT bindings
Date: Sun,  7 Jan 2018 11:24:51 +0200
Message-Id: <1515317092-16187-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1515317092-16187-1-git-send-email-tmaimon77@gmail.com>
References: <1515317092-16187-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 07 Jan 2018 09:25:04 -0000

Added device tree binding documentation for Nuvoton
NPCM7xx Serial Peripheral Interface (SPI) NOR

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/mtd/npcm-spi.txt | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-spi.txt

diff --git a/Documentation/devicetree/bindings/mtd/npcm-spi.txt b/Documentation/devicetree/bindings/mtd/npcm-spi.txt
new file mode 100644
index 000000000000..3c30271c3712
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/npcm-spi.txt
@@ -0,0 +1,31 @@
+* Nuvoton Serial Peripheral Interface(SPI)
+
+Required properties:
+  - compatible : "nuvoton,npcm750-spi" for NPCM750 BMC
+  - #address-cells : should be 1.
+  - #size-cells : should be 0.
+  - reg : the first contains the register location and length,
+          the second contains the memory mapping address and length
+  - reg-names: Should contain the reg names "control" and "memory"
+  - clocks : phandle of SPI reference clock.
+
+Optional properties:
+  - chip-max-address-map: Chip maximum address mapping for direct use.
+  			  the maximum address map size:
+			  NPCM7xx - 0x8000000 (128Mb)
+
+Example:
+
+spi0: spi@fb000000 {
+	compatible = "nuvoton,npcm750-spi";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+	reg-names = "control", "memory";
+	chip-max-address-map = <0x8000000>;
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+	spi-nor@0 {
+			...
+	};
+};
+
-- 
2.14.1
