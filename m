Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cSq7xzff"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XXGvdE9o"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxpHw0sZMzDqSL;
 Wed, 20 Sep 2017 15:31:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EC74021358;
 Wed, 20 Sep 2017 01:31:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 20 Sep 2017 01:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1yWqvD
 Wu5I7snQChfNQ5OVcDpn3v5oxRxzPuvRT1XR8=; b=cSq7xzffBT1aHU2VQN96bL
 IkaoVlqejfZ2FoPhHReTaYgZk0dx2B0S3Cj7iqW0wQOUukrRYxQh6frcveQoBMm6
 kiQQxK0hBA5xbhCBiJcVIwzzI4RMChIHvxj+URTJhWQztwdr12QJ0PJIXUuwsMZI
 G6aEwoEl8CaHjJoJtZ/x2tamVhBK3qftooI6BveUS7fhu4lX8biFe9GVfmzwYUne
 s473RZeTYfFvpQQhnlWG0xTOuWeW+YTlZ0qfA4A6+oubaCPt+nj81vQLFmjIt+GW
 Ke/JGTJzxOZAbqO9asWVGUTTF2l0tSJJQ35Io3hTgjnlL/75Bp9A3ZHlDoh6DzZw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1yWqvDWu5I7snQChfNQ5OVcDpn3v5oxRxzPuvRT1X
 R8=; b=XXGvdE9ohXPSNKPnSBJCrmqBY4sGmi+XFOmuDB8I1gCQKC4rXnHwb4ggg
 vMKaeBxOQuFm7XvATa48A2sijPaaU9Hku2CLNHT28MIT9rV1C9txQPG4Dw9nsVNn
 poBZZr5G0zkZ9hdPsl3A+Oljrimr/staYnsBmTTTcvLEEVUGlpHTlJaSOKuw8Xpm
 jyS6bIeYcCKSpfiovmk4pLzZPnP5tDwEQAYwQCoevL65hKKaEAiRLVJBuxX8EeYy
 gBKkH0qjS8FffhKiLTqKtipXS6QPjPkhXbdn7HwPDtijXwet78p3UGrcCpoeh36B
 6rPfA2bv70vWdZmKu7ypReu3QUYKA==
X-ME-Sender: <xms:Gf3BWUnCSzIEzaUYQNFbFDKMSORpGj4fxqgLELed7_EgkACU_1yPYQ>
X-Sasl-enc: jmCtL8Mvp2nAtI+20KHYLKKvgt5omHvzEg0YebQv5GoL 1505885465
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94AB17F9D0;
 Wed, 20 Sep 2017 01:31:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH v2 3/4] watchdog: aspeed: Remove specific reference to AST2400
 in Kconfig
Date: Wed, 20 Sep 2017 15:00:19 +0930
Message-Id: <20170920053020.6860-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170920053020.6860-1-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 05:31:08 -0000

The driver also supports the watchdog in the AST25xx series, and
may work on earlier SoCs as well.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b562d2e03eb9..a1b92ebe74b6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -741,7 +741,7 @@ config RENESAS_RZAWDT
 	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
 
 config ASPEED_WATCHDOG
-	tristate "Aspeed 2400 watchdog support"
+	tristate "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-- 
2.11.0
