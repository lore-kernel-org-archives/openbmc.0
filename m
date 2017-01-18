Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3hFG6SspzDq5r
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 09:18:26 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0IMEFWK046586
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 17:18:25 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 282dkhr5j9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 17:18:24 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 18 Jan 2017 15:18:24 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 Jan 2017 15:18:22 -0700
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 22A2E19D8047
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 15:17:38 -0700 (MST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0IMILeF46792740; Wed, 18 Jan 2017 22:18:21 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FCCFB2056;
 Wed, 18 Jan 2017 17:18:21 -0500 (EST)
Received: from twohearted.rchland.ibm.com (unknown [9.10.99.32])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 4F952B2046;
 Wed, 18 Jan 2017 17:18:21 -0500 (EST)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Subject: [PATCH] arm: dts: aspeed: witherspoon: Fix BMC's compatible property
Date: Wed, 18 Jan 2017 16:19:30 -0600
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011822-0024-0000-0000-000015BCCDC4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006458; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00809508; UDB=6.00394366; IPR=6.00586865; 
 BA=6.00005072; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013969; XFM=3.00000011;
 UTC=2017-01-18 22:18:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011822-0025-0000-0000-000048110051
Message-Id: <20170118221930.16757-1-mspinler@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-18_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701180270
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
X-List-Received-Date: Wed, 18 Jan 2017 22:18:27 -0000

From: Matt Spinler <spinler@us.ibm.com>

Update the BMC's compatible property to make it consistent
with other systems, and also because code is hardcoded to
check for a certain value.

Signed-off-by: Matt Spinler <spinler@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index edfb05c66ce7..6064afa04421 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "Witherspoon BMC";
-	compatible = "ibm,witherspoon", "aspeed,ast2500";
+	compatible = "ibm,witherspoon-bmc", "aspeed,ast2500";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.11.0
