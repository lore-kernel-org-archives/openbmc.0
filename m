Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3E606A337
	for <openbmc@archiver.kernel.org>; Wed, 11 Nov 2026 22:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc/97iSa
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPzCf2YqXz3bYx;
	Thu, 12 Nov 2026 09:46:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794434023;
	cv=none; b=iUK2oCVUfVwKO+7IBA4PlOXG+EHpQ9urXH7vcVOtb6MHwNEh4u8pU0LlD5mPyNIcxK9/OmNakzCkxDvz1x9d6By+ORMzE+EqWem+p0ax9GB0Vft7s3EH6cWg8v7c3lnIZYDg7DsGLxQFSeCjNsU5/GKCto6qe9tfACylGhWwx0kCvHwf8pNzWmhfcu8929oy6So2AHrGKDJhU1RX0uqDQH+2v/INTzckR6+oa0zOuafnozvkPPzMuTXDwkVZxLL+OuehedIwDZpYPFNCBIK68Kak5M+WM8VV1OIdQZ+uHN6cLIkRg+86zYSGza9olUR3k8koKXj9icGscVHqlg673A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794434023; c=relaxed/relaxed;
	bh=apIjcWhf6ft4S9T/nv2WWzs4no0FMzMPTMX+Kk+3eYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoCuVxoXna/QCIpQ08+l4oy7kK3RMswjFkE3z9775axDETE6381SfBqHGkjbL46He9rG7mT8PYphlOuXIjZuyDHYtlrso9dd9MCf3eLWWOJ+mypWYrDJu7jcPLGWo0UAI+4/lK0Oq9kPkjjg0cXuH9YB5RPkFsd/YK6s+leZ+ah0yRnWOrld7wTtJ3+UcZieW8RfrcXQQu58kh0fhDbMGKcymeEyxurnn0JByQudxnG7u3xoKGV9eq0QHy0D5rv/ZJ+fMqMWxK3P/0tkzYvcug10F3zPbcS71KCpIqhdjAetms2FqvTkZ6l4CJnCC4FZbRGbyP+l2swhIIWUTPJg+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc/97iSa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc/97iSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jPy2Z5LHrz2xmh
	for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2026 08:53:42 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D50AD63548;
	Wed, 11 Nov 2026 21:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524451F00A05;
	Wed, 11 Nov 2026 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434020;
	bh=apIjcWhf6ft4S9T/nv2WWzs4no0FMzMPTMX+Kk+3eYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cc/97iSavrA4IxIRd9mCOgRBAgykrO3P1diDKl3/aXyIRxwlJUUqpSPMSCXNw1mtn
	 iIVVYAuIXAY6urRd2MMraBg+A6Mf72dwzWVIWhyKArx0SHdRNjgUtELQxQMbFQhX/t
	 O7ofOti9Apk1c3OdSIIsAyasg63o96z4exmcJgmTd9TCASpwDYIdeFc6RM3sy8QdQN
	 hQqL2KrN5zXN7L77iZhjirgCf+Wb7iKRaWTC+6CShMrtyJH68UzPbm05mvCDr00xU5
	 T3Emo8nbPf5wMCebGmxAgfciuCVQsIPx2sM+7wcFyYZJskgZRtXczzsu4/KcaMbruI
	 FnQbO5/eWaYgw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linusw@kernel.org>,
	tomer.maimon@nuvoton.com,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/10] pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in probe
Date: Wed, 11 Nov 2026 21:51:50 +0000
Message-ID: <20261111215256.1982044-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

npcm8xx_pinctrl_probe() logs an error with dev_err_probe() when
npcm8xx_gpio_register() fails, but omits the return statement and
returns 0 instead.  Propagate the error returned by dev_err_probe().

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-cff468bb-80b4-4cb3-a5ff-2b3a8fdb151f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 6150cde7e824..8a7cc46b5001 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2583,7 +2583,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 
 	ret = npcm8xx_gpio_register(pctrl);
 	if (ret < 0)
-		dev_err_probe(dev, ret, "Failed to register gpio\n");
+		return dev_err_probe(dev, ret, "Failed to register gpio\n");
 
 	return 0;
 }
-- 
2.56.0.567.gdb80ae8cd5-goog


