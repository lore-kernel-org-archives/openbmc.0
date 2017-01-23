Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6KZW5KqBzDqRl
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 16:27:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="B12PUhhE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="n4C30g1H"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ABB88211B3;
 Mon, 23 Jan 2017 00:27:29 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 23 Jan 2017 00:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=U1+tv8pmjHsqtwUsy9cOut6L3Yw
 =; b=B12PUhhE1hC2A/5c2fBYrVFWhtgVVzfd6CCvcB4f1kodr2lVYiR2WbzYupm
 0X/pwcRMWI2SihN3QGY7b2uPWTi3+cQR+zhi1wlaPBPrYLmSHhr1PbLvtdArjP1J
 SkJ+nfiRZgYV1vXMeruWV4EMsFpS8XRE0d6NQd/VKDM3S5JU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=U1
 +tv8pmjHsqtwUsy9cOut6L3Yw=; b=n4C30g1HagMGV9Wqj4eU6T0rJ0ETLK5ZgZ
 Xektvz7Q3AZPjRVc76d5OeGtvJbeT9kS/SlQanl4b0P/piw5u/KKMxqunbly4p7l
 hD/v1YxfGCEWG1ELAmwsRgCibxOdllp0AOwg2452nXyaWfjhDD0SogLsHiR85HvR
 5720PMqJY=
X-ME-Sender: <xms:QZSFWG8HpIrS0ZaiEODdU0qnEXX-UE4jnj_Ms4BspipiBLuGrvg7Sw>
X-Sasl-enc: PpKbrEw3ntIYNM/0AJUhJQ76UTHvMhgqvozQC6OlJZOC 1485149248
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9F20924077;
 Mon, 23 Jan 2017 00:27:26 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH] pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-7],
 AB[0-7]
Date: Mon, 23 Jan 2017 15:57:17 +1030
Message-Id: <20170123052717.9528-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Mon, 23 Jan 2017 05:27:32 -0000

Incorrect video output configuration bits were being tested on pins in
GPIO banks AA and AB for the ROM{8,16} mux functions. The ROM{8,16}
functions are the highest priority for the relevant pins and also the
default function, so we require the relevant video output configuration
be disabled to mux GPIO functionality. As the wrong bits were being
tested a GPIO export would succeed but leave the pin in an unresponsive
state (i.e. value updates were ignored).

This misbehaviour was discovered as part of extending the GPIO
controller's support to cover banks Y, Z, AA, AB and AC (AC in the case
of the g5 SoC).

Fixes: 6d329f14a75f ("pinctrl: aspeed-g4: Add mux configuration for all pins")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 09b668415c56..7de596e2b9d4 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -1615,8 +1615,8 @@ MS_PIN_DECL(L19, GPIOAA3, ROMA13, VPOG3);
 
 #define L20 212
 #define L20_DESC	SIG_DESC_SET(SCUA4, 28)
-SIG_EXPR_DECL(ROMA14, ROM8, L20_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA14, ROM16, L20_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA14, ROM8, L20_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA14, ROM16, L20_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA14, ROM8, ROM16);
 SIG_EXPR_DECL(VPOG4, VPO24, L20_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOG4, VPOOFF1, L20_DESC, VPOOFF1_DESC);
@@ -1625,8 +1625,8 @@ MS_PIN_DECL(L20, GPIOAA4, ROMA14, VPOG4);
 
 #define L21 213
 #define L21_DESC	SIG_DESC_SET(SCUA4, 29)
-SIG_EXPR_DECL(ROMA15, ROM8, L21_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA15, ROM16, L21_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA15, ROM8, L21_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA15, ROM16, L21_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA15, ROM8, ROM16);
 SIG_EXPR_DECL(VPOG5, VPO24, L21_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOG5, VPOOFF1, L21_DESC, VPOOFF1_DESC);
