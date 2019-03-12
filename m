Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Jgv61ZH7zDqDG
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 03:50:10 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2CGb9q9023024
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 12:50:07 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r6g4uhm4v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 12:50:07 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 12 Mar 2019 16:50:07 -0000
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 12 Mar 2019 16:50:05 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2CGo4qd23920734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Mar 2019 16:50:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EA64AE063;
 Tue, 12 Mar 2019 16:50:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4614DAE062;
 Tue, 12 Mar 2019 16:50:04 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Mar 2019 16:50:04 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
Date: Tue, 12 Mar 2019 11:50:02 -0500
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19031216-0052-0000-0000-00000399AD60
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010745; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01173366; UDB=6.00613477; IPR=6.00954025; 
 MB=3.00025948; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-12 16:50:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031216-0053-0000-0000-00006021725F
Message-Id: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=804 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903120115
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
X-List-Received-Date: Tue, 12 Mar 2019 16:50:10 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add simplified partitions for BMC and alternate flash. Include these by
default in Witherspoon.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi  | 18 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi | 18 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts       |  3 ++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi

diff --git a/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
new file mode 100644
index 0000000..9277599
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
@@ -0,0 +1,18 @@
+		label = "alt-bmc";
+		partitions {
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				compatible = "fixed-partitions";
+				u-boot@0 {
+					reg = < 0 0x60000 >;
+					label = "alt-u-boot";
+				};
+				u-boot-env@60000 {
+					reg = < 0x60000 0x20000 >;
+					label = "alt-u-boot-env";
+				};
+				obmc-ubi@80000 {
+					reg = < 0x80000 0x1F80000 >;
+					label = "alt-obmc-ubi";
+				};
+		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
new file mode 100644
index 0000000..0059ad1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
@@ -0,0 +1,18 @@
+		label = "bmc";
+		partitions {
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				compatible = "fixed-partitions";
+				u-boot@0 {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env@60000 {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				obmc-ubi@80000 {
+					reg = < 0x80000 0x1F80000 >;
+					label = "obmc-ubi";
+				};
+		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c51e3e8..058b9b7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -191,7 +191,7 @@
 		label = "bmc";
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout.dtsi"
+#include "aspeed-bmc-opp-flash-layout-ubi.dtsi"
 	};
 
 	flash@1 {
@@ -199,6 +199,7 @@
 		label = "alt";
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
+#include "aspeed-bmc-alt-opp-flash-layout-ubi.dtsi"
 	};
 };
 
-- 
1.8.3.1
