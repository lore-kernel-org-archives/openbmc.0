Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQsN76ybfzDrDP
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 02:16:52 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0NEwifE011920;
 Tue, 23 Jan 2018 16:58:44 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id C993A5A93F; Tue, 23 Jan 2018 17:16:42 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 1/2] dt-binding: serial: document NPCM UART
 DT bindings
Date: Tue, 23 Jan 2018 17:16:39 +0200
Message-Id: <1516720600-2040-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 23 Jan 2018 15:16:56 -0000

Added device tree binding documentation for Nuvoton NPCM UART.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/serial/nuvoton,npcm-uart.txt          | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt b/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
new file mode 100644
index 000000000000..deb663c58002
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nuvoton,npcm-uart.txt
@@ -0,0 +1,34 @@
+Nuvoton NPCM Universal Asynchronous Receiver/Transmitter (UART)
+
+Required properties:
+- compatible      : "nuvoton,npcm750-uart" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the UART interrupt with flags for falling edge.
+
+Required clocking property, have to be one of:
+- clocks          : phandle of UART reference clock.
+- clock-frequency : The frequency in Hz of the clock that drives the NPCM
+                    UART (usually 24000000).
+
+Optional properties:
+- reg-shift 	  : quantity to shift the register offsets by (default 2).
+- fifo-size 	  : the fifo size of the UART (default 1).
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
+	reg-shift = <2>;
+	fifo-size = <14>;
+	status = "disabled";
+};
\ No newline at end of file
-- 
2.14.1
