Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QrtE9kzw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bUMap9bR"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjS4kVFzDrKC
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8510C20CAA;
 Tue,  7 Nov 2017 02:32:10 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d2sif+trFNrk8EaEq
 bpPgDd9xOzrgIN5Xv3evoe1a/k=; b=QrtE9kzw3S1OWxHPcjppQ80FL6KPe3Cre
 OUa8DPx3SJAK37xUTswnIea9PMxqj+W1mOi9GSqNZHO5kXBm01L9qCfT4Z+ZrOHS
 g1elV1dmAb52nWxZ/+v/QOxi8e5fuC501Xq/XQqyaJ6synUv6AbhfEbSoaYErvIG
 V5AZaYHY1RyLhV1J+HNcxzJe8AUbZ3wJAkT1IEe7VVbYKdriQ08AvVCQGKwWX5gZ
 aYGlYFOvKV7uHikcbAzwuPq5Kv0ZfkUawCcXcVGCurkkZwWWcgIW2FP4mDuMJcP9
 BjQ98xVYdqzUc9E6//v89pclb+jgEjusjYwPnXiTrqp8KvfPsEpUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=d2sif+trFNrk8EaEqbpPgDd9xOzrgIN5Xv3evoe1a/k=; b=bUMap9bR
 YhZhozxHS7cSkDCKExq7AIz1LiFTHXVTaitHHtIZiqJmtXrvc+SdF8LfGqDcUBqo
 EiwsPOJg/4yFTmrYwRk9xp4bnCCeCxwqHXkvZr/fBI7W2B7f61bmEZORURFdaMP5
 gL4iezMMqIDbcmy69phP1BcxnpvUmKzlo0P3jD5wH0g2HQn8GMffBn7KoQCQ0VYn
 Er2rO1IgteHC9orDU7piBRiHc1xWvkOcBN8C0tlqLevR85c0SRI87CDZLexyzDlL
 gjLVWgBashX9TYowWlEg2WeVVq3yoCZG3O0NQxFL3YWizKZrSpqkax5Nq+WWbqt1
 Lb6SvHcN8sBJ4A==
X-ME-Sender: <xms:emEBWm5MWfZyFVVp-s-iGORLe6u66rONdYhqLoDusdGt3fYBbFGsQQ>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BAA10242CF;
 Tue,  7 Nov 2017 02:32:08 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 20/23] watchdog: aspeed: Retain watchdog
 enabled state
Date: Tue,  7 Nov 2017 18:00:43 +1030
Message-Id: <20171107073046.13319-21-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:13 -0000

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
