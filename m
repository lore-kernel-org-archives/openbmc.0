Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uaJp86SA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M441g2t1"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZq03kFRzDrZx;
 Mon, 18 Sep 2017 15:50:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D76B820A4D;
 Mon, 18 Sep 2017 01:50:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=BgM0nG
 RIWOykUxBASDdRHsLpvjv/DxPAGMjLrhip/08=; b=uaJp86SAZez2ASPo+Ia/LL
 StZb2sC78dF50s8ns7/OiiWoY7MbeBC/D8l3i8B21cm5cdVfZVQBtb3Kjz0Lpe2J
 V8Gow4GzzNUHYZMITt7DbhF5G2KrcYg6U4INIUjdRgjrq0Jjx84P60i2GUHqDkIn
 mCS5qVk3IKeAp+kbXu2dcSqWk1h9u6B38oPubhP7NuTgl1jXoUCZA790ijSO4yPD
 UGuRLkFlrew8OEFNlPMxryCU9RsmyN28lJFns7NyPkBY5I3b0DeHxLlAz2N7SvJB
 7MfWYfyKSgK9nzo95la3lSD5LadTorBEmKozq8lxyPrGKnhnzfwNQSRzelqUS3sw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=BgM0nGRIWOykUxBASDdRHsLpvjv/DxPAGMjLrhip/
 08=; b=M441g2t1bZhJcTWxe78G5VTp37LmoG58qzuGZioEc6+MHoL2bKwp11wOH
 AionsRwS2tYj/jbACqMHsnNrtatPDvOICZXunWWVtPrZgu1hCMp4QhHWAQEDnbrO
 0qtzg9Sv3JIrJIrbXZJO+Hh3ezYd2LpjiMbgq306eWfB2iVG/hBIVKN/NUsNMyky
 IXLcnOJi1BjmYIz6fivtOppXOdcqR6Ip2Oq26mEEuFI7gr4TAomC/K280YKODJhn
 DOsmXWDHIN/f4m8zZ+vK3UVZ+LllZllrJ+vY/BpAZlEleJwghrsr3BlkVSjY0kp+
 4IHl1JD3liSIvwDyHsnzOsuPDZbkQ==
X-ME-Sender: <xms:mV6_WTsJ4r3iRbKO6N-BLpeGgT74LeJ2Zfc027HNceBeBYr2i5ccjg>
X-Sasl-enc: LtH+odbAc08lmuOZoOK3teUwjtETKE0RdbBXLTadCQWR 1505713817
Received: from keelia.au.ibm.com (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A1407E183;
 Mon, 18 Sep 2017 01:50:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH 4/4] watchdog: aspeed: Move init to arch_initcall
Date: Mon, 18 Sep 2017 15:19:05 +0930
Message-Id: <20170918054905.16470-5-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 05:50:21 -0000

Probing at device_initcall time lead to perverse cases where the
watchdog was probed after, say, I2C, which then leaves a potentially
running watchdog at the mercy of I2C device behaviour and bus
conditions.

Load the watchdog driver early to ensure that the kernel is patting it
well before initialising peripherals.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/Kconfig      | 6 ++----
 drivers/watchdog/aspeed_wdt.c | 7 ++++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index a1b92ebe74b6..6103185983ed 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -741,8 +741,9 @@ config RENESAS_RZAWDT
 	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
 
 config ASPEED_WATCHDOG
-	tristate "Aspeed BMC watchdog support"
+	bool "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
+	default y if ARCH_ASPEED
 	select WATCHDOG_CORE
 	help
 	  Say Y here to include support for the watchdog timer
@@ -750,9 +751,6 @@ config ASPEED_WATCHDOG
 
 	  This driver is required to reboot the SoC.
 
-	  To compile this driver as a module, choose M here: the
-	  module will be called aspeed_wdt.
-
 config ZX2967_WATCHDOG
 	tristate "ZTE zx2967 SoCs watchdog support"
 	depends on ARCH_ZX
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 99bc6fbd8852..679c35abadc4 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -313,7 +313,12 @@ static struct platform_driver aspeed_watchdog_driver = {
 		.of_match_table = of_match_ptr(aspeed_wdt_of_table),
 	},
 };
-module_platform_driver(aspeed_watchdog_driver);
+
+static int __init aspeed_wdt_init(void)
+{
+	return platform_driver_register(&aspeed_watchdog_driver);
+}
+arch_initcall(aspeed_wdt_init);
 
 MODULE_DESCRIPTION("Aspeed Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.11.0
