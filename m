Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC6cN4RZnzDqyK
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 23:31:46 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w04CDnCh000929;
 Thu, 4 Jan 2018 14:13:49 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id E06535A955; Thu,  4 Jan 2018 14:31:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: i2c: document NPCM7xx I2C
 bus DT bindings
Date: Thu,  4 Jan 2018 14:31:33 +0200
Message-Id: <1515069094-4161-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1515069094-4161-1-git-send-email-tmaimon77@gmail.com>
References: <1515069094-4161-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 12:31:50 -0000

Added device tree binding documentation for
Nuvoton NPCM7xx I2C bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-npcm7xx.txt        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
new file mode 100644
index 000000000000..513584d33cab
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
@@ -0,0 +1,23 @@
+Nuvoton NPCM7XX I2C bus
+
+The NPCM750x includes sixteen I2C busses
+
+Required properties:
+- compatible      : "nuvoton,npcm750-i2c-bus" for Poleg NPCM750.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the I2C interrupt with flags for falling edge.
+- clocks          : phandle of I2C reference clock.
+
+Optional:
+- bus-frequency   : Contain the I2C bus frequency,
+					the defualt I2C bus frequency is 100000.
+
+Example:
+
+i2c0: i2c-bus@f0080000 {
+	reg = <0xf0080000 0x1000>;
+	compatible = "nuvoton,npcm750-i2c-bus";
+	clocks = <&clk NPCM7XX_CLK_APB2>;
+	bus-frequency = <100000>;
+	interrupts = <0 64 4>;
+};
-- 
2.14.1
