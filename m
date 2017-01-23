Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6KYz2LLpzDqRF
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 16:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cVYbwhIr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NG4TZhEw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 322C721374;
 Mon, 23 Jan 2017 00:27:01 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 23 Jan 2017 00:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=GIW
 FJmVHWIpLXu+p+r8yGkZhfvE=; b=cVYbwhIrc987rd35DZRXNWPOogXr+m9a50R
 DDv0Bs/njB2anPnxBUMgUQvMkc4jQzjvoCG0eHE+9NWUf14ea5DSYYp3zWRPr4Yb
 ORSqR22nRyLFsL1xLZBGND+HE16udTnl/2L18maqGsQVXCewmXzLlhZr2SOx26JX
 ReqUE9yA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=GIWFJmVHWIpLXu+p+r8yGkZhfvE=; b=NG4TZ
 hEw0AxQwGEdIHmI5y9d7FZ9hlvteRBJjgIKvArr3Pr4wWOAdcgMB42dUrMGLoAUG
 XeyFM0FIHlf/+fWXl1JPUwoVM+wBRe5V6qsqxvpdb/3rIGKHU1pGjV+zfgcqQvyn
 F0IfVOUwJrJI8FviUOMLT8zRsKlv5ibioUtpwM=
X-ME-Sender: <xms:JZSFWMZJlCyedqIUsYXof2iq2lQVB0gOo0pC7AxuYRZQyLX1kjXiWg>
X-Sasl-enc: /i3bqS1Bj/bwvQR/MmafjOfDg0YbP49xTMiXgXmEQZO8 1485149220
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88B7F7E23C;
 Mon, 23 Jan 2017 00:26:57 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] gpio: aspeed: Make bank names strings
Date: Mon, 23 Jan 2017 15:56:06 +1030
Message-Id: <20170123052607.9424-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170123052607.9424-1-andrew@aj.id.au>
References: <20170123052607.9424-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 23 Jan 2017 05:27:03 -0000

From: Joel Stanley <joel@jms.id.au>

The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
documentation uses two letter names such as AA and AB, so make the names
a three-character array in the bank struct to accommodate this.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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
