Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmjKk6QLHzDqZ0
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 03:16:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2018 08:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,543,1511856000"; d="scan'208";a="29617851"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 21 Feb 2018 08:16:21 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
 andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 5/8] [PATCH [5/8] Documentation: dt-bindings: Add a
 document for PECI hwmon client driver
Date: Wed, 21 Feb 2018 08:16:03 -0800
Message-Id: <20180221161606.32247-6-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 16:16:47 -0000
X-List-Received-Date: Wed, 21 Feb 2018 16:16:47 -0000
X-List-Received-Date: Wed, 21 Feb 2018 16:16:47 -0000
X-List-Received-Date: Wed, 21 Feb 2018 16:16:47 -0000

This commit adds a dt-bindings document for a generic PECI hwmon client
driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/hwmon/peci-hwmon.txt       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
new file mode 100644
index 000000000000..831813158884
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
@@ -0,0 +1,27 @@
+Bindings for Intel PECI (Platform Environment Control Interface) hwmon driver.
+
+Required properties:
+- compatible
+	Should be "intel,peci-hwmon".
+
+- reg
+	Should contain address of a client CPU. Address range of CPU clients is
+	starting from 0x30 based on PECI specification.
+	<0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-hwmon@cpu0 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x30>;
+		};
+
+		peci-hwmon@cpu1 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x31>;
+		};
+	};
-- 
2.16.1
