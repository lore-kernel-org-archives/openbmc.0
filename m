Return-Path: <openbmc+bounces-1347-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7386EEA8114
	for <openbmc@archiver.kernel.org>; Tue, 10 Feb 2026 13:39:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9N2F1pwkz30BR;
	Wed, 11 Feb 2026 00:39:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770730741;
	cv=none; b=TJFJ8gxGCigXjY4eMTnmGS7JyuaaolVXL98Nd7t5ahml0U9BYdE9jws/CBEuPkYx2arNr10rniAJOExZTAu6QFg/D5b0ChTz/9E/hzPiHG/lf0tVy2wp/JgL2OchEcdLlxH1Zhvvp8gtjNaCF4/MDR+0ypZ0sqZd5la0pR9DUHrr5oE15T/wIjWiPPZi6NvmpMgmZ8yHDONQJBdt/GOr69u0iUStg2QBYXU0GnJ5kMpzrIsSLekdjxesVOKbe0LuIiDLawfgoxHuSilJIUvZrgNEPAbKxJiCnuQ3RfgFH3YQKsob4yYz60e1wbQkN/Jix/53Zcal/tK3khLqWj6xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770730741; c=relaxed/relaxed;
	bh=iODKpq8SiTOJupDlKbF2WoG4lC9wFyKPKfQ6o0K08dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AcfcXjxiHxa8X7Lhf+EalFh0i3eaDJJ3v+pwiB7J+pm/8ERznBnHeMwjzAbLWfyV6k1tB4HFR4MlBZ+VZkT5LWULmxWeMic8hGkhhwsLxo6v9GRoZ+qK0j9BCxtpONZmUgx+H5eaizU2KPoMqeE3//1zLmL604JaFf2ioH0NDvWbGLsP907R58syA3gnktFky/nHVkMW5ZD9JhrYj4HllQzAm7Nb9x4woJyoYlHDusGph3vN04ChLSxlajGVjxAzDSSvHmBVrAvdv4gGxJx3LYh+9WOj5myOjbqVbYz0yXW6NqGMz0jMbBaRjblV44HwpgOqV5ZVswHLhueYCb1EKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VJ6j1KaR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VJ6j1KaR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9N2D1ztKz2xQ1
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 00:39:00 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so53669995e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730737; x=1771335537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iODKpq8SiTOJupDlKbF2WoG4lC9wFyKPKfQ6o0K08dg=;
        b=VJ6j1KaRFE3sgnUJiaOxA/LJmB3Z84bbNEz6Bbp6z71BHisu3ZLhPKZCKUOG+ZWEvq
         OmaxFkkTGsnlR5i9jTBzlryqJL6ZpdzoFCIT86eE8gBoZ/S56jv2lXzQqwTP984LDiM7
         pl0F0o7CnA3WZ+ikw4q3887upke7/1iC4VNO5wqmZu+NwblXjvKVU/NEMIkNU8pAwfNT
         gZoHJGGVRwQb6OUeAT2Migs4BlnWf2w6K3WDwEJYSrsPt66DiVVmGT27wgnLH2TTkVuO
         R1UWk/wHZZycA6mbPgW7O86Ns+H+CLxvS79IyFrMXmY5+gbkAGcsmcVD2UHbEK6qxQqL
         PWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730737; x=1771335537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iODKpq8SiTOJupDlKbF2WoG4lC9wFyKPKfQ6o0K08dg=;
        b=F3vsgV98hiONAKRBVy4gef9Qyjk7xU+7kqouOUbTxUxq+klXNp0D4BqGyI3EEfms5k
         t0RxV6l8JnsSPZnnqFV4Ggwurd5KuvK4uut4bIIEQgdMnGVZbn1YD+ZqTr0Khh412pnB
         WakwL6ggvekWiusWBc4N0dF7Dmc3EE0gn1qHc/LJhrgc8YXtAcXF0wuvfDj8INtEJmlu
         V99Af6+uzVg6FqItgU4rFblhXWrjIhyFgG/HbUyQB+4UaSmcUCQD8GPeBgv1XA5mRrP4
         oqBB1jd//d4sPizYkRSkW6HE2pvRfmuTkpftTkWq90wRRX+nOCNPZ5l1vrd4hyECTQ5K
         SXig==
X-Forwarded-Encrypted: i=1; AJvYcCUl/zeFKWZyVQtjYrRl7p+FTlnmUzMbkqppjUBErv6rvCyu8gVrRTCj/NFHCKy3eb5QTfABjfc5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBLw2q2i90//EqcpGXsbyHpuqlCKHLU1+cA1NH+sktts9uxbtn
	Qe0VpeL2F44Lo7PPdSNWmkK60sNEvbeQydxlHoZX8BjfPO/sOayi/Uds
X-Gm-Gg: AZuq6aL7yT+VzUNrZOVuZYq/v0UCJ9KtmfhLxvJGGOs7gM2SycO3C5dGjfCpW35QD6R
	GJim3HC9uLlPVX3J4Za/zI2HT6u2My0AR0muIEMmAUEpsqk0SqcL6SPhFr4IH8ABXleFFw1W0Mh
	byCZonyrvUpXox3pbbYZsHQ8GP11cIm4ip4giC4BHwgKzbhLD88I+5hFfoKDST9t70QJVDdAn/z
	9g1CMsTUTisubqD/3k58REsgAhPET4uaAYpHhaauGhMP8xkbTVkjfwCAr+PmmvDu2Ev3oyf0jJE
	rMCcSYBXIdEYGZaj6OlVpa3xJNLrJOSSTbdHSrbDOPrLhXempPX6IIHqAFYAs9eRL0VLStE/88Y
	A5wBg7t4DuMeYWMm/xFGBjnstQuyjnpM9mY6/CeaS6JiRF0eY/hqr965J7KXVQVQpLG79VArhcw
	l9UPRbbDgMxjc8tabl5shPONqOifC+b8w1hw==
X-Received: by 2002:a05:600c:3e1a:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483505116camr34660955e9.6.1770730737018;
        Tue, 10 Feb 2026 05:38:57 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:56 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
Date: Tue, 10 Feb 2026 15:38:42 +0200
Message-Id: <20260210133843.1078463-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210133843.1078463-1-tmaimon77@gmail.com>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
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

Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
integration. Document syscon property and three configurable reset type
properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
nuvoton,ext2-reset-type)that map reset signal detection to specific
reset bit positions.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..054cc0115af2 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -12,7 +12,7 @@ maintainers:
 description:
   Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
   The watchdog supports a pre-timeout interrupt that fires 10ms before the
-  expiry.
+  expiry and reset status detection via syscon integration.
 
 allOf:
   - $ref: watchdog.yaml#
@@ -40,12 +40,55 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  syscon:
+    description: phandle to the Global Control Register (GCR) syscon node.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nuvoton,card-reset-type:
+    description: Reset type for external card reset signal detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
+  nuvoton,ext1-reset-type:
+    description: Reset type for external reset signal 1 detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
+  nuvoton,ext2-reset-type:
+    description: Reset type for external reset signal 2 detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
 required:
   - compatible
   - reg
   - interrupts
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
@@ -57,4 +100,8 @@ examples:
         interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
         reg = <0xf000801c 0x4>;
         clocks = <&clk NPCM7XX_CLK_TIMER>;
+        syscon = <&gcr>;
+        nuvoton,card-reset-type = "porst";
+        nuvoton,ext1-reset-type = "wd0";
+        nuvoton,ext2-reset-type = "wd2";
     };
-- 
2.34.1


