Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v1w8m3rH7zDqJ7
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 12:08:24 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0G13Rsm109663
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 20:08:22 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 280cbraynp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 20:08:22 -0500
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Mon, 16 Jan 2017 11:08:20 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 16 Jan 2017 11:08:18 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 85E972CE8054
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 12:08:17 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0G18Hns4850170
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 12:08:17 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0G18HLa011975
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 12:08:17 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0G18Gjs011966; Mon, 16 Jan 2017 12:08:16 +1100
Received: from camb691.ibm.com (unknown [9.83.3.20])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AF591A0206;
 Mon, 16 Jan 2017 12:08:10 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au
Subject: [PATCH] ARM: dts: aspeed-g5: Add mailbox and LPC Control nodes
Date: Mon, 16 Jan 2017 12:06:46 +1100
X-Mailer: git-send-email 2.11.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011601-0016-0000-0000-0000020CED11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011601-0017-0000-0000-0000063D8002
Message-Id: <20170116010646.8057-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-15_20:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=51
 spamscore=51 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701160016
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
X-List-Received-Date: Mon, 16 Jan 2017 01:08:25 -0000

This reserves BMC ram for host to BMC communication required by the
LPC control driver.

As both these devices exist on the LPC bus these nodes are children
of a new LPC node.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d6ff41ee6c58..51c339b46740 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -18,6 +18,18 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@94000000 {
+			compatible = "aspeed,ast2500-lpc-ctrl";
+			no-map;
+			reg = <0x94000000 0x04000000>; /* 64M */
+		};
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -89,6 +101,44 @@
 			};
 		};
 
+		lpc: lpc@1e789000 {
+			compatible = "aspeed,ast2500-lpc", "simple-mfd";
+			reg = <0x1e789000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x1e789000 0x1000>;
+
+			lpc_bmc: lpc-bmc@0 {
+				compatible = "aspeed,ast2500-lpc-bmc";
+				reg = <0x0 0x80>;
+			};
+
+			lpc_host: lpc-host@80 {
+				compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
+				reg = <0x80 0x1e0>;
+				reg-io-width = <4>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x80 0x1e0>;
+
+				lpc-ctrl@0 {
+					compatible = "aspeed,ast2500-lpc-ctrl";
+					memory-region = <&flash_memory>;
+					flash = <&spi1>;
+					reg = <0x0 0x80>;
+				};
+
+				mbox: mbox@180 {
+					compatible = "aspeed,ast2500-mbox";
+					reg = <0x180 0x5c>;
+					interrupts = <46>;
+					#mbox-cells = <1>;
+				};
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.11.0
