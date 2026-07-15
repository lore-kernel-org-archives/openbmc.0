Return-Path: <openbmc+bounces-2273-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88479C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:29:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8c6WKKz304x;
	Wed, 15 Jul 2026 22:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118576;
	cv=none; b=me2Otv+x8scP4tL1aINx4X4Svj6lsxAvAlSKleAtWvmUotSYpryCF8ZDj2e6q6FaqJgFkC0bRYNwLhoHVDM38sXVg0P/JTLkfObU8yk1/gt2hH93RLxnDOBUbrbAIr9tfbQpc5jC4UcfWn6iBK2c90j2WCt8axaNF6089Xd2OSaCf6H2+Xh5PZltBAuEMgGLHC9cFI4sAOclDWnHgBcUJfjgPdUoqieg6NP9UazUXIWwmQEQlJarp2VD3oQiK9L+gdeMgVYt/kcpHAO3v5N8pTndm8rbIe+/qv7q+QriKUsnlt1QEu+3sNjZ4X3LZO83kWw32GWh5/9eeAJmHwNP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118576; c=relaxed/relaxed;
	bh=+2HhYmHPpN2k6gv+cX337Z0vUPpech30HlfXZ14MwxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JHq/LJOpWjxZbcaLm7x8kklT0pzrd3Z62Dfu69B8zbWLTJ5OHA5WOyuMYYACVw898oh82fCRb2uvm3xT0tvZMOZkZRDgZ18HzpXRW/mkdtkyaYTX/elr+FmDEHb1dhga/2HxFtdC0sJCvM2VWPLSTr0X82wJ9qaa5jr/+XJcGUedcjn8as+dtAQ3e3Woz5HTUWu2axkOA3SSprewjse7mDKHuifSkiPkGuBo7irBOsJBsGupgHnR6Ra3U2WvPKDxVU7wEdg1BoFoFA/HqhoCCxo9Ii674H9zmHwZwbV7dvHYWbmoQgts2dBhfUOhDQ1flXTdG1ZNHhPvEYKRiDrAig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCENGgAt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCENGgAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8b5jj4z2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:35 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso11111675e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118573; x=1784723373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2HhYmHPpN2k6gv+cX337Z0vUPpech30HlfXZ14MwxY=;
        b=jCENGgAtnUZ9GDCeTYzZ3/1uM2xOFcqfgEgiVqORSW1yA0XnES9/qERb0Pp5Il7ZOj
         kXwxMf+D0JDX+Ue1Ym2jhIUB62t0UhudSQQka/BP5ayXIqCwKViNcjayfMsfKpz1s+Is
         rQjbCWuSkE+v9U5o6guGsq+eKLdo1qSdP2FwyJ/jwmHY1XKH8+Qk4T77/HyUNc5zhIFc
         y0+jI8C2/F4UhV+FAgwsV2zbvYbDGY5+zY8jYlg75w2Blg6dQResjrQCQcT9OmrMs8LP
         DEdyJTQgxN3A55BB1iCb59Ri9hwO5k0bENRN7YsTlx/EE0slIYY7DSWKEuJInGqwJRGt
         FXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118573; x=1784723373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2HhYmHPpN2k6gv+cX337Z0vUPpech30HlfXZ14MwxY=;
        b=INmWuSAtg45VHyY7HZMag7gCqqd2+yyBolkFdrwLsTDvbiOGlNqXmF8d6AKP+k8TD+
         Wf241efwbgVbVmCbQ3JZ/DthCUB5I1n935wvTgn4Hup7DEzO8VbCJeKIRYpfiseqTTbw
         Tz2xBGRig9EaTjwkgKdlyEDhmBlWPBu8om5FKHA3vX1yWGi2VmiZ7dlS5k9xqaTfIFxS
         y/PDRSm0Y1YT9/LdnBa6V2bmnioPXmqC3JRB3Amf0/YFVTx58kjgm4u1Ub+kxXiDTcLm
         Gx+juPUmlgm9Rp6UN+eEm400cxdE1wk5UEqnoXM0EfmJKH+ncSCa1qSo3waKJDssx26W
         7/iQ==
X-Gm-Message-State: AOJu0Yyr1UgLXnCdkT35yswbQB9H+PrAZpmWCvkX1rb6a3rSVUeG9Iu0
	+V7ZcLasM4LlNnw3775RXo9BfamdP1eKlCFnFYVBMF33dr1xKA66uJoR
X-Gm-Gg: AfdE7cmjJIzwOYxxOWaF2uuBeDYwrFIN1gfy32k/dLXhpBXMBCpUToov1orO6znsLWW
	EfU36YI4fN9GWf3uXexJM7PtZXcOTdA30ehbNb5INQ9vQYXj2l6i491bO8LiPlkO/cPByN13dxn
	OHulBNvXnHBT4dVa+0GJV8PycpwfACzQYhcfVy7ae8elAA03UrajlOG53GtDrpV2XTRPXbyfJ5s
	y9YYATC46bNKjlBwr0zUvJkavI42iU/9sd7HQ25Ws36mslHHxKvHolx+FUSfQbyTOOlbRizeuAh
	7/5J1yB02p1rs32rFdGtDcdHIlvzrrXw2AmQfVeWL5nqn8s/eLmUYJf9KBZbob3oOATqANah96H
	uo9LdQYMRqD3rAnUigav8A4p2vv/ZtLZRbrODjKah4humyUm7m4F9JG4J+Jez5D5oJPYAF+O3H9
	3A0GpM9+AlyfzAT3lFLzQSWjM=
X-Received: by 2002:a05:600c:1f87:b0:493:f870:fbf0 with SMTP id 5b1f17b1804b1-493f88b3693mr214909345e9.34.1784118572456;
        Wed, 15 Jul 2026 05:29:32 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:30 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 1/8] pinctrl: npcm8xx: drop RTS/CTS pins from bmcuart1
Date: Wed, 15 Jul 2026 15:29:16 +0300
Message-Id: <20260715122923.1938327-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
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

The bmcuart1 group currently claims BU1_RTS and BU1_CTS in addition
to TXD and RXD. That prevents boards from using the modem-control
pins independently through the dedicated nbu1crts function.

Limit bmcuart1 to the TXD/RXD pair and let users opt into BU1_RTS
and BU1_CTS explicitly through the nbu1crts group when those signals
are needed.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 0aae1a253..c859dca4b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -538,7 +538,7 @@ static const int wdog2_pins[] = { 219 };
 
 static const int bmcuart0a_pins[] = { 41, 42 };
 static const int bmcuart0b_pins[] = { 48, 49 };
-static const int bmcuart1_pins[] = { 43, 44, 62, 63 };
+static const int bmcuart1_pins[] = { 43, 63 };
 
 static const int scipme_pins[] = { 169 };
 static const int smi_pins[] = { 170 };
-- 
2.34.1


