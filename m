Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A32B1A08DD
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453434623775153.38897399934285;
 Thu, 21 Jan 2016 19:50:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux 2/3] aspeed: update bmc dts with attached flash
Date: Thu, 21 Jan 2016 21:50:20 -0600
Message-Id: <1453434621-22227-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 22 Jan 2016 03:50:29 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Add the attached spi flash chips attached to the static memory controller
and the SPI memory controller.  The partitions and label for the SMC
attached flash are included in a seperate file for import from other
build systems.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     | 35 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 28 +++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      | 35 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index ebf86bb..cba561a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -7,6 +7,41 @@
 	model = "Barrelye BMC";
 	compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
 	ahb {
+		fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				/*
+				 * Possibly required props:
+				 * spi-max-frequency = <>
+				 * spi-tx-bus-width = <>
+				 * spi-rx-bus-width  = <>
+				 * m25p,fast-read
+				 * spi-cpol if inverse clock polarity (CPOL)
+				 * spi-cpha if shifted clock phase (CPHA)
+				 */
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+		spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+				/* spi-max-frequency = <>; */
+				/* m25p,fast-read; */
+			};
+		};
 		apb {
 			i2c: i2c@1e78a040 {
 				i2c0: i2c-bus@40 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
new file mode 100644
index 0000000..ca8639b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -0,0 +1,28 @@
+/* This file is the label for the bmc primary flash and its partitions */
+				label = "bmc";
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				u-boot {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				kernel  {
+					reg = < 0x80000 0x280000 >;
+					label = "kernel";
+				};
+				initramfs {
+					reg = < 0x300000 0x1c0000 >;
+					label = "initramfs";
+				};
+				rofs  {
+					reg = < 0x4c0000 0x1740000 >;
+					label = "rofs";
+				};
+				rwfs  {
+					reg = < 0x1c00000 0x400000 >;
+					label = "rwfs";
+				};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 92a7c77..9aacae7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -8,6 +8,41 @@
 	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
 
 	ahb {
+		fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				/*
+				 * Possibly required props:
+				 * spi-max-frequency = <>
+				 * spi-tx-bus-width = <>
+				 * spi-rx-bus-width  = <>
+				 * m25p,fast-read
+				 * spi-cpol if inverse clock polarity (CPOL)
+				 * spi-cpha if shifted clock phase (CPHA)
+				 */
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+		spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+				/* spi-max-frequency = <>; */
+				/* m25p,fast-read; */
+			};
+		};
 		apb {
 			i2c: i2c@1e78a040 {
 				i2c0: i2c-bus@40 {
-- 
2.6.4
