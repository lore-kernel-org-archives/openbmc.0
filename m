Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGRh85PPqzF0bt
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 09:31:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 14:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,337,1511856000"; d="scan'208";a="18805659"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2018 14:31:28 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Subject: [PATCH linux dev-4.10 5/6] Documentation: hwmon: Add a generic PECI
 hwmon
Date: Tue,  9 Jan 2018 14:31:25 -0800
Message-Id: <20180109223126.13093-6-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 09 Jan 2018 22:31:37 -0000

From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>

This commit add a document for a generic PECI hwmon driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
---
 Documentation/hwmon/peci-hwmon | 74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/hwmon/peci-hwmon

diff --git a/Documentation/hwmon/peci-hwmon b/Documentation/hwmon/peci-hwmon
new file mode 100644
index 0000000..e0155b5
--- /dev/null
+++ b/Documentation/hwmon/peci-hwmon
@@ -0,0 +1,74 @@
+Kernel driver peci-hwmon
+===============================
+
+Supported chips:
+	Generic BMC chips provide PECI controller
+
+Author:
+	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+
+Hardware Interfaces
+-------------------
+
+This driver uses a PECI misc driver as a controller interface so one of PECI
+misc drivers which provides compatible ioctls has to be enabled.
+
+
+Description
+-----------
+
+This driver implements a generic PECI hwmon feature which is running with a PECI
+controller driver supports native PECI Client Command Suite for retrieving
+temperatures of the CPU package, CPU cores and DIMM components.
+
+All temperature values are given in millidegree Celsius and will be measurable
+only when the target CPU is powered on.
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
+Note:
+	Core temperature group will be appeared when probing the driver if CPU
+	is online or when the first reading on other attr happens because it
+	needs cpu info reading. The number of generated core attrs depends on
+	the number of cores of the cpu package.
+
+temp[200-215]_input	Provides current temperature of the DDR DIMM.
-- 
2.7.4
