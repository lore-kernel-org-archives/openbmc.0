Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6yPs2hPCzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 07:07:29 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3IL3ZTM039451
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:27 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29wqpuq75q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:27 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 18 Apr 2017 15:07:26 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Apr 2017 15:07:23 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3IL7CLS10027410; Tue, 18 Apr 2017 14:07:22 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC929C6051;
 Tue, 18 Apr 2017 15:07:22 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 781D8C604A;
 Tue, 18 Apr 2017 15:07:22 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 3/3] ARM: dts: aspeed: witherspoon: Add example
 sbefifo and occfifo devices
Date: Tue, 18 Apr 2017 16:07:14 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041821-0008-0000-0000-000007A251B2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849294; UDB=6.00419353; IPR=6.00627935; 
 BA=6.00005300; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015089; XFM=3.00000013;
 UTC=2017-04-18 21:07:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041821-0009-0000-0000-00004195E8CA
Message-Id: <1492549634-27369-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-18_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704180166
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
X-List-Received-Date: Tue, 18 Apr 2017 21:07:30 -0000

From: "Edward A. James" <eajames@us.ibm.com>

A possible implementation of the bindings for SBEFIFO device and OCC
"FIFO" device. Use a phandle to reference the appropriate SBE device
from the OCC entry.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e3a7b77..57ed260 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -57,6 +57,22 @@
 		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+
+		sbefifo1: sbefifo@2400 {
+			compatible = "ibm,power9-sbefifo";
+
+			status = "okay";
+
+			reg = <0x2400>;
+		};
+	};
+
+	occfifo@1 {
+		compatible = "ibm,occfifo";
+
+		status = "okay";
+
+		bus = <&sbefifo1>;
 	};
 
 	iio-hwmon {
-- 
1.8.3.1
