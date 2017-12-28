Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6mXP5QVYzDqMn
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 21:43:14 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBSAPLZJ016514;
 Thu, 28 Dec 2017 12:25:21 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 1B06C5A8F9; Thu, 28 Dec 2017 12:43:05 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 1/2] dt-binding: pinctrl: document NPCM7xx
 pin controller DT bindings
Date: Thu, 28 Dec 2017 12:43:01 +0200
Message-Id: <1514457782-32018-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1514457782-32018-1-git-send-email-tmaimon77@gmail.com>
References: <1514457782-32018-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 28 Dec 2017 10:43:18 -0000

Added device tree binding documentation for
Nuvoton NPCM7xx pin controller

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
new file mode 100644
index 000000000000..a2bba4d5893e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
@@ -0,0 +1,70 @@
+Nuvoton NPCM7XX Pin Controllers
+
+The NPCM7XX Pin Controller multi-function routed through
+the multiplexing block, Each pin supports GPIO functionality (GPIOx)
+and multiple functions that directly connect the pin to different
+hardware blocks.
+
+Required properties:
+- compatible      : "nuvoton,npcm750-pinctrl" for Poleg NPCM750.
+
+Contents of function subnode node
+---------------------------------
+Required subnode-properties:
+- groups : An array of strings. Each string contains the name of a group.
+- function: A string containing the name of the function to mux to the
+  group.
+
+  Valid values for group and function names can be found from looking at the
+  group and function arrays in driver files:
+  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+
+For example, pinctrl might have subnodes like the following:
+	r1err_pins: r1err_pins {
+		groups = "r1err";
+		function = "r1err";
+	};
+	r1md_pins: r1md_pins {
+		groups = "r1md";
+		function = "r1md";
+	};
+	r1_pins: r1_pins {
+		groups = "r1";
+		function = "r1";
+	};
+
+For a specific board, if it wants to use EMC (10/100 network),
+it can add the following to its board-specific .dts file.
+emc0: eth@f0825000 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+				 &r1err_pins
+				 &r1md_pins>;
+	phy-mode = "rmii";
+
+if EMC hardware is not used the EMC pin can used for GPIO56
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio56_pins>
+
+Examples
+========
+
+pinctrl: pinctrl@0 {
+	compatible = "nuvoton,npcm7xx-pinctrl";
+	status = "okay";
+	iox1_pins: iox1_pins {
+		groups = "iox1";
+		function = "iox1";
+	};
+	iox2_pins: iox2_pins {
+		groups = "iox2";
+		function = "iox2";
+	};
+
+	....
+
+	clkreq_pins: clkreq_pins {
+		groups = "clkreq";
+		function = "clkreq";
+	};
+};
-- 
2.14.1
