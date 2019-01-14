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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dYfc0mxgzDqVn
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 00:07:35 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0ECbK1Q019002;
 Mon, 14 Jan 2019 14:37:20 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id B454B62DA4; Mon, 14 Jan 2019 15:07:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>
Subject: [linux dev-4.19 10/15] dt-binding: net: document NPCM7xx EMC DT
 bindings
Date: Mon, 14 Jan 2019 15:07:05 +0200
Message-Id: <20190114130710.427600-11-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190114130710.427600-1-tmaimon77@gmail.com>
References: <20190114130710.427600-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 13:07:36 -0000

Added device tree binding documentation for
Nuvoton NPCM7xx Ethernet MAC Controller (EMC).

Signed-off-by: Avi Fishman <avifishman70@gmail.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/net/nuvoton,npcm7xx-emc.txt           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt

diff --git a/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
new file mode 100644
index 000000000000..4227597401f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
@@ -0,0 +1,36 @@
+Nuvoton NPCM7XX 10/100 Ethernet MAC Controller (EMC)
+
+The NPCM750x provides two identical Ethernet MAC Controllers
+for WAN/LAN applications
+
+Required properties:
+- device_type     : Should be "network"
+- compatible      : "nuvoton,npcm750-emc" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the emc interrupts with flags for falling edge.
+                    first interrupt dedicated to Txirq
+                    second interrupt dedicated to Rxirq
+- phy-mode        : Should be "rmii" (see ethernet.txt in the same directory)
+- clocks          : phandle of emc reference clock.
+- use-ncsi        : Use the NC-SI stack instead of an MDIO PHY
+
+Example:
+
+emc0: eth@f0825000 {
+	device_type = "network";
+	compatible = "nuvoton,npcm750-emc";
+	reg = <0xf0825000 0x1000>;
+	interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+	             <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	phy-mode = "rmii";
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+
+	#use-ncsi; /* add this to support ncsi */
+
+	clock-names = "clk_emc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+	             &r1err_pins
+	             &r1md_pins>;
+	status = "okay";
+};
\ No newline at end of file
-- 
2.14.1
