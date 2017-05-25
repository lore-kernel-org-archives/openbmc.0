Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYhnZ5fyvzDqkZ
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 07:13:22 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4PL407T043711
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 17:13:17 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ap6k2gxr0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 17:13:16 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 25 May 2017 15:13:16 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 25 May 2017 15:13:13 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4PLDDP913042094; Thu, 25 May 2017 14:13:13 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E07D136043;
 Thu, 25 May 2017 15:13:13 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id C24C6136044;
 Thu, 25 May 2017 15:13:12 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add missing clock sources
 for barreleye
Date: Thu, 25 May 2017 16:13:11 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17052521-8235-0000-0000-00000B9317B8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007116; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865572; UDB=6.00429824; IPR=6.00645381; 
 BA=6.00005375; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015583; XFM=3.00000015;
 UTC=2017-05-25 21:13:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052521-8236-0000-0000-00003BF9AAE0
Message-Id: <1495746791-2748-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-25_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705250385
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
X-List-Received-Date: Thu, 25 May 2017 21:13:23 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Reorganize flash controllers into the ast2400 config. Barreleye wasn't
booting with the new aspeed-smc driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 44 ++++++++--------------
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 52 ++++++++------------------
 arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++++
 3 files changed, 66 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index be1f2d1..7a616bb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -31,34 +31,6 @@
 		};
 	};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-#include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
-
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-			};
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -76,6 +48,22 @@
 	};
 };
 
+&bmc_pnor {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
+
+&host_pnor {
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+	};
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index b4faa1d..e55abe6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -47,42 +47,6 @@
                 };
         };
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			aspeed,fmc-has-dma;
-			interrupts = <19>;
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				m25p,fast-read;
-#include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
-
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-				m25p,fast-read;
-			};
-		};
-	};
-
 	gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
 
@@ -94,6 +58,22 @@
 	};
 };
 
+&bmc_pnor {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
+
+&host_pnor {
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+	};
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index d8827d5..9fb7889 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -44,6 +44,40 @@
 		#size-cells = <1>;
 		ranges;
 
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-fmc";
+			status = "disabled";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				status = "disabled";
+			};
+		};
+
+		host_pnor: spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-spi";
+			status = "disabled";
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				status = "disabled";
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
1.8.3.1
