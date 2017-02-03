Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFX3l16FvzDqBm
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 09:44:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v13MdLut019742
 for <openbmc@lists.ozlabs.org>; Fri, 3 Feb 2017 17:44:14 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28cyk3p5e7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2017 17:44:14 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Fri, 3 Feb 2017 15:44:13 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 3 Feb 2017 15:44:11 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 50FB33E40041;
 Fri,  3 Feb 2017 15:44:11 -0700 (MST)
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v13MiBQT10551656; Fri, 3 Feb 2017 15:44:11 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CD026E03F;
 Fri,  3 Feb 2017 15:44:11 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id DF3006E038;
 Fri,  3 Feb 2017 15:44:10 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: witherspoon: Add fsi-master
 GPIO bindings
Date: Fri,  3 Feb 2017 16:44:08 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020322-0012-0000-0000-0000138CFB76
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006551; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816844; UDB=6.00398939; IPR=6.00594279; 
 BA=6.00005114; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014172; XFM=3.00000011;
 UTC=2017-02-03 22:44:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020322-0013-0000-0000-00004B1D1E25
Message-Id: <20170203224408.94384-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-03_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702030212
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
X-List-Received-Date: Fri, 03 Feb 2017 22:44:19 -0000

Define the pins used on Witherspoon by the FSI GPIO master.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 6064afa..4b2d8aa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -46,6 +46,18 @@
 			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	fsi-master {
+		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+
+		status = "disabled";
+
+		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &fmc {
-- 
1.8.2.2
