Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7mJv6wvRzDqkm
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 05:36:15 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6DJYNJg025548
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 15:36:11 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bp1sr8932-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 15:36:11 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 13 Jul 2017 15:36:10 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 13 Jul 2017 15:36:08 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6DJa8o726673316; Thu, 13 Jul 2017 19:36:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C98F6124037;
 Thu, 13 Jul 2017 15:33:35 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 7D020124035;
 Thu, 13 Jul 2017 15:33:35 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for power
 supply presence, ucd alert
Date: Thu, 13 Jul 2017 14:36:06 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17071319-0052-0000-0000-0000023F9B2E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007362; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00887100; UDB=6.00442879; IPR=6.00667240; 
 BA=6.00005470; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016215; XFM=3.00000015;
 UTC=2017-07-13 19:36:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071319-0053-0000-0000-000051519797
Message-Id: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707130302
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
X-List-Received-Date: Thu, 13 Jul 2017 19:36:16 -0000

Add GPIO keys for power supply 0 and 1 presence as well as ucd alert
to the device tree.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 76a5b28..34c5dfc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -42,6 +42,24 @@
 			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(J, 2)>;
 		};
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(P, 7)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(N, 0)>;
+		};
+
+		ucd-alert {
+			label = "ucd-alert";
+			gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(I, 2)>;
+		};
 	};
 
 	leds {
-- 
1.8.2.2
