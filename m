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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43HhCp2PwWzDqXs
 for <openbmc@lists.ozlabs.org>; Sun, 16 Dec 2018 22:00:53 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBGAUg3m024024;
 Sun, 16 Dec 2018 12:30:42 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id CC12B62DA4; Sun, 16 Dec 2018 13:00:40 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 07/11] dt-binding: bmc: add npcm7xx pci mailbox
 document
Date: Sun, 16 Dec 2018 13:00:31 +0200
Message-Id: <20181216110035.151310-8-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181216110035.151310-1-tmaimon77@gmail.com>
References: <20181216110035.151310-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 16 Dec 2018 11:00:55 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM7XX PCI mailbox.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/bmc/npcm7xx-pci-mbox.txt      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
new file mode 100644
index 000000000000..e5585f38041b
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
@@ -0,0 +1,19 @@
+Nuvoton NPCM7xx PCI mail box interface
+
+Nuvoton BMC NPCM7xx PCI mail box, The mailbox is a high-bandwidth
+communication module between the BMC CPU and host CPU.
+
+Required properties for lpc_bpc node
+- compatible	: "nuvoton,npcm750-pci-mbox" for Poleg NPCM7XX.
+- reg 			: specifies two address space
+					1. physical base address and size of the registers.
+					2. physical base address and size of the dual-ported RAM.
+- interrupts	: contain the PCI mail box interrupt with flags for falling edge.
+
+Example:
+	pcimbox: pcimbox@f0848000 {
+		compatible = "nuvoton,npcm750-pci-mbox", "simple-mfd", "syscon";
+		reg = <0xf084C000 0x8
+			0xf0848000 0x3F00>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.14.1
