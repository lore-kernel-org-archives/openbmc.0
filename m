Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF34B27vbzDqBm
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 14:58:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eLGvwtao"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HkyPZplt"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 408562085F;
 Thu,  2 Feb 2017 22:58:00 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 22:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=EvH
 8UOByL4CQtcllIdPcKeHz7Ko=; b=eLGvwtao3jVV3CSHREaYPaRTQRS9kcTbXsc
 bSnsPoQLvCFfx8bjgwBuLVzSGxyfj1zoOrjtqlAW/XocTeY4wAL8GzeBJdg/KgIl
 Ma0oarwY7wyrf1AG+hSP/j8ceo1sQnGotsutnoAo1fhiPFZxL2drJeFooYjhz1z8
 07+1aL8o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=EvH8UOByL4CQtcllIdPcKeHz7Ko=; b=HkyPZ
 pltAwdlj6hVWtMnvs/aNV3IEI2yAdEAUUDPcdYl3OnMW0FwOzyJpV9fVVmSKVUoj
 PMfwDr+ZaINtmCtx1iY1fWQAGgn80YM2ZmduzbvR91mTHB+eVm0wyUxmJoTvnh1N
 E8UbIaBPLzqD5vCAd79jogNT9EOdjaOxi5WWUQ=
X-ME-Sender: <xms:yP-TWE1Tpl6v9UpTqq93r3GS7LKtLYFeRJaWtQQU1VYiPhFCQaQGIA>
X-Sasl-enc: C/eGFSNnmlZH9MN9QKjFKd1tkCmVqG1fWgSh/Plh2Cn5 1486094279
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE07424066;
 Thu,  2 Feb 2017 22:57:57 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH linux dev-4.7 04/14] gpio: aspeed: Make bank names strings
Date: Fri,  3 Feb 2017 14:27:06 +1030
Message-Id: <20170203035716.646-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203035716.646-1-andrew@aj.id.au>
References: <20170203035716.646-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 03:58:02 -0000

From: Joel Stanley <joel@jms.id.au>

The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
documentation uses two letter names such as AA and AB, so make the names
a three-character array in the bank struct to accommodate this.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit 7153f8ef679d5fcb2d9c69a19613399194600f5b)
---
 drivers/gpio/gpio-aspeed.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 03a5925a423c..20f6f8ae4671 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -28,39 +28,39 @@ struct aspeed_gpio {
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
-	const char	names[4];
+	const char	names[4][3];
 };
 
 static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
-		.names = { 'A', 'B', 'C', 'D' },
+		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
-		.names = { 'E', 'F', 'G', 'H' },
+		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
-		.names = { 'I', 'J', 'K', 'L' },
+		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
-		.names = { 'M', 'N', 'O', 'P' },
+		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
-		.names = { 'Q', 'R', 'S', 'T' },
+		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
-		.names = { 'U', 'V', 'W', 'X' },
+		.names = { "U", "V", "W", "X" },
 	},
 	/*
 	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
-- 
2.9.3
