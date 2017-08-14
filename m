Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xWFJJ3GvnzDqlN
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 22:28:15 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 14 Aug 2017 15:27:43 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v7ECRh0A028098;
 Mon, 14 Aug 2017 15:27:43 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v7ECRb0N024430;
 Mon, 14 Aug 2017 15:27:37 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v7ECRAsb023974;
 Mon, 14 Aug 2017 15:27:10 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: [PATCH linux dev-4.10] dts: add aspeed-pwm-tacho to msn dts.
Date: Mon, 14 Aug 2017 15:27:09 +0300
Message-Id: <20170814122709.23845-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 12:28:17 -0000

Add basic pwm-tacho-controller node to ast-g5 dtsi.

Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 49 +++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 17 ++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index 0774959..d790927 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -139,3 +139,52 @@
 	status = "okay";
 };
 
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	#cooling-cells = <2>;
+
+	fan@0 {
+		reg = <0x00>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 72b6638..4c012af 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -40,6 +40,14 @@
 		serial4 = &uart5;
 	};
 
+	clocks {
+		pwm_tacho_fixed_clk: fixedclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+		};
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -372,6 +380,15 @@
 				#size-cells = <1>;
 				ranges = <0 0x1e78a000 0x1000>;
 			};
+
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2500-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&pwm_tacho_fixed_clk>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.8.4
