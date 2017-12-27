Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6Dky3LSWzDqXw
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 00:50:29 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBRDWcGe027580;
 Wed, 27 Dec 2017 15:32:38 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 6E3745A648; Wed, 27 Dec 2017 15:50:21 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: hwmon: document NPCM7xx
 sensors DT bindings
Date: Wed, 27 Dec 2017 15:50:18 +0200
Message-Id: <1514382619-14336-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
References: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 27 Dec 2017 13:50:36 -0000

Added device tree binding documentation for Nuvoton
NPCM7xx Pulse Width Modulation (PWM) and Fan
Tachometer devices.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/hwmon/npcm7xx-fan.txt          | 18 ++++++++++++++++++
 .../devicetree/bindings/hwmon/npcm7xx-pwm.txt          | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt

diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
new file mode 100644
index 000000000000..cb456632a99f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
@@ -0,0 +1,18 @@
+Nuvoton NPCM7xx fan tachometer (Fan) controller device driver
+
+The NPCM7xx fan tachometer controller supports upto 16 Fan inputs.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-fan" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- clocks          : phandle of fan reference clock.
+- interrupts      : Contain the fan interrupts with flags for
+                    falling edge.
+
+fan: fan@0 {
+	compatible = "nuvoton,npcm750-fan";
+	reg = <0xf0180000 0x8000>;
+	interrupts = <0 96 4>, <0 97 4>, <0 98 4>, <0 99 4>,
+		<0 100 4>, <0 101 4>, <0 102 4>, <0 103 4>;
+	clocks = <&clk NPCM7XX_CLK_APB4>;
+};
diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
new file mode 100644
index 000000000000..8b54a59c272a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
@@ -0,0 +1,16 @@
+Nuvoton NPCM7xx Pulse-width modulation (PWM) controller device driver
+
+The NPCM7xx PWM controller supports upto 8 PWM outputs.
+Each PWM output module have watchdog.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-pwm" for Poleg NPCM750.
+- reg             : Offset and length of the registers set for the device.
+- clocks          : phandle of pwm reference clock.
+
+pwm:pwm@f0103000 {
+	compatible = "nuvoton,npcm750-pwm";
+	reg = <0xf0103000 0x1000
+				0xf0104000 0x1000>;
+	clocks = <&clk NPCM7XX_CLK_APB3>;
+};
-- 
2.14.1
