Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w005m31ZzzDqKB
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:59:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tzmz6zNk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hE3bY2C3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53C73207E4;
 Fri,  7 Apr 2017 08:59:22 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nRzvMY
 AW6eFlWpbeJw48QDdI16aOI2n9WC56po2lTOI=; b=tzmz6zNkcAig9K99yRO7e6
 eJ/RUWEYLKXvlv3P2JDgoZ5bcU7VB/YTBocJOZmq8i2mwBxIdrsaMEUNGeHXUFoH
 GqAJW05ZIN5Oz/JUUKu4J3ubBcC/i/POBiFSrpHV3sKGQ5rPUFwG+ZDTv04XcQp2
 hE66Dpzd2Nh0iOMMB3jRMACTTQPo0PKJQaK3JxAdVhOjCtMGSnnHcncXghpwoSNw
 hjwTvsyUikHkj3tx+jIirD1jzuV1RzDZSQHk/QBXJr+lW3Dxg0hzRPGc9QF/+Kd+
 i+i0s8vaj7rzCqSjoNYneWi6LHUIT5p25HM4n0UAVE1s/DHQ4I7jwzOB/+YIETVw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=nRzvMYAW6eFlWpbeJw48QDdI16aOI2n9WC56po2lT
 OI=; b=hE3bY2C3xH5/BmgjtGh8D0x9+W+fyVEQIgcNWlrN1aZzRc4YdyJZ2oRq8
 ne5pz5izK1qE71DrZb64UHhC5OVITN+Mn5QbskBHqyHKUb7r0Kyc8Amzbm5UYQ+W
 TrJgbqriL8kXCbSVtz/o0eNDB5oZ8l4YOj1a2hx0WkQYUBB/pvOaePRZqjy3BZvN
 wD3lmN41O4yndOqrKlx6xIfCpri9hCOgBNBm0oYjXWYm//2L/XrqbaYrALb2yn2I
 LGYGADy0libOyU8e0fY5/8FdM6oHXzqJDd41PJop0v1tKiyQgqAOJ5I6EP3+kuOW
 Mwet11dRIZfCoWELxSlta5VudpFqQ==
X-ME-Sender: <xms:Ko3nWL1maMTo86tRf20gQ13L5xJ35ee8TMhetJWgbpKhuaK03g03hg>
X-Sasl-enc: XTG0qIYGaLp5d5yLKgEe8/LYOGLuoSqGvY4lNJ8gcP6K 1491569961
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 80F387E71B;
 Fri,  7 Apr 2017 08:59:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/4] gpio: aspeed: dt: Fix description alignment in
 bindings document
Date: Fri,  7 Apr 2017 22:28:59 +0930
Message-Id: <20170407125902.15960-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:59:24 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 393bb2ed8a77..6f30b9a048da 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -17,7 +17,7 @@ Required properties:
 
 Optional properties:
 
-- interrupt-parent     : The parent interrupt controller, optional if inherited
+- interrupt-parent      : The parent interrupt controller, optional if inherited
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.9.3
