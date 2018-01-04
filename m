Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC3462qZQzDqqM
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 20:52:00 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w049Y2CW030697;
 Thu, 4 Jan 2018 11:34:02 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 4D6935A950; Thu,  4 Jan 2018 11:51:48 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 1/2] dt-binding: rng: document NPCM7xx rng
 DT bindings
Date: Thu,  4 Jan 2018 11:51:45 +0200
Message-Id: <1515059506-17818-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1515059506-17818-1-git-send-email-tmaimon77@gmail.com>
References: <1515059506-17818-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 09:52:07 -0000

Added device tree binding documentation for
Nuvoton NPCM7xx random number generator.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt

diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt
new file mode 100644
index 000000000000..3b4e81037263
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt
@@ -0,0 +1,16 @@
+NPCM7XX SoC random number generator.
+
+Required properties:
+- compatible  : "nuvoton,npcm750-rng" for Poleg NPCM750
+- reg         : Offset and length of the registers set for the rng device.
+
+Optional:
+- clocks          : phandle of rng reference clock.
+
+Example:
+
+rng: rng@f000b000 {
+	compatible = "nuvoton,npcm750-rng";
+	reg = <0xf000b000 0x1000>;
+	clocks = <&clk NPCM7XX_CLK_APB1>;
+};
-- 
2.14.1
