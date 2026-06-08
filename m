Return-Path: <openbmc+bounces-2052-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71838CD8C9D
	for <openbmc@archiver.kernel.org>; Mon,  8 Jun 2026 17:55:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZ06t5VXkz3bqD;
	Tue, 09 Jun 2026 03:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780941286;
	cv=none; b=kdHziu16z1Bqu9+AYV8Iti58Hu2pRPtEDEh7xcdQLyA5CqvOxLmpX6KZcZJdwW9H9oaRIpGhE0lsZ6WNksFkJEOqjahQ+HGhfJhQpt+jmDCdSyvEVMZ/pmZPfElF/lmG0dmsmJdq8qDTwhCbCqSkPviuq7QGSOmji6Xz5zLZdzkeIXpqs7ud4Rpnvgr5ovtFp53G9PwcczJHt3TreIzu42llk4Eie8Zkum6erdzZTEKj8rBUXMqBHhWjzQTis7fuz/FrZkKnmkEmVflmmGlw29oGBM2vTgx3wvzpdSurgt0Iy7xD52twV5GXR+CLwkCdPCdwUnyDj6SqDNbZIUnNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780941286; c=relaxed/relaxed;
	bh=yQnDKAgbConHDQBUycm84vQeAcwqNLay1jFwOQCu2Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYEtvmybLBIzzFVS0JrsiDEdgkjLjko6mtwLWpECsQzJ7Q7CC1HLygLUqQBJAaIkxBuNCSZpx4T9hDcnXn9vcngig2PgdoRF4Oh7q71IgwQsjGUrT3C5Mq7hYe9K2UqTAq3fT+CqxRie541gFmTG32E2UPzYb38CcLONY8yl0ybmARbMpMTb9YyNUtl2N1c1/+QRBBLUFuYj/IBKJKo3D3bamP5UsGhh/uoJTgjN6teoZv+Yu3dqOejn9KPQuKq5OxKEkGKIhO5dOIAdl6vUDMxtMp6bdDoH513dOB9a+/1iT+O9PcEmyPFePKkaCLqluFMpNkvAxo3nmHi3OzcHlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mZdABmox; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mZdABmox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZ06s3183z2yS4
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 03:54:45 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3111855f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2026 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941282; x=1781546082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQnDKAgbConHDQBUycm84vQeAcwqNLay1jFwOQCu2Sg=;
        b=mZdABmox9qu4FV2NspntLsJ0UPaPFSLAn6ASDgIf+plZkbIA29K+GNZ/C6uQ5lnj+P
         Un9vGOZBYDH4pRHr07lr3OZpBHPIFgZjpKahs1RrAcljwyx302Ts8JZeFuhYQj40mtOe
         m+xUwUG9w5bAVikevtdkBEMxmXq634OU4Nf5z5U7lWdC9VoamIVgGz4wiJcWHfTsUcrv
         pcOlvDq45J5NGWK/QgkklXPW5RASF5Llag+3vCQf4KsroUCm4oBN6jrM85SZBtEVo4k5
         hbJ4W/n+chUIrSb9R70HzcSh22vPqscA7WgGWOlMzdhSdSCbFz2x8YSBkSF3bA98uvac
         KrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941282; x=1781546082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQnDKAgbConHDQBUycm84vQeAcwqNLay1jFwOQCu2Sg=;
        b=O1g4KEMwMBa9l5+ZCh4VI2Q1cpQlNGfmJdhy5IoL13nCAW8cdPbETXo97iQ0soahom
         hJWdGJLWU35om2HZuPXUACF75m8rlMlo3CvOaoVkA9txhb45+RPs9xI1F4FENS4NMQ4/
         ogm3SKOjwOP6xikOQO+cUhtAm3gC6nMKDbgEdB7P4LjCoxqKboeldHL6JNBOtGPhZ9G6
         vCP2bDV2uIsSpwKAkSCb1lV5mUXPo6dnO7zX2H7bS9NX0/wBStNYHyrB1JNnfv6/XNWs
         UNrefTNOjHG/UkyiBcPW2Qsl9yRXRq+vqRPjbBN86o3MC8cflh1dO7nVmbOi7QySAuug
         eYzA==
X-Gm-Message-State: AOJu0YzqLHF5nbG+YK2Uy2AlHqVRDv9wS6h2Bl6aEBBumoIDMedwk5Ao
	3aY/NwdbuUWHIDx+lI0Al9D4c7y/+HjaMcJbDxgc2Kq2dPzYjddRiGF/
