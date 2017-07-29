Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xKZDx1dlhzDrj0
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 04:36:49 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6TIXxtD128870
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 14:36:45 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c0p8cr5q1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 14:36:45 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Sat, 29 Jul 2017 14:36:45 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 29 Jul 2017 14:36:42 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6TIag1V23920856; Sat, 29 Jul 2017 18:36:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DC80AE034;
 Sat, 29 Jul 2017 14:36:55 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.85.181.170])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id CEDBEAE03B;
 Sat, 29 Jul 2017 14:36:54 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v6 1/2] ARM: dts: aspeed: Witherspoon add
 gpio-keys-polled for fan presence
Date: Sat, 29 Jul 2017 13:36:37 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17072918-0024-0000-0000-000002B775A9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007448; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00894699; UDB=6.00447398; IPR=6.00674866; 
 BA=6.00005499; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016443; XFM=3.00000015;
 UTC=2017-07-29 18:36:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072918-0025-0000-0000-000044EB75F4
Message-Id: <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707290309
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
X-List-Received-Date: Sat, 29 Jul 2017 18:36:49 -0000

Add gpio-keys-polled  node for pca955x fan presence lines.
Add GPIO details to pca955x for the presence lines as well.

Polling period of 1 second determined to be the max acceptable
value based on discussions with Brad Bishop and Matt Spinler.
Tested with gpiomon program - verified.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v6 - Add gpio pin details for fan presence to pca955x node
v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
     gpio cells property and wrong format for poll-interval.
v4 - Add details regarding polling period to commit message.
v3 - Remove 'autorepeat'
   - Increase polling period to 1 second.
   - Remove GPIO specifiers from pca955x in dev tree
v2 - Change 'linux,code' from a unique global value to a local one
     for all the gpio-keys-polled devices.
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 5afc03a..70328668 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -56,6 +56,37 @@
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
 	leds {
 		compatible = "gpio-leds";
 
@@ -277,6 +308,7 @@
 		reg = <0x60>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#gpio-cells = <2>;
 
 		fan0: led@0 {
 			label = "fan0";
@@ -302,6 +334,26 @@
 			reg = <3>;
 			type = <PCA955X_TYPE_LED>;
 		};
+		fan0_pres_gpio: gpio@4 {
+			label = "fan0_presence";
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		fan1_pres_gpio: gpio@5 {
+			label = "fan1_presence";
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		fan2_pres_gpio: gpio@6 {
+			label = "fan2_presence";
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		fan3_pres_gpio: gpio@7 {
+			label = "fan3_presence";
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
 		front_fault: led@13 {
 			label = "front-fault";
 			default-state = "keep";
-- 
1.8.2.2
