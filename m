Return-Path: <openbmc+bounces-2118-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1759ACDB46B
	for <openbmc@archiver.kernel.org>; Mon, 22 Jun 2026 08:31:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkLy95FJlz2yYK;
	Mon, 22 Jun 2026 18:31:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782117073;
	cv=none; b=BCY31ttyglUiCMURvIhKVzvw5+U0BbYxVMPL4k0aAxFWAqWPH8UW4WOSxowlRd2IhaM1JALEiz9xngepXNra3XFHvH9j63GBuaGW8S7vQ/G+IcUbQzghDeoZdgYG7BP/BsPErZS3ia8ws8BfWcwRqYcFKuaJT7HjAVxKlmDt2bQ+q0ryOHkFQV7lK8llI56HX/yvWFeOshyqzYhxIQIaraTQ6wAeYmooWC/ahdpkTyNX+S0QSkupu+ZQrxo8NB7XhMCQwu+LA1N5xBim7s9IR1oSWE6sgAcHEqkjquxT22i19GAvEOOams1AIToFeS3x681YwKQSBCLLsj9VCj2r/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782117073; c=relaxed/relaxed;
	bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCu3vRpuo8malXOi1QBoYT/WXqOKqSEahnkhoOnOfnjaVamQghXjE5WHUPmuGlov45F5uu3YC65cZTLokn6zno5Fk78c83Rfd8E+jm5pv9gryfDO3VCzhGBgHIkisdU0rlSgSBgEYgCGLhdkz8RyLgIUcQiq9/XSTiHdTiMFfD3kyU9l4Xxf89xUEndPUxXpcdWoXgrgIXL9+0TGawJWmql+WWd8ImwuBc6Qg375nZNVpYLSbMT798bM0NOfBvV6Wd13HTly////en0YsBmIumbNlCBBwTzq16gW9yXEwtW3JOEciScku5F64qPajzO4g5GGM9rCvxksoMaxFMR0jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gP0bir0O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gP0bir0O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkLy854x1z2xPL
	for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 18:31:12 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49258ac7294so266305e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117070; x=1782721870; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=gP0bir0OJbPHzLFEXlpDSKJUWZt646mre4ul2Y1M8fV5KUMM2cAt70mm5+EiSgCn/w
         Fl9ThSPqzjrf2+sxLoX5DocXGg5V9pi5GQAEYcTQrFolpHfqG1sKC7RCp+RisEa3TaVP
         J4yFvpQ7pQuBQaqPF0n52r+wx3GM1MfbKwAanq7gowHuyQ1PSkw+Gam+mVuo3laPid5r
         591L1/SaMOVd+2iUl+eQFY7FkIj5w5lL9/G+hZbc1ytBPIhjwmcM/Jny8wsE/l/b/CF5
         sZxfWZzsKJ2GWEF7k5euoaTbWWK3bnH0CW+uTTWOqluaL4xOQLV2Y+/scpUxvORTsYXI
         HQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117070; x=1782721870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=ih/Etyj8vagkzTzlqAWlJTJGvouf6KI4CmU7wZ/K1tMni9/c8n317LY+CMqWpiYtW9
         XtqRnfMO3Vcfkd46nq3ARu1UWDW13+l48Bqd7iEuMvcsm4zFC6oU/jU8lclLYfYRTArI
         wrz3ZcL9uVlwzk/MbX6RU3PhKcYXb/24JQKH3g8Fxfc2SOvQ+AuQxfGQhomvi3ABt9Gt
         WwNDfDkQJRIIwYrkOyw61Ybg85Y6fLn+JYPI2+l+YbR7pIHKShQskQ9WvHdx+8HC7cpx
         hneHPGQcct14Fdc/iH7CxXrMKhXYbpd0PvewKf5rdgCYUpYQFYWkky3eN2J3h6qnkirG
         mVbA==
X-Gm-Message-State: AOJu0YxCGb6NLc4yG7m1VLAOGCjVg7z3URYkIPM4YEcSH6dFJFxIxJJb
	0/cB98cGjL2CEpAzrE0tS2onPdCM5cxcDn0nXGbCMTSGFdTtfF5lboBO
X-Gm-Gg: AfdE7clynFzbjxKaD22JFvHG49Dv7Q66zAv4QsVHCyTsLDGVSh8A7bNJbxKBvP/AQJa
	yT493ZcNuRiUCPqOM7rZpyky7sSLdJPsPkBP1v1KWDrlEw+/2qUasyIrVr/kKYD5u3qEXPo9+ln
	fKnMFG/dWTM3t7afyrzPYRvA6Jom/DLsrOxeZDn2wocKoYNPzraj+3mOXvd20uweZPRQMm/ESTr
	Maz9uskRRebX5piPFHjozIlakWn/bn1ldzaiDkU1NbDZ3S9m6U4y20jbCOLtxkKf87xaSTiDzbY
	8/raAJ2foPX3J+p5hSBBmAbPa7fkGVt47ghxMRrUaYr7jx3TGOwdMTkxvp6bhwyStog2isdJGyc
	ypOyMARONezggPTpRjiNcqWlj3poSuJTtgiPV79br/1AO6deoQZzKLSF0C7zmcxjuG3Cb7htuuG
	5tV5uQ5wxTNLF0r5SQnHnpwdw=
X-Received: by 2002:a05:600c:5285:b0:492:4640:cf59 with SMTP id 5b1f17b1804b1-4924640cf67mr192104875e9.36.1782117069622;
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Mon, 22 Jun 2026 11:30:44 +0300
Message-Id: <20260622083046.3189603-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
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

Describe syscon property that handles general control registers (GCR) in
Nuvoton BMC NPCM watchdog driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..4f00f099b2d2 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
+      instances.
+
 required:
   - compatible
   - reg
-- 
2.34.1


