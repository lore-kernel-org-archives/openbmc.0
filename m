Return-Path: <openbmc+bounces-2065-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F5ACD8CB2
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 16:40:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZZPm6fZTz3brD;
	Wed, 10 Jun 2026 02:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781023180;
	cv=none; b=D+j4ia8DjF7mjWN8GgqhXLiquAIMoODEfkYyoayTvxmMQlDLsl0OIBwdtxbMR2hMCUvRn3dApjyuPjDnlx3ltQrEjVTSGiAAvjyGV4dS4H2w+Q/Ltdt7eyA5hHiEGpY1C5fyVHSmG3Ia/sY/jMZvItN59FSlcd0JjK14gfiLyXq8/+k06SCbqI7z7scClBO/arW4XiijWhkQyfkh5iWce9lMT5vJDAVFSEkhgmFg+RF5EfjxQtvqvIqjXmUt4iE1MoaX+jTblB6pI7mdR2/BaPpw31XJBtdzHOvx7jEMCxbSz8Ss0j0z4Zpcf09RycHBMfuuFWMuT2NoPFduBkNGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781023180; c=relaxed/relaxed;
	bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=STO2rumTTKN0HLmqTjoywAiIBABZYY9DO3kLdJvD9qUUoj/KFKNGxIBZiaeEt2uEocFd+vplh8v3G2BforWPKCcIbynkDp1MqatelZoOMtGZEOkNKZgWI59XhjrV4bNqrXTHSfjZsM39YQP6und8/exjyafM7yX/qr5pf+BLBxyAt4Bqsb7fxzd9zDGk6nttZzmqT7YRbHYBoI4cSo7u2sn66ybx0oN2SfVnRNHvdLJ1fuC2MiakUijzrl3DLfeeSp7sfdZEmsbnOmsM/wKuFvJUbGv4cy3Jgo6PN3ptzTIG/FK8E0LcKT1y8KICtab11XEfSfs9Nm8MKfw8xK9xzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VvEm24xE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VvEm24xE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZZPk4YYqz2ytV
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 02:39:38 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-460166910e6so3006761f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023175; x=1781627975; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
        b=VvEm24xElsufGfE80ZhL7wiieNckLcKPoi+aDMVAmUg5RGAY81ir1WC3YPI+9IU0WP
         OgTh3+Q57TqFGn96bg3l29ojrJVwpJXyNI1tWjQ/uNIc8AAZ8msds0IxTp+UONI5FqlA
         MOIBj9T6kmElf0VraqdOH4SdH0mdHg45D+AT0isRrryhkaUPHFCvJuC+WKXvVQdiaMCr
         +ADBKfngDptMf1VThsw1DmR5GCwhtHYYLeMMRBd+pVu9zg+dqcaLZ+zUA6Co6wxhRg4j
         uUbW5V+5PHKjxu+9ZkVeBEHHP5hoF/VIso8Q57WOeeOSjUsNgpOVfZmiakq610n0k317
         G7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023175; x=1781627975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
        b=WP1+N7Rs4Xt5DYnoszoGwSxIHnBIW6clcKp4byEPtHGTknrRiPPMfw9UJaCOec6Puh
         l7UFOflMnCeRQ9aNhk/VbTNU9NxKrhOJPwC8V/UBfwfAK4apUMV8iGEUui0VhOpLdtg6
         eheZuOkyN4ZrmZFOXyS1KkoEzIbMkRDIbQ1he+o31NwwkFtet9hjDVj92+D2A05az17G
         rlBF+R4ks5AjxCq5wFdrmt2qb2h9lq+vsoZJYvXRiV1vW17h30bAKTOCujkm6duFqQC5
         aev+hyEagPuCFmAUp+CA0NqmUcN06qRJCf1B0TAg9csjl50+UUO2PIS7B93ElnHIiH8j
         fsbQ==
X-Gm-Message-State: AOJu0YzwQnU0l3cRTRGrD/8FG/i7/r+Mst4eNJG1x4bmgdMMAkeEWSqe
	RhWX60SjHYa2/+ud4YLSzqAGqEQfrwEdd0g3wNieFWdZ6ZaU3xn/3axz
X-Gm-Gg: Acq92OH3+3ojoCRH+DQzmYYD0eWKTaamj6OUPYuUAB+cxRc5XWeOL7KGdeoRWkmfyNB
	KnPpuhg4BoUWViWzuxCLHjEGwWSAJN5vI0qOGx+gEEZZwLwNLzcxIhwbtYJN5mVQIBTCpd75F/5
	XtMhGF5vIQzpbX7PEGvkfgKU6o+67J9MY3B8wORIPqqn/Ym+DKKs6yyZhdLndN25UxpVtxP3H0G
	BHcH8fvovbRzQZ7InijnkFgzX6LO8T1E77q0LLv4D6mwVFybzp16nRV/McOw+pAKVwE4iIOOOWC
	vn16j+u6VgmxMxFHdAOFO8N2hrwkyAEN6kWTZANRSwApRaDpKM4Hv6IGOCjGBUZBJWrPI41zDeI
	eDANUJAUyMY3mDUoes6TzDFDJAFt5FJfecp7GxhInnkK7CsmTDv/9jmf7MpX4R2zwYdZN5rLidC
	i+ifYbuyqOB5yccoOrCOICb7qXOl8/dZxqHMGi3kwnudCd
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id 5b1f17b1804b1-490c2508a5emr376584805e9.0.1781023175374;
        Tue, 09 Jun 2026 09:39:35 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:34 -0700 (PDT)
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
Subject: [PATCH v4 3/3] spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema
Date: Tue,  9 Jun 2026 19:39:19 +0300
Message-Id: <20260609163919.3321228-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609163919.3321228-1-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
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

Document the required control registers and the optional direct-
mapped flash window separately, matching the driver behavior
when the direct mapping is not described.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm750-fiu.yaml     | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml

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
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml
new file mode 100644
index 000000000000..965904a98785
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,npcm750-fiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Flash Interface Unit (FIU) SPI Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
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
+  The FIU control register block is always required. The direct-mapped
+  flash window is optional because the controller can still access flash
+  through the UMA path when that mapping is not described.
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
+    description:
+      The first resource is the FIU control register block. An optional second
+      resource describes the direct-mapped flash window used for direct
+      read/write accesses.
+    minItems: 1
+    items:
+      - description: FIU control registers
+      - description: Memory-mapped flash contents
+
+  reg-names:
+    description:
+      Resource names for the control registers and optional direct-mapped
+      flash window.
+    minItems: 1
+    items:
+      - const: control
+      - const: memory
+
+  clocks:
+    maxItems: 1
+    description: FIU reference clock.
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
+        reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+        reg-names = "control", "memory";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk NPCM7XX_CLK_SPI0>;
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


