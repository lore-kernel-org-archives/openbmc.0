Return-Path: <openbmc+bounces-1796-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FB5F45A18
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:47:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsykt4z8vz2yYK;
	Sat, 11 Apr 2026 12:47:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719293;
	cv=none; b=m08oOVN9JMoEajyNpedDVabO5dvS2yKJk8x8V1jymP/Mvz0wddYd+lxo8yHHTSI3wPJdRzMAKlnR0KDAKnSWKYkXVzmqDSrrwT5dmO2A/o1ZTYBXJRsG0ST0mb5P1zubbXf5ay3nPZnPJz5PebzQphVGca7FX1Xc+/LZZyAz+UwC+R6KMFytQmICZx2qcZL4QURO5NxPYbUMChJGpCqRnQXBPBaUi57A1ygSfg9W2FRGsknq0Mt/R+1ahXme9ey/T0xH5jy8sylMdS1i0lXsMIqUEHT0J22tWjD9p5UDA+k47WsGDjjKdMHhTexz8TAjtU6bWIUNqa+jTuOO7Q7xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719293; c=relaxed/relaxed;
	bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jG3T0l6nQU9PhfxFXEl2TU48JB7/uGPmGBvMJtRyvzE1woug3WktIpWTN1J2UNU6KnNCmwe7Fq7mHLNrLe1kT3ZLDsRH8HaKKjZlJqlOb+luV2qVTyg/t5osBazhldacXZVFudfNRNbdlM97mqOkrJPicnsyOX3Uzl81YBwssYII76xoCQSJ9hb/wmAGIp5pgFcZ8gRqXd+8cOIQcNqDOcbN0d1U3UdtE/K/nayEUMY7e/q4XmEfrnBSFCKB5BubkK16EUJ8uDkPapjxiJLQJY9wPj8Uj/A9G9qNyb6xyqfB6jtfjZPYPGYnZq3Va9ANJu+/JAo01ZW8jEDvadJg4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joJizAJ/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joJizAJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frrvw1ptRz2ySj
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 17:21:31 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82d03827316so266269b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719290; x=1776324090; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=joJizAJ/KU79MJLu7LeKi0ZUns4QI/GshQM0S2G/IjiQ4CZfrSadffABS+euBxPC0v
         5K+MjcULYHzzGM/hxY8vMWj6YWX372+iR6uIOFTA4YO3EUN9r6/DaxEVYPPZi6pE1Smi
         Xa8Z0N8gBG7s5TYU7rrJe2IAVwdjVwxSyD6fa9p+qLzBriIkeaCsx4gQvrflBYi4/EL/
         +8RJ6TTtyD9FDwNpdJPWW0j8x+2fFjBCSamSwfAMef81MQLuFWMGgVDtXQEY5a6pLgbg
         V71+v1UZXw64ypu18yxgYUo79dedcxK6jCxX38JQZ7t8pT+SyeDmoX7MZ0zaTB2LsBCY
         WN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719290; x=1776324090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=UJ9sO2/FLHekZCCc7FPrux3SB+p4Uk9HlO2yrVhJj+U8KDkkfRDJfj/TC8IRjPhAW2
         e7Jbbbd3ra3FIhCkLjDPIcXEV6z33OcNqUgHTz6CZbJOfl5Xv70klWNX6KIyBj4d+h/o
         wqu79ly8TnfJ/7t35AgSmXeqrWGJyEBFB0xeyvU6R+7qUE9B35OPscmyZdasczyTwjm2
         fIb2/aUl23ROMJ3Z4PnD1xP+yGSV0yCAj+PJGUwm17qNc8vZN+E9OTWyIT2OTDGXTap4
         hZjVCPYZxLA7dKbCedkvnkPjQw0lJ/4ix2tPgVRxOSlH7nuR9a5BzqUgVdcloQQNk4vI
         A+OA==
X-Forwarded-Encrypted: i=1; AJvYcCUEXkjRyP+j1HMEiyra0glZt3dfPk4+85nG2rMat3AZl/sGg8dPUeUE26Q/yM2vdspYXACslAaZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2kJnKVwrXbsEr3pIx++JlavbVa52jRG5Djecxekz6f6SAd6LI
	VFHdHbTouSbE1FRGZhNt/uuT5H0OAERKkdgnW4wzXJVk3LMsYZwpH1z3
X-Gm-Gg: AeBDieu3ixQmF5OlH77nTJAwTEiIyntPQYgzDW/g/3FzuvmjagH1+AHewnVoGw2MlZ+
	Q730rO9vEPYHvh6yZbAhnDcwmtRcraUIdMPTjagEvrRFrxQpqBDK4eNr14w4dC5KbLe42KLPDkO
	S9i4kgJQM/wCPoOwTwXFNcFyaHu3yPAWFcVLezj2bejd6I8yBtKFtUYv9K55foiFf7lnDx5vDqc
	tqFw8aW4+oOr999CGXvQvxdqDZ+lKHar0dTH5xpHm6YlMbXr8hYsLpPIZgwYwyYxlaRqdLCNh/S
	schR4XOFPw0Pu3tyDrt/z/nuXPan3j8UsEHFlauFcyPahH+BfMZYwbmxKDt4dwnRasiUm64WbBA
	dpF4ENECymEcQSNXzrY2f4U6u98eXAo2KvTs6tgdBlAIHL9GaIwcE+Ttzqb9bhrqxYce6ia+6Do
	2X+gaIAsMwxWrD9ecAI4NEa4APKMC1EHIZtlzqCPICMh+l5q+Jna9cPsDYaRy+Lrcytx/L1Cjiq
	0+5SuEC
X-Received: by 2002:a05:6a00:b60e:b0:827:2d7b:5038 with SMTP id d2e1a72fcca58-82dd8a1d9f4mr2094952b3a.5.1775719289983;
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
Date: Thu,  9 Apr 2026 15:21:04 +0800
Message-Id: <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
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

Add "nuvoton,ctrl-reg-val" vendor property to allow optional
initialization of the RTC control register (0x0A).

This allows platform-specific configurations like 24h mode and
write ownership to be defined via Device Tree.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
index 4f9b5604acd9..0984dfb77170 100644
--- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -24,6 +24,10 @@ properties:
 
   reset-source: true
 
+  nuvoton,ctrl-reg-val:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Initial value for the control register (0x0A).
+
 required:
   - compatible
   - reg
@@ -39,6 +43,7 @@ examples:
         rtc@6f {
             compatible = "nuvoton,nct3018y";
             reg = <0x6f>;
+            nuvoton,ctrl-reg-val = <0x21>;
         };
     };
 
-- 
2.34.1


