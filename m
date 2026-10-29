Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41A606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:16:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTs74sKcz3048;
	Thu, 29 Oct 2026 14:16:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793243771;
	cv=none; b=hw+raur5kbSjSEbCCMTyuqXZrqAT0IHaLnuvoEIeUETZOZnkxmWrJ7HaqAPnRvtDxrMRm6u5gqobMGh1av9l2kM5RIeo75W4xEYcf5fNYb+OpuJdEQnfrAiEDf5dEd0XcVMaDypDQywcpMqsRtWHuAwSYxOW5+5eNX8PGqHn18X9xBCwMXcQAhWoKqa1C4KZYgS6RiCUOswjfca7LFkvnlyf/gVqnRCaIX6o4mPflb8+f3CoozzZgidOIj5SYyhcZ6X2r1pe9ObKi8XnwPNMkUnR7S3wBi3EtC6xTL9d7gsBuvV+2tztM5iwJK0fXc5KeblnmhxK0EUsWG4akUJzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793243771; c=relaxed/relaxed;
	bh=Wk7wCWDkx/wV/vtPYKdEMFgAsyB2900VUASdFvSNooY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acBS+A5S3VbK9nGuF9J60BmvcUXZM/msUP+CdwPRgdn1JM6DKzxsGyJFh1vdUtjm7aXNLkRp9VaFOw5bxviFZnGsaItk4FSXPI5ovCgEvaMPFwdu0SU1evr7dCE1tCOohRTT6vOkm14uHH4cKYKHG33tN2imU9XExbD1cPqPBoCpswaSiDAtOoV/POXV814xEwMYN8dxWooP8clC7n6QQzHKuk18AkmaoIaAQFrIRKMJUrfRqOl+Jg0ni34FBgQS0NvTdUORdgnygnjTMRaNsAxG3FAweMEapSzfYu4U5KeuLd8PP6R2NJuUBz2os4VE4OsMpKs32UPi1sjdvhD9Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTs60lYSz2ypY
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:16:10 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:15:52 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:15:52 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Billy Tsai <billy_tsai@aspeedtech.com>, <joel@jms.id.au>, Rob Herring
	<robh@kernel.org>, Linus Walleij <linusw@kernel.org>, Lee Jones
	<lee@kernel.org>
Subject: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
Date: Thu, 29 Oct 2026 11:15:49 +0800
Message-ID: <20261029031552.515601-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029031552.515601-1-vince_chang@aspeedtech.com>
References: <20261029031552.515601-1-vince_chang@aspeedtech.com>
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

AST2700 consists of two interconnected SoC instances, each with its own
System Control Unit (SCU). The SCU0 provides pin control, interrupt
controllers, clocks, resets, and address-space mappings for the
Secondary and Tertiary Service Processors (SSP and TSP).

Describe the SSP/TSP address mappings using the standard
memory-region and memory-region-names properties.

Disallow legacy child nodes that are not present on AST2700, including
p2a-control and smp-memram. The latter is unnecessary as software can
access the scratch registers via the SCU syscon.

Also allow the AST2700 SoC0 pin controller to be described as a child
node of the SCU0, and add an example illustrating the SCU0 layout,
including reserved-memory, interrupt controllers, and pinctrl.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Linus Walleij <linusw@kernel.org>
Link: https://patch.msgid.link/20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com
Signed-off-by: Lee Jones <lee@kernel.org>
(cherry picked from commit 2611c4d623ba867e196a4146f1927c3c468ac2bc)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index da1887d7a8fe..8b14d8d75639 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -46,6 +46,18 @@ properties:
   '#reset-cells':
     const: 1
 
+  memory-region:
+    items:
+      - description: Region mapped through the first SSP address window.
+      - description: Region mapped through the second SSP address window.
+      - description: Region mapped through the TSP address window.
+
+  memory-region-names:
+    items:
+      - const: ssp-0
+      - const: ssp-1
+      - const: tsp
+
 patternProperties:
   '^p2a-control@[0-9a-f]+$':
     description: >
@@ -87,6 +99,7 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc0-pinctrl
 
     required:
       - compatible
@@ -139,6 +152,30 @@ required:
   - '#clock-cells'
   - '#reset-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2700-scu0
+              - aspeed,ast2700-scu1
+    then:
+      patternProperties:
+        '^p2a-control@[0-9a-f]+$': false
+        '^smp-memram@[0-9a-f]+$': false
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: aspeed,ast2700-scu0
+    then:
+      properties:
+        memory-region: false
+        memory-region-names: false
+
 additionalProperties: false
 
 examples:
@@ -163,4 +200,81 @@ examples:
             reg = <0x7c 0x4>, <0x150 0x8>;
         };
     };
+
+  - |
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            ssp_region_0: memory@400000000 {
+                reg = <0x4 0x00000000 0x0 0x01000000>;
+                no-map;
+            };
+
+            ssp_region_1: memory@401000000 {
+                reg = <0x4 0x01000000 0x0 0x01000000>;
+                no-map;
+            };
+
+            tsp_region: memory@402000000 {
+                reg = <0x4 0x02000000 0x0 0x01000000>;
+                no-map;
+            };
+        };
+
+        bus {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            syscon@12c02000 {
+                compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+                reg = <0 0x12c02000 0 0x1000>;
+                ranges = <0x0 0x0 0x12c02000 0x1000>;
+                #address-cells = <1>;
+                #size-cells = <1>;
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+
+                memory-region = <&ssp_region_0>, <&ssp_region_1>,
+                                <&tsp_region>;
+                memory-region-names = "ssp-0", "ssp-1", "tsp";
+
+                silicon-id@0 {
+                    compatible = "aspeed,ast2700-silicon-id", "aspeed,silicon-id";
+                    reg = <0x0 0x4>;
+                };
+
+                interrupt-controller@1b0 {
+                    compatible = "aspeed,ast2700-scu-ic0";
+                    reg = <0x1b0 0x4>;
+                    #interrupt-cells = <1>;
+                    interrupts-extended = <&intc0 97>;
+                    interrupt-controller;
+                };
+
+                interrupt-controller@1e0 {
+                    compatible = "aspeed,ast2700-scu-ic1";
+                    reg = <0x1e0 0x4>;
+                    #interrupt-cells = <1>;
+                    interrupts-extended = <&intc0 98>;
+                    interrupt-controller;
+                };
+
+                pinctrl@400 {
+                    compatible = "aspeed,ast2700-soc0-pinctrl";
+                    reg = <0x400 0x318>;
+                    emmc-state {
+                        function = "EMMC";
+                        groups = "EMMCG1";
+                    };
+                };
+            };
+        };
+    };
+
 ...
-- 
2.43.0


