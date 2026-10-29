Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFD606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:03:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTYj1Yy1z2ynZ;
	Thu, 29 Oct 2026 14:02:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793242968;
	cv=none; b=RIBpFWsqw/hMmw37TtNbr64t1XlEuq/0gUROAoC/IXpEUWRJg8/bhGWBnIL6AlTosOZZ3MXYNFkyHIV9n+Fas/CZ5P+3x+PNponJr7FNXTWUZChjEENMUc23ZnbDatKkmlZkdiig7FAVqrFae6eS68goGZKuCacUY6sSmekT1fgIag1Dzjk9EFYj/3A4bslf5/6oqGEbrE+xge2cQiNq+4aPGCdqB4barENc9Zw1vHJ1wyHcaZnNWDfOAtmwXkuWphj8AhtercewVtnTIyKXVtfjQ+PPkBRFYAkZTT/bjPmD+EEvpaNfdCsCH7uvfpIo2DTViKabDUzvAJGI+rWuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793242968; c=relaxed/relaxed;
	bh=QBzL6+Xi3eYzkZ0E11IkNlaMG7JzOFuzwvHlJqrtvwQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfplaSU/quWjcomRnsfXbJH3/sa9bggkU1WXILVrOhhPEYRJfM6osiPF5wwWeKk2eddVXECp96ECN8YGZcpqcUBPzyPmwnWCwy4tN9C2MKjguR6NY0xY1/J6zDaSk4Bep6yi7skQWqj1CZXY5GgXRGyhqQiBBJxvQSJcl3ZF2QhRvJr8q71g6jbATXEbzUKtMezhaFxT0zgCa5fRnkTAP4Lh1kC5KP6s9PXywyGyIeUQwCen5jw/ZzDW9PPkaK2T9SGQxA5LzPNEa3X4YHH6yGP7ydk/E4Xht9cJ+KB3caHPMQSfr2ko0SWhSYRjdeLVvJdfLLVgNSEo2w5JyaQ8PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTYf5Bvxz2ygd
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:02:46 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:02:24 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:02:24 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Thomas Gleixner
	<tglx@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH linux dev-6.18 1/6] dt-bindings: interrupt-controller: Describe AST2700-A2 hardware instead of A0
Date: Thu, 29 Oct 2026 11:02:16 +0800
Message-ID: <20261029030224.470029-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029030224.470029-1-vince_chang@aspeedtech.com>
References: <20261029030224.470029-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ryan Chen <ryan_chen@aspeedtech.com>

Introduce a new binding describing the AST2700 interrupt controller
architecture implemented in the A2 production silicon.

The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
prior to mass production. The interrupt architecture was substantially
reworked after the A0 revision for A1, and the A1 design is retained
unchanged in the A2 production silicon.

The existing AST2700 interrupt controller binding ("aspeed,ast2700-intc-ic")
was written against the pre-production A0 design.

That binding does not accurately describe the interrupt hierarchy and
routing model present in A1/A2, where interrupts can be routed to multiple
processor-local interrupt controllers (Primary Service Processor (PSP) GIC,
Secondary Service Processor (SSP)/Tertiary Service Processor (TSP) NVICs,
and BootMCU APLIC) depending on the execution context.

Remove the binding for the pre-production A0 design in favour of the
binding for the A2 production design. There is no significant user
impact from the removal as there are no existing devicetrees in any
of Linux, u-boot or Zephyr that make use of the A0 binding.

Hardware connectivity between interrupt controllers is expressed using
the aspeed,interrupt-ranges property.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://patch.msgid.link/20260407-irqchip-v5-1-c0b0a300a057@aspeedtech.com
(cherry picked from commit 51561ad8c89cfdd90314ce78c63553632d95bfd2)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 .../aspeed,ast2700-intc.yaml                  |  86 --------
 .../aspeed,ast2700-interrupt.yaml             | 188 ++++++++++++++++++
 2 files changed, 188 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
