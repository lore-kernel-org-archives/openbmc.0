Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v229h4lGKzDqRh
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:36 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0G5Y9Hr095340
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 00:39:34 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0b-001b2d01.pphosted.com with ESMTP id 280d8mr8fs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 00:39:33 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Mon, 16 Jan 2017 15:39:30 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 16 Jan 2017 15:39:28 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 0887E2CE8046
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:28 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0G5dSCZ51380354
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:28 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0G5dRjK008746
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:39:27 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0G5dRev008736; Mon, 16 Jan 2017 16:39:27 +1100
Received: from camb691.ibm.com (unknown [9.81.197.197])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC212A0206;
 Mon, 16 Jan 2017 16:39:26 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au
Subject: [PATCH v2 1/3] ARM: dts: aspeed-g5: Add mailbox and LPC control node
Date: Mon, 16 Jan 2017 16:37:38 +1100
X-Mailer: git-send-email 2.11.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011605-0044-0000-0000-0000021D0C1E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011605-0045-0000-0000-0000065BEA24
Message-Id: <20170116053740.15299-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=62
 spamscore=62 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701160088
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
X-List-Received-Date: Mon, 16 Jan 2017 05:39:37 -0000

Both these devices exist on the LPC bus these nodes are children of a
new LPC bus node.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
v2:
	Add the core to to the dtsi
	Enable them in the platforms that want them in subsequent patches
	Remove the compatible property for the reserved-memory nodes
	  All my understanding seems to indicate that this is how it
	  should be. However i've had problems with drivers probing on
	  other systems, hopefully these problems will turn out to have
	  been unrelated.

 arch/arm/boot/dts/aspeed-g5.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d6ff41ee6c58..1ce07d0ed431 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -89,6 +89,44 @@
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
+				lpc_ctrl: lpc-ctrl@0 {
+					compatible = "aspeed,ast2500-lpc-ctrl";
+					reg = <0x0 0x80>;
+					status = "disabled"
+				};
+
+				mbox: mbox@180 {
+					compatible = "aspeed,ast2500-mbox";
+					reg = <0x180 0x5c>;
+					interrupts = <46>;
+					#mbox-cells = <1>;
+					status = "disabled"
+				};
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.11.0
