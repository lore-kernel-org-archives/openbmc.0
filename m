Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk3h71RLKzDrVV
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 00:51:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=SpwxN1vU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=X3FpVssk; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 33A58205B9;
 Tue, 27 Sep 2016 10:51:49 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 27 Sep 2016 10:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lyAAK
 CP4n+nRwdUaXc71Hs9jWe0=; b=SpwxN1vUlxnHwjqzXRodjDU1WjXpKRRR5rLDJ
 QpSI06Rz6VsgVkcOGrRBzaQbFB8V1FOVAGQsPjLkeWStZRbJ9XdN+s2SwJOkR9lF
 c9t8Eb62HQZSAJYDX5l4H6AwrUs1ChjBC95CsO2MlEFPV5ogtHKTlwBEvT1IWgKh
 iu25v8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lyAAKCP4n+nRwdUaXc71Hs9jWe0=; b=X3FpV
 sskdUOY2j9wxd6CECQ41ZynW6ZEY2Y+r/LxuuaLdq3M91HJnnhL7v21qX1d0Mu3A
 /+G2baqzAiT+cUvr5LlLZpG3qLmX0J76GZIE9imjCJR6SmISwIcwgjV4GnqAe03Q
 2gz3b43pc0TWzaOyMNMS9HexKGdOkjLaXQ1G2A=
X-Sasl-enc: /ajSQMgYL+T8G72xHMVtRbHKfxge1TB/DUWO8YNdBaNY 1474987908
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CD0EF29CC;
 Tue, 27 Sep 2016 10:51:44 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/8] pinctrl: aspeed-g5: Fix names of GPID2 pins
Date: Wed, 28 Sep 2016 00:20:14 +0930
Message-Id: <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Tue, 27 Sep 2016 14:51:51 -0000

Fixes simple typos in the initial commit. There is no behavioural
change.

Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
Reported-by: Xo Wang <xow@google.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index e1ab864e1a7f..14639834a5eb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -151,21 +151,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
 
 #define GPID2_DESC      SIG_DESC_SET(SCU8C, 9)
 
-#define D20 26
+#define F20 26
 SIG_EXPR_LIST_DECL_SINGLE(SD2DAT0, SD2, SD2_DESC);
 SIG_EXPR_DECL(GPID2IN, GPID2, GPID2_DESC);
 SIG_EXPR_DECL(GPID2IN, GPID, GPID_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPID2IN, GPID2, GPID);
-MS_PIN_DECL(D20, GPIOD2, SD2DAT0, GPID2IN);
+MS_PIN_DECL(F20, GPIOD2, SD2DAT0, GPID2IN);
 
-#define D21 27
+#define D20 27
 SIG_EXPR_LIST_DECL_SINGLE(SD2DAT1, SD2, SD2_DESC);
 SIG_EXPR_DECL(GPID2OUT, GPID2, GPID2_DESC);
 SIG_EXPR_DECL(GPID2OUT, GPID, GPID_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPID2OUT, GPID2, GPID);
-MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID2OUT);
+MS_PIN_DECL(D20, GPIOD3, SD2DAT1, GPID2OUT);
 
-FUNC_GROUP_DECL(GPID2, D20, D21);
+FUNC_GROUP_DECL(GPID2, F20, D20);
 
 #define GPIE_DESC	SIG_DESC_SET(HW_STRAP1, 21)
 #define GPIE0_DESC	SIG_DESC_SET(SCU8C, 12)
@@ -614,7 +614,6 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D10),
 	ASPEED_PINCTRL_PIN(D2),
 	ASPEED_PINCTRL_PIN(D20),
-	ASPEED_PINCTRL_PIN(D21),
 	ASPEED_PINCTRL_PIN(D4),
 	ASPEED_PINCTRL_PIN(D5),
 	ASPEED_PINCTRL_PIN(D6),
@@ -630,6 +629,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(E7),
 	ASPEED_PINCTRL_PIN(E9),
 	ASPEED_PINCTRL_PIN(F19),
+	ASPEED_PINCTRL_PIN(F20),
 	ASPEED_PINCTRL_PIN(F9),
 	ASPEED_PINCTRL_PIN(H20),
 	ASPEED_PINCTRL_PIN(L1),
-- 
git-series 0.8.10
