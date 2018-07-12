Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R24K4RLkzF360;
 Thu, 12 Jul 2018 13:49:21 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6C3mnNT020207;
 Wed, 11 Jul 2018 22:48:54 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 1/5] dt-bindings: fsi: Document binding for the
 fsi-master-ast-cf "device"
Date: Thu, 12 Jul 2018 13:48:43 +1000
Message-Id: <20180712034847.12878-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180712034847.12878-1-benh@kernel.crashing.org>
References: <20180712034847.12878-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 03:49:22 -0000

This isn't per-se a real device, it's a pseudo-device that
represents the use of the Aspeed built-in ColdFire to
implement the FSI protocol by bitbanging the GPIOs instead
of doing it from the ARM core.

Thus it's a drop-in replacement for the existing
fsi-master-gpio pseudo-device for use on systems based
on the Aspeed chips. It has most of the same properties,
plus some more needed to operate the coprocessor.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 .../bindings/fsi/fsi-master-ast-cf.txt        | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt b/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
new file mode 100644
index 000000000000..431bf8a423ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
@@ -0,0 +1,36 @@
+Device-tree bindings for ColdFire offloaded gpio-based FSI master driver
+------------------------------------------------------------------------
+
+Required properties:
+ - compatible =
+	"aspeed,ast2400-cf-fsi-master" for an AST2400 based system
+   or
+	"aspeed,ast2500-cf-fsi-master" for an AST2500 based system
+
+ - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
+ - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
+ - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
+ - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
+ - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
+                                          functions (eg, external FSI masters)
+ - memory-region = <phandle>;		: Reference to the reserved memory for
+                                          the ColdFire. Must be 2M aligned on
+					  AST2400 and 1M aligned on AST2500
+ - aspeed,sram = <phandle>;		: Reference to the SRAM node.
+ - aspeed,cvic = <phandle>;		: Reference to the CVIC node.
+
+Examples:
+
+    fsi-master {
+        compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+
+	clock-gpios = <&gpio 0>;
+        data-gpios = <&gpio 1>;
+        enable-gpios = <&gpio 2>;
+        trans-gpios = <&gpio 3>;
+        mux-gpios = <&gpio 4>;
+
+	memory-region = <&coldfire_memory>;
+	sram = <&sram>;
+	cvic = <&cvic>;
+    }
-- 
2.17.1
