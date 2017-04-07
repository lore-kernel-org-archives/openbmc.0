Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w00626rBDzDqJh
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C/Hy+taA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sD6bbTX+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D4D8420B23;
 Fri,  7 Apr 2017 08:59:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YRa4Iy
 39H6d7GxiiFHxcfcdkIUfrFzIqUldPKBGQaVY=; b=C/Hy+taAB7DibwDFu5XbAc
 n6GEV+HPz+8yT85OlKAuXFvtJt/uNzI5ZQJbQmv4X5w/bgNIrxryebnxRpH2LIaK
 JEdLyffY/er4yPn6CYYQH896MrA8gzmW+zdCbATHv3KIWpv1HiXE/HnyR6mpmwmU
 /D2xWWcPzQDXTKQGAa+HM39kgnKOWr8EmFZA94UO/K3DZ0vg9LfiMwYk32oUpWwP
 kKeYHuIRS7wqP5ERl5TwEPRP8K8/pG9akA3j/an7tgLnZ4B3H3sf/7+MZ3o8ROnm
 NT5clQngULydr6mYGqA9z8AkJ2KLUUbK0CIy4gemiK8FpoMrErCnWG02NjbM1lJA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=YRa4Iy39H6d7GxiiFHxcfcdkIUfrFzIqUldPKBGQa
 VY=; b=sD6bbTX+v4ggFf9M+YGa9uZzIG+Q06Dm17ucKLmb2836fSz51fSF72FN/
 Mf2gqsilaneDWHrp/sDk1y9g+tNheQf76duSqnRrcBnK69LRnlOrTuMJE7vg7Oz2
 8CPkv1M9tqmi4AsfIpI5G0p49I4rSlTWz0cX6eaojMfJ+FyQin0H1F+cCVY8YddC
 xOnWelCh6Pg95MbkCpRifUtyOKMj1p4DjSaVx2MvJj49/HBoJm3Mlrpvfni7Hfuw
 FNhCDwgBpY3tAZSlmVFa08AsPfBKVPSWfy3uAiiVuMdoumLLW+BMmaElhVLW+YDe
 gyMmSEKuFGlL8i3MUdzYDihkwW99A==
X-ME-Sender: <xms:OI3nWDztMgEMuzY_eWpgaHZT9gwu-8fRa5PHZRseqEwsfXIdNBFUuQ>
X-Sasl-enc: WMlcn5nuH0ozQqp4aaPOZ/ArGvaLPVVH/VNupSlvcnqO 1491569975
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 87D827E6A3;
 Fri,  7 Apr 2017 08:59:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/4] gpio: aspeed: Add open-source and open-drain support
Date: Fri,  7 Apr 2017 22:29:02 +0930
Message-Id: <20170407125902.15960-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170407125902.15960-1-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:59:39 -0000

As per the datasheet, manage the IO and value states to implement
open-source/open-drain, but do this by falling back to gpiolib's
emulation.

This commit simply makes the behaviour explicit for clarity, rather than
relying on the implicit return of -ENOTSUPP to trigger the emulation.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3327a48df862..ccea609676ee 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -761,6 +761,10 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
 		return pinctrl_gpio_set_config(offset, config);
+	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
+			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
+		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
+		return -ENOTSUPP;
 
 	return -ENOTSUPP;
 }
-- 
2.9.3
