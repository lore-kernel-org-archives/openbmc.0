Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJx5l1fRZzDq5W
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 12:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BMt466qt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gJB2gSBw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1626920636;
 Thu,  4 May 2017 22:43:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 04 May 2017 22:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GQIhm3
 98kcTwhjg1U3iuhmJYnTkuyAkj3LtHv1QFq24=; b=BMt466qtdkvJp5sC0NM9hQ
 I2gh67O+M9BFMBpO5HQ4ta8qzt1MzhRx5FF59wwBDZRuMCk/hKHqY0leq0eFY+NE
 rDfGWAVw5PwPn0V268JoBGQA2rowpOlKjs20AZkSBV7BN/z3KxOumy3w9IXfUQb9
 NMA1NBF710k3phmSD3Nwn9ZNPimDOwlRvIiv3Ww1hSHMl6/HCx/9zB4c2Twt7/+O
 qGY04Ju/0Ap4wIMTvbatARY9r4kJfaWIWvRHDah3lGJWhHTX7igC6fA7st3QlZKx
 C3xPzBPFhAYE3Ebl5V/ugkzodCPalKa8zKPITBGc5Ahh83Z4X01hHsRJxbHA413g
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GQIhm398kcTwhjg1U3iuhmJYnTkuyAkj3LtHv1QFq
 24=; b=gJB2gSBwGBmldBUK2ajS4E3LU8FAN7r6EESX4i0tO1JRGvi2ZHAkIXn+2
 kgmfItJa9y9xJ7GuPFq6PAHzRsX+R4B08IPAfFRyRZrC6qOuKx3urTk2EPiYPvi5
 GCNLwbs6mhEOA2+fIEYT1E4nZd4bty8M3swimSKXjLwu2fJlIJef5TX+QuPUJp79
 Sz6+9/+SF97VQIEYP8Bj0iEvGZ04fnwXNjrsJQXY6rJDe7HcjTRInvTWEOxTX/KV
 ghkrx330I8/ewr+AoxWrTmAqJwUZhiJoNdmkcaYxBF9WbNAT2ihHPxYWwChinMI8
 NlG6OnhYxQ4vAV3B2PU+3uqoVttBw==
X-ME-Sender: <xms:ueYLWVVljQUZh8qsl8GfuzL9mOa1yvApqzeYhaRWCtBVqO32GKFH-Q>
X-Sasl-enc: loGm2YdXoKSRKOrzDrJBRafVkY71IaY1gg2g7rHhOVVe 1493952184
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 739C87E317;
 Thu,  4 May 2017 22:43:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com, ken.th.liu@foxconn.com,
 john.hc.wang@foxconn.com
Subject: [PATCH linux dev-4.10 v3 1/3] aspeed: barreleye: Remove unnecessary
 GPIO configuration
Date: Fri,  5 May 2017 12:12:24 +0930
Message-Id: <20170505024227.30962-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170505024227.30962-1-andrew@aj.id.au>
References: <20170505024227.30962-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 05 May 2017 02:43:07 -0000

These values will be configured by requesting the GPIOs from userspace,
as the GPIO controller plumbs its pin request through the pinctrl
subsystem.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0f1a536ba1b2..88d0a59d043d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -64,13 +64,6 @@ static void __init do_barreleye_setup(void)
 	writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
 	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
 
-	/* SCU setup
-	 *  - GPION must be set to GPIO mode (SCU88[0:7] = 0) on
-	 *    Barreleye so they can be used to read the PCIe inventory
-	 *    status
-	 */
-	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));
-
 	/* To enable GPIOE0 pass through function debounce mode */
 	writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
 
-- 
2.9.3
