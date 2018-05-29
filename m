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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w9jY2SzMzDr4N
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 21:00:00 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4TAxkqL000308;
 Tue, 29 May 2018 13:59:46 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id C47325AA0B; Tue, 29 May 2018 13:59:45 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: hwmon: Add NPCM7xx PWM
 documentation
Date: Tue, 29 May 2018 13:59:42 +0300
Message-Id: <1527591583-28623-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1527591583-28623-1-git-send-email-tmaimon77@gmail.com>
References: <1527591583-28623-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 11:00:02 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM7xx Pulse Width Modulation (PWM) controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/hwmon/npcm7xx-pwm.txt      | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt

diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
new file mode 100644
index 000000000000..2d8a7ccdc8cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
@@ -0,0 +1,25 @@
+Nuvoton NPCM7xx Pulse-width modulation (PWM) controller device driver
+
+The NPCM7xx has two identical PWM controller modules,
+Each module has four PWM controller outputs.
+NPCM7xx PWM controller module 0 outputs PWM0-3 and NPCM7xx PWM controller
+module 1 outputs PWM4-7.
+
+Required properties:
+- compatible	: "nuvoton,npcm750-pwm" for Poleg NPCM7XX.
+- reg		: Offset and length of the registers set for the device.
+- clocks	: phandle of pwm reference clock.
+- pinctrl-names	: a pinctrl state named "default" must be defined.
+- pinctrl-0 	: phandle referencing pin configuration of the PWM ports.
+
+pwm:pwm@f0103000 {
+	compatible = "nuvoton,npcm750-pwm";
+	reg = <0xf0103000 0x50
+		0xf0104000 0x50>;
+	clocks = <&clk NPCM7XX_CLK_APB3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+			&pwm2_pins &pwm3_pins
+			&pwm4_pins &pwm5_pins
+			&pwm6_pins &pwm7_pins>;
+};
-- 
2.14.1
