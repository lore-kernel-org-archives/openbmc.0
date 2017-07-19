Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCVPV3Ll5zDr56
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 07:23:10 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6JLLMNL081618
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 17:23:08 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2btc8fexfe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 17:23:08 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 19 Jul 2017 15:23:07 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 19 Jul 2017 15:23:06 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6JLN5Gx65077414; Wed, 19 Jul 2017 14:23:05 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C6E06A03C;
 Wed, 19 Jul 2017 15:23:06 -0600 (MDT)
Received: from gfw155.aus.stglabs.ibm.com (unknown [9.3.62.242])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id CF18B6A03B;
 Wed, 19 Jul 2017 15:23:05 -0600 (MDT)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: witherspoon: Add iio-hwmon
 node for dps310
Date: Wed, 19 Jul 2017 16:22:53 -0500
X-Mailer: git-send-email 2.7.2
X-TM-AS-GCONF: 00
x-cbid: 17071921-0012-0000-0000-000014B3B0D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007389; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889975; UDB=6.00444598; IPR=6.00670146; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016282; XFM=3.00000015;
 UTC=2017-07-19 21:23:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071921-0013-0000-0000-00004EAE02BD
Message-Id: <1500499373-12184-1-git-send-email-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-19_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707190333
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
X-List-Received-Date: Wed, 19 Jul 2017 21:23:10 -0000

From: Matt Spinler <spinler@us.ibm.com>

This is needed so hwmon knows about the dps310 iio device.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 2efad39..4ae0cfe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -72,7 +72,12 @@
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
 	};
 
-	iio-hwmon {
+	iio-hwmon-dps310 {
+		compatible = "iio-hwmon";
+		io-channels = <&dps 0>;
+	};
+
+	iio-hwmon-bmp280 {
 		compatible = "iio-hwmon";
 		io-channels = <&bmp 1>;
 	};
@@ -195,9 +200,10 @@
 		reg = <0x52>;
 	};
 
-	dps310@76 {
+	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
+		#io-channel-cells = <0>;
 	};
 
 	pca0: pca9552@60 {
-- 
2.7.2
