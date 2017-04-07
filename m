Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w004w6g5rzDqJq
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:58:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V51sdM/R"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SDK4gxj9"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D95E320BC7;
 Fri,  7 Apr 2017 08:58:38 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=13pSiDyKVIUNd9ONJbBY1Mq5gFTdNA
 vNMHjLzYEik34=; b=V51sdM/RlQ1qqsRzkUb+RdFh48XawhTKRwfUxs4+SWbe2v
 5Gh7hvyb1BeLrrUshRewjgLJrN0/ZYlEIMzc9Pn3Hlxx3Zv3K6umKP3cH6pU6Wus
 6FPVfwQRJYHPWxk76B4Z/IKM6T7ws0AmdHkKEAWVCfgxs52ZzuQdApsSvE9GvKCA
 f0wITClfW38t60uquMwF6xJ0okE8XutswyfD9no9RJGRYVFipLcGT9vEft+Sg16j
 uaKlZdrPNG9LAGFRWiCPG1dZ6TyH8gmh0SeuLClOypKRzsA6cV0QrKSTrsMcH4GR
 guCIo6/lhoHEe7o1AgK6Uq+M+1SbZ4FBi/WeLLug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=13pSiD
 yKVIUNd9ONJbBY1Mq5gFTdNAvNMHjLzYEik34=; b=SDK4gxj9Q2Kbhaa99MKsZ5
 zcaWaAds3Y5P6yEmSYX0cJXRtl2xRt09WbH5vcB3zc1hwTnNyDCOpQkgFmsjfOKz
 pEa2dnAkA6DU4xhi9Jli7Fi1aFRzZynBczMmeRtBvbIQJ/so2xqgzLG4CS1vEzNl
 YAgKGbwd319C4aBi6OJzluLGFTcMEm9HA+iSaeY1mNPoJlpZ6NWKoh/D9wNSlcIY
 Tb/ScEZGfusroYolaR3FaU8sohbeN9egu8DPnVIJm5RiD8Ux++hEravmHnDc76n7
 JEP0Ra8mReAVpii2O3jhIu2s36Uc9qbgeTDl3q8z53lutNGBJobZCJNHwRh5XJNQ
 ==
X-ME-Sender: <xms:_oznWNRLUl8mCQ8NDz25_jxucSBCx8GzHpbVCYX5pIdikHdvy4tgDQ>
X-Sasl-enc: p+CJKxDofcXIxj6r/E8mVAdhrGEWtzi8DpGmvHZ1ZvmS 1491569918
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D988244D9;
 Fri,  7 Apr 2017 08:58:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH] pinctrl: aspeed: Fix unused-const-variable warnings
Date: Fri,  7 Apr 2017 22:28:17 +0930
Message-Id: <20170407125817.15834-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:58:41 -0000

Three video input signals suffered from a search/replace failure in
some copied code.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 7de596e2b9d4..731dc2352c71 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -856,8 +856,8 @@ SIG_EXPR_DECL(VPIG3, VPI18, VPI18_DESC, AB1_DESC);
 SIG_EXPR_DECL(VPIG3, VPI24, VPI24_DESC, AB1_DESC);
 SIG_EXPR_DECL(VPIG3, VPI30, VPI30_DESC, AB1_DESC);
 SIG_EXPR_LIST_DECL(VPIG3, SIG_EXPR_PTR(VPIG3, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG3, VPI24),
+		SIG_EXPR_PTR(VPIG3, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM3, PWM3, AB1_DESC);
 MS_PIN_DECL(AB1, GPION3, VPIG3, PWM3);
 FUNC_GROUP_DECL(PWM3, AB1);
@@ -868,8 +868,8 @@ SIG_EXPR_DECL(VPIG4, VPI18, VPI18_DESC, W5_DESC);
 SIG_EXPR_DECL(VPIG4, VPI24, VPI24_DESC, W5_DESC);
 SIG_EXPR_DECL(VPIG4, VPI30, VPI30_DESC, W5_DESC);
 SIG_EXPR_LIST_DECL(VPIG4, SIG_EXPR_PTR(VPIG4, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG4, VPI24),
+		SIG_EXPR_PTR(VPIG4, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM4, PWM4, W5_DESC);
 MS_PIN_DECL(W5, GPION4, VPIG4, PWM4);
 FUNC_GROUP_DECL(PWM4, W5);
@@ -880,8 +880,8 @@ SIG_EXPR_DECL(VPIG5, VPI18, VPI18_DESC, Y4_DESC);
 SIG_EXPR_DECL(VPIG5, VPI24, VPI24_DESC, Y4_DESC);
 SIG_EXPR_DECL(VPIG5, VPI30, VPI30_DESC, Y4_DESC);
 SIG_EXPR_LIST_DECL(VPIG5, SIG_EXPR_PTR(VPIG5, VPI18),
-		SIG_EXPR_PTR(VPIG2, VPI24),
-		SIG_EXPR_PTR(VPIG2, VPI30));
+		SIG_EXPR_PTR(VPIG5, VPI24),
+		SIG_EXPR_PTR(VPIG5, VPI30));
 SIG_EXPR_LIST_DECL_SINGLE(PWM5, PWM5, Y4_DESC);
 MS_PIN_DECL(Y4, GPION5, VPIG5, PWM5);
 FUNC_GROUP_DECL(PWM5, Y4);
-- 
2.9.3
