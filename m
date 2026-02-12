Return-Path: <openbmc+bounces-1363-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D1EEA870
	for <openbmc@archiver.kernel.org>; Thu, 12 Feb 2026 23:23:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBrv56Rnfz2xpn;
	Fri, 13 Feb 2026 10:22:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770900113;
	cv=none; b=nXLnmCNtn+/t5aAbwdKHgO9NpmjBr8tjnqBHd7fPBx5abRvt1Fxw9L5paw+BjZGBgbNQVempv6P30ztNEbPwiiDiMBygPRJxXi9UPoMEW6etej1ONFI6mE7uPQ6QWPqetEpae2RPE9bK0MAdoITRhsEszo7KbUOyP56fsBtJXDsQNAuEG/fa6fUBt6thk1EdJ+q1BbKbLKjdfrSL6o+cMlv2aG2eXtnhkNzE7lvQd62Jm7HIxsoe82JxBaYNdZONzea0Vy5x8T8zNS57LHUXNb/yVfnZgIkncrODTFSu7RevM9hTZMN12tiRX4yrH5qTv3l8onEIvWRf7t1mkLE8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770900113; c=relaxed/relaxed;
	bh=NIZiZtGtHzT/irepT+VZQ4zYZLwWPZLEhQN/aE3V0gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m3B2ClA784QLFsZ7a7Mz0gJELyl7fF6vLy98FZC8K4DnExbaTuEvHxO2UcZAcdlPG17nBg5W+TadNwvn2ISgkrVMrCxIo9vp3pilYn6p6Auy25uLUK4/nyA4RBCciwy9+6fwpyQZwf0eThTjbPnrRAGhKZiZbmQ8TZMoStl4cLGXEUwagHAkDSTqYOJ+FtDo+YfdEULCMuhdmaGCpCX6Jr7+Pdi2ndy+W0jN7QI3iNz25/T4ufkP+M51DkNcQPv1w5sHuQdnca7L3BXbjF057j+8sX3YjTKG7jfWvZCaIa/1sdE2nKJIyrKuJD3Rp3m6eldiJTYvPuiMSB5zsFeb7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLAOwHSB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ustc.gu@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLAOwHSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ustc.gu@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBZgN1P2Cz2xlh
	for <openbmc@lists.ozlabs.org>; Thu, 12 Feb 2026 23:41:51 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a79998d35aso55795025ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 12 Feb 2026 04:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770900104; x=1771504904; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NIZiZtGtHzT/irepT+VZQ4zYZLwWPZLEhQN/aE3V0gU=;
        b=WLAOwHSBqXmfAthtIXZa79Ubp/E7ctMkNzLQx0f06aEH3XOjdCAzlhK4/p7Ax1jc/k
         SACGM+LRNEh27Tzgvm3KGf1mcPoKksG4Xeco77UWg5sOGQOIfKrQtx8gkqmgx71e0/sC
         AJs79xby21duSFRoaq7XVn6+2MC8zsmU1jzqEUzd1TQBCpDQXxFPuwgcanW6L64/euZB
         YB8TUAEVIQfEHcHa+6Ii2dvdpX1JjzNs55v5FuXOKAfgY/ahYB7Q2oLtSSx4ENcN8Uyg
         MUPNZ8Gd1dL6hudYIlKb6kdcDrHzykRmWHitskgxnjX1Kjjst0Xzj/2K5xymv1R4AYlM
         Xmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900104; x=1771504904;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIZiZtGtHzT/irepT+VZQ4zYZLwWPZLEhQN/aE3V0gU=;
        b=ZgC0OALMJu8ojLwf0NUuhmaFNVt5qB+V+okb3URtwK0249Lkq8/cEGwE3/fG4ndQNB
         8H+YM7djVUZ0vY/VYQowlWKvXQyY8O4OSNNSkTpHB5iBt1aieEP6BoRzJLDChdSDvAQV
         cPmG5aXj7I3I9LAmLLw6ZE3dbFS1r9fBXb1eZli3Hoffmm8aQrbTBIg7FVqY4zSMCzKI
         C6lDxXe4tSgYt0fs9aVib5XIaXsH8tuTms7f078oC5W+dMbHJITqPAlQY5LYQbD1Zm0P
         ch4oqsfopxpMZ8QpwDx7dKTFOB9OibyFRf0/VhtvtX6R3meHRGXdzZWMbTbwgsbt6Pno
         mNpg==
