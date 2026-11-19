Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DB606A905
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHlDrqmA
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVrGm6LWhz30DK;
	Fri, 20 Nov 2026 07:51:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795121472;
	cv=none; b=Efmh0Vtmch7lC2arjgwd6TjDxMQs87cCFkY+bYTojsfeowVvM+5wKJnjQpruRa2sjJ620qI8He94PNhaUDNVOIy47OBRTBk3LOnZ8M2zU131VNbAlD8zxbIp8ZGXaDRGkXOH8y766Bsm5WqmId1rp62XZlpfK1lnjkDKPb15dV85qMky4aTVsJkfGEdJjtkKZcrnfz1CvOmdcU1qpNFS30+qXtdMCnJ+wB/LfukYFVvjZwCueEe5Vu7tuxDAhWtJA5yx+cmv8CIaMFJZqrs8eCFcB08ZoF2fXOS46knl8GmfjK9sAiTd6ju6g5K5TtmAS4Zpk6V/xwfvwy4qHdJnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795121472; c=relaxed/relaxed;
	bh=w785jD0T5Pisp+wBka588XQ3quIRcHgbBG4Ss1sWiiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzC/clmnKaVnQ/iYt5E+UqfnGpRx70eEywDMbcoGI2HM233xb8bPjLyICbbWBThHx0WU9frJpWWVJVxNpYpTHs7HHAWJh5NsmS+XT6wsOhrybBsr6rmB8tLMIAcwJqCE1RIw9YN0lseKksI5vQ6gUtsQOg2j7zN+ypO4EWEvzTmRIuGrpYv5bV7b48/RzdkHk6Xz8b2YcLNDRJMnlIktg2e64dhApUCABt3ClDsgOsa8KUXKrzpwCUeQSlVsErLzEPmNiEJHqf0T2AAZyV63iNdTH2WtMBg3J44jW1xrOzVdIQdeJni1pCRuyCcQrIsmgo5QBJ+VaWRJ2ik/ZZNiVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHlDrqmA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHlDrqmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVrGm0kZ1z2x9N
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 07:51:12 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97E32413DA;
	Thu, 19 Nov 2026 20:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB431F000C0;
	Thu, 19 Nov 2026 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121470;
	bh=w785jD0T5Pisp+wBka588XQ3quIRcHgbBG4Ss1sWiiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHlDrqmAGyVJJ7jlxOJX97khMiyrO1bJh1YQjOX338pdI0aV/CFTHOAc8TKSHLpLh
	 JfrK09s/D/DV6NTZwWzyUEabN0dZH8HONmxWe2LeJUowptsHR/BH4L+78qkkhY4k/l
	 dsyL84ggcTSqpAbOTXwR4Mx0nh5d8nQhwFLMimJWyBlwwIaQfYKjEpkuBzkYN1nZ/l
	 iXAHia1aHVkb0muu7TjpjyXiuUReXqF1H13//gNbxwgizzCSnN/QkGvaLOVm/dZ9ne
	 2eCDUzTE1ea72iXo6mPXAT7W8HD3JrzxwSULikzcWzaH+m9ZtzAHP+zJ8Q/txAt1Op
	 Yx32gyc4zJI6A==
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
Subject: [PATCH v2 07/12] pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in probe
Date: Thu, 19 Nov 2026 20:49:03 +0000
Message-ID: <20261119205013.2563811-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

v1 => v2: No changes

 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f300c3cd924a..6c124d8129bb 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2598,7 +2598,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 
 	ret = npcm8xx_gpio_register(pctrl);
 	if (ret < 0)
-		dev_err_probe(dev, ret, "Failed to register gpio\n");
+		return dev_err_probe(dev, ret, "Failed to register gpio\n");
 
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog


