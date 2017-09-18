Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ilEDdyWa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OXQB1/kd"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZpn2TdHzDrbL;
 Mon, 18 Sep 2017 15:50:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 75DC820B00;
 Mon, 18 Sep 2017 01:50:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=T9AdEQ
 dqS2BwgFgh5MAUBA55GqXLjQqTwLlJFBDxfhA=; b=ilEDdyWaon9PGaCK/tYHSF
 8bptId+L9y0qoYBbh0+aDGrMNh/c+IhbvebnqUTS0w819Jo0GgK0Rkaxbxf790Cm
 iX4vmRM2Yzyu9Zl3kQsIeg0lo9qSmAQTjYSIiMBK8E0SDt+rcDteaXh651r7/Fav
 ZTQAJrvm1AkbTh7lKV83e8wyQxYJZX1YNz7fQd2y5S2sdjPwEdXH7eNWfjBvM759
 yzncuu9O/IqTNJMgeM7OX03sbbeW2LB/pl2JrVs2HC6qTokDq4VwrT+y/W4VHtqr
 nWNR/bM32nXeHFIbPVqGrHATrru1O58ilaqTo6VuHPcr1GJynWfQueVWKHJv9aQw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=T9AdEQdqS2BwgFgh5MAUBA55GqXLjQqTwLlJFBDxf
 hA=; b=OXQB1/kdTtGrrqspurmkJKi8jnMtcKWKUqUYXtgYCP6x/Qv/OwTVBI3YA
 9JHXgLnZI6u69VxRz6a1W5IWglyVGP0jpi+LbBGfsNclxSHu9ZiLNMO0ywPJul7P
 23ZxC7of+/uxLvYZn6WcfEjRmiZ1EikvsYivIlYTHxl40oxRAmTpDz60I/Ccclt2
 EawSckgFPZ6xkiUL+c1zdQMOLR+ECNWf6AclA2RlGwvHuCG1Zg+3afftao2XlUtv
 gEbL1qJEejTsj1Xi5Y+rewaHzk0+GL2CYIIud0k4hgpz1c6HYynUxu4yDTpXVY6K
 DOWZ/B7hFcLV7hEFP77lyN6jUGbzA==
X-ME-Sender: <xms:jl6_WTLJKCOsPTsjLirOVK_vAHs1qr7jqqfqVyVSANSJy-ILaZaO3w>
X-Sasl-enc: DAXxHrmqO6/G0OvwYDy1MNHqWa4iNr3OEQ4fyuHayikj 1505713805
Received: from keelia.au.ibm.com (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBB217FA1C;
 Mon, 18 Sep 2017 01:50:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH 1/4] watchdog: aspeed: Retain watchdog enabled state
Date: Mon, 18 Sep 2017 15:19:02 +0930
Message-Id: <20170918054905.16470-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170918054905.16470-1-andrew@aj.id.au>
References: <20170918054905.16470-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 05:50:09 -0000

An unintended post-condition of probe() is that the watchdog is
disabled. Rework probe() such that we retain the value of the "enabled"
bit from the control register, and take the appropriate actions with
respect to the watchdog core if so. Otherwise, just configure the
watchdog as directed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 79cc766cd30f..99bc6fbd8852 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -221,7 +221,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	config = ofdid->data;
 
-	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
+	wdt->ctrl |= readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE;
+	wdt->ctrl |= WDT_CTRL_1MHZ_CLK;
 
 	/*
 	 * Control reset on a per-device basis to ensure the
@@ -243,11 +244,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (of_property_read_bool(np, "aspeed,external-signal"))
 		wdt->ctrl |= WDT_CTRL_WDT_EXT;
 
-	writel(wdt->ctrl, wdt->base + WDT_CTRL);
-
-	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)  {
+	if (wdt->ctrl & WDT_CTRL_ENABLE) {
 		aspeed_wdt_start(&wdt->wdd);
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+	} else {
+		writel(wdt->ctrl, wdt->base + WDT_CTRL);
 	}
 
 	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
-- 
2.11.0
