Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ7Fq0zZHzDrHV
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 20:17:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UTKJ+KNh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZOKkj26e"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 06A9120776;
 Thu, 27 Jul 2017 06:17:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 06:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=lJw3CM
 WVqGlHm9QBm3Qkn3hjY0qH7nEEgMZ+Teby190=; b=UTKJ+KNheQaZAGhX0IybQB
 eoQgeb2CnHec5QpPjWpeS9TFJ2MgiB7Q2e2rdsxtx8ESt9xzEhmSY0r1NAF1xmw3
 rz+4xMn2h+wLJDuOdA2bGNnmNkGwDBsWrbcxdpsoRAKY5ft+WP6MaqGa74pQvvow
 /9QFEY+KqTuM5LEanuxxe/tHPPf4r+zYf8JC0lSgnkxwSoQQA7PpNweWIILF0DWT
 dvuYGoZr2q1BRHDYc7cR1MK9JqOeinvAICZh3lET3WVEp6N51GFNUi9hnnlX4U6e
 1i8rpkswrYHGlZ1y72l3B8Pj8D6HtFyxM6+4V+aSk0V+qB3UX0roCYnF5LYTDD1w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=lJw3CMWVqGlHm9QBm3Qkn3hjY0qH7nEEgMZ+Teby1
 90=; b=ZOKkj26eONrQxWHitvYhJZvp9wdAwD4/TD/JarDlaTpkGMfA71Cvfqm5P
 58v8DAJ33L+YvdRFZ3KTrBwIRdYCeJ/HtBRlGF3O76dYdsgVQiOau2oUDoqsPK/0
 dkwNyYhJwzSti41au4AWKiDTci9+YGNhvyZJ+D7U8C6Pr9Nq1VzzRCG4fRImWgW3
 5oYYZczuDxFalcSThFoIXpuIayqGsLSwPRLdUMQRXVhe8kfhh6ggn4tPnqXw23Hp
 LFCbaOXDfRClJFcf+nCDZwfa1fsOxlmCG19pF5pE3RefyGt0qd7rCUS2QSW2FphK
 nHla1lcCqJS8ZrV8eNZpYIzJEKEtA==
X-ME-Sender: <xms:vL15WdDo7Pe0ZHlI8-hDsPQdlgAXBVkLImeXmeP4Hmgeg1t5wstZuw>
X-Sasl-enc: e05SwA+Nljv0KZwHJFXievx2BSnY05leJtE2bGoxVu0G 1501150652
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id C12D87E2DE;
 Thu, 27 Jul 2017 06:17:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 4/4] ARM: dts: aspeed: Witherspoon WDT1
 external signal is push-pull
Date: Thu, 27 Jul 2017 19:46:47 +0930
Message-Id: <20170727101647.26960-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727101647.26960-1-andrew@aj.id.au>
References: <20170727101647.26960-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 10:17:35 -0000

Fix the drive and polarity of WDTRST1 with respect to the latch design
which assert the FAULT pin on the MAX31785 across a BMC reset. This
ensures the fan outputs are ramped to 100% PWM duty.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c28222c17d03..6a7ab9648984 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -488,6 +488,8 @@
 &wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdtrst1_default>;
-- 
2.11.0
