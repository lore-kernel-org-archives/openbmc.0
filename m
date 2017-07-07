Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47Wd3WlqzDr9P
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:47:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67Lhsa0044820
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:47:55 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bjge4bwnu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:47:54 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 15:47:54 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 15:47:52 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LlqSS28442730; Fri, 7 Jul 2017 14:47:52 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38B29C6037;
 Fri,  7 Jul 2017 15:47:52 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 8E5B7C6043;
 Fri,  7 Jul 2017 15:47:51 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 2/3] arm/dts: Enable FSI I2C busses for P9
Date: Fri,  7 Jul 2017 16:47:36 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070721-8235-0000-0000-00000BE1DCE2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884326; UDB=6.00441252; IPR=6.00664513; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:47:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-8236-0000-0000-00003CA45CD3
Message-Id: <1499464057-27830-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070362
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
X-List-Received-Date: Fri, 07 Jul 2017 21:47:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Enable all the ports for witherspoon and romulus. Also add aliases so
that users can easily access the /dev/ entries.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 150 +++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 150 +++++++++++++++++++++++
 2 files changed, 300 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index d53dc59..4d52cbc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -9,6 +9,36 @@
 
 	aliases {
 		serial4 = &uart5;
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c102 = &cfam0_i2c2;
+		i2c103 = &cfam0_i2c3;
+		i2c104 = &cfam0_i2c4;
+		i2c105 = &cfam0_i2c5;
+		i2c106 = &cfam0_i2c6;
+		i2c107 = &cfam0_i2c7;
+		i2c108 = &cfam0_i2c8;
+		i2c109 = &cfam0_i2c9;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c200 = &cfam1_i2c0;
+		i2c201 = &cfam1_i2c1;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c204 = &cfam1_i2c4;
+		i2c205 = &cfam1_i2c5;
+		i2c206 = &cfam1_i2c6;
+		i2c207 = &cfam1_i2c7;
+		i2c208 = &cfam1_i2c8;
+		i2c209 = &cfam1_i2c9;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c212 = &cfam1_i2c12;
+		i2c213 = &cfam1_i2c13;
+		i2c214 = &cfam1_i2c14;
 	};
 
 	chosen {
@@ -72,6 +102,126 @@
 
 #include "ibm-power9-cfam.dtsi"
 
+&cfam0_i2c0 {
+	status = "okay";
+};
+
+&cfam0_i2c1 {
+	status = "okay";
+};
+
+&cfam0_i2c2 {
+	status = "okay";
+};
+
+&cfam0_i2c3 {
+	status = "okay";
+};
+
+&cfam0_i2c4 {
+	status = "okay";
+};
+
+&cfam0_i2c5 {
+	status = "okay";
+};
+
+&cfam0_i2c6 {
+	status = "okay";
+};
+
+&cfam0_i2c7 {
+	status = "okay";
+};
+
+&cfam0_i2c8 {
+	status = "okay";
+};
+
+&cfam0_i2c9 {
+	status = "okay";
+};
+
+&cfam0_i2c10 {
+	status = "okay";
+};
+
+&cfam0_i2c11 {
+	status = "okay";
+};
+
+&cfam0_i2c12 {
+	status = "okay";
+};
+
+&cfam0_i2c13 {
+	status = "okay";
+};
+
+&cfam0_i2c14 {
+	status = "okay";
+};
+
+&cfam1_i2c0 {
+	status = "okay";
+};
+
+&cfam1_i2c1 {
+	status = "okay";
+};
+
+&cfam1_i2c2 {
+	status = "okay";
+};
+
+&cfam1_i2c3 {
+	status = "okay";
+};
+
+&cfam1_i2c4 {
+	status = "okay";
+};
+
+&cfam1_i2c5 {
+	status = "okay";
+};
+
+&cfam1_i2c6 {
+	status = "okay";
+};
+
+&cfam1_i2c7 {
+	status = "okay";
+};
+
+&cfam1_i2c8 {
+	status = "okay";
+};
+
+&cfam1_i2c9 {
+	status = "okay";
+};
+
+&cfam1_i2c10 {
+	status = "okay";
+};
+
+&cfam1_i2c11 {
+	status = "okay";
+};
+
+&cfam1_i2c12 {
+	status = "okay";
+};
+
+&cfam1_i2c13 {
+	status = "okay";
+};
+
+&cfam1_i2c14 {
+	status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 31315d0..8132056 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -10,6 +10,36 @@
 
 	aliases {
 		serial4 = &uart5;
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c102 = &cfam0_i2c2;
+		i2c103 = &cfam0_i2c3;
+		i2c104 = &cfam0_i2c4;
+		i2c105 = &cfam0_i2c5;
+		i2c106 = &cfam0_i2c6;
+		i2c107 = &cfam0_i2c7;
+		i2c108 = &cfam0_i2c8;
+		i2c109 = &cfam0_i2c9;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c200 = &cfam1_i2c0;
+		i2c201 = &cfam1_i2c1;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c204 = &cfam1_i2c4;
+		i2c205 = &cfam1_i2c5;
+		i2c206 = &cfam1_i2c6;
+		i2c207 = &cfam1_i2c7;
+		i2c208 = &cfam1_i2c8;
+		i2c209 = &cfam1_i2c9;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c212 = &cfam1_i2c12;
+		i2c213 = &cfam1_i2c13;
+		i2c214 = &cfam1_i2c14;
 	};
 
 	chosen {
@@ -84,6 +114,126 @@
 
 #include "ibm-power9-cfam.dtsi"
 
+&cfam0_i2c0 {
+	status = "okay";
+};
+
+&cfam0_i2c1 {
+	status = "okay";
+};
+
+&cfam0_i2c2 {
+	status = "okay";
+};
+
+&cfam0_i2c3 {
+	status = "okay";
+};
+
+&cfam0_i2c4 {
+	status = "okay";
+};
+
+&cfam0_i2c5 {
+	status = "okay";
+};
+
+&cfam0_i2c6 {
+	status = "okay";
+};
+
+&cfam0_i2c7 {
+	status = "okay";
+};
+
+&cfam0_i2c8 {
+	status = "okay";
+};
+
+&cfam0_i2c9 {
+	status = "okay";
+};
+
+&cfam0_i2c10 {
+	status = "okay";
+};
+
+&cfam0_i2c11 {
+	status = "okay";
+};
+
+&cfam0_i2c12 {
+	status = "okay";
+};
+
+&cfam0_i2c13 {
+	status = "okay";
+};
+
+&cfam0_i2c14 {
+	status = "okay";
+};
+
+&cfam1_i2c0 {
+	status = "okay";
+};
+
+&cfam1_i2c1 {
+	status = "okay";
+};
+
+&cfam1_i2c2 {
+	status = "okay";
+};
+
+&cfam1_i2c3 {
+	status = "okay";
+};
+
+&cfam1_i2c4 {
+	status = "okay";
+};
+
+&cfam1_i2c5 {
+	status = "okay";
+};
+
+&cfam1_i2c6 {
+	status = "okay";
+};
+
+&cfam1_i2c7 {
+	status = "okay";
+};
+
+&cfam1_i2c8 {
+	status = "okay";
+};
+
+&cfam1_i2c9 {
+	status = "okay";
+};
+
+&cfam1_i2c10 {
+	status = "okay";
+};
+
+&cfam1_i2c11 {
+	status = "okay";
+};
+
+&cfam1_i2c12 {
+	status = "okay";
+};
+
+&cfam1_i2c13 {
+	status = "okay";
+};
+
+&cfam1_i2c14 {
+	status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
-- 
1.8.3.1
