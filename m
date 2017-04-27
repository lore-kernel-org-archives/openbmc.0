Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63b2HGJzDqHg
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JmGYVbvA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="F/oMYZEk"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2871420853;
 Thu, 27 Apr 2017 02:09:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=4tF8yG
 g3Bp9gc2NWuMuwQNZPHsJMLHnVvbuc8DlrYAA=; b=JmGYVbvAgHlmAwmyoyDkHR
 UTomNOQQRnY6CBIi/g/GSTtJzL5adSe+u+SKboLwhheBRrOwkc7EfQmJ41hZYF3P
 0C2O+alt8fhqQVBHhVQY01/N1Big0jr05m2YRI0x9qN9FGMIReej4AbIuGSSfHr8
 nHR15FUgyCZQNOK1GNd9jOYYJjcttGk9Pef9UWw1LQGsLaVt5wl9yKPqDSs996lZ
 +cm8zQzpmLAjCskCsM3Z1rcZEKN58JDXVsfVk4Z7iwfAxqvU1dyxHXbF2oxXzAmr
 9zdj9ER+AEFyZBs5fx63pwZDEBg7XmhRhPHn90Hrixfy8lUhG1Mp4uXmKVxpiwhA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=4tF8yGg3Bp9gc2NWuMuwQNZPHsJMLHnVvbuc8DlrY
 AA=; b=F/oMYZEkH6QNoShO5DDg64ZXw2nNJfgjjWPDw9NlgTUMdC0yCaOdMMk6Q
 HTd0M91pPbvgv2l/mKmaovgRVTCmbUsAscIeWfLw5le2AtcTOv/dCU6Rjgas26/Q
 cGzcjohobXEOMiPzAdROtAeDJ1WiL8kcjtsI8y/7ikXp5+NVrUcfgqoYHY28ricm
 qQE0TBs+j6o6cssidr7uVr0ZzZrkxfRR8UHEBzcGXBavGXS4P9/WOAO85lZ2nqUO
 1Bd6WCJSh6xm6w26TO3iqSoFddeUlBHjsohIz5/r04v1x/Nc02aucT7Md8OHX1Lg
 tllXFmudZSodo8Lbh9i/P8pIU0OtA==
X-ME-Sender: <xms:GYsBWeCNR7RvTfMyuUHLbZgSGbbqmpGcx4Ps0WQ15brRoOv8kPplDQ>
X-Sasl-enc: S2sSUyozBHxTpzJGmM097sw0wMQa7WNAP96z9aYiXmio 1493273368
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD627241E1;
 Thu, 27 Apr 2017 02:09:25 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 06/10] aspeed: zaius: Remove LPC-to-AHB bridge
 configuration
Date: Thu, 27 Apr 2017 15:38:19 +0930
Message-Id: <20170427060823.32226-7-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:31 -0000

This is handled by the mbox daemon via the lpc-ctrl driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index f73a72676437..e879e9e1aa42 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -136,18 +136,6 @@ static void __init do_zaius_setup(void)
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
 	writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
 
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
