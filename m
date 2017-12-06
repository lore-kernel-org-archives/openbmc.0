Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysWKK2QxczDsTj
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:02:44 +1100 (AEDT)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 13:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; 
   d="scan'208";a="9696716"
Received: from maru.jf.intel.com ([10.54.51.80])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2017 13:02:42 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 1/6] Documentation: dt-bindings: Add Aspeed PECI
Date: Wed,  6 Dec 2017 13:02:40 -0800
Message-Id: <20171206210240.6996-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 21:02:46 -0000

This commit adds a dt-bindings document for Aspeed PECI.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/misc/aspeed-peci.txt       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-peci.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-peci.txt b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
new file mode 100644
index 000000000000..af950d72a48c
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
@@ -0,0 +1,52 @@
+* ASPEED PECI (Platform Environment Control Interface) misc driver.
+
+Hardware Interfaces:
+- This driver implements support for the ASPEED AST2400/2500 PECI which has the
+  following features:
+	- Directly connected to APB bus
+	- Intel PECI 3.1 compliant (PECI 3.0 for AST2400)
+	- Maximum packet length is 256 bytes (Baseline transmission unit)
+	- Support up to 8 CPUs and 2 domains per CPU
+	- Integrate PECI compliant I/O buffers, can connect to PECI bus directly
+	- Transmit buffer 32 bytes and receive buffer 32 bytes
+
+Required properties:
+- compatible: "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
+	- aspeed,ast2400-peci: Aspeed AST2400 family PECI control interface
+	- aspeed,ast2500-peci: Aspeed AST2500 family PECI control interface
+- reg: Should contain PECI registers location and length
+- interrupts: Should contain PECI interrupt
+
+Optional properties:
+- msg_timing_nego: Message timing negotiation period
+	0 ~ 255 (default: 1)
+- addr_timing_nego: Address timing negotiation period
+	0 ~ 255 (default: 1)
+- rd_sampling_point: Read sampling point selection
+	0 ~ 15 (default: 8)
+- clk_div: Clock divider for 24MHz clock source
+	0: Divide by 1   <- default
+	1: Divide by 2
+	2: Divide by 4
+	3: Divide by 8
+	4: Divide by 16
+	5: Divide by 32
+	6: Divide by 64
+	7: Divide by 128
+- cmd_timeout_ms: Command timeout in units of ms
+	1 ~ 60000 (default: 1000)
+
+Example:
+	peci: peci@1e78b000 {
+		compatible = "aspeed,ast2500-peci", "syscon", "simple-mfd";
+		reg = <0x1e78b000 0x60>;
+		reg-io-width = <4>;
+		interrupt-controller;
+		interrupts = <15>;
+		msg-timing-nego = <1>;
+		addr-timing-nego = <1>;
+		rd-sampling-point = <8>;
+		clk-div = <0>;
+		cmd-timeout-ms = <1000>;
+	};
+
-- 
2.15.1
