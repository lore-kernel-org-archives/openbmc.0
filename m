Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471zn04l7bzDr2J
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 02:54:41 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x9SFs4Qe001373;
 Mon, 28 Oct 2019 17:54:05 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D081560275; Mon, 28 Oct 2019 17:54:04 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 1/3] dt-binding: reset: add NPCM reset controller
 documentation
Date: Mon, 28 Oct 2019 17:54:01 +0200
Message-Id: <20191028155403.134126-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191028155403.134126-1-tmaimon77@gmail.com>
References: <20191028155403.134126-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 28 Oct 2019 15:54:45 -0000

Added device tree binding documentation for Nuvoton BMC
NPCM reset controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/reset/nuvoton,npcm-reset.txt     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
new file mode 100644
index 000000000000..94793285a2ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
@@ -0,0 +1,35 @@
+Nuvoton NPCM Reset controller
+
+In the NPCM Reset controller boot the USB PHY, USB host
+and USB device initialize.
+
+Required properties:
+- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
+- reg : specifies physical base address and size of the register.
+- #reset-cells: must be set to 1
+
+Optional property:
+- nuvoton,sw-reset-number - Contains the software reset number to restart the SoC.
+  NPCM7xx contain four software reset that represent numbers 1 to 4.
+
+  If 'nuvoton,sw-reset-number' is not specfied software reset is disabled.
+
+Example:
+	rstc: rstc@f0801000 {
+		compatible = "nuvoton,npcm750-reset";
+		reg = <0xf0801000 0x70>;
+		#reset-cells = <1>;
+		nuvoton,sw-reset-number = <2>;
+	};
+
+Specifying reset lines connected to IP NPCM7XX modules
+======================================================
+example:
+
+        spi0: spi@..... {
+                ...
+                resets = <&rstc NPCM7XX_RESET_PSPI1>;
+                ...
+        };
+
+The index could be found in <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.
-- 
2.22.0
