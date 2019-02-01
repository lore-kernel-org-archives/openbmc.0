Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtV09F5zDqfM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:45 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Feb 2019 16:40:43 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:41 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 3/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: Add i2c
 nodes
Date: Fri, 1 Feb 2019 16:40:24 +0800
Message-ID: <20190201084027.19501-3-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
References: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No--4.924400-0.000000-31
X-TM-AS-MatchedID: 704421-121504-704473-701016-188019-700264-188900-703529-7
 80012-702609-148004-148036-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:51 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Add i2c nodes, including:
1. ADC
2. EEPROM
3. i2c-switch
4. Temperature Sensor
5. ADM

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 213 +++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 5a56181af25c..f2eda099d20a 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -25,6 +25,17 @@
 		udc8 = &udc8;
 		udc9 = &udc9;
 		emmc0 = &sdhci0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c13 = &i2c13;
 		spi0 = &spi0;
 		spi1 = &spi1;
 		fiu0 = &fiu0;
@@ -260,6 +271,208 @@
 				};
 			};
 
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				i2c-switch@70 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x70>;
+					i2c-mux-idle-disconnect;
+
+					i2c_slot1a: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_slot1b: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+
+					i2c_slot2a: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_slot2b: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+
+					i2c_slot3: i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+					};
+
+					i2c_slot4: i2c-bus@5 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+					};
+
+					i2c_slot5: i2c-bus@6 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+					};
+				};
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					reg = <0x71>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					i2c-mux-idle-disconnect;
+
+					i2c_m2_s1: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_m2_s2: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c_m2_s3: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_m2_s4: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+			};
+
+			i2c3: i2c@83000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c4: i2c@84000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				eeprom@54 {
+					compatible = "atmel,24c64";
+					reg = <0x54>;
+				};
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+
+				adc128d818@1d {
+					compatible = "ti,adc128d818";
+					reg = <0x1d>;
+					ti,mode = <1>;
+				};
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				adm1278@11 {
+					compatible = "adm1278";
+					reg = <0x11>;
+					Rsense = <500>;
+				};
+
+				adm1278@12 {
+					compatible = "adm1278";
+					reg = <0x12>;
+					Rsense = <500>;
+				};
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp75@4a {
+					compatible = "ti,tmp75";
+					reg = <0x4a>;
+					status = "okay";
+				};
+				m24128_fru@51 {
+					compatible = "atmel,24c128";
+					reg = <0x51>;
+					pagesize = <64>;
+					status = "okay";
+				};
+				ATtiny1634@52 {
+					compatible = "atmel,ATtiny1634";
+					reg = <0x52>;
+					status = "disabled";
+				};
+			};
+
 			pwm_fan:pwm-fan-controller@103000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <   &pwm0_pins &pwm1_pins
-- 
2.17.1
