Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2Pk33fRYzDqSD
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 07:20:27 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0GKIWVD029716
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 15:20:23 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2813dpbg8h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 15:20:23 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 16 Jan 2017 13:20:22 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 16 Jan 2017 13:20:19 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id DBBB01FF001F
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 13:19:57 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0GKKIQE8782134; Mon, 16 Jan 2017 13:20:18 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF45278037;
 Mon, 16 Jan 2017 13:20:18 -0700 (MST)
Received: from twohearted.rchland.ibm.com (unknown [9.10.99.32])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 72A6C78043;
 Mon, 16 Jan 2017 13:20:18 -0700 (MST)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH] arm: dts: aspeed: witherspoon: Add i2c and led devices
Date: Mon, 16 Jan 2017 14:21:20 -0600
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011620-0008-0000-0000-000006ED4570
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006445; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00808510; UDB=6.00393767; IPR=6.00585869; 
 BA=6.00005062; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013940; XFM=3.00000011;
 UTC=2017-01-16 20:20:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011620-0009-0000-0000-00003F09C2A9
Message-Id: <20170116202120.17855-1-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-16_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701160286
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
X-List-Received-Date: Mon, 16 Jan 2017 20:20:28 -0000

From: Matt Spinler <spinler@us.ibm.com>

Add more I2C devices and the rear LEDs.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 41 +++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 9badf3e94599..da5ec5ee3746 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 
 #include "aspeed-g5.dtsi"
-#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
 	model = "Witherspoon BMC";
@@ -19,6 +19,22 @@
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		rear-fault {
+			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-id {
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-power {
+			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &fmc {
@@ -115,25 +131,38 @@
 		compatible = "bosch,bmp180";
 		reg = <0x77>;
 	};
+
+	max31785@52 {
+		compatible = "maxim,max31785";
+		reg = <0x52>;
+	};
 };
 
 &i2c4 {
 	status = "okay";
 
-	/* CP1 TMP423A */
 	/* CP1 VDN & VDDR */
 	/* CP1 VDD & VCS */
 	/* CP1 VIO */
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
 };
 
 
 &i2c5 {
 	status = "okay";
 
-	/* CP1 TMP423A */
 	/* CP1 VDN & VDDR */
 	/* CP1 VDD & VCS */
 	/* CP1 VIO */
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
 };
 
 &i2c6 {
@@ -152,13 +181,17 @@
 &i2c9 {
 	status = "okay";
 
-	/* Tmp275 */
 
 	/* MUX
 	 *    -> PCIe Slot 3
 	 *    -> PCIe Slot 4
 	 *    -> PCA9517 -> PEX8725
 	 */
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
 };
 
 &i2c10 {
-- 
2.11.0
