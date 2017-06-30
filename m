Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzQSJ3vCpzDr5w
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 15:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rmhg0nPr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qibn2URZ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A33C2100F;
 Fri, 30 Jun 2017 01:43:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 30 Jun 2017 01:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=Cj9/FSquJfV3+D0L2nfxtxj6qqjbEh
 pm9nQQcD+DQJA=; b=rmhg0nPro76srMHj9L8MSiLRb0nYyqaTxGy8VbVDIpaGU4
 If3A7uPzc32KlaPbnbojG24InekiQALhHVGXXRjYj53U4mzH2UVgulAZY399zUxH
 DsVCWU3AglSKWRAXGQJR0RduiZd5vjOT79JkmPNxbX8WXnldFkoD/JrJzj95SxZz
 rozad9+vYoMshC5xnoRb6a3kSc9ucfhpLwDwtciamxDlQcg72CP3rbZ5lecH9J55
 8DdbajnUSKrxvhyQ54RfHyOIDWb0vzs97l3omw2R3D2Q6aSSshCoqjBOzLzEJrYE
 m9jvet83gVXdXEi+2O7Xf0FvnDSN7Xqsog529ljQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Cj9/FS
 quJfV3+D0L2nfxtxj6qqjbEhpm9nQQcD+DQJA=; b=qibn2URZUe8+VHLVH76aCZ
 6TzsliLqf7wHS3vqaCAhWhpPs+qS1hJLvLNVXnMnhQeEjhEdtKbADVnhj9Rv2usS
 eR4DN2lA6JNUD9S37Zw/fYuVOzwT5gC2QQARmmXvL8c6LTFBIODyxMr4HfKnMUhR
 YZyTxIVzbLSVD4ETByzV+WUgJFgq/iNm+Vb/H51DsJ+rqo7ylSSW4eQJYesLzrbg
 +PjCDzq0tYRrWR/gQyP87PPAXd2Nw64ky17yH33AO1LkdFMvj8CakVJEhgFGX+Jl
 xlGed1H6QenryrZhnfNeZfqcQR2W3pV9hCbKyVXeqrdGPqxTb4WPm1XIFQcdI3DA
 ==
X-ME-Sender: <xms:DOVVWf6e6xHNJNKZ0l9tXP3BoYHHZQinfw5HWFZBpwrm-Fir4OjCQw>
X-Sasl-enc: Qknhk/++vO6eU9xqxUUt9Usle3QNP523lHxW2CACYiF3 1498801419
Received: from keelia.au.ibm.com
 (ppp118-210-130-225.bras1.adl6.internode.on.net [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id 10BA424232;
 Fri, 30 Jun 2017 01:43:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 spotthur@in.ibm.com
Subject: [PATCH] ARM: aspeed: palmetto: Deconflict FSI trans line and hog of
 GPIOH6
Date: Fri, 30 Jun 2017 15:13:02 +0930
Message-Id: <20170630054302.20162-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 30 Jun 2017 05:43:45 -0000

The hogs are left-overs from the Bad Old Days of Palmetto development.
The specification of the trans GPIO for fsi-master-gpio conflicted with
one of the hogs.

Remove the hog to allow fsi-master-gpio to allocate the GPIO.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index f7a7cbf77aba..a171e41790c1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -295,13 +295,6 @@
 		line-name = "SYS_PWROK_BMC";
 	};
 
-	pin_gpio_h6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "SCM1_FSI0_DATA_EN";
-	};
-
 	pin_gpio_h7 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
-- 
2.11.0
