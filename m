Return-Path: <3AarHWwUKB1gAKDO86EE6B4.2ECEF4D1C2B8IJI.EPB01I.EH6@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e4a; helo=mail-vs1-xe4a.google.com;
 envelope-from=3aarhwwukb1gakdo86ee6b4.2ecef4d1c2b8iji.epb01i.eh6@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PUZo9laP"; 
 dkim-atps=neutral
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b52L50XrzF3Xp
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 08:30:44 +1100 (AEDT)
Received: by mail-vs1-xe4a.google.com with SMTP id f137so6786079vsd.20
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=O15kTxbgzt/RIOqNWgHWoDpGet/SMUenjSK030XOI+8=;
 b=PUZo9laPeV4bhwyEP3usfNc6fTdv9KZD+MzcnTK8peypN9NDF7s4u6t5NgYxWmH+Be
 D5P1VWwwJLS7jWlWHl1oEYc5Pd5bXcko6OwIAZiDQUlO/iaZYvFWjEV72dDH1+a/3zs4
 bFASN+k1OejoFycg1srGKdkPxSb3Ox9JsiCTvCo1+MLMiIZsc1LtJkYpHLFhKSgLoz6m
 8tmfqih1jjiRtSNsxQNCNdwI0PW+3FXKfbEZfxdvAiDJH10CA6oEcmfDXT7EZNWLLnbg
 UwObES4meMFFvqIHxsm3wlYv2gl7A4QOykJK9QjFz1NMi+dQtmKibqH8PVj6Q+Y8EB8V
 mrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O15kTxbgzt/RIOqNWgHWoDpGet/SMUenjSK030XOI+8=;
 b=tf8Ccn81bG3DzWdhqNqWVHxguG+/q1CKvSmYJtwQhOBL/dyid1+NXAo9RkFH90HM3W
 BLAUvvR1R6G+KBlnsMInFOqTCw3X2gaBswSRrWWzimB58dyZojUG+X94W1rmkhwbVYMd
 gL415+TNVyh25QtIOQ//UMTBYsI+SNWFLB+XFnQrS5VFdMsYmKMMP4BPySu8T7Mm+viw
 89psNVnU6rOZN58iBjG21yvBxZQg93V7z7YHwzZvm/LOt/bJK7Okc0YqAIQLzDhcejtj
 6wrNA/Mh8+OXvVGIcVZhdsWlTSU+Un7EkqYWL2abe/nUgCYV1BpDIo3mnN0XzQS0kLUZ
 aKFg==
X-Gm-Message-State: ABuFfoh14a+e/3rwwYA34d/Xe5FBeTO2zJ0KOtF6xzwdW/GnuDsEnGTY
 +Jd4ZPd7O9dNzBb9E6h2bvJ/lvN+kQ==
X-Google-Smtp-Source: ACcGV60fTq1qfGOUVvxGoJyLfi//QTmG+LF4Ie18gfsLcxWQbzBJtQcnsjcVlAvMhY8VdF5OcpM7xwVeXQ==
X-Received: by 2002:a1f:85cd:: with SMTP id h196mr3075269vkd.2.1539811841656; 
 Wed, 17 Oct 2018 14:30:41 -0700 (PDT)
Date: Wed, 17 Oct 2018 14:30:12 -0700
In-Reply-To: <20181017213012.233957-1-kunyi@google.com>
Message-Id: <20181017213012.233957-3-kunyi@google.com>
Mime-Version: 1.0
References: <20181017213012.233957-1-kunyi@google.com>
X-Mailer: git-send-email 2.19.1.331.ge82ca0e54c-goog
Subject: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
From: Kun Yi <kunyi@google.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tmaimon77@gmail.com
Cc: linux-kernel@vger.kernel.org, avifishman70@gmail.com, 
 openbmc@lists.ozlabs.org, Kun Yi <kunyi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 21:30:51 -0000

Indicate that the pins are both controlled by the pinctrl driver and the
generic GPIO driver, thus GPIO driver should read the register value
before updating, instead of using the stored shadow register values.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7ad50d9268aa..ac7b69d53aff 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1904,7 +1904,8 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 					 NULL,
 					 pctrl->gpio_bank[id].base +
 					 NPCM7XX_GP_N_IEM,
-					 BGPIOF_READ_OUTPUT_REG_SET);
+					 BGPIOF_READ_OUTPUT_REG_SET |
+					 BGPIOF_VOLATILE_REG);
 			if (ret) {
 				dev_err(pctrl->dev, "bgpio_init() failed\n");
 				return ret;
-- 
2.19.1.331.ge82ca0e54c-goog
