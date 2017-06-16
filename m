Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wqC4p02ZvzDqLt
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 06:43:21 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5GKdbx2116869
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:43:18 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b4pjbg2jq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:43:18 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 16 Jun 2017 14:43:17 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 16 Jun 2017 14:43:16 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5GKhFop8061394; Fri, 16 Jun 2017 13:43:15 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2526E038;
 Fri, 16 Jun 2017 14:43:15 -0600 (MDT)
Received: from twohearted.rchland.ibm.com (unknown [9.10.99.32])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id EF7366E03F;
 Fri, 16 Jun 2017 14:43:14 -0600 (MDT)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH] ARM: dts: witherspoon: enable wdt2
Date: Fri, 16 Jun 2017 15:43:30 -0500
X-Mailer: git-send-email 2.13.0
X-TM-AS-GCONF: 00
x-cbid: 17061620-8235-0000-0000-00000BBC5FCE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007245; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00875766; UDB=6.00436068; IPR=6.00655855; 
 BA=6.00005425; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015856; XFM=3.00000015;
 UTC=2017-06-16 20:43:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061620-8236-0000-0000-00003C509B1B
Message-Id: <20170616204330.25401-1-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706160348
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
X-List-Received-Date: Fri, 16 Jun 2017 20:43:22 -0000

From: Matt Spinler <spinler@us.ibm.com>

WDT1 is used for a fan watchdog, so enable WDT2
for use by others.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 99003b9fb54b..d1c455606a32 100644
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
-- 
2.13.0
