Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZC3d3Fz4zDq9l
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:59:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x33Gsr5b082005
 for <openbmc@lists.ozlabs.org>; Wed, 3 Apr 2019 12:59:22 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rmxkd7cru-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 12:59:21 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 3 Apr 2019 17:59:19 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Apr 2019 17:59:16 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x33GxFA214352468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Apr 2019 16:59:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 197BBAE063;
 Wed,  3 Apr 2019 16:59:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A74A5AE064;
 Wed,  3 Apr 2019 16:59:14 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Apr 2019 16:59:14 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH v2] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
Date: Wed,  3 Apr 2019 11:59:11 -0500
X-Mailer: git-send-email 2.7.4
In-Reply-To: <962b866599ac4dfd866d7433b7ddb276@linux.vnet.ibm.com>
References: <962b866599ac4dfd866d7433b7ddb276@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19040316-0060-0000-0000-00000327FAF1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010867; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01183811; UDB=6.00619795; IPR=6.00964563; 
 MB=3.00026280; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-03 16:59:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040316-0061-0000-0000-000048D2CEF5
Message-Id: <1554310751-52446-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=926 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904030115
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 16:59:25 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add simplified partitions for BMC and alternate flash. Include these by
default in Witherspoon.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 37 ++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 1cdc96d..82f63aa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -194,14 +194,47 @@
 		label = "bmc";
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout.dtsi"
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x1F80000 >;
+				label = "obmc-ubi";
+			};
+		};
 	};
 
 	flash@1 {
 		status = "okay";
-		label = "alt";
+		label = "alt-bmc";
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "alt-u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "alt-u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x1F80000 >;
+				label = "alt-obmc-ubi";
+			};
+		};
 	};
 };
 
-- 
1.8.3.1
