Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPdSN18pFzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:15:15 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1H3E18n073504
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 22:15:12 -0500
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nqfstyck-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 22:15:12 -0500
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Fri, 17 Feb 2017 13:15:09 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 13:15:08 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id BD7473578052
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:15:07 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1H3ExbE7209206
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:15:07 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v1H3EZ9f025625
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:14:35 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v1H3EZU7024863; Fri, 17 Feb 2017 14:14:35 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A7315A00BE;
 Fri, 17 Feb 2017 14:14:10 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: Update reserved memory nodes for zaius
 and witherspoon
Date: Fri, 17 Feb 2017 14:12:30 +1100
X-Mailer: git-send-email 2.11.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021703-0040-0000-0000-000002F08E35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021703-0041-0000-0000-00000C420031
Message-Id: <20170217031230.12800-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170031
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
X-List-Received-Date: Fri, 17 Feb 2017 03:15:16 -0000

Zaius platform doesn't use VGA so don't reserve that memory

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
v2: Drop reserving the framebuffer on Zaius
    Both platforms have 1GB not 512MB - adjust numbers
    Add comment requested by Joel.

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 15 +++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 12 ++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4b2d8aa8abb6..b79cadb2f6d7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -25,9 +25,20 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		/*
+		 * The addreses for the flash_memory reserved range are the
+		 * highest allowable for the size of the mapping (ie, the
+		 * address has no set bits greater than the size)
+		 */
+
+		flash_memory: region@b8000000 {
+			no-map;
+			reg = <0xb8000000 0x04000000>; /* 64M */
+		};
+
+		vga_memory: framebuffer@bc000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0xbc000000 0x04000000>; /* 64M */
 		};
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e1c9b3f4fe44..5a06da43801b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -25,10 +25,18 @@
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@94000000 {
+		/*
+		 * The addreses for the flash_memory reserved range are the
+		 * highest allowable for the size of the mapping (ie, the
+		 * address has no set bits greater than the size)
+		 */
+
+		flash_memory: region@bc000000 {
 			no-map;
-			reg = <0x94000000 0x04000000>; /* 64M */
+			reg = <0xbc000000 0x04000000>; /* 64M */
 		};
+
+		/* Zaius doesn't use VGA so don't reserve VGA buffer */
 	};
 
 	onewire0 {
-- 
2.11.1
