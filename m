Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63k1kj1zDqJ6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K+mfpjzP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mW47r9ci"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 07228207DA;
 Thu, 27 Apr 2017 02:09:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3xUH/j
 EvXmmcwK1mgbup29XGDMS2ikHVDiT/ACAavrY=; b=K+mfpjzPFwXRYmhXP1w8rV
 oyc9m5WORpec2R+5LJlgMkiQG6y2SGOrSsBM+eUtjxtTutE7+L+U+jHjD6Yv10j8
 bldC8zcEV8yXG/jvjFw5H20fCBQTD3j7oXjKDQBBWDAOnlWzwXSbFn1wFWVK3l01
 iqV2xLm1eykkZSxYuYXcGLPoOrgvJhKyNUWfHhC/wfu6YjqvAk0qJ+WtzIuFInc3
 Hbg7pmvSJG8qqGrV3hJGA3VGZobUHfA+icKr0m4uY/Gg1A9zzcFzFd6BXC+7nHHD
 xI0mYtje3+cr+iS9AJ7QqTRQ9dzIGBQfj1881FsD6yTiLLVqBzXTL28H9kg9+XsA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=3xUH/jEvXmmcwK1mgbup29XGDMS2ikHVDiT/ACAav
 rY=; b=mW47r9ci+FyIvque/i0LzPDAbRAp3XVsnU9s3wYxRdp+/zUrPkSHyurn6
 pOGl5PgbTKDcbE1vrHMr+Jpz4+sC/w3/jABLot4e/8e4os7utHGOX7jcKJEHgtNp
 edm1R1SnH9eInQwZC5OFMfxYRrpWcU2QitohD8s2kA0ZmQnFXfq9aK4PorjT7ovH
 TaQsJw+jyf6lF1NiV43DHKGyu5Ayb7wW6Si9oRoTcPGLrLKaiUoFgr9Xmt58lQOM
 W8LpCTdSC7ctTAKqPyn8BXoM+SlVq7cD0V2CNa0eIDka152VUN7pMdf2kRlo5ijs
 i63l100vGChHchl5yL0ExAqErIQPg==
X-ME-Sender: <xms:H4sBWTmETGLGlxXDLInA5NLI2XK2IeYY0NtrvMbOkL_Q56O-UvBSlw>
X-Sasl-enc: +9xXcvN5fjovNvpr0qcFeowJKDFlek8Y6jF1UMvPN66v 1493273375
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3530C241E1;
 Thu, 27 Apr 2017 02:09:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 08/10] aspeed: witherspoon: Remove LPC-to-AHB
 bridge configuration
Date: Thu, 27 Apr 2017 15:38:21 +0930
Message-Id: <20170427060823.32226-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:38 -0000

This is handled by the mbox daemon via the lpc-ctrl driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ded756b4fae5..e7d01f5490af 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -149,18 +149,6 @@ static void __init do_witherspoon_setup(void)
 {
 	do_common_setup();
 
-	/* Setup PNOR address mapping for 64M flash
-	 *
-	 *   ADRBASE: 0x3000 (0x30000000)
-	 *   HWMBASE: 0x0C00 (0x0C000000)
-	 *  ADDRMASK: 0xFC00 (0xFC000000)
-	 *   HWNCARE: 0x03FF (0x03FF0000)
-	 *
-	 * Mapping appears at 0x60300fc000000 on the host
-	 */
-	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
-	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
-
 	/* Set SPI1 CE1 decoding window to 0x34000000 */
 	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
 
-- 
2.9.3
