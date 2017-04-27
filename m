Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63D3CF8zDqCC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="poHMgg89"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="U7lzzMvp"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EEA420867;
 Thu, 27 Apr 2017 02:09:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=xRgw9w
 iivg0YpGCXZcB5WUsRSgmVBv2tvx2SipQuX+M=; b=poHMgg89+WR0M+NR7b3WyC
 v5zyn8gX5sqsZFA1IMa8RAjIbmFgEHGkbLWq7zsnzoP+TGYUVtA1j6oolhzFl8i+
 0W7TSXgM3KFLmSl/bePwpU1ZA/Gr6M7DzpeQQ2sEI++V2JiKxFXRkYS16R5FeCyu
 6kC9DIqyhEIWsdqzGTDZT47bzIFLogxAidOpCO5e9Xoz0k/LGgvPiCSIUv1QmM61
 /se9QA0o7YtR1cr2XGZGTXus9grFrgXwQZb7CbY26xG27KS7lJCY8ErHYaNmTK22
 AMrBacCReKQA3XlzLF30iL505sWh4Zji+18NnbfeEFaAL0KjgN/XiLYXiH57DaQg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=xRgw9wiivg0YpGCXZcB5WUsRSgmVBv2tvx2SipQuX
 +M=; b=U7lzzMvpQ12sGYEsXXlV8BP8FmQ6B85QuFqPFq5r/oCv15Z41IUGUwycO
 vTXTHe9XW9n8YoUM7Xl9WTnrCDR/VCUq6ZoxrAoWXSXKm2aZsmtn0m9Jl3Gl16xx
 Q0lvhCqDDH9d0/hSUhFunC7YBD03DJk0ft35cYapXSyxn3Ll47uJo3sl+QtG01Yl
 cKqkW7Cv/3Hdj5maUXv2VmTfP8DHbJpHf6Non1IeKYEfyAQMU3sua0wmxBoJQTt1
 v4VD1fTi3cDwtLcb+ktPtnBtF+5zoHInhOhxP+FvGTyBOB1r3chfGkS92oq8B+08
 3e4B0oHmEBbtaxEZkIaQ9RGPPZkXw==
X-ME-Sender: <xms:BosBWVmJv3HxPJDE6xSE754ErVZzzb5kAu7zBPmNo-SISjgpKqW0OQ>
X-Sasl-enc: vgTdkcywsP58VCSJwm7joPwKEhVb18PQb+ViRYPuF+F2 1493273349
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 746E824216;
 Thu, 27 Apr 2017 02:09:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 01/10] aspeed: barreleye: Remove unnecessary
 GPIO configuration
Date: Thu, 27 Apr 2017 15:38:14 +0930
Message-Id: <20170427060823.32226-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:12 -0000

These values will be configured by requesting the GPIOs from userspace,
as the GPIO controller plumbs its pin request through the pinctrl
subsystem.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 7ac006aaa5f4..6c6bac0c3e63 100644
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
