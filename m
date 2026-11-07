Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18C606A326
	for <openbmc@archiver.kernel.org>; Sat,  7 Nov 2026 01:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKATQmCP
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLyyP0bmJz2y7W;
	Sat, 07 Nov 2026 12:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794014684;
	cv=none; b=XQExT/j1aU2YrX+tut5nDsnEJ43rpO9tP9Y5igNQYwlPKXjbPnuUwS6b2dYyVDgsds/DBnFISwvHUQJJDRac5lN8hYKyLv4KRe6nkKj0B+Ap4EiArWUiZ/6enDhDV3PWaPDFkXGvy0w0z82Xv/TT7vrQizUkdFC0VJ6X66lsO42Quz/QgGXM+YReAwKE8P+3/yjHg/emuCD24bXup7SDe74HjANzIQ7NkYnjO3gQ7G8YT9Wb1BnKzuShgyY/wSt1c+isdCcTF+X7pMvlERG9J0EchFxhFTp0rKdtjqC1bQCAGku0G3i6DL0ncFhI0lPdPuPhNNwzHR+tZfIkJNR4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794014684; c=relaxed/relaxed;
	bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fs0W1HFOPnfQXXlQ7nUlVA0MwuetNPjjkL5RxLn5lNwI0cSYe8CChiRaswEaeyMz3djo0omPIgAVeEev1EkfM8l0nGWJlBXDxhVsaFKyx840pEaosUlL3jVTy6PFP8zMxK+fvhOBQNz0MrOnVhBbf3DKndKTx3QKGLzmpHK1Jy96ZtPsZedfbGHHdF1xZ0aPCP7bms+1eS+pc3haORUXrpkpC4d0HIYMSLsaASR2mIP+7YxjE5KqZcn5xDRoBlSDTs64dG8H1/F3hx3YBRY5Q2Fcy/IALPyNWUxHVHeRK5HJQAjzL4XGNd6RsG95mm0Z9eL9EDFLE17zn1bkXSGLAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKATQmCP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKATQmCP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com [IPv6:2607:f8b0:4864:20::1332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jLyyM2q23z2y2K
	for <openbmc@lists.ozlabs.org>; Sat, 07 Nov 2026 12:24:42 +1100 (AEDT)
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-37000e7234bso1517205eec.1
        for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 17:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794014680; x=1794619480; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=BKATQmCPOl66ctIsElSERo0a9dc45IgBv+FazmnqkEA9J0895D+dnXgkVqNuCm4LM/
         0l08jVv+0WxQiNN64vi4SqQlJ+XYtQXOeWud1qq3gTH8njYvADTCWl5MT9ShImmT6fM7
         ZngKTPPYNyleE00x94RufghOkZOzFXlTbu6vQLdkwRmL2matO8cX3XtCPmU0PY47NKix
         ugSM2ruJGkM8/rYGZ6DqQxB9hrS2At8SQpOFWDt2bytv1G1zYQHpeX3chW2tWUoqGjX0
         JxPxsn+fSYnobA3RvViWg3BXOAKRoBZorcH7XXUeyfYdbC/tvp6jHT9LhjFp5NnISsD9
         l9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794014680; x=1794619480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=OmHydvmVV0tosQ2eMY9RU5ibw5SigIpZQPhyS0ulBmohq47DDmBo9KGyzg/3VYPHeI
         JOJAHKVAVU7wulzwDagJZv3X35mtOegakV7KT6bwNHAUfVVnwx1MWFgg7qvDykURK3Q3
         EAkKy4ivj+J0zOq4hcU162fOmL/8nO5Jcz0KV8V1RdqS8rezBam4u3b+N+R5zeOn3Tf5
         Kfqc8fGOlGrQZxaMaiOHMuchPuHF+ov80Mr1dtO8g6lf2MQ7/dtHWl+i4UIO2eqxuQGO
         IxUGwqpBeaYk71px57tWVMms4otGSlDIJvTT7DH34pgqWb3qWxMjKrnwD9TnAjzS5C30
         Mtgg==
X-Forwarded-Encrypted: i=1; AKwUvBzMsowKvwmYJKfMVPxPkvZzYzEtlx1VN1ch3t8q73zXB+iBtZdbZ6xWBOyinMpIEZ6jEro0Oa+z@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/By80hRjdBMo2igewe/BAbvu47w2hs6l/iFLHabEcUdwK889s+
	84U2gWoy0lwU1kfQdajnxJUg85xEtmVJ3ZWRhCY94s7Q9XcEMX2nnKg9
X-Gm-Gg: AYBFou0LAk6DOpxvZRUNCyMFtnZEEegbPDtrDoCR+wi5YqQy3EAE6Rlu5YqRAZdfjRi
	qBD0i7wxGZZeeIfm6lpWnhSWFd8wkyUjwuP9ry3NbS7qzapEyVtu05WvPidH7hXqzZzr+2kUjU7
	Bosmryg2zdLi11+NxYQxQnCsENZMXJLBnPvwc/YulvBoCt3uS0Uc7TPVJVQO4Lbt/SuKYXIJyAU
	A76rPMxntjYxDNyV7/axmyMKtEPeH+ez78QdUV9wXwxWq2nyDFkluj9U0CPeQs2LPMB9ZfQSyYp
	5NkR+ol1K9wRR4Lf2qDCs+trtMGpFFu4KA2VFGS7GxoRIh7tWYaNSGfF1lUQ8dDAswsaxy/KXij
	4mb24EyfnOITq7L6HVGOqMG9J8Hcm7lRg+rlM7wVQD57RQL6UcFj8uBaCzVylV+llWLR00IQGAP
	PurNekziiKZzZG0o9B7pGG/d66k74PN+Igw6IlPlfkDPbdIspv3K432dZTKAMnhgCcFTjurjVcc
	8U+83o4Lvlq+mHouEkNO/5bEYCtVmrk5ZGrQyL37+VJytC0+RSiDrcduv7edaaeGaAemy9LgN02
	X6FYQs+btI0bgKspIy4NAiGkOluam/J6by8BwJxFCIrbHA==
X-Received: by 2002:a05:701b:2905:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b25d3190eemr4699302c88.19.1794014680193;
        Fri, 06 Nov 2026 17:24:40 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm8436986c88.8.2026.11.06.17.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:24:39 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
Date: Sat,  7 Nov 2026 06:52:36 +0530
Message-ID: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3


