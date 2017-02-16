Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP4zy75kQzDqL0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:52:14 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1G5nGt4142805
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 00:52:13 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28mq9h4tty-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 00:52:12 -0500
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 16 Feb 2017 15:52:09 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 15:52:07 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 0332A3578053
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:52:07 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1G5pwWu15007942
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:52:06 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v1G5pY7j022766
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 16:51:34 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v1G5pY3X022237; Thu, 16 Feb 2017 16:51:34 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 28C0FA0212;
 Thu, 16 Feb 2017 16:51:10 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for zaius and
 witherspoon
Date: Thu, 16 Feb 2017 16:49:22 +1100
X-Mailer: git-send-email 2.11.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021605-0048-0000-0000-0000020625CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021605-0049-0000-0000-0000478A888F
Message-Id: <20170216054922.19722-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160060
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
X-List-Received-Date: Thu, 16 Feb 2017 05:52:15 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 9 +++++++--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4b2d8aa8abb6..2d76bfee1262 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -25,9 +25,14 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		flash_memory: region@98000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+
+		vga_memory: framebuffer@9c000000 {
+			no-map;
+			reg = <0x9c000000 0x04000000>; /* 64MB */
 		};
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e1c9b3f4fe44..f30288f735bc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -25,9 +25,14 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		flash_memory: region@98000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+
+		vga_memory: framebuffer@9c000000 {
+			no-map;
+			reg = <0x9c000000 0x04000000>; /* 64MB */
 		};
 	};
 
-- 
2.11.1
