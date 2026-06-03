Return-Path: <openbmc+bounces-2034-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9E6CD6E5D
	for <openbmc@archiver.kernel.org>; Wed,  3 Jun 2026 01:26:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVVR76TSLz2xc2;
	Wed, 03 Jun 2026 11:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780448226;
	cv=none; b=GV8vse92lZKnnbI6W/wO6kOesuV6IJMf7zIZe1Eu9Ta8honRYjox1LKhAF8ffzE5cDZpG8nafggfx+g/6q50n27a+9VstXYCf3F3kdr8kNA8sLdRuSi0/HT8vCXpHelsJj0Wpx0NJb5plOA7DGkx04srqpdH+cVeP6fOFbkshZHVQfbM+uYvBwEfttxK4+mPaXsflMjz+GN2ew3plkJTCBhBR01etpVj73OYk2AjWoMvWEqhG1EHIKoQODcYglMNzx0oIdx9uB+ohSD3WJ3iTZSSTI/7EdZk9JoSTC73WGIRSN9BEqSpHuC9vnNt+s/Xey6PJjkTYT5vhaYVLi1Y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780448226; c=relaxed/relaxed;
	bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kDEJY5864sN+vd3bMwneMCHOcIROZBYKR7uk+SrroQywoS9W73EGgVnvTQVY+09i09HSAUPdW5IA2PF7f4sL9CX9ZFR3fnJJd3JfLC0sG8KkBWAeItCYY1f5mj9LU8EjlBAMCP7oMYMJzxiFEn8R2Lvzq2Eh1eNWsaQSQVBlvk5t/PTo7bpyITYw4/onsed0EbDgzxyXefxy/rHA1WkBagOgZStBX2mouB0Jncaj95QXj/Xm7xnfVtDo7m6uVrpx/B+TeTRw8iANcnnscobj2MgWhfwIkdf57Xmgso6s+DZy2/B0vBaE9kzNCAn1rosA0FiCyRuTp4wRA3FQC6aSsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iKnUyP5K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iKnUyP5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVTmy2Bqkz2xSb
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 10:57:06 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5175eab3a93so16623511cf.2
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 17:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448224; x=1781053024; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=;
        b=iKnUyP5KPdIE+jDzJdh94JqxoAxBIzamxCHlNnC90lIk3AIHNtJf84e/iPNnWHKksB
         eFhopjwwr+iUjqvAD8sqOnXqYwSpm+n92F+uuy/fBYOYep/RTjXwuzMqFm/LW9DlUhTd
         OQaG1TEbPa2TA9N+RXnU1Le378+QEw4L1oOxvTeMVS9djwMiGApFS3yu9XCfXT49N2p/
         yZCpYiMtVtwaR4BKJsLMPfp7SIXgdwJ6YF8qeV8dQzGKO4lxGbKl/KEjkN0tC6J8yiRE
         iCtC+/N+q+g1YCHRbVggI4kmY3AiUjJGvApLpiLWBtjqDwZQ0lw7ZoVgaIx17oP5rw0N
         33SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448224; x=1781053024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jhe81GLnFMt2SFFisrAqvCgJB0UsWbau4qiCW8JuqQ=;
        b=PFT64W3NCj2FureslFM0mQVl9+wlh5+vW1gz5Go7ON7L+1Bo3FMFDY28Z/aCdEthgy
         eAOihnm1v2fRmYcX1tBXcTxJ8vwJ5dFoGuPgrIb36kkcekZK+mSMhNoLA57jZqM18544
         6qp0qdi0e3sPXnMtaPxWcpKnvnjJNAGZ4bKTGAlBWT/Ni5qy3dnhKXZFjgwElLVyK60f
         XDMyypwoVhc0y2Qp+2C3BLbYNKD9tDuEXd5MhzHwka0WnyiSUlxEwn7ekIbmEulPEyLD
         ZAGYK8JlVWpHa/QunJn23AyO5U55NRjobml3HQVxIC+Kc+/3hFjc4zaJGBLIJ7uVppr0
         YihQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nHcFA6ySzsaqmoRAS2fELNl4Uij/y98absXTKYo6K09l4UDG29m+iiQfgqHWVHTsGg1P5urRr@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwX9MzekO96EtuFd0LDQPK3Kx7JvC9RC195tSkgZNXLDIXfN+1G
	jPrFl/WMIUIYJcGF8s+aysVTJT0pdD3bPfaS04sluIxGgolfY6Cs0SRY
X-Gm-Gg: Acq92OF598x8ZuK1wzaXxiQ602HlXRrKPziqQXfLZTXQWGk4maPUAPX6Vuu2xkFiRVZ
	BPtNlKlKsWaPdhYM4LBE9bfAaEAUhqTfcofMJDSrKot4yOGLZnk+q1A6pQitAL5o3lVtWZsxmim
	fp+ehFL21iwDL81xKUx6wwgtIm6Yq82Qd9sxSSdNXJ/J/J2JiCGDJj8KYUfqIYpmUaAuGHu1Bgh
	6/ke+Sy+BnxZGA2Gz0OJBsNuTMlHPZsl5nuGKrIstKvyHg8q9mq6LuusUAYEw5amALIqMC9a7J0
	1l5kLcxRJ/wN8LuNgjmKTyO+S9GGxcotrCVO1gBFaXo77SlaJVyN7ofSR70zoHs8xrvz+C5/MII
	iJ5Ol6OIaQmhyRpArVa8FPjbrGWzEq5TmuXE/pXGCbei877gu0UwQTsXreDDjso1EPeIlrAxPGp
	7NkWETkFWs4rE8Dm3dRV6YdmB/8JsM+pb+N/IDiXnm0vUYIea/Bp9q0XSyyS3x20tgBB9yDumUS
	umNf8ktwrPVB2No3pR1DmyupHcTNxhHvXB9pIBue8vxhw==
X-Received: by 2002:a05:622a:4114:b0:517:642c:8196 with SMTP id d75a77b69052e-517785921eemr24993891cf.12.1780448224112;
        Tue, 02 Jun 2026 17:57:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm12121051cf.8.2026.06.02.17.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:57:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org (moderated list:ARM/ASPEED I2C DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: aspeed: Simplify resource mapping and IRQ retrieval
Date: Tue,  2 Jun 2026 17:56:45 -0700
Message-ID: <20260603005645.227239-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Simplify resource mapping by using devm_platform_ioremap_resource()
instead of the longer devm_platform_get_and_ioremap_resource() helper
as the last argument is NULL.

Additionally, use platform_get_irq() to retrieve the interrupt
instead of irq_of_parse_and_map() and propagate its error code on
failure.

Assisted-by: Antigravity:Gemini-3.5-Flash
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a26b74c71206..f3c28c7c547d 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1006,7 +1006,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (!bus)
 		return -ENOMEM;
 
-	bus->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	bus->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
@@ -1064,7 +1064,10 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
 			       0, dev_name(&pdev->dev), bus);
 	if (ret < 0)
-- 
2.54.0


