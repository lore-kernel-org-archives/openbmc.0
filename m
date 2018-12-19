Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KFT40rg1zDqXm
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:02:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 16:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; d="scan'208";a="128987471"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2018 16:02:47 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.19 07/12] dt-bindings: mfd: Add a document for
 PECI client MFD
Date: Tue, 18 Dec 2018 16:02:31 -0800
Message-Id: <20181219000236.30812-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2018 00:02:48 -0000

This commit adds a dt-bindings document for PECI client MFD.

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/intel-peci-client.txt  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt

diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
new file mode 100644
index 000000000000..5d1d5d0a552f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
@@ -0,0 +1,34 @@
+* Intel PECI client bindings
+
+PECI (Platform Environment Control Interface) is a one-wire bus interface that
+provides a communication channel from PECI clients in Intel processors and
+chipset components to external monitoring or control devices. PECI is designed
+to support the following sideband functions:
+
+- Processor and DRAM thermal management
+- Platform Manageability
+- Processor Interface Tuning and Diagnostics
+- Failure Analysis
+
+Required properties:
+- compatible : Should be "intel,peci-client".
+- reg        : Should contain address of a client CPU. According to the PECI
+	       specification, client addresses start from 0x30.
+
+Example:
+	peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		peci-client@30 {
+			compatible = "intel,peci-client";
+			reg = <0x30>;
+		};
+
+		peci-client@31 {
+			compatible = "intel,peci-client";
+			reg = <0x31>;
+		};
+	};
-- 
2.7.4
