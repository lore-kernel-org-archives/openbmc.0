Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2QhQ41gbzDrYD
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 20:05:06 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBL8lFHc029943;
 Thu, 21 Dec 2017 10:47:15 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 77E4E5A93F; Thu, 21 Dec 2017 11:04:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: serial: document NPCM UART
 DT bindings
Date: Thu, 21 Dec 2017 11:04:51 +0200
Message-Id: <1513847092-6304-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513847092-6304-1-git-send-email-tmaimon77@gmail.com>
References: <1513847092-6304-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 21 Dec 2017 09:05:11 -0000

Added device tree binding documentation for Nuvoton NPCM UART.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/serial/nuvoton,npcm-uart.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt b/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
new file mode 100644
index 000000000000..52c44f83d274
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
@@ -0,0 +1,24 @@
+Nuvoton NPCM Universal Asynchronous Receiver/Transmitter (UART)
+
+Required properties:
+- compatible      : "nuvoton,npcm750-uart" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the UART interrupt with flags for falling edge.
+- clocks          : phandle of UART reference clock.
+
+Note: Each uart controller should have an alias correctly numbered
+in "aliases" node.
+
+Example:
+
+aliases {
+	serial0 = &serial0;
+};
+
+serial0: serial0@f0001000 {
+	compatible = "nuvoton,npcm750-uart";
+	reg = <0xf0001000 0x1000>;
+	clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+	interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+	status = "disabled";
+};
\ No newline at end of file
-- 
2.14.1
