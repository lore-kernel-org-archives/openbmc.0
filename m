Return-Path: <openbmc+bounces-1706-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68898FEC104
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 22:51:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgQJQ60xkz2ynH;
	Wed, 25 Mar 2026 09:51:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774261090;
	cv=none; b=jApNsDUvngw5QEY6l5jBiDvcKFFpWP0aMLchgA1GxXA48FqPibFmdh4hr3cQzAE32QdbepiQVjOgUWAz+J2JyYpSnFedQCOUn/wBdP2DKLGVlbRb6j1kMDrhEzuvOpyYB4H9/a1m9wlZrYY3gHBchS0KMV2s773Rtn9yQFcNl1NcfoZR9CgF1y7Z83Cn0GYIckGtTi3s/bfwr1g5bXKZQLscXyGeAse1pTEonIufvD2JTGzBrzdmWwYeQtRXOT9op9NacAB1zmdjbzoWfu0cq16iVRNSFd8IoCCcdLoul9E7m87PxBlnFfVyxcR+VMdpQ5dO/b5juw3IO/wPDCBCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774261090; c=relaxed/relaxed;
	bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2v/fLiVpeqthyM4YXpL4La7A6CU5z/WweNBvEYlNfiXpqViWJLVwK/Vtdq58c8four9MTeOPTli/6Yau3ney8zaWF2g++dhhxwXD2R6lReojMdfe9cO7biKMsPTL0Twspjk6Updt+iQ7KLCAhKCffwTc+3OvzhzRyCMFIuu+5lS2wWe9JYF3EoU7LIxm6qf2qRnudLb06JR9ABgcjJI26eFmAte4AMFMZye7FoxqNtCyv1Qi/34HWUTVHmzg8d3+5KEzbvqEycjGjEcnEHom29XyqerwDscZGYmjyC0r8BqXdOHmjzh3D6tJB+C7j0bpETVS5R5HXihYL/sam54gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHsoK80A; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHsoK80A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffTdZ0NPgz2xly
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 21:18:09 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8299f1ca894so2463839b3a.2
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 03:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261088; x=1774865888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=QHsoK80Am8MOrNiqy5Bhun4HXc9+XCpdTftTmJQ2Ode5H+S7FNSJt31fR2CeziIAyU
         SHOjRon0jVpPFaXxMvc/Dff2N4y4ePy20pkBfZwytt3kmlqq2t1JSZYVQa/+k55Wc5mJ
         QqFq7P7r4yRANoh2kzpfDPDCgxiumHtwgC9R44kXk0D/2HNJwX6V5JxDER5CL+nJEKz3
         dcjbow3ycy+zkX2F4r59hGGZA2fFso+oQRye6R0lU9NRAJ7JjuiXGJWZjerU8hAZIdk1
         manIiN3NQ3oeIcBJUlxz4bp78KONi2n8MDEjtza3bEEzFJvctUChWU9l/c6hVH0lBoHw
         baNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261088; x=1774865888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oyXu0gtjiBhx9nuUYM0Mf+9SNK/PonIri6dLaS9aeOY=;
        b=IJICylWBP/RowyrUv53LGA0wjwTpSekWB474j1/JiX3GgMZIUsXTXc+4q/PRmdPavo
         2KpZAgfnIRGmnyaw8At0qcSsML/qFL0h7zzB5Cd48Kx9ZO+9WijqKjH5PmCaLtmzuVK4
         CeB82W++EDJ0z4Bj3vmv2Fa5oVL5/mOJxHLfx8VE9fDo5x6eWux3osTVxGgQh/Ra0NDA
         xR4iGMR86tN6vV7fUj14oQxAexhgApGuDcegTX7R5BnowRmYebvFW/WO5vTU8uTIAkW8
         8GcUMTXEvbNQujSaL2AyIasEs5W/IlPXsaNh8nzxtxOBRBHW9Tv0wnKpETZKnTnM1ptw
         TNgg==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ1bh8JVvPjiZ6fwE94u4+C6PImsibmYRkOXyjIOVn3MrQ2b9kC7oYUaR39hSinWDjcD2AoCd@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxc4aE2pVua2Zao/wLTyLLhlZsZHbPd43bjS1qzxNCHz8DG8Z3z
	IpzuvZr102qcTS8Azy9OP2vwMIRU7GEslCn49keXaYJ/VEUz2OU8XUsj
X-Gm-Gg: ATEYQzzd3N7VGFfRlJfCWAbepgm6ImNffWBn2c6ASb+wNNokGOzRx4Ikywn3XixqODt
	o8fGbJRgnjN5WaN9mSaylzeMEB2+XsD4Hu4PSkPiSXRLF9wqr8M4FiO2PD5j+ehkzFKceewLn5a
	wwBg0x9A+eipOq10OfycnqCQJ2RzkqodFBUQQL3Cq0UfZCH87Wmk0AvD0MuxGyMx7q/KWrc72rS
	W1H8iDchubXlSm9MyRSDc/iy7HsZx3cJKFquGvvA18SpLG6EdForyzIwLusL0TnzqYA+7oOanTl
	91fgqabXCOzjO+CYKbodmH738aMGywsQyiBTLeCxVmX2bRaBKgnFBGdRGtyym9OX/Utnw+BSFjX
	yMNAitTwAAtiOzCopGbOwKF0x1bPH7wImRXsaT7YrEnzqf9Lsjmc776uP7n4Ht5F9nP8omyZAgB
	QjiFrNrJ9qlc4Atxjphx5C23LVeahzkOX72MSkFEP6FgSCzAolKwmKEjFFEzrNQN2y9X+R3Bd69
	qqO2uI9TIsjb5Qp5GPQHVQ=
X-Received: by 2002:a05:6a00:1c83:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82a8c23fb65mr8571011b3a.1.1774261088009;
        Mon, 23 Mar 2026 03:18:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v15 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 23 Mar 2026 18:17:54 +0800
Message-ID: <20260323101756.81849-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..ab18702e53f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+        snps,multicast-filter-bins = <0>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <4096>;
+        tx-fifo-depth = <2048>;
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 98ebb6276bc6..c25903c74484 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0


