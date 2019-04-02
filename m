Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YD5d4dgszDqLj
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 13:42:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x322YEge012133
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 22:42:43 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rkv3nqnjn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 22:42:42 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 2 Apr 2019 03:42:42 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 03:42:39 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x322gchM29425782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 02:42:38 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75EA56E04C;
 Tue,  2 Apr 2019 02:42:38 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 383396E04E;
 Tue,  2 Apr 2019 02:42:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 02:42:38 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jae.hyun.yoo@linux.intel.com
Subject: [PATCH dev-5.0 v4 5/7] ARM: dts: aspeed-g5: Add video engine
Date: Tue,  2 Apr 2019 02:42:28 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19040202-0012-0000-0000-0000172138D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010858; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01183052; UDB=6.00619336; IPR=6.00963797; 
 MB=3.00026252; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 02:42:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040202-0013-0000-0000-000056B8659E
Message-Id: <1554172950-2072-6-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=926 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020017
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
X-List-Received-Date: Tue, 02 Apr 2019 02:42:46 -0000

Add a node to describe the video engine on the AST2500.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index a79e01f..d11c078 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -252,6 +252,16 @@
 				status = "disabled";
 			};
 
+			video: video@1e700000 {
+				compatible = "aspeed,ast2500-video-engine";
+				reg = <0x1e700000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+					 <&syscon ASPEED_CLK_GATE_ECLK>;
+				clock-names = "vclk", "eclk";
+				interrupts = <7>;
+				status = "disabled";
+			};
+
 			sram: sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
1.8.3.1
