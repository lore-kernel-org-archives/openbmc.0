Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E2AE77187
	for <openbmc@archiver.kernel.org>; Wed, 18 Dec 2024 21:43:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YD6bt4dzdz3dX0
	for <openbmc@archiver.kernel.org>; Thu, 19 Dec 2024 08:42:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734522299;
	cv=none; b=hEYSuMZCNdOQQf3mTyooMnqePeV/AS9f95vQiR6Nn9aQRKZm/4IN6443OUOoL5NaZGN+XTY1Zs9XKEmHAnwnir1pahD4dcb41U6nPX5zdBI92bTNeOxurD7k0JtqA77YZJVAoicQ/g1JFbXHO6zBw5JICWi9nHaDPvEJBAVY/pg3M0rD6O6OD4gX8u3XM6EnXZhQs47YTEBTXrnXdRyUyHV0ly6UezkuPwXzp0siPKZ+LP6K1TCSylMV3BxNxIV73E3J4/FuDbX9lLrVKTEQ5y+ZzemK8Rp/vvl+glynItfo1sfskqKasBC48iXKSnITYebcHSgq6+RT9kWlhg+QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734522299; c=relaxed/relaxed;
	bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WSz8vPiJMsso2IjhPPp6nkclmP3SLfxLN9RXUdnnWUlSeXemr2DIk2CYRNZ7CyXAXp/yfGuRBgRQ7s02EKrhpGlAln/0kSqvdaSP06XI2alSDUs/CmrlKI+w8Pz9gU57ngyLyj1LRsnSZg5i/79QyUKItq5xDeKqCW/LhE8rkeJmoqOWshY3RXGE3xJpSff+KXdz3aJBnM24jy6MKzJiCWAyXdGPcFN+dKyVtWDiasj7NIwodgzGOKGuq6PY5d1E/t7+qj/VO7HobViYFR1J5B67MXRW7XofIMWLz1JP04l/y0ZP+DiBYNZKTeP7Np4VFz62UQjnSPJ1zAjVaIdB6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0lwSDSC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0lwSDSC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCsL227lKz30TL
	for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 22:44:58 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728ea1573c0so5540987b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 03:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522295; x=1735127095; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=C0lwSDSCbH/UhK3E2SfzvTU814pQgtFd+CJxvB8hjmDmzeJM+YKKqjtpnDgJB++1Kf
         FAdTQYhrcDVWierHFuRqAx4z5Vv/7sFNZqqu8+Z/hR37P5nkk7guILj0E1asZkqE/WJY
         ohsBnqv+HKkaHAaz0WQhb8Lb6YdO0byxeiql37z3goatJ+eEPwR5fyNWZyfbwqkNqjdN
         A/nrTh9Vw08XxZqsyaKq/z+1XoJfddUZPlJQK9Of1tftls8NdKkC8uhwpzxC85vNAMGp
         udoO4VtAFjRv1HK5KQgwYZOBKriVekCvQQ6K1+Jy7aIKMBvHHlMAzJ1whqB1bG0IZz+C
         o3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522295; x=1735127095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=vegDV4Aa9c28OvqI4VjE0L7nPDtpY0NrSChL0xR2sfPoyP29NdketGgSsIZX/ORW9e
         XE6sK8wOYJUybDZ9iK9nIlnbuVutW1uVXrMEF+Nibkn/0SYWaQr8ZU9pU0KPT4DqJ6vp
         omCTI8YEi15cKQ9dloFE1VOXs6aonM3hOG3y4jVA3hpWPpTFA3Q0hA8GCr5YdSXbsFw9
         Op5Xz3l+E/8UbqSJO94DmanTs0kPFqrtHf5qpPjErsmxCB3zqsih/dBp1hAoh9LN74AD
         4DRCPQuqBCMFJK5BbprVPpCtMIWdh5NyZd/vHu0uI1C37c6b59iOv2Xnpm0yit1DKDP3
         IGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBE7TrNE6rCB4vpDz8drqhHnRGFPEnoVvc8PQUH3BaR0it8QNawlEEPLlbjycVkyrA32io6b1M@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKRwb72bv+XQKP6FJ6b6QDY5Y1WWmjsmGV6h5lvPMoJ04hKgO0
	3TCWqIXGGXDJvNUIPOyiSO/5xK4BWEpxk4r5GP1p4azXEDP64ZuA
X-Gm-Gg: ASbGncuIRu+8SqKrOcPPeiqbbGE6kRGJWa39M+M0la8M/1ZOKV8gUh7ZUw0RQurdPRE
	kWx5iEXV2/wclBfyTPAr71fVylVe6BSyDlt6NtMZCTjjjG7S7ls2MDcRGX3zUfwAzhueOIflJfP
	UrCnO1e88b+5q0fIfBo8gthDiZR0gKPy2zSttIPpQO0AVkM+RyrpX8xF8l0fF+e3fRabArOWw0h
	eTbcorVM9CD4CYGFx4XlrO+ULnz/K/Kl6QvYFosLeiNWNimWwx2/EGox+2cy4G+5mcy3QsZBXPq
	wz+IjQLymEQgmF2xrBssFw==
X-Google-Smtp-Source: AGHT+IHONX6Gx0giguOpmTW6fQVk1CaAqSvv5cTzOJz9POkcYbKiTEO3GeqPM6pq2BbnSq8Z/eze6A==
X-Received: by 2002:a17:90a:c2c6:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2f2e91c13demr3765154a91.6.1734522295379;
        Wed, 18 Dec 2024 03:44:55 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:55 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Wed, 18 Dec 2024 19:44:40 +0800
Message-Id: <20241218114442.137884-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218114442.137884-1-a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Dec 2024 08:42:42 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..c3f2ad423cc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,126 @@
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
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1-dwmac
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
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index eb1f3ae41ab9..4bf59ab910cc 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1

