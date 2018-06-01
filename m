Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40yCNY3LJ4zF0dm
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 04:22:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jun 2018 11:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,467,1520924400"; d="scan'208";a="233889880"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2018 11:22:18 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for PECI
 client mfd
Date: Fri,  1 Jun 2018 11:22:16 -0700
Message-Id: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Fri, 01 Jun 2018 18:22:22 -0000

This commit adds a dt-bindings document for PECI client multi-function
device.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 .../devicetree/bindings/mfd/peci-client.txt   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/peci-client.txt

diff --git a/Documentation/devicetree/bindings/mfd/peci-client.txt b/Documentation/devicetree/bindings/mfd/peci-client.txt
new file mode 100644
index 000000000000..4eb8f6bb6ca4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/peci-client.txt
@@ -0,0 +1,23 @@
+* Intel PECI client bindings
+
+Required properties:
+- compatible : Should be "intel,peci-client", "simple-mfd".
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients is starting from 0x30 based on PECI specification.
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-client@30 {
+			compatible = "intel,peci-client", "simple-mfd";
+			reg = <0x30>;
+		};
+
+		peci-client@31 {
+			compatible = "intel,peci-client", "simple-mfd";
+			reg = <0x31>;
+		};
+	};
-- 
2.17.0
