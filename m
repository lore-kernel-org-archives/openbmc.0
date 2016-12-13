Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td6rF0C0kzDvk4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:57:00 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBD4sE8B008208
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 23:56:58 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27a63nrjfj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 23:56:57 -0500
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 13 Dec 2016 14:56:55 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 13 Dec 2016 14:56:53 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id B23FC2BB0057
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:56:52 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBD4uqna60293186
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:56:52 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBD4uqpI017810
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:56:52 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBD4uqaO017804
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:56:52 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2FA74A01DA
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:56:52 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] ARM: dts: aspeed: Set correct memory size for 2400
 based opp platforms
Date: Tue, 13 Dec 2016 15:56:22 +1100
X-Mailer: git-send-email 2.10.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121304-0008-0000-0000-000000F098C8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121304-0009-0000-0000-000008B048C7
Message-Id: <20161213045623.1542-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-13_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612130083
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
X-List-Received-Date: Tue, 13 Dec 2016 04:57:01 -0000

These platforms all have 512MB of memory as opposed to the previously
thought 256MB.

Update the device trees accordingly

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 802ce95..353033b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -17,7 +17,7 @@
 	};
 
 	memory {
-		reg = <0x40000000 0x10000000>;
+		reg = <0x40000000 0x20000000>;
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 005ff89..ee7b569 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -21,7 +21,7 @@
 	};
 
 	memory {
-		reg = < 0x40000000 0x10000000 >;
+		reg = <0x40000000 0x20000000>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 92b29d1..3f3fd1f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -17,7 +17,7 @@
 	};
 
 	memory {
-		reg = < 0x40000000 0x10000000 >;
+		reg = <0x40000000 0x20000000>;
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index acaceda2..816c004 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -17,7 +17,7 @@
 	};
 
 	memory {
-		reg = <0x40000000 0x10000000>;
+		reg = <0x40000000 0x20000000>;
 	};
 
         leds {
-- 
2.10.2
