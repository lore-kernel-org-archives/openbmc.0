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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JShn4pClzDr1X
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 00:25:58 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x7SEPFQc001863;
 Wed, 28 Aug 2019 17:25:15 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 39A4E62A57; Wed, 28 Aug 2019 17:25:15 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 vigneshr@ti.com, bbrezillon@kernel.org, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 1/2] dt-binding: spi: add NPCM FIU controller
Date: Wed, 28 Aug 2019 17:25:12 +0300
Message-Id: <20190828142513.228556-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190828142513.228556-1-tmaimon77@gmail.com>
References: <20190828142513.228556-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 28 Aug 2019 14:26:02 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM Flash Interface Unit(FIU) SPI master controller
using SPI-MEM interface.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
new file mode 100644
index 000000000000..a388005842ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
@@ -0,0 +1,47 @@
+* Nuvoton FLASH Interface Unit (FIU) SPI Controller
+
+NPCM FIU supports single, dual and quad communication interface.
+
+The NPCM7XX supports three FIU modules,
+FIU0 and FIUx supports two chip selects,
+FIU3 support four chip select.
+
+Required properties:
+  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
+  - #address-cells : should be 1.
+  - #size-cells : should be 0.
+  - reg : the first contains the register location and length,
+          the second contains the memory mapping address and length
+  - reg-names: Should contain the reg names "control" and "memory"
+  - clocks : phandle of FIU reference clock.
+
+Required properties in case the pins can be muxed:
+  - pinctrl-names : a pinctrl state named "default" must be defined.
+  - pinctrl-0 : phandle referencing pin configuration of the device.
+
+Optional property:
+  - nuvoton,spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
+
+Aliases:
+- All the FIU controller nodes should be represented in the aliases node using
+  the following format 'fiu{n}' where n is a unique number for the alias.
+  In the NPCM7XX BMC:
+  		fiu0 represent fiu 0 controller
+  		fiu1 represent fiu 3 controller
+  		fiu2 represent fiu x controller
+
+Example:
+fiu3: spi@c00000000 {
+	compatible = "nuvoton,npcm750-fiu";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+	reg-names = "control", "memory";
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi3_pins>;
+	spi-nor@0 {
+			...
+	};
+};
+
-- 
2.18.0
