Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq54D0DSZzDq8B
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 02:12:27 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5GG93sX022083
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 12:12:24 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b4h6k3sph-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 12:12:24 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 16 Jun 2017 12:12:23 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 16 Jun 2017 12:12:22 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5GGCLGZ22413328; Fri, 16 Jun 2017 16:12:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8DF11204B;
 Fri, 16 Jun 2017 12:12:26 -0400 (EDT)
Received: from twohearted.rchland.ibm.com (unknown [9.10.99.32])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id A2600112034;
 Fri, 16 Jun 2017 12:12:26 -0400 (EDT)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH] ARM: dts: witherspoon: enable wdt2
Date: Fri, 16 Jun 2017 11:12:29 -0500
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
x-cbid: 17061616-0048-0000-0000-000001A932A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007243; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00875676; UDB=6.00436014; IPR=6.00655765; 
 BA=6.00005425; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015853; XFM=3.00000015;
 UTC=2017-06-16 16:12:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061616-0049-0000-0000-0000418AF408
Message-Id: <20170616161229.6639-1-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706160267
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
X-List-Received-Date: Fri, 16 Jun 2017 16:12:28 -0000

From: Matt Spinler <spinler@us.ibm.com>

WDT1 is used for a fan watchdog, so enable WDT2
for use by others.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 99003b9fb54b..1c99e22b256b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -84,6 +84,10 @@
 
 #include "ibm-power9-cfam.dtsi"
 
+&wdt2 {
+    status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -367,7 +371,7 @@
 			type = <PCA955X_TYPE_GPIO>;
 		};
 		gpio@14 {
-			reg = <14>;
+			reg = <14>;./arch/arm/boot/dts/
 			type = <PCA955X_TYPE_GPIO>;
 		};
 		gpio@15 {
-- 
2.11.0
