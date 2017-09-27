Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2WBC28jYzDsPT
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 07:27:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8RLOU67061808
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 17:27:27 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d8kkf8vyd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 17:27:26 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 27 Sep 2017 17:27:25 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 27 Sep 2017 17:27:22 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8RLRLEY3998168; Wed, 27 Sep 2017 21:27:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 253E8B2046;
 Wed, 27 Sep 2017 17:24:41 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.202.110])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 0E52CB2056;
 Wed, 27 Sep 2017 17:24:38 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2016.07] aspeed: clear all asserting watchdog
 conditions
Date: Wed, 27 Sep 2017 16:27:12 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17092721-0048-0000-0000-000001EC390C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007801; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000232; SDB=6.00923275; UDB=6.00464137; IPR=6.00703417; 
 BA=6.00005609; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017295; XFM=3.00000015;
 UTC=2017-09-27 21:27:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092721-0049-0000-0000-000042B2AD32
Message-Id: <20170927212712.4804-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-27_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709270299
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2017 21:27:32 -0000

Clear out all flagged watchdog conditions to allow the following
kernel load to complete successfully.  This will allow the kernel
to determine the next boot side instead of leaving it to u-boot.
This method of side switching has been suggested by Milton Miller
and Adirana Kobylak.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 arch/arm/mach-aspeed/reset.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/reset.c b/arch/arm/mach-aspeed/reset.c
index 1a44b3a..7d88d99 100644
--- a/arch/arm/mach-aspeed/reset.c
+++ b/arch/arm/mach-aspeed/reset.c
@@ -9,6 +9,12 @@
 
 void reset_cpu(ulong addr)
 {
+	/* Clear out all flagged watchdog events */
+	__raw_writel(0x1, AST_WDT1_BASE+0x14);
+	__raw_writel(0x1, AST_WDT2_BASE+0x14);
+	__raw_writel(0x1, AST_WDT3_BASE+0x14);
+	__raw_writel(__raw_readl(AST_SCU_BASE+0x3C) & 0x03, AST_SCU_BASE+0x3C);
+
 	__raw_writel(0x10 , AST_WDT1_BASE+0x04);
 	__raw_writel(0x4755, AST_WDT1_BASE+0x08);
 	__raw_writel(0x3, AST_WDT1_BASE+0x0c);
-- 
1.8.2.2
