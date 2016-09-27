Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk3hC5TZGzDrVT
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 00:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=aEuOeIHk; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=uv2qg3Dq; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BE4EC206F1;
 Tue, 27 Sep 2016 10:51:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 27 Sep 2016 10:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=P6FXi
 zSdx6S2b2NiwZRnxO6pcAY=; b=aEuOeIHk+wE7SOkm7fYueHkHnz2ZReV3Kk82Q
 EbcBy92bmpzbkghzQ75QrN6RPQrqMw5n1ccHHugsfsH4m/Qqk29VjfPw54H/jkkS
 9joxfGexj4Yj2HKuqLmNXV05GvcYbAX5t0EjkTw0fE+RUB9ZVw3zr8T5mq96VCgg
 FGxoEE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=P6FXizSdx6S2b2NiwZRnxO6pcAY=; b=uv2qg
 3DqFCT/38fYRwrIpcp7BS3hq4Vk5n+ZznElJyTpm3amRPFrPAPsQvdPVxfDJR0aW
 L8Hkf6ZxY1z3Vl1xFDKVeOGw//mQubmIM0UQyOM4O1M4RxPSw3z5eJc5Lseoey4n
 YXXRRHXHAIf0FNR4fh8H/bpdPfotZyc+zEf3tU=
X-Sasl-enc: jAzxUhnzn8of1yA+k/7EWvCTGw0JyTgImEbWqkwu6hgf 1474987912
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id A882CF29CE;
 Tue, 27 Sep 2016 10:51:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/8] pinctrl: aspeed-g5: Fix GPIOE1 typo
Date: Wed, 28 Sep 2016 00:20:15 +0930
Message-Id: <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:21:04 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2016 14:51:56 -0000

This prevented C20 from successfully being muxed as GPIO.

Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 14639834a5eb..235d929e74fd 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -182,7 +182,7 @@ SIG_EXPR_LIST_DECL_SINGLE(NDCD3, NDCD3, SIG_DESC_SET(SCU80, 17));
 SIG_EXPR_DECL(GPIE0OUT, GPIE0, GPIE0_DESC);
 SIG_EXPR_DECL(GPIE0OUT, GPIE, GPIE_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPIE0OUT, GPIE0, GPIE);
-MS_PIN_DECL(C20, GPIE0, NDCD3, GPIE0OUT);
+MS_PIN_DECL(C20, GPIOE1, NDCD3, GPIE0OUT);
 
 FUNC_GROUP_DECL(GPIE0, B20, C20);
 
-- 
git-series 0.8.10
