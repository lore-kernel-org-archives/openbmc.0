Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysWKV48PtzDsQ1
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:02:54 +1100 (AEDT)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 13:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; d="scan'208";a="156638466"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga004.jf.intel.com with ESMTP; 06 Dec 2017 13:02:51 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/6] ARM: dts: aspeed: peci: Add Aspeed PECI
Date: Wed,  6 Dec 2017 13:02:50 -0800
Message-Id: <20171206210250.7044-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Wed, 06 Dec 2017 21:02:55 -0000

This commit adds Aspeed PECI node into aspeed-g4 and aspeed-g5.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 424d843ec1da..d45f6b67fecc 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -238,6 +238,20 @@
 				clocks = <&clk_hpll>;
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "aspeed,ast2400-peci", "syscon", "simple-mfd";
+				reg = <0x1e78b000 0x60>;
+				reg-io-width = <4>;
+				interrupt-controller;
+				interrupts = <15>;
+				msg-timing-nego = <1>;
+				addr-timing-nego = <1>;
+				rd-sampling-point = <8>;
+				clk-div = <0>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			timer: timer@1e782000 {
 				compatible = "aspeed,ast2400-timer";
 				reg = <0x1e782000 0x90>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ba3607c788e8..c75998ef759c 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -289,6 +289,20 @@
 				clocks = <&clk_hpll>;
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "aspeed,ast2500-peci", "syscon", "simple-mfd";
+				reg = <0x1e78b000 0x60>;
+				reg-io-width = <4>;
+				interrupt-controller;
+				interrupts = <15>;
+				msg-timing-nego = <1>;
+				addr-timing-nego = <1>;
+				rd-sampling-point = <8>;
+				clk-div = <0>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			timer: timer@1e782000 {
 				compatible = "aspeed,ast2400-timer";
 				reg = <0x1e782000 0x90>;
-- 
2.15.1
