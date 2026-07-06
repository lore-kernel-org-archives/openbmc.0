Return-Path: <openbmc+bounces-2218-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8EFC43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 14:48:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv6gF6fgpz3bqV;
	Tue, 07 Jul 2026 00:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783349321;
	cv=none; b=kv+GnZ1X5j7Wx4VbxcpWA+2M2G/cYNh3FjLUqgECR93RLwmvPXWazmWSItEUPftQmNzBXCzrP9FluH0qHspjoEiMEKilXtUd/OYYM9yVdt1lvQRMP4woXMeOb9Qt/YPsFaQRBJ8HAbqtpN8yF3fpyHldoaWRR87fiw9xz2j3oWi9k83oT2S5AIUd+WgNfdZigL1HO+J0IK4IcEsv2d7Q6rrOMH923Brh6SeAnQ7v/nSNrqK6UG5slNdRl3k69ScY02oV3v/pjbGBnqwv3GQTHqdlVVUvBikQtnuq935VKYec3rdcBI6VMtKmgpRc0h63oOKZaH6ElWbASXvMA9j6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783349321; c=relaxed/relaxed;
	bh=jqvnsBC1QnHy0BgYcjusDNjgJMCaD3QUZ4+Za8Z0104=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ftGSSXalhN/STXwCA7M7yevzFzqsrNps6ceb5j59N7Dg4Lbfop7NSlcbhcBtwRGpLnTvD/KIhuMf0G49/2kaJDNf0nt7pgg7nlZR1G87kIn5K7TqmnQGYuwVtGVhPCbWXjNRLH4U725hIKJfCykn4LCcex8BUFvUpFEejirVwNUf5137v7m4BBwuz9L1mK8/sFl0C3hsgDkI4X/o1+DfAyeDGHPFYI0pat1IbKO0LtsMjXwGqdpmycE0RnP/vLRQwVoVIz74gY3L3LPwSx45PADLexPC7fbDt81EPhFpMCgkmx8bIK+jrKmiHFXlyaLmtZ5PvJkp72uxZkV75/FnJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RSU0orbu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RSU0orbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv6gD3nn1z3bby
	for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 00:48:40 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47de0093c42so1237671f8f.3
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349317; x=1783954117; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqvnsBC1QnHy0BgYcjusDNjgJMCaD3QUZ4+Za8Z0104=;
        b=RSU0orbuBm0yLE+4VJkdRQMNS70NPVU4SgvQ+xu/rox8f1ZNLXPme7srSwQ3/MzTJE
         u39I5z0L4VBbmJNMJ5OMgg/6ZQa3HQNQ1Ytc7VimmS4z2/oYsk91EuvjzSPIlbH5LIpk
         pw/rHYIqIkcGh8upxxxMY3XQoA0J930OukLmiiucG+JG225+v9rFW9xzW8iQnjoHq18T
         OBaqifLPuvK7B9ZX6HjVCYRHqRwtCKwq2W4gk6oneV+qdD9f6IEamEWFMYUvanD9aqoh
         Fo1tlAURTozqo1eK7N+HIkobqX8a2ERS2e5/lPn7Qgn0MhsxNssmNmpL8nTr2cnmlyVe
         REMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349317; x=1783954117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqvnsBC1QnHy0BgYcjusDNjgJMCaD3QUZ4+Za8Z0104=;
        b=LAXYaCcW4KTEkyWffJ0qyV5294b9NRSS9Rt/Vwl87MtlCF6hp5BKRg79YuoN25SbA7
         DjIL45DoPiP3r5TUv7KbhtGfUwx1d0zlymDCFU5eq31nbSH93t+tDRYN9mzUQRDFgXuo
         /a7v+X5smmE/fdOnQUZoml4D9/DwqFwC0hz9tJtB7ZcwLb83kWLCYIkEgE8cHMECGy/8
         Hfhh94ViLMHV7gcXg8VKGCrCdTf0Gw4WCnLC7c8+HtUr+0EblCTzYEIZexHt7lrxpbY1
         GDRLBe8KBrItm41RzWZdK7mOd9EY3ZVHKNQYnqDY+oSbMACP+ODGpivZsqvLkQpmR2e2
         XKew==
X-Gm-Message-State: AOJu0Yxo4JbRFJK7AOc7r67L6lGStJcQAOfy070ELwvyT46UqbBOGYZU
	xScSdXSE5UV8p4Zn+t5E1uLoeFrzudoTOW3yIuQ8xHLuzfY/9Ky4FZVN
X-Gm-Gg: AfdE7ck6jjKd83/1BEjcKRu6pR0D6CG8f4vNIhoqMHd2nufaqh1lmemOvNlw7sjhPQz
	ISXn2T0zWa63yLxpBopu7Z5gNhwjp+NbOzLCMrjcCe5NYK6rfSvH7K2Rw44WinMJ/ZQ6CQDDgGo
	YePMzAmFz0Y7+T5b5+PHyv+INln5LXMiq/FiBkZmN5FwdCF4Xs8uLhp/V1gZRUAhgxFibkQWzwk
	GuSTuyLP9UdADKnGEvXqV9rNBbT4wjI1JX4uBaOOkaMJFk0Irm0DzMj+uRpRo/LtnS5gqo2GE1D
	coA6gUDjdflA2E6j9cPCaMA3s/TrI483W/nVLhCrg9Q8jKcWeR/lx7TQTix+dWlZFJHscbZhHax
	C0Det7ZOyje4u4Reml/gmxecqt6F0fXlo8LSRGF+wIg0tdYSXAIBPaJ2i4+2Zw4LhCfom1XACsY
	3CslaINZt0WKoytSe/eXmqNe7lCXKA4KYHBg==
X-Received: by 2002:a05:6000:186e:b0:476:d52b:b85 with SMTP id ffacd0b85a97d-47de6695ff5mr680196f8f.16.1783349317101;
        Mon, 06 Jul 2026 07:48:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:36 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Mon,  6 Jul 2026 17:48:26 +0300
Message-Id: <20260706144828.3517631-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
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

NPCM750 and NPCM845 latch watchdog reset indications in the SoC
GCR block rather than in the watchdog block itself.

Add the optional nuvoton,sysgcr phandle so watchdog nodes can
reference the shared GCR reset-status registers that hold those
latched watchdog reset indications.

This is needed by the following reset-status support, which reads
those latches and reports watchdog-caused resets through bootstatus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/watchdog/nuvoton,npcm750-wdt.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..81269fdc81a5 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -16,6 +16,14 @@ description:
 
 allOf:
   - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,wpcm450-wdt
+    then:
+      properties:
+        nuvoton,sysgcr: false
 
 properties:
   compatible:
@@ -40,6 +48,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access the GCR reset-status registers that latch
+      watchdog reset indications on NPCM750 and NPCM845.
+
 required:
   - compatible
   - reg
-- 
2.34.1


