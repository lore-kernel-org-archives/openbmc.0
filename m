Return-Path: <openbmc+bounces-2075-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C7ACD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 12:19:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb4ZF0skDz3br2;
	Wed, 10 Jun 2026 22:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781093924;
	cv=none; b=Vv6R/yptiNkQc0glLY9D+p5mezTULFS8HnFlcJ3lJeBYc8Lkis6YnlKX/JPClLkg8Xk+0ozzKX/IbtUCUr3ZMENvQAnXVrHZlVUXyzhl4Vuel8Z8FvTtDHkqRLjnEn2WHW8QIKU7wObY8TT7E+orEpHv7Sxlr4Pu3XKezFybuUG1KkeRaq9jJ5vA+ydmsio7Az9+5ZA6z+r9bP6AhUf46JL97MZL0EqPt4jCyMU7tYHZGrDErtvEgqvz1ds5MPQ/JoBNQ2BGNPvrwdg1vY8JkBtmsm0LUssrj+Cy/TC46sQpGluf7NQIwqMitBxFKZ9HCw/4tNGfFJbOIRgh1cpiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781093924; c=relaxed/relaxed;
	bh=hVBJJGFYjcbuEOi6xjg9aXQreuuYV6xXp7Ov8MwZ6W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcFxuEhc0RWMirwVNzkmCdMHJbqJnzofjy7dgcb1J01pNVoCPLcPJX2clgMQWQJ0MdCSwA8jSu0liTQO6pualipqxZ5xLZX6qjEfYQJI6U4qxyIcOVkuFFO0cy5UFagmYmeAgS4vpAeJCmKY9b13euqe4cL4f4XyqUmw1UYFj6B2rSP7XfF4LIXWrr5L8NB7In5mMuQ7q7JJ7S4Xqbnj42UNfA7Hnhir3Bv5t6rUshuJUYsrUoZ/1pvxGWPxn17IHcRzZ6Gki3YuKyshUszkG3mfO2GkKSdLmAcAwxE3iyUeCJodqAlRj76LfTbBIAEI/K8H3X0AzhzOV9WtvV0Y6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F9zYeC4U; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F9zYeC4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb4ZC3QZHz3bpm
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 22:18:43 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so59393685e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093920; x=1781698720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVBJJGFYjcbuEOi6xjg9aXQreuuYV6xXp7Ov8MwZ6W0=;
        b=F9zYeC4UXAbFyXY/2Y8+K/AwjbM1o/itXsMf/T8S2t/2ZnqjhC833Wkd1oo4HzDdf/
         60Tl7xiDuNhQq78WavLjXyrQLa5FyUVhVJ+oXyegWWu6H0XPrEDc+ySgewEKf+SfaMkk
         EkH/smj/jdlViV1jUvDIendtQRYJrNvWcDUtKiQNVUpw60peEaZvpXfkQFZDl0C10ti9
         ZH+joIw1WNEWPxcUS4vCB0DYkPdwDX/TawrPz4z2g1M+MtQKVhWuwB67iy/1AE4Oux3J
         50k2iwN6O51PAwRE8oDdC/DXnIm+/xMdtaXHSJlpObdbNQDcBGtkwawOaTW2SM8v0euD
         F6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093920; x=1781698720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVBJJGFYjcbuEOi6xjg9aXQreuuYV6xXp7Ov8MwZ6W0=;
        b=l4TCmjy4+TQygwrvV3jcZVMS/Z4h4hRbkECGWx+tkMQyhT0yjbVQlYVn/Uun8GP5WQ
         htZVP3gJC8lUQ8GBm8yXeP1zvzGsCXcq3dDUMwNqch8uWd2/ubg1fk5YRS6i5bQy194K
         yEKnbrXuyhmX5RfFEan6WTWqRQv9qeOoNHeKuJFehwCKVLNiAKsM0FcEdNjqqjqpRLVZ
         gKlo6A6x/8h5ldvEbdE6djSQ/q0pqm5011pcgvw643jkvDn2lcb4qyZ9nDl64RBi/aga
         WlK7cVGV2VHlVxJLnNOwDYqoeDCA5ywr/REeoAS/IkM+pA5ydBESwXZoMLEKJbLD0Ggr
         4Y6A==
