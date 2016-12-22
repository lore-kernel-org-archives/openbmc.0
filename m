Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkgyw1FMszDwZN
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:07:03 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBM64Y9d113373
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:07:01 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27g1utvufe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:07:01 -0500
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 22 Dec 2016 16:06:58 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 22 Dec 2016 16:06:55 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id A9BCC2BB0055
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:54 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBM66sqs55836856
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:54 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBM66sxZ021458
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:54 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBM66sZW021455; Thu, 22 Dec 2016 17:06:54 +1100
Received: from camb691.ibm.com (unknown [9.81.194.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B975AA0114;
 Thu, 22 Dec 2016 17:06:53 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Subject: [PATCH v2 2/5] ARM: dts: aspeed: Put the lpc_ctrl under lpc_host node
 for regmap
Date: Thu, 22 Dec 2016 17:06:07 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161222060610.29695-1-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122206-0048-0000-0000-000001EFC85B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122206-0049-0000-0000-0000473981D8
Message-Id: <20161222060610.29695-3-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-22_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612220102
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
X-List-Received-Date: Thu, 22 Dec 2016 06:07:04 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |  6 ++++++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |  6 ++++++
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  |  6 ++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  5 -----
 arch/arm/boot/dts/aspeed-g4.dtsi               | 30 ++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 9dc3e67fc98c..19aeb3eb4a0a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -29,6 +29,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 68946aa34e31..a99fef94a616 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -33,6 +33,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 639b8f877184..12b1cbcdf9d6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -29,6 +29,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+	
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index b60044800ea1..bba911d79fbf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -37,11 +37,6 @@
 		};
 	};
 
-	flash_buffer@1e789000 {
-		compatible = "aspeed,ast2400-lpc-ctrl";
-		memory-region = <&flash_memory>;
-		reg = <0x1e789000 0x8>;
-	};
 
         leds {
                 compatible = "gpio-leds";
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 1ed2a9ba7ab8..2db7915de790 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -33,6 +33,36 @@
 		#size-cells = <1>;
 		ranges;
 
+		lpc: lpc@1e789000 {
+			compatible = "aspeed,ast2400-lpc", "simple-mfd";
+			reg = <0x1e789000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x1e789000 0x1000>;
+
+			lpc_bmc: lpc-bmc@0 {
+				compatible = "aspeed,ast2400-lpc-bmc";
+				reg = <0x0 0x80>;
+			};
+
+			lpc_host: lpc-host@80 {
+				compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
+				reg = <0x80 0x1e0>;
+				reg-io-width = <4>;
+	
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x80 0x1e0>;
+
+				lpc-ctrl@0 {
+					compatible = "aspeed,ast2400-lpc-ctrl";
+					memory-region = <&flash_memory>;
+					reg = <0x0 0x80>;
+				};
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.11.0