X-Gm-Message-State: AOJu0YwEVfAnkkTknIKiYiBUWFgrVfSXeoQRu8KrKXKBt7uDyBt+DLXJ
	MJAf8EDypnrhJE5te/Bc/xI7xld/tpgT/NBzVPtTJMw2sKMguhatyfRQ
X-Gm-Gg: AZuq6aJRpvKbyJVzpD0YV64OuK4AiiYEVg1JDCvnCHnd70zxR/EpCBARjbjbHFgzeV1
	V3GsYWgDSmOwBaOn46NcZY5Ja+g8uPlHi+9t6AcPx9QhjDQe0V58DLGpl9Mxd0oYPgB4LUJWW19
	58vAEj6ZPpZFnCI7xRdlVY93GbjEg8Cyur0J/BfNGZervmeKL2ZMtvfp36AvP6ijc/L5iQ3qSOP
	IxcBEbKtspqWS+QfDkeJmKAFSGE2D3noerLY0ZQl1iQz43jK/SkWuY73MtyjUOqglBtq4HOVN7J
	FZKGZeSzAMjy9IKyHs5fVW2g4XU5W2I6n//2A0SdeaFZaemcyzFpAus2gzAX6FpW41cIOsRjqhu
	GSKklKWY5hyia3YpgGiedyQ/h0MOCy0r0y0fJUttoBD+3a5D6135dBWIK7Xn0UDGu4+/o34fDhn
	9V5/8zxc9I5K/JxHEf4lIKAtPPgdSZ6/e0kYkk
X-Received: by 2002:a17:902:d4c3:b0:2aa:dc84:251f with SMTP id d9443c01a7336-2ab398a922amr24090025ad.2.1770900103789;
        Thu, 12 Feb 2026 04:41:43 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:dc7:da9e:7bba:3b99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29979b13sm49087875ad.61.2026.02.12.04.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:41:43 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 12 Feb 2026 20:41:40 +0800
Subject: [PATCH] spi: wpcm-fiu: Fix potential NULL pointer dereference in
 wpcm_fiu_probe()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIPKjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3fKC5FzdFAuzNHMzczNDMxNTJaDSgqLUtMwKsDHRsbW1AOx28a1
 WAAAA
X-Change-ID: 20260212-wpcm-d86f76761645
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Mark Brown <broonie@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770900102; l=1414;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=EkBsQjHkvpT+EDzlTJQoxDY16uNrl2PUIqqeXh4h1+I=;
 b=BBb4/US8KhK9xEjwgm+JhoNpUwUaYp/aSYN8vFEydw0Kn85dWRKlCrGmjTK+xqoauYss/QjW7
 IePX0f8tTVWAekP85XxHNtVHDcn2ylipgiSiNTKP6nUKjBDB+LmTiAm
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

platform_get_resource_byname() can return NULL, which would cause a crash
when passed the pointer to resource_size().

Move the fiu->memory_size assignment after the error check for
devm_ioremap_resource() to prevent the potential NULL pointer dereference.

Fixes: 9838c182471e ("spi: wpcm-fiu: Add direct map support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-wpcm-fiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
index 0e3ee5516587..0e26ff178505 100644
--- a/drivers/spi/spi-wpcm-fiu.c
+++ b/drivers/spi/spi-wpcm-fiu.c
@@ -459,11 +459,11 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
 	fiu->memory = devm_ioremap_resource(dev, res);
-	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
 	if (IS_ERR(fiu->memory))
 		return dev_err_probe(dev, PTR_ERR(fiu->memory),
 			       "Failed to map flash memory window\n");
 
+	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
 	fiu->shm_regmap = syscon_regmap_lookup_by_phandle_optional(dev->of_node, "nuvoton,shm");
 
 	wpcm_fiu_hw_init(fiu);

---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260212-wpcm-d86f76761645

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


