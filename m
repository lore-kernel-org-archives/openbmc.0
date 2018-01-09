Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGRh75Tf8zF0bT
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 09:31:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 14:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,337,1511856000"; d="scan'208";a="18805656"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2018 14:31:28 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.10 4/6] Documentation: dt-bindings: Add a generic
 PECI hwmon
Date: Tue,  9 Jan 2018 14:31:24 -0800
Message-Id: <20180109223126.13093-5-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 09 Jan 2018 22:31:36 -0000

This commit add a dt-bindings document for a generic PECI hwmon
driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/hwmon/peci-hwmon.txt       | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
new file mode 100644
index 0000000..20b86f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
@@ -0,0 +1,33 @@
+* Generic PECI (Platform Environment Control Interface) hwmon driver.
+
+Dependency:
+- This driver uses a PECI misc driver as a controller interface so one of PECI
+  misc drivers which provides compatible ioctls has to be enabled.
+
+Required properties:
+- compatible: "peci-hwmon"
+- cpu-id: Should contain CPU socket ID
+	- 0 ~ 7
+
+Optional properties:
+- show-core: If this protperty is defined, core tmeperature attrubites will be
+	     enumerated.
+- dimm-nums: Should contain the number of DIMM slots that attached to each CPU
+	     which is indicated by cpu-id.
+	0 ~ 16 (default: 16)
+	     In case of 0, DIMM temperature attrubites will not be enumerated.
+
+Example:
+	peci-hwmon0 {
+		compatible = "peci-hwmon";
+		cpu-id = <0>;
+		show-core;
+		dimm-nums = <16>;
+	};
+
+	peci-hwmon1 {
+		compatible = "peci-hwmon";
+		cpu-id = <1>;
+		show-core;
+		dimm-nums = <16>;
+	};
-- 
2.7.4
