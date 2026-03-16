Return-Path: <openbmc+bounces-1541-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF10FB5E85
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 22:56:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZVnb5bt3z2yj3;
	Tue, 17 Mar 2026 09:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773640482;
	cv=none; b=YHtMweVcIq9es2gsT1ev6cg52pbwemBzANxrwqNir3u3lGFPjrKrRNwwblok5872dTWJbknXi4vRKqxMPW2Z2fb8tSD8zgBqotCfH0WOdoymNncMVEzm+m5LkRYELUKttEhWte4gvee+jE1iGVeLWGVcCeQ6YZs1Xf9A+tgHv5CoBvyhgsdgJH3fat/FSnHFBWTzykU6LV1/mIU/wJGJaRzMagd+1RnWgpnizIldiFfOPItWulVKZl6u2cu7MzZcQI1Zyba9E7AOiaVvmhDKpysC2YA5qPG5Vw1QUPj+qeDhNO1lyma4pkO+gi95Y30u7i40n/FhXK03dnkqkD6XsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773640482; c=relaxed/relaxed;
	bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEuVKGBykTYAQWN299+JH6iwvsrFy9X3wfOH+XfxLFKTvgwjQV0qhbBCPKG4G3Gik/eVNgaZMuMO3ADGzYxmApcQ9Kgwpsk8WpAbGfcEQ+SjO+l59kHrCMZq8P8uVCewl9ovesuID+PfJZu+AUUoA1AfBhyQQtxJn9c9j7VYw2LlcN2DJiuvf/9eQeqWFRTCZf7zc7m04aGGAu+AyO6GESHIKOodXDLY65N2nww+sL3nvYbiRrd3dgolsz0Pu9ThdKbpZHsGDfDPtOpi5QXhCOo59dEY6H847H5ZuoaTKUEHsxt1TMQR+CO5unWPWcWIfIeIAwOgF/nPtp74Ejws7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BrQxFfgo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BrQxFfgo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ46n2sVdz2xlP
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:54:41 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so672947a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 15 Mar 2026 22:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640479; x=1774245279; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=;
        b=BrQxFfgo1UwHIeAzIrGhTT8UVNB7WANMf05XQvWSMKgLrI01VGTtGVnEQWZj5W3VRu
         UkEQ2oT3UOqQezXM+RERPlnAqTVI/ImEk2fpbhlKHRsFu2dFIOVIhaZTSH+3KsmgisvN
         5+MCoKmRqretGV1Eq+tHnbgUfhR/YdsJAKwa43rtt22JxmSqK5fXVZPMfDHrIpabyyaZ
         /aR91E3m5E8aCPcVhUFDoAjP76iM4XCki2LWqSAEbrC660RU7SawmRiZ5tB5jTKFL2sc
         9UZPYrhfvXIl5p4JO9uyeFMg8G4u/A2uxAs8qXCD1BouTsW/jB8ztBYSH0sudvBErxHH
         axkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640479; x=1774245279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=;
        b=KALtfyceGlRZv504yz5TA++jK9BehC7/soMig8dAPHcpukTWKE1lnoZ8wyJlTJbi4n
         9mywtRF+GKrQbWdOJ55CC3SaDf2YpOOmjMpZos7K1ov0ZX+azSs/nAekyhFrrFYs7slS
         ZmyDXP7p12yyMBDKZK1vueA1+qJDN6ncTWPHozM1KqBjtdTcF+de5LkxmJaHxBthDKFu
         WV+9QxpRS/eEiZApWIZcricHFlvp4+PYeBo6bYDh+9VTSYr1+XcvAMnYOXU5ZPGeGX4p
         XUz/vV7mvaR1A/82JXHP2xUOQ3Pt7JftxD+wmrXaA+FmnWYLuWKpH42c5hORkr+TAFwB
         EssA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1ZAi4hyhVoJgfb7k2lITjXa5/1Kpbtlr1Z8L2OYzXXvfplRSCn1zI1ef46WKnZTRc1kVALIE@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVOIZknivtkDagqBQhPn8pkX0KQInIQteIV2K/gTu5Mj4w3qgK
	VOqi+fIs2eaPVrk6tYGz4OIRSQYoDmHJTqxF91OYx8OMWQ5bOHzUlhi6
X-Gm-Gg: ATEYQzyUi912O6PNWSNj/IhsjRt5IkjvK/V7AwK+CxyCIEcxxbHpl+eBoxljuH9AJRt
	rHPvoHbAJ9xwIA/P+wmqMcSE204M3+gKTaHmc44piy76weq4yKJUtciTwIOHqJvrWD8klvnPpH8
	mJNocimKdWmsKCmz5yQmxbe8KO2/gLtrz+PXR3tX9J1ET7+QZKddr2wku2v3d+F4Ks4HIOgtBSN
	mCwO3fYjEz+T1CKIqXq9PGC/YZ8nwFl0kKw+6bDHpaRyVvSP/nar6vE3lS7dbC6QNfL2+x1Bw02
	fwsTWg1a0OB+jByl3v2JY1KhLVaVvwOiwEO0c4P3+dkViOBhjehPWfmIvWWJtYfuTJL3vefug1h
	yMKzDP9H2CjS4KYjPzdjRFkV+psyydezZLikYu2Egqgi4x+ZTn8gWidapZqDfLcrFR2EAxmv8dE
	hEo3iu/4wLDADQedz1E6S0JQ3sBhtL7wNGjbwCV9XC0Y4IwAIo2weQe1zyz1ku3OG3GzWIGkfml
	g/FclM2OWAI
X-Received: by 2002:a17:90b:4a47:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35a21f007ccmr10901351a91.2.1773640479016;
        Sun, 15 Mar 2026 22:54:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:38 -0700 (PDT)
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
Subject: [PATCH net-next v14 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 16 Mar 2026 13:54:25 +0800
Message-ID: <20260316055427.1310569-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316055427.1310569-1-a0987203069@gmail.com>
References: <20260316055427.1310569-1-a0987203069@gmail.com>
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
index 38bc34dc4f09..de04cbbab0c6 100644
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


