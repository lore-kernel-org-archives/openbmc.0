Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 613081A0024
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218027373106.10269906576275;
 Tue, 15 Dec 2015 14:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] barreleye: Add gpio LEDs to device tree
Date: Tue, 15 Dec 2015 16:20:25 -0600
Message-Id: <1450218025-11821-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218025-11821-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218025-11821-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 22:20:33 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change exposes the LEDs (which are connected to GPIOs) on
barreleye and palmetto machines as led-class devices. This allows
us to use the full trigger support.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 19 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 18 ++++++++++++++++++
 arch/arm/boot/dts/ast2400.dtsi                 |  2 ++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 4d1a215..38a4fd0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include "ast2400.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Barrelye BMC";
@@ -38,5 +39,23 @@
 			};
 		};
 	};
+
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio 140 GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			gpios = <&gpio 141 GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+		};
+
+	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 2c3e824..92a7c77 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include "ast2400.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Palmetto BMC";
@@ -31,4 +32,21 @@
 			};
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio 140 GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			gpios = <&gpio 141 GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+		};
+
+	};
 };
diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index 21f4875..20b5db3 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -287,6 +287,8 @@
 			};
 
 			gpio: gpio@1e780000 {
+			       #gpio-cells = <2>;
+			       gpio-controller;
 			       compatible = "aspeed,ast2400-gpio";
 			       reg = <0x1e780000 0x1000>;
 			       interrupts = <20>;
-- 
2.6.3