X-Gm-Message-State: AOJu0Yze/1Wa/cydUnoELftXrJReUwPrbNeI0pS2GW524kKiqmNw+MpJ
	JIyLM/ebokbkpKk5GrGuCTyhFJnOoQodU91TJU0lL0dC+LcIucAzWc92
X-Gm-Gg: Acq92OE+le+6scpAoPpoSnKgzQ6BVRS6h1NggsQOhocg1A0q+VKMYa6XOUwqOFTEQVy
	bYGtDuCR4EMZxN+TPrYx0fFuSduDpsEcxstdqCiEDt4lZ8tDg9yJc987yXbfvfcb2s32puePU+O
	71pdvD2ndzdpIwhk4PMpUrJ/vvclkMGGn6OJN6ATaA0YNuirXk1+vJS530vRS6lOU8nUTlcFzI5
	HM3cn6dQ/hFK/nw8cgPntHpIc5ubmiwjHdiohqW79PSXgSGhhNvxU8O5dM4sNjVJNb0YkgwZP8w
	DibYJe2yBuGpk9jc1QSjq6BebL6T+t8TKuPsR9kGhwEGLcHT2be5e29d5QAPovYqajnBQ6aeVqV
	3bRKGY0MrHGt6QGnsASksPxT2xF4xvmCbOzQnHrxNl4jC3lDNJVEH6+Z5speeJcM8t+LkYXxLy8
	OkUrZMBMl02Kqz923/yR4LctsPJXxx7wiMjBaRZTMNumzH
X-Received: by 2002:a05:600c:8519:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490c2d0e9a2mr302554865e9.13.1781093920430;
        Wed, 10 Jun 2026 05:18:40 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:40 -0700 (PDT)
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
	benjaminfair@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/3] spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema
Date: Wed, 10 Jun 2026 15:18:22 +0300
Message-Id: <20260610121822.2524634-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610121822.2524634-1-tmaimon77@gmail.com>
References: <20260610121822.2524634-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Convert the Nuvoton NPCM FIU binding to DT schema format.

Document the required control registers and the optional direct-
mapped flash window separately, matching the driver behavior
when the direct mapping is not described.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
 .../bindings/spi/nuvoton,npcm750-fiu.yaml     | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.=
txt
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm750-f=
iu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/D=
ocumentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
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
-  - nuvoton,spix-mode: enable spix-mode for an expansion bus to an ASIC or=
 CPLD.
-
-Aliases:
-- All the FIU controller nodes should be represented in the aliases node u=
sing
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
-	compatible =3D "nuvoton,npcm750-fiu";
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
-	reg =3D <0xfb000000 0x1000>, <0x80000000 0x10000000>;
-	reg-names =3D "control", "memory";
-	clocks =3D <&clk NPCM7XX_CLK_AHB>;
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&spi3_pins>;
-	flash@0 {
-			...
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml=
 b/Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml
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
+      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
+      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fiu1;
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-fiu # Poleg NPCM7XX
+      - nuvoton,npcm845-fiu # Arbel NPCM8XX
+
+  reg:
+    description:
+      The first resource is the FIU control register block. An optional se=
cond
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
+        compatible =3D "nuvoton,npcm750-fiu";
+        reg =3D <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+        reg-names =3D "control", "memory";
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        clocks =3D <&clk NPCM7XX_CLK_SPI0>;
+
+        flash@0 {
+            compatible =3D "jedec,spi-nor";
+            reg =3D <0>;
+            #address-cells =3D <1>;
+            #size-cells =3D <1>;
+        };
+    };
--=20
2.34.1


