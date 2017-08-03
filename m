Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNfJy02zmzDqJ0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 04:50:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73ImrNY121545
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 14:50:55 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c45c8q087-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 14:50:54 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 12:50:54 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 12:50:51 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73IoptN983302; Thu, 3 Aug 2017 11:50:51 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11E98BE042;
 Thu,  3 Aug 2017 12:50:51 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id AB387BE039;
 Thu,  3 Aug 2017 12:50:50 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v7] ARM: dts: aspeed: witherspoon: Add
 gpio-keys-polled for fan presence
Date: Thu,  3 Aug 2017 13:50:48 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17080318-0020-0000-0000-00000C7C73FE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897080; UDB=6.00448831; IPR=6.00677263; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016519; XFM=3.00000015;
 UTC=2017-08-03 18:50:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080318-0021-0000-0000-00005D8C4897
Message-Id: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030288
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
X-List-Received-Date: Thu, 03 Aug 2017 18:50:58 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add gpio-keys-polled node for pca955x fan presence lines. Change the binding
of the pca9552 to remove the leds and instead define all the provided gpio pins
there. Add back the leds in a 'gpio-leds' compatible entry.

Polling period of 1 second to be determined to be the max acceptable
value based on discussions with Brad Bishop and Matt Spinler. Tested
with gpiomon program - verified.

Patch based on Cedric's example - thanks! Tested on witherspoon.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 152 ++++++++++++++++++-----
 1 file changed, 124 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c0f992e..9ab8e46 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -56,6 +56,77 @@
 		};
 	};
 
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
+			linux,code = <4>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
+			linux,code = <5>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+	};
+
+	pca_leds {
+		compatible = "gpio-leds";
+
+		fan0 {
+			label = "fan0";
+			default-state = "keep";
+			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
+		};
+		fan1 {
+			label = "fan1";
+			default-state = "keep";
+			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
+		};
+		fan2 {
+			label = "fan2";
+			default-state = "keep";
+			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
+		};
+		fan3 {
+			label = "fan3";
+			default-state = "keep";
+			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
+		};
+		front_fault {
+			label = "front-fault";
+			default-state = "keep";
+			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
+		};
+		front_power {
+			label = "front-power";
+			default-state = "keep";
+			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
+		};
+		front_id {
+			label = "front-id";
+			default-state = "keep";
+			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -278,47 +349,72 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		fan0: led@0 {
-			label = "fan0";
-			default-state = "keep";
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
 			reg = <0>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		fan1: led@1 {
-			label = "fan1";
-			default-state = "keep";
+		gpio@1 {
 			reg = <1>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		fan2: led@2 {
-			label = "fan2";
-			default-state = "keep";
+		gpio@2 {
 			reg = <2>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		fan3: led@3 {
-			label = "fan3";
-			default-state = "keep";
+		gpio@3 {
 			reg = <3>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		front_fault: led@13 {
-			label = "front-fault";
-			default-state = "keep";
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@13 {
 			reg = <13>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		front_power: led@14 {
-			label = "front-power";
-			default-state = "keep";
+		gpio@14 {
 			reg = <14>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
-		front_id: led@15 {
-			label = "front-id";
-			default-state = "keep";
+		gpio@15 {
 			reg = <15>;
-			type = <PCA955X_TYPE_LED>;
+			type = <PCA955X_TYPE_GPIO>;
 		};
 	};
 };
-- 
1.8.3.1
