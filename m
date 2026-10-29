Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F221606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:16:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTs60lkhz2yps;
	Thu, 29 Oct 2026 14:16:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793243769;
	cv=none; b=cQL9bCsnPzobUXyfnfsxYjNVpm48BF4x3UtriZ6o7rqoPSSS72gd9ZFCqDoly4NQHvFXkf26p99EDS7iWX5ZSkS8Z9pPFv2flT05Cwciltgt6vKi72llZKIpRgWKdcwZno9KJosfltbTD+AeFbijN2k058E4rIO0DOCKsVDYjISBHBqpNMbNPei+I1c6+b/lwnYHuqmRDYoK+jtCQs4cOofta0rN8GUGdO5pOdUzvvIe+EG8JRi556aH+4LeuwTfum0uuGYs6q2KHPGW/qTKbi87Jatlv3GfGYEDza+jJCEhzQeTKdo6S8doZx3Ik+c+dU+PO83jCq4V+i0Kkgp+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793243769; c=relaxed/relaxed;
	bh=uv7TAkdSaSffgoa8vQuLM1jVCpIlDkEcxBzCQYsHUok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+0ld+s3oVn0ugr8f/6KFtRCkddgnuoBRRyKVF1N358N0PocnzIksysCKrm8rGY8+ZC6/hIWg9IeICt0zJElBYMIuORCcW/8vwDtjtAx+OjjHmwgjueKKx0V75ym70Fl+UxA6TS5uFn7IXJsDmImDdoGwmco6sz5kHhzipuNXwPuDcE37OzhRnJ6+XbDKF2F4kM6VRjcne69w+bEWxV3wKsH6m2CtDFvRCaVXDbutfHhRbK3nBsiaM7gdeiXIAkyFPdv9aXQh19Z0csXkWa20/t/nVFl8UOEiga5Yur0IC1bsKTGrebOQBvi6It6GjQh96r8Q51nNQQtZrPltwpD6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTs44T4Kz2yh4
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:16:08 +1100 (AEDT)
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
CC: Billy Tsai <billy_tsai@aspeedtech.com>, <joel@jms.id.au>, Conor Dooley
	<conor.dooley@microchip.com>, Linus Walleij <linusw@kernel.org>
Subject: [PATCH linux dev-6.18 1/3] dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
Date: Thu, 29 Oct 2026 11:15:48 +0800
Message-ID: <20261029031552.515601-2-vince_chang@aspeedtech.com>
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

Add a device tree binding for the pin controller found in the
ASPEED AST2700 SoC0.

The controller manages various peripheral functions such as eMMC, USB,
VGA DDC, JTAG, and PCIe root complex signals.

Describe the AST2700 SoC0 pin controller using standard pin multiplexing
and configuration properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
(cherry picked from commit 86dc1b92cdb343f8de51edf489bcdd8cb5517cf8)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..407a64f28d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: >
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC0.
+
+  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
+  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    description: |
+      Pin control state.
+
+      If 'function' is present, the node describes a pinmux state and must
+      specify 'groups'.
+
+      For pin configuration, exactly one of 'groups' or 'pins' must be
+      specified in each state node. Group-level configuration applies to all
+      pins in the group. Pin-level configuration may be supplied in a
+      separate state node for individual pins; when both group-level and
+      pin-level configuration apply to the same pin, the pin-level
+      configuration takes precedence.
+
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+      - if:
+          required:
+            - function
+        then:
+          required:
+            - groups
+      - oneOf:
+          - required:
+              - groups
+          - required:
+              - pins
+
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - JTAGDDR
+          - JTAGM0
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2AD0
+          - USB2AD1
+          - USB2AH
+          - USB2AHP
+          - USB2AHPD0
+          - USB2AXH
+          - USB2AXH2B
+          - USB2AXHD1
+          - USB2AXHP
+          - USB2AXHP2B
+          - USB2AXHPD1
+          - USB2BD0
+          - USB2BD1
+          - USB2BH
+          - USB2BHP
+          - USB2BHPD0
+          - USB2BXH
+          - USB2BXH2A
+          - USB2BXHD1
+          - USB2BXHP
+          - USB2BXHP2A
+          - USB2BXHPD1
+          - USB3AXH
+          - USB3AXH2B
+          - USB3AXHD
+          - USB3AXHP
+          - USB3AXHP2B
+          - USB3AXHPD
+          - USB3BXH
+          - USB3BXH2A
+          - USB3BXHD
+          - USB3BXHP
+          - USB3BXHP2A
+          - USB3BXHPD
+          - VB
+          - VGADDC
+
+      groups:
+        enum:
+          - EMMCCDN
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BAP
+          - USB2BBP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - VB0
+          - VB1
+          - VGADDC
+
+      pins:
+        enum:
+          - AB13
+          - AB14
+          - AC13
+          - AC14
+          - AD13
+          - AD14
+          - AE13
+          - AE14
+          - AE15
+          - AF13
+          - AF14
+          - AF15
+
+      drive-strength:
+        enum: [3, 6, 8, 11, 16, 18, 20, 23, 30, 32, 33, 35, 37, 38, 39, 41]
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@400 {
+        compatible = "aspeed,ast2700-soc0-pinctrl";
+        reg = <0x400 0x318>;
+        emmc-state {
+            function = "EMMC";
+            groups = "EMMCG1";
+        };
+    };
-- 
2.43.0


