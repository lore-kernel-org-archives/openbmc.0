Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHphh0R22zDqpT
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 07:51:15 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6QLoEY8044769
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:51:14 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bxwdjhk0y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:51:13 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 17:51:12 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 17:51:11 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6QLpAD124707224; Wed, 26 Jul 2017 21:51:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB32FAC041;
 Wed, 26 Jul 2017 17:51:22 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 9CBD4AC040;
 Wed, 26 Jul 2017 17:51:22 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v5] ARM: dts: aspeed: Add gpio-keys-polled for
 fan presence
Date: Wed, 26 Jul 2017 16:51:09 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17072621-2213-0000-0000-000002000CD5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007431; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893335; UDB=6.00446599; IPR=6.00673499; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016395; XFM=3.00000015;
 UTC=2017-07-26 21:51:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072621-2214-0000-0000-00005702799F
Message-Id: <20170726215109.23044-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707260320
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
X-List-Received-Date: Wed, 26 Jul 2017 21:51:16 -0000

Define gpio-keys-polled.  Add pca-955x chip IO as GPIO source.
Polling period of 1 second determined to be the max acceptable
value based on discussions with Brad Bishop and Matt Spinler.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
     gpio cells property and wrong format for poll-interval.
v4 - Add details regarding polling period to commit message.
v3 - Remove 'autorepeat'
   - Increase polling period to 1 second.
   - Remove GPIO specifiers from pca955x in dev tree
v2 - Change 'linux,code' from a unique global value to a local one
     for all the gpio-keys-polled devices.
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index d964901..22dbb91 100644
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
 
@@ -224,6 +255,7 @@
 		reg = <0x60>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#gpio-cells = <2>;
 
 		fan0: led@0 {
 			label = "fan0";
-- 
1.8.2.2
