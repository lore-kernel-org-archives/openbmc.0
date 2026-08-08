Return-Path: <openbmc+bounces-2387-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD4EC5AC67
	for <openbmc@archiver.kernel.org>; Sun,  9 Aug 2026 02:59:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hHjJt3dfPz2yXj;
	Sun, 09 Aug 2026 12:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786174692;
	cv=none; b=MkZgQPjP6GbWaBD7EPW9qUgLVPaolDCCcTvJeTtwzT3k/8SjBfSxPXEeY6JN+lY7E3VCrz0jS1+gt2ywKO/oq7so6cY+WmYevrA07WW+KuqgPe9V08eUj0pQV0tro+E7LIPX8jFYXHQ4Rh5J5tBfVjE2Q2CDOIvoa/KzHHkad+wMPLlTRXp90+/f00kAKsaFaTk5pmpDZRxZLlj6n71lbeOA7GomdUusZuRovtiOMCrgSoD8esy0cU/NNg4GmkzqyduySQ6+eTNUBZcFIAdcn06m6ntDLp0GEjnXY/0fHR1H8lnS748PVOB6TeU5iBwtJlO8I6ADEy7v/b1IzPKukA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786174692; c=relaxed/relaxed;
	bh=QZ3y0avheyoaouXFIVz5Hu8HDtYYb6j86ujlX80DrU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J36KTNd6l9ESniQOK2/NJxaIu8B+yVR+N9RxFdPNIoMPEUYTp3FDMJbou98zcGMMVtztn2BmkERlac5i05wQWEg+eJ872ekeVGWvohOlmuerXSfuLCDFEX/nypcj1+XqWWoO8WoU2+LgOrTPkZDIz+Oo2gcPOFZTuhq5MD06tKcvvUjh1uhlJf9011ZEa8rnu6CxqPR8LCvbaAKQu5w8VibJq8dy81NfQHrwlp64QYmv/yZS9oUr8xUm5kpOvoc0+07456Lg5slmVqVm/jQgq24LEykjJ70BYpBqw6gJdzZxvHuVbZfWR/RzC1z44Ht4BPus7FQLMptujtyOrXg/Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gorS63ar; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gorS63ar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hHCYG36Fyz2xLf
	for <openbmc@lists.ozlabs.org>; Sat, 08 Aug 2026 17:38:08 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso233676a12.0
        for <openbmc@lists.ozlabs.org>; Sat, 08 Aug 2026 00:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786174685; x=1786779485; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZ3y0avheyoaouXFIVz5Hu8HDtYYb6j86ujlX80DrU4=;
        b=gorS63ar6WJAqM2d6ymaZzftzkCiGFH8Nlx9PqyWVqV4AC38p9854GRsn/QwAPTCYR
         a+8pyBFzajOg15onPRMwoFeOHhPdbLLJIIzWem5EdlW3OTZMstW/jOUUCydJkM6QLO2G
         SUttFmoT2EB29H+f/TCi1mInTa0zR9PwxkMr2g3s5SKcN27klcgX8IKruPFJiLNpYdgY
         7AU4djVyhqQF1iHiPQemeV3cEtgMvj2n7RHxzQ1CZvyxdcok3mjND3Jey0r2PNwxP3jz
         75OnzD6hBsMIcEzUPxbER/WCnUzZsZIEw3AufcF0R7p9WiomQ68Gu6e5EHTR3ZMWH0d0
         Tc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786174685; x=1786779485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZ3y0avheyoaouXFIVz5Hu8HDtYYb6j86ujlX80DrU4=;
        b=P+Q9ESjwGFw/nB8ZYYyDxgP+rVNJJN/z4j07tUbKwzRLRfF8CS76i3hNaoCRjoR0C3
         d7A5WCMrk5NOt5SMGL+4Gs4hj9h7c4jvoZHPVXha8HkdP7pXX29zjsA1yiybnNxtRfRC
         p6O4fU4jfsUR2wXa4aBZmgiq2N4ONFbMFxTJUlmkzvY3pO+vznxGp895gyinof2FkwVn
         v/vctBzLT0Hs3s4AoNmtOPV8fLMFtsjPHPw+FasoSYmqrJjSFEmb0BDeXJ72aBswYqOl
         zhw1pta9dOvj9PBkssvUK3jzSRWqC/ZDl5FGuCcNPGLrzOo3bUMSs4BQYCbhSjh5oH0d
         a1vQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYnIe4xH2aADRKj7+iri9BAQ7r4DENM8YBYmep+huBaJBXcAbual+3UZll8tObdM1jDK/AZ+Aw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOQ4kbqA+EIc95hena4Nop257TfTI1zxdQKxtxCvINVuAXaAL+
	Y4gU+5fnpfuvuZJOiMRv0i9Gfd1KaxCMq1G5C0ik39igfopYEUee8SEi
X-Gm-Gg: AR+sD10MC+QzMGt9xuwu47lavV6aI1u8vKdoXGSpo9fD81oXC0ZUohiHjr4+6CZ8eCB
	sihq77Z6la4e68GkPIqMNttbg5EsA018lmBTuxbhTk4aISZVbIQpMOSqtAKIfiTMRDwNJ27RPFp
	KBbsKJmEiMKAi34b6y1eRrtlLjxvRXApK6NQA2AGGTzkvaOYtWGdgwAWNOdr2eMFJ9WpI4xYnuu
	fyG4AJ28Aj46a9KUKLC2FnnEiki1Ffwh6MQGjSuGB1v4+R0lnQAdtnNvMYEdt8FylyN2kKCMkXw
	3MdgJ6PdcTXnZ3UdJ4gslaL4jBwLKtxnDqkyPEbSz32hAR/HJ66A+8jZ3iYeEol9saZaWmij5Qq
	tIOpg7RDrirtaxakd4AgHcSmT5nKt+cadID7N2bxYSWLRTe+fsp/6RBOIxkMs17GF3FlbUXbB0U
	XXy1N6sHVLy2JXbobIJ99wZJ7W2OwqeHcN6nhLQgDHT8aEs6xKZdi5sX4DFg==
X-Received: by 2002:a05:6a00:1ca2:b0:847:8ccc:d7c6 with SMTP id d2e1a72fcca58-84f2e0278d5mr31776713b3a.31.1786174685244;
        Sat, 08 Aug 2026 00:38:05 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58dce5sm1891208b3a.58.2026.08.08.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:38:04 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Thompson <danielt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwrng: npcm: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 15:37:48 +0800
Message-ID: <20260808073748.2649808-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

npcm_rng_probe() calls pm_runtime_use_autosuspend(), but neither the
probe failure path nor npcm_rng_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: c98429297d8b ("hwrng: npcm - add NPCM RNG driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/char/hw_random/npcm-rng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 40d6e29dea03..43f96abee753 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -118,6 +118,7 @@ static int npcm_rng_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register rng device: %d\n",
 			ret);
+		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_set_suspended(&pdev->dev);
 		return ret;
@@ -131,6 +132,7 @@ static void npcm_rng_remove(struct platform_device *pdev)
 	struct npcm_rng *priv = platform_get_drvdata(pdev);
 
 	devm_hwrng_unregister(&pdev->dev, &priv->rng);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.43.0


