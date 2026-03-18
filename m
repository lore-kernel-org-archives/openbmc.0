Return-Path: <openbmc+bounces-1626-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336DA1088E49
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:45:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkRP0NYVz2yrQ;
	Thu, 19 Mar 2026 09:44:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773862606;
	cv=none; b=dUq00GcvsBV0PjOGZOyrCYlHhIG3ScG3hN1ON0Ukd7rLVwxrP1zdAp5zRCG/UNn02FjkwRLMhKtWfk+QChcIhuzvKhX3UKXhWn6zK6S+SM4mHLTkzGoO9O0xJYv3BoioERV+adu7fRxR4NDpcjehVO5RzlKliCui+j6dzxw4pAANQENC2YLI91bKNpoICzmYnOBWARU14g4ZJZDlTpmNqTFT4by3fJkP17eDwgfL0AMJ1z+vDopbdM6l9l/o03yNdNFoJH5U+8L1Pq82AOYWN7XX+5ps2q8oO/4tSCCSMBQgHkxXE+M9xMBQ9RKJBG7SEQCVLk03K3f71hL+la0TzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773862606; c=relaxed/relaxed;
	bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYNZcknbTUd7fPS0y+W+pvvBjXXDb8ZYlBB5qt1hf93dEcSvIqRferPTKKRpeM5i8KDtThsQ3w8ZLiBl2HZMDDdZ7pctvxVtmrHMKzf8+koVJxkbMQBK1uvQ4/yhP239hw4C9GDuK+e6Rq/GTZxtvoG+i8Cm3SpVr1sKUMjIAewE+8tdGVkVxewyKDawNzSb3qRDuiHiBSTsGMV1bTX4mqtBeVcM5oxfx1uA5refrOQJEe1uYSagrX0By6j7Aba+c1nyALNyai1xhWEcv2jLI9IipyiHc+qX6/KLiQS9KCOqjJMcJezV/I07EnfWoKCzkQS/QAy4xvJa8QeuyCf5vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KQJ1JUtL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KQJ1JUtL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbfGP3t4kz2ynT
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 06:36:45 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35bb9070644so134597a91.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862603; x=1774467403; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=;
        b=KQJ1JUtLOQHrGVrjO11dwdZTpz/TUu1atIzccqNqvKCDrZJNshv8KTjo0xsSH4E5ME
         Ua3pd6p4gCKs8F/d5ZFIbjYDlvEfpohq5XK+iiOcWiVyUo1rQYgsQamfME247wO3MrUf
         kGey7a7JO4QMcnHUYEFlKh6junOoBqZeR793uNVjbFN6dFJl9SO3iuoQmjBxD+OQlpon
         FbVswRF/aFSzydEGBgKpjhbxXew+028k2cPG3QYLafOVeAnjAUltWVnGdqhqLsYSznuS
         p4tid1P0lKcTqPL1fvnrip1aJGANXBq52ydvwlRC6u0eGlTN7ebHzIDA01uwadvVl95A
         kmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862603; x=1774467403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=;
        b=IHkP2HZTOfn4zCz1SYnAXf8jjW6EMOqNPhQz9fa9xtGl9vd8GFUSdTeHWbL4tb+GvJ
         +G2azf6lrl4PF6AJsCAqHbZGEyWyVueZrhFPTXn9A/EF+PawXakLL3XORY9lhL7gCbIA
         ThqDL2qIwad2wIy+q0D8XC7P03RWTqG5rHGvQbo9PTnbbgHY4dFWy+O8Ho/2Slk4IFBH
         nHUnByA7xkW5JsgIXtF+11ez2bNihqNPZY2vq2c4Z7IJIP2d3pgnNpOXYBa7YndB2t63
         5Ooe2bZlQLRzBAJw+ZWuFifyyio2MnBDB25sC2AjNaPQ3DEE2Um8hZxGU/4DHE+fjVaY
         iHfw==
X-Forwarded-Encrypted: i=1; AJvYcCW+W5xdKgUYSrYKdVVDa0GSy5yXLtvK8fwyJ1/VYdm6vcQBEcB7toT+rn6Y19ewbLm/k6zUy77H@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqK/AmFyvOS85p9o/uG6VsGoJJan3HORIPlwq1hflmhHmnRes8
	Whrjspg8eiUhkQyMCBJKnVhD1xq/hnUQ9/FrFhR4IX3qqg01tsBX/2hn
X-Gm-Gg: ATEYQzzL7BpVO8dzc3Nl5iqL5pQDLeKAUNT9wbCvfWsHbr9KRkj81lo1ALOzRL2VGiI
	xGKoMTbQEjxyu7fq7PBUXh1PPKgnTCBDUkFehCPvjtVRc9hval9wpx9exeFKdV9RQOcPg0XzQI9
	8doBh10c73d1NXpFCy59x1FrBCcuphZVdGzxKm/z/a2sdjAbTQONf9r4eE/V5D/PKBXEps8g2Ds
	f3MmsCYBt7fYOfpQuxluF9fVcUYj8lsmf3qb1wLZeyRAqzA6qfB8Cg0mW5QwD4W6rEhZ9yXJcgu
	Ttu/Mhn/wwVdxDQaCZF2btXR4YVcHf76ADQm6vPtgBusy12u3vKj4GS0hDjlFnvkCbaUlm+XiGD
	FazHxkzT8ORBCjkILtKZ9zM88vyaqgj00FHYhnVPFIgdrjGIVNqAgiQqqIGgz0+xrOLdsFroDBL
	N8JXkzlTVSGrlP2bHhwQbsO4fIbD4d3zgq0lzrsP2FnbxIwParHo+uCmGpJ9ZRsi3yZr+YPqQtc
	/dL3nSqbHpU9ao3rR5wFBKDB9HMyQJ6j9wMMmM=
X-Received: by 2002:a17:90b:288c:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-35bb9f11b2cmr3546557a91.23.1773862603302;
        Wed, 18 Mar 2026 12:36:43 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:42 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: add nuvoton,npcm750-otp
Date: Wed, 18 Mar 2026 19:35:36 +0000
Message-ID: <20260318193538.246853-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
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

Add device tree bindings for the OTP memory controllers found on
Nuvoton NPCM7xx SoCs.

The NPCM7xx SoCs contain two independent OTP memory arrays:
- Key Storage (OTP1): used for cryptographic keys.
- Fuse Array (OTP2): used for hardware strapping, calibration data,
  and derivative definitions.

Each controller provides up to 1024 bytes of read-only storage.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../bindings/nvmem/nuvoton,npcm750-otp.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml b/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
new file mode 100644
index 000000000000..45bcf72d7c78
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nuvoton,npcm750-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx OTP (One-Time Programmable) Memory
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-key-storage
+      - nuvoton,npcm750-fuse-array
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    otp@f0189000 {
+        compatible = "nuvoton,npcm750-key-storage";
+        reg = <0xf0189000 0x1000>;
+    };
-- 
2.53.0.851.ga537e3e6e9-goog


