Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytZYH48htzDsCS;
 Sat,  9 Dec 2017 01:31:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Dec 2017 06:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,377,1508828400"; 
   d="scan'208";a="1204843"
Received: from build0101.sh.intel.com ([10.239.164.138])
 by orsmga006.jf.intel.com with ESMTP; 08 Dec 2017 06:31:43 -0800
From: Haiyue Wang <haiyue.wang@linux.intel.com>
To: joel@jms.id.au, clg@fr.ibm.com, jk@ozlabs.org, andrew@aj.id.au,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: Haiyue Wang <haiyue.wang@linux.intel.com>
Subject: [PATCH linux dev-4.10 2/2] ipmi: add the KCS nodes into ASt2500
 device tree
Date: Fri,  8 Dec 2017 22:31:39 +0800
Message-Id: <1512743499-26590-2-git-send-email-haiyue.wang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512743499-26590-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1512743499-26590-1-git-send-email-haiyue.wang@linux.intel.com>
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
X-List-Received-Date: Fri, 08 Dec 2017 14:31:48 -0000

Add kcs1, kcs2, kcs3 into mfd node 'lpc-bmc@0', and
add kcs4 into mfd node 'lpc-host@80'.

Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 42 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ba3607c..f428491 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -135,8 +135,39 @@
 			ranges = <0x0 0x1e789000 0x1000>;
 
 			lpc_bmc: lpc-bmc@0 {
-				compatible = "aspeed,ast2500-lpc-bmc";
+				compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
 				reg = <0x0 0x80>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x0 0x80>;
+
+				kcs1: kcs1@0 {
+					compatible = "aspeed,ast2500-kcs-bmc";
+					reg = <0x0 0x80>;
+					interrupts = <8>;
+					kcs_chan = <1>;
+					kcs_addr = <0x0>;
+					status = "disabled";
+				};
+
+				kcs2: kcs2@0 {
+					compatible = "aspeed,ast2500-kcs-bmc";
+					reg = <0x0 0x80>;
+					interrupts = <8>;
+					kcs_chan = <2>;
+					kcs_addr = <0x0>;
+					status = "disabled";
+				};
+
+				kcs3: kcs3@0 {
+					compatible = "aspeed,ast2500-kcs-bmc";
+					reg = <0x0 0x80>;
+					interrupts = <8>;
+					kcs_chan = <3>;
+					kcs_addr = <0x0>;
+					status = "disabled";
+				};
 			};
 
 			lpc_host: lpc-host@80 {
@@ -148,6 +179,15 @@
 				#size-cells = <1>;
 				ranges = <0x0 0x80 0x1e0>;
 
+				kcs4: kcs4@0 {
+					compatible = "aspeed,ast2500-kcs-bmc";
+					reg = <0x0 0xa0>;
+					interrupts = <8>;
+					kcs_chan = <4>;
+					kcs_addr = <0x0>;
+					status = "disabled";
+				};
+
 				lpc_ctrl: lpc-ctrl@0 {
 					compatible = "aspeed,ast2500-lpc-ctrl";
 					reg = <0x0 0x80>;
-- 
2.7.4
