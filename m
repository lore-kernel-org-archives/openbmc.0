Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0hXv5lxlzDrnB
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 00:22:36 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBID4msu026783;
 Mon, 18 Dec 2017 15:04:48 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 1F70E5A934; Mon, 18 Dec 2017 15:22:27 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: watchdog: document NPCM7xx
 watchdog DT bindings
Date: Mon, 18 Dec 2017 15:22:23 +0200
Message-Id: <1513603344-5700-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513603344-5700-1-git-send-email-tmaimon77@gmail.com>
References: <1513603344-5700-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 13:22:41 -0000

Added device tree binding documentation for Nuvoton NPCM7xx watchdog.
---
 .../bindings/watchdog/nuvoton,npcm7xx-wdt.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm7xx-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7xx-wdt.txt
new file mode 100644
index 000000000000..211f93cab141
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm7xx-wdt.txt
@@ -0,0 +1,23 @@
+Nuvoton NPCM7xx watchdog timer
+
+Nuvoton NPCM7xx have three watchdog timer modules, each watchdog timer is a free-running timer
+with programmable timeout intervals.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-wdt" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the timer interrupt with flags for
+                    falling edge.
+
+Optional:
+- clocks          : phandle of watchdog timer reference clock.
+
+Example:
+
+watchdog0: watchdog@f0008000 {
+	compatible = "nuvoton,npcm750-wdt";
+	interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+	reg = <0xf0008000 0x1000>;
+	status = "disabled";
+	clocks = <&clk NPCM7XX_CLK_TIMER>;
+};
\ No newline at end of file
-- 
2.14.1
