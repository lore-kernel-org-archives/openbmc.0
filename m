Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xCxCx0l9PzDrCn
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 00:31:24 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 20 Jul 2017 17:31:07 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6KEV747030959;
 Thu, 20 Jul 2017 17:31:07 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v6KEV36d001556;
 Thu, 20 Jul 2017 17:31:03 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v6KEUkEV001082;
 Thu, 20 Jul 2017 17:30:46 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [patch v2] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Thu, 20 Jul 2017 17:30:39 +0300
Message-Id: <20170720143039.821-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Thu, 20 Jul 2017 14:31:27 -0000

This controller supports fan tacho channels and pwm channels.
Without this change only tachometer channels can be configured.
Add extra level of hierarchy - for tachometer channel
with fan subnodes and pwm channels with pwm subnodes.

It's add support for cooling device creation to
aspeed-pwm-tacho.
Cooling device could be bound to a thermal zone
for the thermal control.

v1 -> v2:
 - Fix commit message.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index cf44605..df85aa7 100644
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
2.8.4
