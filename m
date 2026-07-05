Return-Path: <openbmc+bounces-2190-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DA5C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 14:01:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtTfx68Y1z2yd7;
	Mon, 06 Jul 2026 00:01:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783260073;
	cv=none; b=F00m1DvpE3CRAfOuw1YediKOol69PFV0uQYK3xqufYLZMCHzpLrdJiMkudhb+RuVGFnvbRurWpTb0bkeJKZ0yIKkCkvSAh2/8Y7qzwPEIEXJIHKOErYrOqdcIEl0guPgLBUmP/JAGvoJrqBN00VyWxoof549TDxGNpKVwOmANuFctLEVpforRzfpwgNx2csyd90pVOj00q553pPiuD60x98W8frUMztkFIy48yTZ2e3UngYS+yFMAYx5lFPU6L2+SpxLMxVw0vlQTk9/g3wn8NTdD+Jkbw+J+6kMZP92JscKswiNGSrCoAosFlG5fGa1OHhZa3a2PFvHh1nsCb2MlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783260073; c=relaxed/relaxed;
	bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lfaeUB8YuTtD0SXc9anya9R1yQFe+OM/Cm+veAFotSNxWGzb99K+Z2uiLZ7QLCNCh5HRyzKWgB2Pr3CWcm0YnKxBOQYgK5TQRsK02ewJl0r+FFKsaG9jP8blUpY3nISYiTGoASv7MfXWcbnDXI/THD3qyU5zZVChk373JXXW48+s/p6Y9sI3F49pRiFc4T2xF+vjV9AkrZHBZqz44RTnyo2RnPxjS1zm4cKhJW7iKHBRQu+k9p1HJTP3hcnuCx2ZwvlE6/L9ziNwXnWXQ4Z6rTKuJHGD5r95MPM+gpgId5SxiWjgH3PnNYt0gfb3g1dzoi+/pYDpc+xnsDQ6OAmAYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvhP2jtL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvhP2jtL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtTfv3wLtz2xYg
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 00:01:11 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493c83474ddso20208975e9.3
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260068; x=1783864868; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=QvhP2jtLHOFv5vLpbn1jw3UdxFQV4sLzA8d5mWJsVchlWycQkyPQjMlWHxYkwOrKP4
         fV+fmGsfOYbeaLTThlHrvpbUQOhly03Z7+7z1uDG6PfvWO1GPgmFBuYLrX0trRXnO3wv
         4zkwsApE0OX56T9mNZkKrqagZRCl9+EuUn4YEsGLRM9QFAh7azs/fV4XiALx/XckyBDU
         COjqsFEnxEOULuJBUkhcyDxLi7F4J0f98fzQP6IrCJ1tDUwMJr0J+9kI/l9Zw4e/nfki
         2RAAkJKUHqjuR9PGIKBG76rwCOYy6mSlp+1+Hh8ri3ZcoUMWpxj6R2cATuERkunsdLJz
         62/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260068; x=1783864868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=mwtTwS1YDKxhIdkVFAmfc23F+2R6HQ+4ayBsRx/tN++sGxgm8tDf+qnj1ImIdyxcYg
         JIXw4cItXZo8kslCVnes/aKbb/vZq5WMp6tBW6MTo/mIF5dsc5JJ2Mn3p2Q9rNIEHt/Q
         48G5hxWKcgQKsDAJR/ICoP8Z+wU7M5MpmBD3A90LKgzeGvZJfGE2DLZH+Y3omBDBSu6T
         JwJNdANYz8XNOr+4ptwPkNt2mWYFXU8/4cEfWSf4h5/n8Hf4d9XukZP/erfhj5vF3p7Z
         3cOnB9biraexBHuCZIinbB7OGM4cMOx8DZSUbwL+a+6wqvWrRZv2WhzMWkfenofpYuc+
         xiKA==
X-Gm-Message-State: AOJu0YyzUZVyF+CEZwXtmEw/pIaOIXTVO0Y1jWXsxoRWfk0zwiuxdb70
	5YqDdiCccHQT8jurtEtc8ROJH8FSJzjbzlixLa1ZO2SNw9FRNP0AuaK5
X-Gm-Gg: AfdE7ck0Vyi7ZvydBiIn88PW3Y+HnQymmOnkVxUJZzXlrjM0l5SXRW1d+fKkwK9ZLdH
	iD05bRDPWf+l4Ix+zlnZMs4Ac7pacfeoNUrr9qJoRwzr2T+W0wRLNKkttAcYbX/735o6Sf0iEPv
	xOF4Nof4uUhHcxAJoXxbiiFNvG5GYpbigNw68zehB3vNb7gf6R5se+LV90l72dUIHpn8+FVmhzb
	yupEllvbt5VqAXJj4Q4Zibtsl7MRML2X6u9wSVlb2V2CTdzD15/dhg3s4IxD8ny9YSsVu5mxUsu
	03J50ujpyfOHITA1ifP0emRR6fui8bX8VS2DPzzHr6Nf6T1P+e4nyex0rKc6dp91sJ8RmKb/v7s
	Cp54otZ6CCRAR7awLs+V0J5mgAXGeVRfCDiwMa38RhKCkldoanc/L2F83WaPUJH3vWqgkQAv503
	OQ4GBtQhs3Qa2lipCTCFf7Vkk=
X-Received: by 2002:a05:600c:6792:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493d11d7dd2mr74212545e9.16.1783260068120;
        Sun, 05 Jul 2026 07:01:08 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:07 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Sun,  5 Jul 2026 17:00:58 +0300
Message-Id: <20260705140100.1543486-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260705140100.1543486-1-tmaimon77@gmail.com>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
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
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..99c225f166db 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
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


