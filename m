Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkgyt3W1jzDwYk
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:07:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBM64WPM046015
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:59 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27g1utw12g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:59 -0500
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 22 Dec 2016 16:06:56 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 22 Dec 2016 16:06:55 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 0C8872CE8046
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:55 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBM66smm61276258
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:54 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBM66sEx009081
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:54 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBM66sjH009078; Thu, 22 Dec 2016 17:06:54 +1100
Received: from camb691.ibm.com (unknown [9.81.194.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 176E5A0277;
 Thu, 22 Dec 2016 17:06:54 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Subject: [PATCH v2 3/5] ARM: dts: aspeed: Move mbox under lpc_host node
Date: Thu, 22 Dec 2016 17:06:08 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161222060610.29695-1-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122206-0008-0000-0000-000000F45DB0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122206-0009-0000-0000-000008BFD591
Message-Id: <20161222060610.29695-4-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-22_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612220102
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
X-List-Received-Date: Thu, 22 Dec 2016 06:07:03 -0000

The mbox registers are on the lpc_host bus this should be reflected in the device tree

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 2db7915de790..864136d2b73c 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -60,6 +60,12 @@
 					memory-region = <&flash_memory>;
 					reg = <0x0 0x80>;
 				};
+
+				mbox: mbox@180 {
+					compatible = "aspeed,ast2400-mbox";
+					reg = <0x180 0x5c>;
+					interrupts = <46>;
+				};
 			};
 		};
 
@@ -900,12 +906,6 @@
 				interrupts = <8>;
 			};
 
-			mbox: mbox@1e789200 {
-				compatible = "aspeed,ast2400-mbox";
-				reg = <0x1e789200 0x5c>;
-				interrupts = <46>;
-			};
-
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.11.0
