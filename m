Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BX8s1GZnzF13G
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 05:39:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 12:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,253,1526367600"; d="scan'208";a="59887863"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2018 12:39:54 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux-next v6 01/13] dt-bindings: Add a document of PECI
 subsystem
Date: Thu, 21 Jun 2018 12:39:47 -0700
Message-Id: <20180621193947.20645-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 21 Jun 2018 19:39:57 -0000

This commit adds a document of generic PECI bus, adapter and client
driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/peci/peci.txt         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci.txt

diff --git a/Documentation/devicetree/bindings/peci/peci.txt b/Documentation/devicetree/bindings/peci/peci.txt
new file mode 100644
index 000000000000..5583aa80b78a
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci.txt
@@ -0,0 +1,60 @@
+Generic device tree configuration for PECI buses
+================================================
+
+Required properties:
+- compatible     : Should be "simple-bus".
+- #address-cells : Should be present if the device has sub-nodes.
+- #size-cells    : Should be present if the device has sub-nodes.
+- ranges         : Should contain PECI controller registers ranges.
+
+Example:
+	peci: peci@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10000000 0x1000>;
+	};
+
+Generic device tree configuration for PECI adapters
+===================================================
+
+Required properties:
+- #address-cells : Should be <1>. Read more about client addresses below.
+- #size-cells    : Should be <0>. Read more about client addresses below.
+
+The cells properties above define that an address of CPU clients of a PECI bus
+are described by a single value.
+
+Example:
+	peci0: peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+Generic device tree configuration for PECI clients
+==================================================
+
+Required properties:
+- compatible : Should contain name of PECI client.
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients starts from 0x30 based on PECI specification.
+
+Example:
+	peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		peci-client@30 {
+			compatible = "vendor,peci-client";
+			reg = <0x30>;
+		};
+
+		peci-client@31 {
+			compatible = "vendor,peci-client";
+			reg = <0x31>;
+		};
+	};
-- 
2.17.1
