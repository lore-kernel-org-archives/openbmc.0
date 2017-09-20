Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="q94IezjA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o4XFkDsh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxpHm2njvzDqBd;
 Wed, 20 Sep 2017 15:31:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E9BE20E37;
 Wed, 20 Sep 2017 01:30:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 20 Sep 2017 01:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=d2sif+
 trFNrk8EaEqbpPgDd9xOzrgIN5Xv3evoe1a/k=; b=q94IezjAjwE3njmPLO0FrV
 EsLthd1Q5zlWYmJ1pQohwvRkvvDKiGBv8W1UojYnIlx9hiYEk37FAUkzxGFLNM4w
 2cqAg1AL3gZgWQK61AIkCYbG94D/KUyjL1fAJPc7TWEqtyjKtW/GGbU2gQnwckgr
 a0g1hOcGkglgWHgl/Oxh7m4jSJFriOwRqOh1xiZfw+NlF/q09F96d2wHuDLPhrp0
 rW0VLE7rr9//LtixJcO0KxfNmbrp3vhGruHMQroYarQ6r2UzYTu9jqWSerrfjb8r
 wUOdQq8BlTj/+dy6MSsjWubnBVl4l5jgKjizOAfloQGzYD+aeGl5mqnFDecFp8MA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=d2sif+trFNrk8EaEqbpPgDd9xOzrgIN5Xv3evoe1a
 /k=; b=o4XFkDshzKouFLv4gcFNc88XNNFc6lbSzqXGKwQ+UTbGGd0cUH/qEcbr/
 lhTtZjqQlZpBfR9bKm3Q7EIx9bBiM0qJwGJkMIaPb5aKM1zUQbEe+ExtnAx5f95d
 7lsAeCEg80a/3uAaCec/dL+ppxvihSjxYO/XZ5c+MiettHbW9+85Is7ltJnvlJ1S
 Q+p/kB7ALQU7fWnHp1O+uGYRMBYdiovozpeAU7htHIvt/hyo7MY1T9GfkOe43VQ2
 HSRg+605rwqEADwcIttJnDPoK0QFn1L0FEXRcgxJqHO+GeroYfVDumzGfsFkzX7a
 t7JfaERTzrIVwZDNBJ1IUdu9P/9Eg==
X-ME-Sender: <xms:Ev3BWa4bfLVYaXiBhiTrThe3TYYebzcdOAOeu6vgTY5rNHeCgOQyHw>
X-Sasl-enc: NodKJXea2snAQpmkMaO7EJsmdCAuUhy/D70hj61KMedz 1505885457
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A36E37F9CF;
 Wed, 20 Sep 2017 01:30:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH v2 1/4] watchdog: aspeed: Retain watchdog enabled state
Date: Wed, 20 Sep 2017 15:00:17 +0930
Message-Id: <20170920053020.6860-2-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 20 Sep 2017 05:31:00 -0000

An unintended post-condition of probe() is that the watchdog is
disabled. This behaviour was introduced by an unnecessary write to the
control register to configure the hardware based on the devicetree. The
write is unnecessary because the cached control value that is
manipulated by the code parsing the devicetree is eventually written by
aspeed_wdt_enable(), which is when we care how the control register
should be configured.

Remove the write to restore expected behaviour.

Fixes: b7f0b8ad25f3 ("drivers/watchdog: ASPEED reference dev tree properties for config")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 79cc766cd30f..6c6dd3f4c48d 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -243,9 +243,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (of_property_read_bool(np, "aspeed,external-signal"))
 		wdt->ctrl |= WDT_CTRL_WDT_EXT;
 
-	writel(wdt->ctrl, wdt->base + WDT_CTRL);
-
 	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
+		/*
+		 * The watchdog is running, but invoke aspeed_wdt_start() to
+		 * write wdt->ctrl to WDT_CTRL to ensure the watchdog's
+		 * configuration conforms to the driver's expectations.
+		 * Primarily, ensure we're using the 1MHz clock source.
+		 */
 		aspeed_wdt_start(&wdt->wdd);
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
-- 
2.11.0
