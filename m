Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysWKx1BNHzDrZW
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:03:16 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 13:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; d="scan'208";a="10188351"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 06 Dec 2017 13:03:14 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 4/6] Documentation: dt-bindings,hwmon: Add Aspeed PECI hwmon
Date: Wed,  6 Dec 2017 13:03:13 -0800
Message-Id: <20171206210313.7138-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 21:03:17 -0000

This commit add dt-bindings and hwmon documents for Aspeed PECI
hwmon.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../bindings/hwmon/aspeed-peci-hwmon.txt           | 89 ++++++++++++++++++++++
 Documentation/hwmon/aspeed-peci-hwmon              | 64 ++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
 create mode 100644 Documentation/hwmon/aspeed-peci-hwmon

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
new file mode 100644
index 000000000000..a20a82f3380c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
@@ -0,0 +1,89 @@
+* ASPEED PECI (Platform Environment Control Interface) hwmon driver.
+
+Dependency:
+- This driver uses ASPEED PECI kernel misc driver as a controller interface
+  which can be enabled by setting CONFIG_ASPEED_PECI as yes.
+
+Required properties:
+- multi-functional device body: "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
+	- aspeed,ast2400-peci: Aspeed AST2400 family PECI MFD
+	- aspeed,ast2500-peci: Aspeed AST2500 family PECI MFD
+- compatible: "aspeed,ast2400-peci-hwmon" or "aspeed,ast2500-peci-hwmon"
+	- aspeed,ast2400-peci-hwmon: Aspeed AST2400 family PECI hwmon
+	- aspeed,ast2500-peci-hwmon: Aspeed AST2500 family PECI hwmon
+- cpu-id: Should contain CPU socket ID
+	- 0 ~ 7
+
+Optional properties:
+- show-core: If this property is 1, core temperature attributes will be
+	      enumerated.
+	0 or 1 (default: 1)
+	     In fact, these will be appeared when first reading on other attr
+	     happens because it needs cpu info reading. The number of generated
+	     core attrs depends on the number of cores of the cpu package.
+- dimm-nums: Should contain the number of DIMM slots that attached to the CPU
+	     which is indicated by cpu-id.
+	0 ~ 16 (default: 16)
+	     In case of 0, DIMM temperature attrs will not be enumerated.
+
+Example:
+	peci: peci@1e78b000 {
+		compatible = "aspeed,ast2500-peci", "simple-mfd";
+
+		peci_hwmon0: peci-hwmon-cpu0 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <0>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon1: peci-hwmon-cpu1 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <1>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon2: peci-hwmon-cpu2 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <2>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon3: peci-hwmon-cpu3 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <3>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon4: peci-hwmon-cpu4 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <4>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon5: peci-hwmon-cpu5 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <5>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon6: peci-hwmon-cpu6 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <6>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+
+		peci_hwmon7: peci-hwmon-cpu7 {
+			compatible = "aspeed,ast2500-peci-hwmon";
+			cpu-id = <7>;
+			show-core = <1>;
+			dimm-nums = <16>;
+		};
+	};
+
diff --git a/Documentation/hwmon/aspeed-peci-hwmon b/Documentation/hwmon/aspeed-peci-hwmon
new file mode 100644
index 000000000000..2debf1353e74
--- /dev/null
+++ b/Documentation/hwmon/aspeed-peci-hwmon
@@ -0,0 +1,64 @@
+Kernel driver aspeed-peci-hwmon
+===============================
+
+Supported chips:
+	ASPEED AST2400/2500
+
+Author:
+	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+
+Hardware Interfaces
+-------------------
+
+This driver uses ASPEED PECI kernel misc driver as a controller interface which
+can be enabled by setting CONFIG_ASPEED_PECI as yes.
+
+
+Description
+-----------
+
+This driver implements support for the ASPEED AST2400/2500 PECI hwmon.
+
+
+sysfs files
+-----------
+
+temp1_input		Provides current die temperature of the CPU package.
+temp1_max		Provides thermal control temperature of the CPU package
+			which is also known as Tcontrol.
+temp1_crit		Provides shutdown temperature of the CPU package which
+			is also known as the maximum processor junction
+			temperature, Tjmax or Tprochot.
+temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
+			the CPU package.
+
+temp2_input		Provides current DTS thermal margin to Tcontrol of the
+			CPU package. Value 0 means it reaches to Tcontrol
+			temperature. Sub-zero value means the die temperature
+			goes across Tconrtol to Tjmax.
+temp2_min		Provides the minimum DTS thermal margin to Tcontrol of
+			the CPU package.
+temp2_lcrit		Provides the value when the CPU package temperature
+			reaches to Tjmax.
+
+temp3_input		Provides current Tcontrol temperature of the CPU
+			package which is also known as Fan Temperature target.
+			Indicates the relative value from thermal monitor trip
+			temperature at which fans should be engaged.
+temp3_crit		Provides Tcontrol critical value of the CPU package
+			which is same to Tjmax.
+
+temp4_input		Provides current Tthrottle temperature of the CPU
+			package. Used for throttling temperature. If this value
+			is allowed and lower than Tjmax - the throttle will
+			occur and reported at lower than Tjmax.
+
+temp[100-127]_input	Provides current core temperature.
+temp[100-127]_max	Provides thermal control temperature of the core.
+temp[100-127]_crit	Provides shutdown temperature of the core.
+temp[100-127]_crit_hyst	Provides the hysteresis value from Tcontrol to Tjmax of
+			the core.
+
+temp[200-215]_input	Provides current temperature of the DDR DIMM.
+
-- 
2.15.1