deleted file mode 100644
index 55636d06a674..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ /dev/null
@@ -1,86 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Aspeed AST2700 Interrupt Controller
-
-description:
-  This interrupt controller hardware is second level interrupt controller that
-  is hooked to a parent interrupt controller. It's useful to combine multiple
-  interrupt sources into 1 interrupt to parent interrupt controller.
-
-maintainers:
-  - Kevin Chen <kevin_chen@aspeedtech.com>
-
-properties:
-  compatible:
-    enum:
-      - aspeed,ast2700-intc-ic
-
-  reg:
-    maxItems: 1
-
-  interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 2
-    description:
-      The first cell is the IRQ number, the second cell is the trigger
-      type as defined in interrupt.txt in this directory.
-
-  interrupts:
-    maxItems: 6
-    description: |
-      Depend to which INTC0 or INTC1 used.
-      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
-      status registers for use.
-      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
-      INTC1 is used to assert INTC0 if interrupt of modules asserted.
-      +-----+   +-------+     +---------+---module0
-      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
-      |     |   |       |  |  |         |---...
-      +-----+   +-------+  |  +---------+---module31
-                           |
-                           |   +---------+---module0
-                           +---| INTC1_1 |---module2
-                           |   |         |---...
-                           |   +---------+---module31
-                          ...
-                           |   +---------+---module0
-                           +---| INTC1_5 |---module2
-                               |         |---...
-                               +---------+---module31
-
-
-required:
-  - compatible
-  - reg
-  - interrupt-controller
-  - '#interrupt-cells'
-  - interrupts
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    bus {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        interrupt-controller@12101b00 {
-            compatible = "aspeed,ast2700-intc-ic";
-            reg = <0 0x12101b00 0 0x10>;
-            #interrupt-cells = <2>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.yaml
new file mode 100644
index 000000000000..a62f0fd2435b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-interrupt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 Interrupt Controllers (INTC0/INTC1)
+
+description: |
+  The ASPEED AST2700 SoC integrates two interrupt controller designs:
+
+    - INTC0: Primary controller that routes interrupt sources to upstream,
+      processor-specific interrupt controllers
+
+    - INTC1: Secondary controller whose interrupt outputs feed into INTC0
+
+  The SoC contains four processors to which interrupts can be routed:
+
+    - PSP: Primary Service Processor (Cortex-A35)
+    - SSP: Secondary Service Processor (Cortex-M4)
+    - TSP: Tertiary Service Processor (Cortex-M4)
+    - BMCU: Boot MCU (a RISC-V microcontroller)
+
+  The following diagram illustrates the overall architecture of the
+  ASPEED AST2700 interrupt controllers:
+
+                  +-----------+                +-----------+
+                  |   INTC0   |                | INTC1(0)  |
+                  +-----------+                +-----------+
+                  |   Router  | +-----------+  |   Router  |
+                  | out   int | +Peripheral +  | out   int |
+  +-----------+   |  0     0  <-+Controllers+  | INTM      | +-----------+
+  |PSP GIC  <-|---+  .     .  | +-----------+  |  .     .  <-+Peripheral +
+  +-----------+   |  .     .  |                |  .     .  | +Controllers+
+  +-----------+   |  .     .  |                |  .     .  | +-----------+
+  |SSP NVIC <-|---+  .     .  <----------------+  .     .  |
+  +-----------+   |  .     .  |                |  .     .  |
+  +-----------+   |  .     .  <--------        |  .     .  |
+  |TSP NVIC <-|---+  .     .  |       |    ----+  .     .  |
+  +-----------+   |  .     .  |       |    |   |  O     P  |
+                  |  .     .  |       |    |   +-----------+
+                  |  .     .  <----   |    --------------------
+                  |  .     .  |   |   |        +-----------+  |
+                  |  M     N  |   |   ---------+  INTC1(1) |  |
+                  +-----------+   |            +-----------+  |
+                                  |                  .        |
+                                  |            +-----------+  |
+                                  -------------+  INTC1(N) |  |
+                                               +-----------+  |
+  +--------------+                                            |
+  + BMCU APLIC <-+---------------------------------------------
+  +--------------+
+
+  INTC0 supports:
+    - 128 local peripheral interrupt inputs
+    - Fan-in from up to three INTC1 instances via banked interrupt lines (INTM)
+    - Local peripheral interrupt outputs
+    - Merged interrupt outputs
+    - Software interrupt outputs (SWINT)
+    - Configurable interrupt routes targeting the PSP, SSP, and TSP
+
+  INTC1 supports:
+    - 192 local peripheral interrupt inputs
+    - Banked interrupt outputs (INTM, 5 x 6 banks x 32 interrupts per bank)
+    - Configurable interrupt routes targeting the PSP, SSP, TSP, and BMCU
+
+  One INTC1 instance is always present, on the SoC's IO die. A further two
+  instances may be attached to the SoC's one INTC0 instance via LTPI (LVDS
+  Tunneling Protocol & Interface).
+
+  Interrupt numbering model
+  -------------------------
+  The binding uses a controller-local numbering model. Peripheral device
+  nodes use the INTCx local interrupt number (hwirq) in their 'interrupts' or
+  'interrupts-extended' properties.
+
+  For AST2700, INTC0 exposes the following (inclusive) input ranges:
+
+    - 000..479: Independent interrupts
+    - 480..489: INTM0-INTM9
+    - 490..499: INTM10-INTM19
+    - 500..509: INTM20-INTM29
+    - 510..519: INTM30-INTM39
+    - 520..529: INTM40-INTM49
+
+  INTC0's (inclusive) output ranges are as follows:
+
+    - 000..127: 1:1 local peripheral interrupt output to PSP
+    - 144..151: Software interrupts from the SSP output to PSP
+    - 152..159: Software interrupts from the TSP output to PSP
+    - 192..201: INTM0-INTM9 banked outputs to PSP
+    - 208..217: INTM30-INTM39 banked outputs to PSP
+    - 224..233: INTM40-INTM49 banked outputs to PSP
+    - 256..383: 1:1 local peripheral interrupt output to SSP
+    - 384..393: INTM10-INTM19 banked outputs to SSP
+    - 400..407: Software interrupts from the PSP output to SSP
+    - 408..415: Software interrupts from the TSP output to SSP
+    - 426..553: 1:1 local peripheral interrupt output to TSP
+    - 554..563: INTM20-INTM29 banked outputs to TSP
+    - 570..577: Software interrupts from the PSP output to TSP
+    - 578..585: Software interrupts from the SSP output to TSP
+
+  Inputs and outputs for INTC1 instances are context-dependent. However, for the
+  first instance of INTC1, the (inclusive) output ranges are:
+
+    - 00..05: INTM0-INTM5
+    - 10..15: INTM10-INTM15
+    - 20..25: INTM20-INTM25
+    - 30..35: INTM30-INTM35
+    - 40..45: INTM40-INTM45
+    - 50..50: BootMCU
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2700-intc0
+      - aspeed,ast2700-intc1
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: Single cell encoding the INTC local interrupt number (hwirq).
+
+  aspeed,interrupt-ranges:
+    description: |
+      Describes how ranges of controller output pins are routed to a parent
+      interrupt controller.
+
+      Each range entry is encoded as:
+
+        <out count phandle parent-specifier...>
+
+      where:
+        - out:     First controller interrupt output index in the range.
+        - count:   Number of consecutive controller interrupt outputs and parent
+                   interrupt inputs in this range.
+        - phandle: Phandle to the parent interrupt controller node.
+        - parent-specifier: Interrupt specifier, as defined by the parent
+                            interrupt controller binding.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    items:
+      description: Range descriptors with a parent interrupt specifier.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - aspeed,interrupt-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@12100000 {
+        compatible = "aspeed,ast2700-intc0";
+        reg = <0x12100000 0x3b00>;
+        interrupt-parent = <&gic>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        aspeed,interrupt-ranges =
+          <0 128 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+          <144 8 &gic GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+          <152 8 &gic GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+          <192 10 &gic GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+          <208 10 &gic GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+          <224 10 &gic GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+          <256 128 &ssp_nvic 0 0>,
+          <384 10 &ssp_nvic 160 0>,
+          <400 8 &ssp_nvic 144 0>,
+          <408 8 &ssp_nvic 152 0>,
+          <426 128 &tsp_nvic 0 0>,
+          <554 10 &tsp_nvic 160 0>,
+          <570 8 &tsp_nvic 144 0>,
+          <578 8 &tsp_nvic 152 0>;
+    };
-- 
2.43.0


