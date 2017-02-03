Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3Zx3gxyzDqD0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VyW+bLyx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="S3JuNzom"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C1AF20A72;
 Thu,  2 Feb 2017 23:21:11 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Zc5
 y+e7kaFAo5u0fnbT6oAodMdw=; b=VyW+bLyxa0usAWQiUPmXp06iLCKNNE0QMGq
 fIOOx0X9PJeMz7PqKUcPwGckyW0xBW93cvd922sh34Bo80y97ovkLmXcRjuX/ZxY
 9w6mryk/gL41/7oGaEJHwkj2mAj2X3DhhH9vRrLUzWk8TldeNrV2+5Oe5ugHFoER
 MYFcLgUo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=Zc5y+e7kaFAo5u0fnbT6oAodMdw=; b=S3JuN
 zomQwSQ42qrtWx2hEnFMwdvSuZs7VcPx1nTYnMtojJGHDSu6tlrZBBgHFNL5w51l
 KTXAugr3O04bJjeOBEfgY2irrnkMh23zm5EPpvwtBcnaRxkMw3jRs7TdeYlIA5uD
 LQV80pJrRQkepjkwkwVT+svXL7QXqfn+Kpl9NM=
X-ME-Sender: <xms:NwWUWA9v35ZacEHmsMXercEE2vARHtM2tcwOnWWPyE4PNyHRQV4tSg>
X-Sasl-enc: zU7q+iIf4l950NgjnRawzRL/4zW+A7rgwqZCdntRPac2 1486095670
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1BAB24066;
 Thu,  2 Feb 2017 23:21:08 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 06/14] gpio: aspeed: Remove dependence on
 GPIOF_* macros
Date: Fri,  3 Feb 2017 14:50:05 +1030
Message-Id: <20170203042013.2719-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:13 -0000

commit 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC") is a
(v2) patch which had unresolved review comments[1]. Address the comments
by removing the use of macros from the consumer header (this patch
represents the diff between v2 and v3[2]).

[1] https://lkml.org/lkml/2017/1/26/337
[2] https://lkml.org/lkml/2017/1/26/786

Applied with a commit message tweak from: https://patchwork.kernel.org/patch/9550977/

Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index cb37783ff857..b855c948090f 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/pinctrl/consumer.h>
 
@@ -259,10 +258,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return GPIOF_DIR_OUT;
+		return 0;
 
 	if (!have_output(gpio, offset))
-		return GPIOF_DIR_IN;
+		return 1;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-- 
2.9.3
