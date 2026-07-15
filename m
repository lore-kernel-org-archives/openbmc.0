Return-Path: <openbmc+bounces-2278-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B9C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:31:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8r1Zjvz30Qv;
	Wed, 15 Jul 2026 22:29:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118587;
	cv=none; b=VUxL6aO9Y0DDGQwX/T1yVdbZJqrebKH109Kk4ky0djZqv9Kdn64mLyuIgmHD5r2LKcFfF8rkiQwRB/Y8OYDx71J6iW0XAzKZdkO7XyS1C7c3fkyuq5zq67bH6E+TVJIXelBAscGjyJo2lRVvBoyshhX7w8PajA6zsdgVYowVg7G8oYdpINGs7taxkw6rQjyPe7+xTvYnTw8NV+jrMBvPpmdl/wAetFy1q8vYWsBfsk+Qfy06Fj1dCoqiLzY2+DRRckTKiIF1Ya5AwaqwHNV7wDOrnA1eWBWp1P97RHY+nRDd84ZBN9p6zTj7NMvy5ncm8RjR4IbT/O0Xflg8kZzsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118587; c=relaxed/relaxed;
	bh=Xg6K9BOVyTm0sW/3T39sG2O2ploAdMhQq+0sGRnM+RE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jNc1MsHfePAnuoDVFM0XGGJUhCliP71zLW/xte7TnTg500QJRU0Cvug9t1c/tsVWQunz0qdNRHew7u8RKxz3SzLED1t5Ti7wnMjnMaPMA8sE/kF/n9j4m7VA0zp2YmzoJjruQVenfzIjwgsYjDwG9MKLt6Q9zM8IoDWSk+PfoAEX9Bj4iqwaMWjNm+u66sZc9jjn323+0dO3J1G0szbGHF/LoPHV1och/xuIDudFmIxKeLL4lN7JAghtR9IcPfC6ZQAJzfTTkh1zy46YY/VOoYgQ6zhRJGxFuQhGMK16WlLVxcryRtqCcJ6RVDYHZFobVL0TU4GR7tdGVszYC35seA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vy6kUlFx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vy6kUlFx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8q07V2z2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:47 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so38523055e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118584; x=1784723384; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xg6K9BOVyTm0sW/3T39sG2O2ploAdMhQq+0sGRnM+RE=;
        b=Vy6kUlFx9EhdvBxrzFhf5duddI+5Y6X9UeiBED/MMEwfKYy5hNKPaieay6kfvrW+LI
         WVpIPpD2LanGpH92itSaqaNkVx1oea112Sy4aF0SK/waN/lZ9YoBSQojTV/jTDG4Fq8K
         pmu+tPB96LrTSX6u+BjbJqdl5G5QZ5oHL9Ia9uKH0SDfAWfjG4ztduNgEtqYfAbbnoNX
         mlg09Dm/Xg2Q1bnEVl8uj51lCHrz37vdWyeV6cjPQFOkE6bpRJ7DSqYh9TG8nP3Quhfi
         SSU4Qa1F86NttaTQs7VUeTvfyidTIDk+QuTfmEF8Kt5mSCDrvlrBpzTa3BxKJ2pI1slm
         Gksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118584; x=1784723384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xg6K9BOVyTm0sW/3T39sG2O2ploAdMhQq+0sGRnM+RE=;
        b=gWXCSsc9MNdbGOROTJ9QoIW9QXyiL/wKqR/06h/ZCzGH/ID3U8Qx4AZ7CfkELRX6eX
         1ruNXCjCMO5B9yGCBmJXb21pVp7MWfaI0prsTlAZjEf8pfnU+lJhkPuXqHcmj1bRbP9V
         KWXoTbZ8d/kyjFdRECG939OB5vvMs7dFNZqWCu4+qOul2lJ2X2MJsBIxsngQfWDQQRrX
         ESWNtXpn2+Yg45HWALwJt/dxP1alFizcCZ2R/r0b1QBTZP3Btt7PnIXTCNQ/BblovbZv
         hhmzsfHa0s4seJ5qRqHDMw7W1nIeFxwA0sVAFO+7EXfYcwy6LxXd/waF7wGzjlwjQHqm
         DT4w==
