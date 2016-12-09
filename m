Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZh431YYmzDw7f
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB95doWo018033
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 00:43:44 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 277gu7wumy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Dec 2016 00:43:44 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Fri, 9 Dec 2016 15:43:41 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 9 Dec 2016 15:43:38 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id ED0513578056
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB95ha9t18809076
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uB95hagL014767
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uB95hawo014760
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 75601A026A
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
Date: Fri,  9 Dec 2016 16:43:21 +1100
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209054323.7320-1-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120905-0044-0000-0000-0000020E399F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120905-0045-0000-0000-00000624172E
Message-Id: <20161209054323.7320-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-09_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612090079
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
X-List-Received-Date: Fri, 09 Dec 2016 05:43:47 -0000

Palmettos have 512mb of ram. There is always framebuffer memory at the
top of ram.

This patch also reserves BMC ram for host to BMC communication.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 25 ++++++++++++++++++++++++-
 arch/arm/boot/dts/aspeed-g4.dtsi              |  6 ++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index acaceda2..e810ae7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -17,7 +17,30 @@
 	};
 
 	memory {
-		reg = <0x40000000 0x10000000>;
+		reg = <0x40000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells= <1>;
+		ranges;
+
+		flash_mem: region@52000000 {
+			compatible = "aspeed,lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64m */
+		};
+
+		fb_mem: framebuffer@5f000000 {
+			no-map;
+			reg = <0x5f000000 0x01000000>; /* 16m */
+		};
+	};
+
+	flash_buffer {
+		compatible = "aspeed,lpc-ctrl";
+		memory-region = <&flash_mem>;
+		reg = <0x1e789000 8>;
 	};
 
         leds {
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7c78eb1..2eba968 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -870,6 +870,12 @@
 				interrupts = <8>;
 			};
 
+			mbox: mbox@1e789200 {
+				compatible = "aspeed,mbox-host";
+				reg = <0x1e789200 0x5c>;
+				interrupts = <46>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.10.2
