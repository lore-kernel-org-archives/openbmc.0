Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3x6N2P6nVqzDqb4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 23:18:52 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 11 Jul 2017 16:18:45 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6BDIjJP029678;
 Tue, 11 Jul 2017 16:18:45 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Tue, 11 Jul 2017 16:18:27 +0300
Message-Id: <20170711131827.64045-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 13:18:55 -0000

This binding adds description for interface supporting
aspeed-pwm-tacho driver cooling device creation.
This cooling device could be bound to a thermal zone
for the thermal control.

It adds extra level of hierarchy -  for tachometer channel
with fan subnodes and pwm channels with pwm subnodes.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index cf4460564adb..df85aa70ed7f 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -23,9 +23,18 @@ Required properties for pwm-tacho node:
 - clocks : a fixed clock providing input clock frequency(PWM
 	   and Fan Tach clock)
 
+tach-channels subnode format:
+===================
+Under tach-channels subnode there can be fan child nodes.
+
+Required properties for tach-channels node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 0.
+
 fan subnode format:
 ===================
-Under fan subnode there can upto 8 child nodes, with each child node
+Under fan subnode there can be upto 8 child nodes, with each child node
 representing a fan. If there are 8 fans each fan can have one PWM port and
 one/two Fan tach inputs.
 
@@ -39,6 +48,24 @@ Required properties for each child node:
 		Fan tach channel 0 and 15 indicating Fan tach channel 15.
 		Atleast one Fan tach input channel is required.
 
+pwm-channels subnode format:
+===================
+Under pwm-channels subnode there can be pwm child nodes.
+Required properties for tach-channels node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 0.
+
+- #cooling-cells : should be 2;
+
+pwm subnode format:
+===================
+- reg : should be <0x00>.
+
+- cooling-levels      : PWM duty cycle values in a range from 0 to 255
+			which correspond to thermal cooling states.
+
+
 Examples:
 
 pwm_tacho_fixed_clk: fixedclk {
@@ -55,14 +82,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
 	clocks = <&pwm_tacho_fixed_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
-
-	fan@0 {
-		reg = <0x00>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	tach-channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		fan@0 {
+			reg = <0x00>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+		};
+		fan@1 {
+			reg = <0x01>;
+			aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+		};
 	};
-
-	fan@1 {
-		reg = <0x01>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+	pwm-channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#cooling-cells = <2>;
+		pwm@0 {
+			reg = <0x00>;
+			cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		};
 	};
 };
-- 
2.11.0
