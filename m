Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xH0cX2B2RzDqmj
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 00:14:51 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 25 Jul 2017 17:14:23 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v6PEENFs029941;
 Tue, 25 Jul 2017 17:14:23 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [patch v3] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Tue, 25 Jul 2017 17:14:22 +0300
Message-Id: <20170725141422.7924-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Tue, 25 Jul 2017 14:14:53 -0000

It's add support for cooling device creation to
aspeed-pwm-tacho.
Cooling device could be bound to a thermal zone
for the thermal control.

v1 -> v2:
 - Fix commit message.
v2 -> v3:
 Pointed out by Rob Herring:
 - Put cooling-levels under fan subnodes.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index cf44605..367c820 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -11,6 +11,8 @@ Required properties for pwm-tacho node:
 
 - #size-cells : should be 1.
 
+- #cooling-cells: should be 2.
+
 - reg : address and length of the register set for the device.
 
 - pinctrl-names : a pinctrl state named "default" must be defined.
@@ -28,12 +30,17 @@ fan subnode format:
 Under fan subnode there can upto 8 child nodes, with each child node
 representing a fan. If there are 8 fans each fan can have one PWM port and
 one/two Fan tach inputs.
+For PWM port can be configured cooling-levels to create cooling device.
+Cooling device could be bound to a thermal zone for the thermal control.
 
 Required properties for each child node:
 - reg : should specify PWM source port.
 	integer value in the range 0 to 7 with 0 indicating PWM port A and
 	7 indicating PWM port H.
 
+- cooling-levels: PWM duty cycle values in a range from 0 to 255
+                  which correspond to thermal cooling states.
+
 - aspeed,fan-tach-ch : should specify the Fan tach input channel.
                 integer value in the range 0 through 15, with 0 indicating
 		Fan tach channel 0 and 15 indicating Fan tach channel 15.
@@ -50,6 +57,7 @@ pwm_tacho_fixed_clk: fixedclk {
 pwm_tacho: pwmtachocontroller@1e786000 {
 	#address-cells = <1>;
 	#size-cells = <1>;
+	#cooling-cells = <2>;
 	reg = <0x1E786000 0x1000>;
 	compatible = "aspeed,ast2500-pwm-tacho";
 	clocks = <&pwm_tacho_fixed_clk>;
@@ -58,6 +66,7 @@ pwm_tacho: pwmtachocontroller@1e786000 {
 
 	fan@0 {
 		reg = <0x00>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
 		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
 	};
 
-- 
2.8.4
