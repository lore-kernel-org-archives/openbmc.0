Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyR4r10TrzDqQw
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0A95AIf076134
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:54 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27vrnxr8ke-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:54 -0500
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 10 Jan 2017 19:07:52 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 Jan 2017 19:07:50 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 18A1B2BB0045
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:50 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0A97qPG51183668
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:52 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0A97nZR024174
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0A97n1k024167
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7422DA027E
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 3/5] ARM: dts: aspeed: Add mailbox and LPC Control nodes
Date: Tue, 10 Jan 2017 20:06:38 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170110090640.12608-1-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011009-0012-0000-0000-000002021080
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011009-0013-0000-0000-000006C8D581
Message-Id: <20170110090640.12608-4-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=46
 spamscore=46 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701100129
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
X-List-Received-Date: Tue, 10 Jan 2017 09:07:57 -0000

This reserves BMC ram for host to BMC communication required by the LPC
control driver.

As both these devices exist on the LPC bus these nodes are children of a
new LPC node

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |  6 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |  6 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  |  6 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  7 +++++
 arch/arm/boot/dts/aspeed-g4.dtsi               | 38 ++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 9dc3e67fc98c..19aeb3eb4a0a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -29,6 +29,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 68946aa34e31..a99fef94a616 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -33,6 +33,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 639b8f877184..246ed04bf8b3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -29,6 +29,12 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 13e9f18fbed8..bba911d79fbf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -29,8 +29,15 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@54000000 {
+			compatible = "aspeed,ast2400-lpc-ctrl";
+			no-map;
+			reg = <0x54000000 0x04000000>; /* 64M */
+		};
 	};
 
+
         leds {
                 compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7c78eb1c01ff..c84e833c9480 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -33,6 +33,44 @@
 		#size-cells = <1>;
 		ranges;
 
+		lpc: lpc@1e789000 {
+			compatible = "aspeed,ast2400-lpc", "simple-mfd";
+			reg = <0x1e789000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x1e789000 0x1000>;
+
+			lpc_bmc: lpc-bmc@0 {
+				compatible = "aspeed,ast2400-lpc-bmc";
+				reg = <0x0 0x80>;
+			};
+
+			lpc_host: lpc-host@80 {
+				compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
+				reg = <0x80 0x1e0>;
+				reg-io-width = <4>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x80 0x1e0>;
+
+				lpc-ctrl@0 {
+					compatible = "aspeed,ast2400-lpc-ctrl";
+					memory-region = <&flash_memory>;
+					flash = <&host_pnor>;
+					reg = <0x0 0x80>;
+				};
+
+				mbox: mbox@180 {
+					compatible = "aspeed,ast2400-mbox";
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