X-Gm-Message-State: AOJu0Yx7+F870hf7iqby8h+GWDc+axOBQH/wVMwv7w7j5ceKygEZXS8E
	PwpOh70L6FpDE0xiyrxgAR6c8+rjEgLPBi3o17+/QDZyB+sh10nGNzrb
X-Gm-Gg: AfdE7cmHwnS7LHKvg+M2A8XzcFwaNTxq8j95EKWXfAhoia/5Dqm0K7q2v1GkxCQ894F
	joci8KyREgNHwASikk3dLGnnkJfeVJE27KpgK63SgqDV+96XT5kOqxYctGPA4lGHO1dfV5s5Pwg
	f+n4LJ+UYx/ypMo43lecmyI8dgi74PPs9p3Tbdjw68vPgW3h9mD5UY1P1xIVg0yvhFWA6epnYf/
	vO52Fkxi31CMLnGsoqrM0cTycG7A/prm+eLEhv20d3ZrHrizM0UG8o927hLVgdIhDSheBiPzLLP
	YpSMj78UZd5YK3+DpW8WWt+uFbTEpzQI616EPdj1g7l0xqXJMa76w29OghyKvKxzDm0eZpNG6yd
	FIaMq59XTgC4ccljFojELRs0c1F8KBltUOcrsAdT7h8UK5dlOyeyA3PU3PvoA8W09RyUbxptAs6
	ntAwBQT139tG+SiZK/oxYjczpP3iqhGXsEzA==
X-Received: by 2002:a05:600c:3487:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4953c144adamr29207275e9.4.1784118584084;
        Wed, 15 Jul 2026 05:29:44 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:43 -0700 (PDT)
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
Subject: [PATCH v1 6/8] pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
Date: Wed, 15 Jul 2026 15:29:21 +0300
Message-Id: <20260715122923.1938327-7-tmaimon77@gmail.com>
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

npcmgpio_irq_startup() calls pinctrl_gpio_direction_input(), which may
sleep while taking the pinctrl core mutex. That makes IRQ startup trip
lockdep when CONFIG_PROVE_LOCKING is enabled.

Move the direction change into irq_request_resources() and keep startup
limited to the ack and unmask operations that are safe in atomic
context.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 29 ++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 1c95d7cbd..e21ccdb5d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -297,17 +297,33 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 
 static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = irqd_to_hwirq(d);
-
-	/* active-high, input, clear interrupt, enable interrupt */
-	npcmgpio_direction_input(gc, gpio);
 	npcmgpio_irq_ack(d);
 	npcmgpio_irq_unmask(d);
 
 	return 0;
 }
 
+static int npcmgpio_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = irqd_to_hwirq(d);
+	int ret;
+
+	ret = npcmgpio_direction_input(gc, gpio);
+	if (ret)
+		return ret;
+
+	return gpiochip_reqres_irq(gc, gpio);
+}
+
+static void npcmgpio_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = irqd_to_hwirq(d);
+
+	gpiochip_relres_irq(gc, gpio);
+}
+
 static struct irq_chip npcmgpio_irqchip = {
 	.name = "NPCM8XX-GPIO-IRQ",
 	.irq_ack = npcmgpio_irq_ack,
@@ -315,8 +331,9 @@ static struct irq_chip npcmgpio_irqchip = {
 	.irq_mask = npcmgpio_irq_mask,
 	.irq_set_type = npcmgpio_set_irq_type,
 	.irq_startup = npcmgpio_irq_startup,
+	.irq_request_resources = npcmgpio_irq_request_resources,
+	.irq_release_resources = npcmgpio_irq_release_resources,
 	.flags =  IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static const int gpi36_pins[] = { 36 };
-- 
2.34.1


