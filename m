Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBsZG1Q4kzDrHw
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 06:43:34 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6IKd0rU038229
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 16:43:31 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bskp900d6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 16:43:31 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 18 Jul 2017 16:43:30 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Jul 2017 16:43:28 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6IKhSdB26673346; Tue, 18 Jul 2017 20:43:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA928B2046;
 Tue, 18 Jul 2017 16:40:57 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 6D325B204D;
 Tue, 18 Jul 2017 16:40:57 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] ARM: dts: aspeed: Add gpio-keys-polled for fan presence
Date: Tue, 18 Jul 2017 15:43:23 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
References: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17071820-0044-0000-0000-0000036FF4F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007383; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889487; UDB=6.00444307; IPR=6.00669659; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016265; XFM=3.00000015;
 UTC=2017-07-18 20:43:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071820-0045-0000-0000-0000079DFAD1
Message-Id: <20170718204324.32945-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-18_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707180323
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
X-List-Received-Date: Tue, 18 Jul 2017 20:43:34 -0000

Define gpio-keys-polled.  Add pca-955x chip IO as GPIO source.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2 - Change 'linux,code' from a unique global value to a local one
     for all the gpio-keys-polled devices.
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 34c5dfc..f574d7b3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -62,6 +62,38 @@
 		};
 	};
 
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#poll-interval = <100>;
+		autorepeat;
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
 
@@ -224,6 +256,8 @@
 		reg = <0x60>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
 
 		fan0: led@0 {
 			label = "fan0";
-- 
1.8.2.2
