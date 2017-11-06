Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVygf5vpxzDr8P
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 03:29:13 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vA6GBOHq010521;
 Mon, 6 Nov 2017 18:11:24 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 0263B5A91C; Mon,  6 Nov 2017 18:28:39 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
 tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 2/2] dt-binding: timer: document NPCM7xx timer DT bindings
Date: Mon,  6 Nov 2017 18:28:36 +0200
Message-Id: <1509985716-25759-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
References: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 16:29:19 -0000

Added device tree binding documentation for Nuvoton NPCM7xx timer.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
new file mode 100644
index 000000000000..c5150522e618
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
@@ -0,0 +1,25 @@
+Nuvoton NPCM7xx timer
+
+Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
+timer counters.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the timer interrupt with flags for
+                    falling edge.
+
+Required clocking property, have to be one of:
+- clocks          : phandle of timer reference clock.
+- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
+                    timer (usually 25000000).
+
+Example:
+
+timer@f0008000 {
+    compatible = "nuvoton,npcm750-timer";
+    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    reg = <0xf0008000 0x1000>;
+    clocks = <&clk NPCM7XX_CLK_TIMER>;
+};
+
-- 
2.14.1
