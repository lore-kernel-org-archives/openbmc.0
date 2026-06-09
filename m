Return-Path: <openbmc+bounces-2060-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690ACCD8CB9
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 15:55:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZYQH0ZtKz3bqV;
	Wed, 10 Jun 2026 01:55:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781020502;
	cv=none; b=c8osqFOzcG058htgiCJHqfIB9PxpFejwhZXKj7mlcQn07Cwc8VQeTA8OxcknpatcnQxPLe1ZwT6NH2vKaQmLwPqmfC29hsmu0K4mKv26nK6wvWlNYzMESErmEG7b85nU12+MaFOf8tEJ1O15sonlvWMWcHjTpRHt+llR4zSE4X7XvLsguquqZ3YfQvuxT2wYgznrYnOPuZqiJ/m5sT4OCujtYkTrabOxZZQ5O7iOzbeeQI5SREut5kZkU1UZTZKKIsGuBnHUQFXNyXf6j5zuFhhVzT0DhlXsLiPSkciiZpuj2diiQwAExDS4q80bwFeOOUWGgeLYhlVnuWdHPkGbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781020502; c=relaxed/relaxed;
	bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NIua0ik1rXXptGLdvFSjG/4S1BtkM3wLx9EvwseeDU+UJ8+ijD8nPoQxYn9TD9qhxObmZNYhUE4Cziawy90lri037RmmceSsHSrM1GpUHA3K6q8tTlaTJBI0Q0KQP3Lr3imFQaunNBo1UbLb1fhrzc935URwKKjH9MzNiTo2DkIEL2zupTcah5ulGt4wcYx1tRW9oQNqUqCC+/21ytz09QCVQUpc7RGOQAOiTFisgk3EHsWnts/YrXjMM5krrkFeuH7semIcFjQOQ27wqagkbme5UdfasLECf17NcwDQBc1GA2tC2FLmEdcs2rzdqgP0tq5lnwiEUFAAGVs3R4ceTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GSjdc2rr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GSjdc2rr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZYQF3JVMz2xll
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 01:55:01 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490be03d47bso49598595e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020493; x=1781625293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
        b=GSjdc2rrHYNk6aus1Yhjg39QYtUyoPAKe8yL4yxHoLCzF/ue9E0NsSbMG9F+QuCoWu
         jwF3RAKQcwCG6iLl+3NnWHZC82TiU8+ig0pCYPLc2pdUOF8Di8egxI89huwqhjUV/b3N
         X33a4iBdEdHE42zvWVWpKIm7PnFjul7/LXjtXORRD8DyfUqHjnMr10iZYV1bVv1aEn6D
         y+ZwTuuoQvbEBvGCrEg8bhtx+3kdGJIiT2vdgkerEVuNy7G7GwNlAsL+0L45j/XkQX00
         1GkjcqtbwBDNa5mVbgCAa12rdfqoPEv4f8fH68LLlr/OzYyxtvTpqmzulqFuL0Ciqcmv
         YRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020493; x=1781625293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GareA3ERBAa/OnomNTiqG902TF5L3PgbbtUZ1LHV6tA=;
        b=Euatl/TVNC76SF0tYwEvt202XwToqnQ3zaZ5PKN2vWEv2S3Rn35iEIJvyJ6/2c+i+o
         w9PPo1ynhIztIMYIkuJ41MYBPtZpxZfSXr1EHzZ6f2x9plRRtwoO+Mbjw/l17VD+IWyi
         Kfiv/dhg3AEt2EWqQgQkZA/maDirhwuPG099NCrqdCdI9IOZXVZrSLRJ1xJoL96iEOTj
         h2F+1/GagWxZVAdqpg2dtfRONTTLKaOpIpQ5s3KFiCSSDpech/fEyvidRt8aty5LSU3M
         LR6xmQC/qlXVb7J8GC6UKhYvA4Ny/wAjuPimi4BktfxzN69iYZTjPcwyFsJaMl/ZBQSR
         M/lQ==
X-Gm-Message-State: AOJu0YwZXzbajAg0XX8M/AKnu642Z3O2fNKzgrb+zKT4vSOVQmHBBF1+
	5YOkoSWg/vN3zO7QRuSWDU0DG1ZuDUEr8FK01vneWUhT7BuYUG5jaY2X
X-Gm-Gg: Acq92OHDLNrL+X20zCwuGRRJW4TJVL3zVoJeqZ8vRuKngLL5JymJ5kGp54L4RWsPy7a
	82CWPzbRIRAOvhl3IDkEBC9WbaxN71z2Ut8jtNPTEPeqGEbn80bDceu3vneQveLsZ2QpWdFsPnj
	XbgwjSpjW2JTjXG4szFOsx12cJuOrybqBzC0iiT6kVDkhXz+Fif9POuwMvNYGkuhmcITBX1ifot
	2epwtFotWFf/Alkwhtsae/zZN/87d9TIlvE9XKny4NakwGSywyPzNk1gA+iW/zO5PfmD//3M8Dh
	VsBsMLLfjAXRw8O/YALtRnjBTzd+5gO/l3bJqmfQOUxe+9bqGqa6f4toTewgeWrP+mWhe0HdclI
	5WOAOm1e3iX3BQUMoxkvZ5vqJ97I1KUXk43fHCNbzZus/38wM6zZl9Z/oz4M20kIjkanKp9r3oB
	gy1zuJL46aHEX/LTFvwDW2dxuCwNU1Yf10NdcIwPj84tRg32Uqr+cTtnM=
X-Received: by 2002:a05:600c:1d27:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490c25e10f9mr354300715e9.20.1781020493455;
        Tue, 09 Jun 2026 08:54:53 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm545506645e9.11.2026.06.09.08.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:54:51 -0700 (PDT)
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
Subject: [PATCH v3 2/2] spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema
Date: Tue,  9 Jun 2026 18:54:37 +0300
Message-Id: <20260609155437.3285042-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609155437.3285042-1-tmaimon77@gmail.com>
References: <20260609155437.3285042-1-tmaimon77@gmail.com>
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


