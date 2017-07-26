Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHg5b6DPhzDqpP
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 02:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Vwp2mEaG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="h59x/GBJ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C3CBE20ACE;
 Wed, 26 Jul 2017 12:08:49 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 12:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=I1H1VX
 U1KD0yi4yn6fpdIhMnfqG/pvyrNQ/k9pS5DVs=; b=Vwp2mEaGgXylH4zpTO/71Q
 OF7w0q+ZzNlIztX5D5R0oOAZBr73LjL/uGDgyREWpNnaYhLIMqUXHa3Hx1NzDbYW
 EgNd1B2KwsvyYzhB9wR65BL/oAsV/4EvksPm380vD2tHroLFYGk4Oygzna4OVE7D
 Ddz2cu0qKD76+x+wYrZrBlPGBv2xpBpbApxT1aMOfhaRShz/lymID/rSCMi3c+4G
 s0+G5dD1R8t3VYsH+CARKGY8hybiWM3wA3mB1RF+/eOMKPddXizx8D5JqDq2QeNN
 c8tiEtz1SWDzGHMhseCnShfT3hZbTnkzWCudw8mHLml5rskch1DuuaQhb5oToEbg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=I1H1VXU1KD0yi4yn6fpdIhMnfqG/pvyrNQ/k9pS5D
 Vs=; b=h59x/GBJdskcu9hOm1UTuUK1hMC3CGOM43a5wy0qdXK3bI3IHOE3ZKno1
 lK4Yr6SBcYZ+qwd/wavpezaryAEUfaYRv4u3kwAc7WklXqB1aImFrZ7SoW8N+tGw
 3w2Jxp7Vy5WccE76E682CMd29vSoMJdWFa79duH2u6S2EObo7uWHAMZcV7P1hPoZ
 BOjnAwrxBaXbna0wB0EPDVK7qb0bL74lLJaoJOmr/ZS+8LgNSJhw/c2q9GIYwNBx
 ex88ZAyJxuRnmhBEh3WJP1WMdf0QJ0ODPAw8EUBvXJgVXBYk/9JDYTxtH94kSc+c
 Qm/cxZpK3Rk0O81vZ5H8Myhj+erQw==
X-ME-Sender: <xms:kb54WRm8iW3us1xLpUb4d4zgdW9kMaT07wLf1wbdyoHnetshpVDrdQ>
X-Sasl-enc: ve1XsN3xOFMJpzL9YNOPJnXMNN2bqb1RO5/56K3FaYCV 1501085329
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AC8A24515;
 Wed, 26 Jul 2017 12:08:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 3/4] watchdog: aspeed: Support external
 signal drive and polarity bindings
Date: Thu, 27 Jul 2017 01:38:30 +0930
Message-Id: <20170726160831.17867-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170726160831.17867-1-andrew@aj.id.au>
References: <20170726160831.17867-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 26 Jul 2017 16:08:52 -0000

These bindings are optional, and only relevant on the AST2500 and
compatible watchdog controllers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d29f75e90bb6..9a07ef176054 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -42,6 +42,9 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_WDT_INTR		BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
+#define WDT_RESET_WIDTH		0x18
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
+#define   WDT_RESET_WIDTH_PUSHPULL	BIT(30)
 
 #define WDT_RESTART_MAGIC	0x4755
 
@@ -204,6 +207,24 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+		u32 from = readl(wdt->base + WDT_RESET_WIDTH);
+		u32 to = from;
+
+		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
+			to |= WDT_RESET_WIDTH_PUSHPULL;
+		else
+			to &= ~WDT_RESET_WIDTH_PUSHPULL;
+
+		if (of_property_read_bool(np, "aspeed,ext-active-high"))
+			to |= WDT_RESET_WIDTH_ACTIVE_HIGH;
+		else
+			to &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+
+		if (from != to)
+			writel(to, wdt->base + WDT_RESET_WIDTH);
+	}
+
 	ret = watchdog_register_device(&wdt->wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register\n");
-- 
2.11.0