@@ -1635,8 +1635,8 @@ MS_PIN_DECL(L21, GPIOAA5, ROMA15, VPOG5);
 
 #define T18 214
 #define T18_DESC	SIG_DESC_SET(SCUA4, 30)
-SIG_EXPR_DECL(ROMA16, ROM8, T18_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA16, ROM16, T18_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA16, ROM8, T18_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA16, ROM16, T18_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA16, ROM8, ROM16);
 SIG_EXPR_DECL(VPOG6, VPO24, T18_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOG6, VPOOFF1, T18_DESC, VPOOFF1_DESC);
@@ -1645,8 +1645,8 @@ MS_PIN_DECL(T18, GPIOAA6, ROMA16, VPOG6);
 
 #define N18 215
 #define N18_DESC	SIG_DESC_SET(SCUA4, 31)
-SIG_EXPR_DECL(ROMA17, ROM8, N18_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA17, ROM16, N18_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA17, ROM8, N18_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA17, ROM16, N18_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA17, ROM8, ROM16);
 SIG_EXPR_DECL(VPOG7, VPO24, N18_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOG7, VPOOFF1, N18_DESC, VPOOFF1_DESC);
@@ -1655,8 +1655,8 @@ MS_PIN_DECL(N18, GPIOAA7, ROMA17, VPOG7);
 
 #define N19 216
 #define N19_DESC	SIG_DESC_SET(SCUA8, 0)
-SIG_EXPR_DECL(ROMA18, ROM8, N19_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA18, ROM16, N19_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA18, ROM8, N19_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA18, ROM16, N19_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA18, ROM8, ROM16);
 SIG_EXPR_DECL(VPOR0, VPO24, N19_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOR0, VPOOFF1, N19_DESC, VPOOFF1_DESC);
@@ -1665,8 +1665,8 @@ MS_PIN_DECL(N19, GPIOAB0, ROMA18, VPOR0);
 
 #define M18 217
 #define M18_DESC	SIG_DESC_SET(SCUA8, 1)
-SIG_EXPR_DECL(ROMA19, ROM8, M18_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA19, ROM16, M18_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA19, ROM8, M18_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA19, ROM16, M18_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA19, ROM8, ROM16);
 SIG_EXPR_DECL(VPOR1, VPO24, M18_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOR1, VPOOFF1, M18_DESC, VPOOFF1_DESC);
@@ -1675,8 +1675,8 @@ MS_PIN_DECL(M18, GPIOAB1, ROMA19, VPOR1);
 
 #define N22 218
 #define N22_DESC	SIG_DESC_SET(SCUA8, 2)
-SIG_EXPR_DECL(ROMA20, ROM8, N22_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA20, ROM16, N22_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA20, ROM8, N22_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA20, ROM16, N22_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA20, ROM8, ROM16);
 SIG_EXPR_DECL(VPOR2, VPO24, N22_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOR2, VPOOFF1, N22_DESC, VPOOFF1_DESC);
@@ -1685,8 +1685,8 @@ MS_PIN_DECL(N22, GPIOAB2, ROMA20, VPOR2);
 
 #define N20 219
 #define N20_DESC	SIG_DESC_SET(SCUA8, 3)
-SIG_EXPR_DECL(ROMA21, ROM8, N20_DESC, VPO_24_OFF);
-SIG_EXPR_DECL(ROMA21, ROM16, N20_DESC, VPO_24_OFF);
+SIG_EXPR_DECL(ROMA21, ROM8, N20_DESC, VPO_OFF_12);
+SIG_EXPR_DECL(ROMA21, ROM16, N20_DESC, VPO_OFF_12);
 SIG_EXPR_LIST_DECL_DUAL(ROMA21, ROM8, ROM16);
 SIG_EXPR_DECL(VPOR3, VPO24, N20_DESC, VPO24_DESC);
 SIG_EXPR_DECL(VPOR3, VPOOFF1, N20_DESC, VPOOFF1_DESC);
-- 
2.9.3
