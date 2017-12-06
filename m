Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysWL74q7wzDr3x
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:03:26 +1100 (AEDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 13:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; d="scan'208";a="1252603309"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2017 13:03:24 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 5/6] ARM: dts: aspeed: peci-hwmon: Add Aspeed PECI hwmon
Date: Wed,  6 Dec 2017 13:03:23 -0800
Message-Id: <20171206210323.7185-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 21:03:28 -0000

This commit adds Aspeed PECI hwmon node into aspeed-g4 and
aspeed-g5.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 64 ++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 64 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index d45f6b67fecc..f9904c2ee5d9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -250,6 +250,70 @@
 				clk-div = <0>;
 				cmd-timeout-ms = <1000>;
 				status = "disabled";
+
+				peci_hwmon0: peci-hwmon-cpu0 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <0>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon1: peci-hwmon-cpu1 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <1>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon2: peci-hwmon-cpu2 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <2>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon3: peci-hwmon-cpu3 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <3>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon4: peci-hwmon-cpu4 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <4>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon5: peci-hwmon-cpu5 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <5>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon6: peci-hwmon-cpu6 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <6>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon7: peci-hwmon-cpu7 {
+					compatible = "aspeed,ast2400-peci-hwmon";
+					cpu-id = <7>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
 			};
 
 			timer: timer@1e782000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index c75998ef759c..749ed252f71e 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -301,6 +301,70 @@
 				clk-div = <0>;
 				cmd-timeout-ms = <1000>;
 				status = "disabled";
+
+				peci_hwmon0: peci-hwmon-cpu0 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <0>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon1: peci-hwmon-cpu1 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <1>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon2: peci-hwmon-cpu2 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <2>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon3: peci-hwmon-cpu3 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <3>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon4: peci-hwmon-cpu4 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <4>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon5: peci-hwmon-cpu5 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <5>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon6: peci-hwmon-cpu6 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <6>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
+
+				peci_hwmon7: peci-hwmon-cpu7 {
+					compatible = "aspeed,ast2500-peci-hwmon";
+					cpu-id = <7>;
+					show-core = <1>;
+					dimm-nums = <16>;
+					status = "disabled";
+				};
 			};
 
 			timer: timer@1e782000 {
-- 
2.15.1
