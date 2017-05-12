Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wPgJD5mpBzDqch
 for <openbmc@lists.ozlabs.org>; Sat, 13 May 2017 05:38:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4CJcWlT022110
 for <openbmc@lists.ozlabs.org>; Fri, 12 May 2017 15:38:34 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2adjrw99xu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 May 2017 15:38:33 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 12 May 2017 13:38:33 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 12 May 2017 13:38:30 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4CJcTLf10879288; Fri, 12 May 2017 12:38:29 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A00F96E035;
 Fri, 12 May 2017 13:38:29 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 41CE36E03D;
 Fri, 12 May 2017 13:38:29 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] dts: aspeed: witherspoon: Add FSI devices
Date: Fri, 12 May 2017 14:38:20 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1494617900-32369-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494617900-32369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17051219-0016-0000-0000-000006BB0F51
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007052; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000211; SDB=6.00859642; UDB=6.00426139; IPR=6.00639225; 
 BA=6.00005345; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015432; XFM=3.00000015;
 UTC=2017-05-12 19:38:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051219-0017-0000-0000-0000399DC2E5
Message-Id: <1494617900-32369-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-12_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705120367
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
X-List-Received-Date: Fri, 12 May 2017 19:38:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f20aaf4..4138c93 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -65,6 +65,8 @@
 
 	gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
 
 		status = "okay";
 
@@ -73,6 +75,50 @@
 		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				occ@1 {
+					compatible = "ibm,p9-occ";
+					reg = <1>;
+				};
+			};
+
+			hub@3400 {
+				compatible = "fsi-master-hub";
+				reg = <0x3400 0x400>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+
+				cfam@1,0 {
+					reg = <1 0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					sbefifo@2400 {
+						compatible = "ibm,p9-sbefifo";
+						reg = <0x2400 0x400>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						occ@2 {
+							compatible =
+								"ibm,p9-occ";
+							reg = <2>;
+						};
+					};
+				};
+			};
+		};
 	};
 
 	iio-hwmon {
-- 
1.8.3.1