X-Gm-Gg: Acq92OEQVsIMqm9CQAqtyzRXYCnkQeEyMCTwxVHjEoQH78TWHG6Wgi8P8uqN2BrO1Ys
	rXis0WmM5DyLN5nh+CXr4sst0og8bj4v0FkD2gCYQOhX5TgJ8xrDhg3biXm7ZKbSJMTJNCYz5m4
	kIteJEUKqnVGjXtDGifwoviuAWAJWCmpKQD0kfm6CrnMl73vMA7NIJm5ewRWqid0wOt/PyFvWJb
	6mDQpLS0CDevIsQY5dGd0nk4UE6MdAnb7ZwwwkxCf3fPpxOir6w9iW0LZBMO/tn0UAOpGjUiwCC
	NXbQSMDUZBnZU5AziaBhndfJFRQyMiKGgV4vXuiLYB5wbVzbds9yojoVvWi9ProfolVCqjvvgLC
	EB3rA8xg73FJteYqi8+mn7jtvwGLPw87YGTjzHxUz7d/XROS8JZ1oJs8iK1hj1fMmexsR7ZI2gl
	bVKYaFvYGPQb2Uri1yYYs2ggdbfhuGPagVLu+hPhfR/ZGdyG/whsVir/E=
X-Received: by 2002:a05:6000:46cd:b0:460:1492:4f0d with SMTP id ffacd0b85a97d-4603063c591mr16901396f8f.34.1780941282010;
        Mon, 08 Jun 2026 10:54:42 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm56269275f8f.28.2026.06.08.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:41 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema
Date: Mon,  8 Jun 2026 20:54:18 +0300
Message-Id: <20260608175418.1936892-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175418.1936892-1-tmaimon77@gmail.com>
References: <20260608175418.1936892-1-tmaimon77@gmail.com>
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

Convert the Nuvoton NPCM FIU binding to DT schema format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm-fiu.yaml        | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
deleted file mode 100644
index fb38e96d395f..000000000000
--- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Nuvoton FLASH Interface Unit (FIU) SPI Controller
-
-NPCM FIU supports single, dual and quad communication interface.
-
-The NPCM7XX supports three FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU3 support four chip select.
-
-The NPCM8XX supports four FIU modules,
-FIU0 and FIUx supports two chip selects,
-FIU1 and FIU3 supports four chip selects.
-
-Required properties:
-  - compatible : "nuvoton,npcm750-fiu" for Poleg NPCM7XX BMC
-			     "nuvoton,npcm845-fiu" for Arbel NPCM8XX BMC
-  - #address-cells : should be 1.
-  - #size-cells : should be 0.
-  - reg : the first contains the register location and length,
-          the second contains the memory mapping address and length
-  - reg-names: Should contain the reg names "control" and "memory"
-  - clocks : phandle of FIU reference clock.
-
-Required properties in case the pins can be muxed:
-  - pinctrl-names : a pinctrl state named "default" must be defined.
-  - pinctrl-0 : phandle referencing pin configuration of the device.
-
-Optional property:
-  - nuvoton,spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
-
-Aliases:
-- All the FIU controller nodes should be represented in the aliases node using
-  the following format 'fiu{n}' where n is a unique number for the alias.
-  In the NPCM7XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 3 controller
-  		fiu2 represent fiu x controller
-
-  In the NPCM8XX BMC:
-  		fiu0 represent fiu 0 controller
-  		fiu1 represent fiu 1 controller
-  		fiu2 represent fiu 3 controller
-  		fiu3 represent fiu x controller
-
-Example:
-fiu3: spi@c00000000 {
-	compatible = "nuvoton,npcm750-fiu";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
-	reg-names = "control", "memory";
-	clocks = <&clk NPCM7XX_CLK_AHB>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi3_pins>;
-	flash@0 {
-			...
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
new file mode 100644
index 000000000000..0f95def01910
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,npcm-fiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Flash Interface Unit (FIU) SPI Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+description: |
+  NPCM FIU supports single, dual and quad communication interface.
+
+  The NPCM7XX supports three FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU3 supports four chip selects.
+
+  The NPCM8XX supports four FIU modules:
+    FIU0 and FIUx support two chip selects
+    FIU1 and FIU3 support four chip selects.
+
+  Alias convention:
+    The '/aliases' node should define:
+      For NPCM7xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux;
+      For NPCM8xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux; fiu3=&fiu1;
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-fiu # Poleg NPCM7XX
+      - nuvoton,npcm845-fiu # Arbel NPCM8XX
+
+  reg:
+    minItems: 1
+    items:
+      - description: FIU registers
+      - description: Memory-mapped flash contents (optional)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: control
+      - const: memory
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - enum:
+          - clk_spi0
+          - clk_spi1
+          - clk_spi3
+          - clk_spix
+
+  nuvoton,spix-mode:
+    type: boolean
+    description: Enable SPIX mode for an expansion bus to an ASIC or CPLD.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    spi@fb000000 {
+        compatible = "nuvoton,npcm750-fiu";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+        reg-names = "control", "memory";
+        clocks = <&clk NPCM7XX_CLK_AHB>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&spi3_pins>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+        };
+    };
-- 
2.34.1


