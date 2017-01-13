Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0XbJ0wbZzDqYp
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jan 2017 06:23:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0DJJtE8143809
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 14:23:04 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27y404202t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 14:23:03 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 13 Jan 2017 12:23:02 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 13 Jan 2017 12:22:59 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id ADBA719D8058
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 12:22:15 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0DJMw3a12517842; Fri, 13 Jan 2017 12:22:58 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5862BC6042;
 Fri, 13 Jan 2017 12:22:58 -0700 (MST)
Received: from twohearted.rchland.ibm.com (unknown [9.10.99.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 1E301C6069;
 Fri, 13 Jan 2017 12:22:58 -0700 (MST)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH] arm: dts: aspeed: witherspoon: Add devices
Date: Fri, 13 Jan 2017 13:23:59 -0600
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011319-0008-0000-0000-000006E92C70
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006427; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00807225; UDB=6.00392914; IPR=6.00584556; 
 BA=6.00005053; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013912; XFM=3.00000011;
 UTC=2017-01-13 19:23:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011319-0009-0000-0000-00003EF9AD28
Message-Id: <20170113192359.18149-1-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-13_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701130256
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
X-List-Received-Date: Fri, 13 Jan 2017 19:23:08 -0000

From: Matt Spinler <spinler@us.ibm.com>

Add more I2C devices and the rear LEDs.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 39 ++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 9badf3e94599..11de7a957738 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -19,6 +19,22 @@
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		rear-fault-led {
+			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-id-led {
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-power-led {
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
