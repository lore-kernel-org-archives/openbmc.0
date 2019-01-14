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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dYfR6ZySzDqWH
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 00:07:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0ECbI8m018990;
 Mon, 14 Jan 2019 14:37:18 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D5DD562DA4; Mon, 14 Jan 2019 15:07:15 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 06/15] dt-binding: bmc: Add NPCM7xx LPC BPC
 documentation
Date: Mon, 14 Jan 2019 15:07:01 +0200
Message-Id: <20190114130710.427600-7-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 13:07:28 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM7xx BIOS Post Code (BPC).
The NPCM7xx BPC monitoring two configurable I/O addresses
written by the host on Low Pin Count (LPC) bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
new file mode 100644
index 000000000000..0832c9cbea32
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
@@ -0,0 +1,26 @@
+Nuvoton NPCM7xx LPC BPC interface
+
+Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
+configurable I/O addresses written by the host on the
+Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.
+
+NPCM7xx BPC supports capture double words, when using capture
+double word only I/O address 1 is monitored.
+
+Required properties for lpc_bpc node
+- compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
+- reg 			: specifies physical base address and size of the registers.
+- interrupts	: contain the LPC BPC with flags for falling edge.
+- monitor-ports : contain monitor I/O addresses, at least one monitor I/O
+				  address required
+
+Optional property for lpc_bpc node
+- bpc-en-dwcapture : enable capture double words support.
+
+Example:
+	lpc_bpc: lpc-bpc@f0007040 {
+		compatible = "nuvoton,npcm7xx-lpc-bpc";
+		reg = <0xf0007040 0x14>;
+		monitor-ports = <0x80>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.14.1
