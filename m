Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63f5YydzDqFL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="a1s9IA06"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FJcxg+75"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CB7D207DA;
 Thu, 27 Apr 2017 02:09:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=P0Zg/N
 nkZShycwj5IC0CkeX1JMM3K7kDRf4nY7LhQBk=; b=a1s9IA06W3VEPSxRkpOOzL
 YNVbkFNaHyp3FbZX8s/lqx1RKFmp01QWGNUuWCuFmAGgYgByA8k34WIqrW9P6IbO
 +DkLYbQ6aMECdtCpK9itMvzki0txU36UrGqqhVRtZnPknCJ1Yzx9kircEwZhD8Zg
 doIMmmegR1CrylYH0cqN0RyVeRGBZaoax/U6y3jKz7fc99HfmkoqXegV7Bt4eXIk
 O1X5zlROkGsjl4EAXuzCO0LJ99PrpwRhDczqk7N4wUprwF2ZdlL7mpbCipXHsUYF
 qqN6f8BVxLSwJfnSDpGWpyHnat6o0UNixA/hUxnRhaVamcCbWY3ixpxIZbW0I6Wg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=P0Zg/NnkZShycwj5IC0CkeX1JMM3K7kDRf4nY7LhQ
 Bk=; b=FJcxg+755L+HwiJAx+tBsP1DkNEOVEbRKGYMj7yYHXWfhOK7VVgHyyhH7
 XZsDBbkvuHNNwlVzY2nFqTHvooOeJ3jPThEydpQ2n3WUnysanpeGD1quMgRIiQZk
 CTKA7hEOXq4XuA/0Ku4zJqmDCBXdr+lM46zmAasBNzE3INoj8AtzuvsYebezucUm
 rqRt72q6CLXI9qQsf390KOiYGZNctFQ9+aUkQDlr6Bf9Q5/5pQptG8DD7WtMB0oU
 35VEfRuqHboCuTYVzeaQXYh3Nx3TU0X/7Tlj3abudTth5FA5jh4xosbcYYHRqLoR
 QzoyojSWZAWGCgKcXGR8QuaxtMlmw==
X-ME-Sender: <xms:HIsBWZQ6XpUIkPtrFO2tGifJYheihNVgcSdBH9lSOAHvZ4iqlYZuvg>
X-Sasl-enc: ET2apHqxfCIdwRmxMlqMerNRNjWBwKGHuVvOt/uhRtPn 1493273371
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A22E3241E1;
 Thu, 27 Apr 2017 02:09:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 07/10] aspeed: zaius: Remove manual CS decoding
 window configuration
Date: Thu, 27 Apr 2017 15:38:20 +0930
Message-Id: <20170427060823.32226-8-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:35 -0000

This is now handled by the SMC driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index e879e9e1aa42..ded756b4fae5 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -136,12 +136,6 @@ static void __init do_zaius_setup(void)
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
 	writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
 
-	/* Set SPI1 CE1 decoding window to 0x34000000 */
-	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
-
-	/* Set SPI1 CE0 decoding window to 0x30000000 */
-	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
-
 	/* Disable default behavior of UART1 being held in reset by LPCRST#.
 	 * By releasing UART1 from being controlled by LPC reset, it becomes
 	 * immediately available regardless of the host being up.
-- 
2.9.3
