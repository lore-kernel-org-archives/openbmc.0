Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="filSgt2A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="erf7i7ZQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZpr3VQJzDrZV;
 Mon, 18 Sep 2017 15:50:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DC1D2088D;
 Mon, 18 Sep 2017 01:50:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=oEqgc/
 n6xegAPXK++myBPN7liwQ3HCMzsBRadKzD2ro=; b=filSgt2A/UiLvpC4UXANXT
 TpUjZAD/leTrIEGNoJg5kJAUKeD205whOXTjGYOfPoq1JxAaSpVWhNs2qbRV/BVi
 6/2Twp+G0J8VfKUtruM2LWR0KHNqlXy+7qRADdpSBMlp3IbZDJbChmrnGFL6IXZV
 A5ofd8DuiBR3gIetmuoj9vwCNDnBRQQki1AKpn4aot97LLPeh8Mduyt0GCR6D4Ou
 uB8NgXHUyk36r0cBTlrlQM5m9rYx5bJpS6divvDxMqincUytLLoHQWAli5xUCILq
 l1X+eaB9inElYVZp3Ax6pYIpm1Zx/F3shIzk7MjEFKL2H85zxl2y0j8twB/J+ozQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=oEqgc/n6xegAPXK++myBPN7liwQ3HCMzsBRadKzD2
 ro=; b=erf7i7ZQmdEzvqIiUd4v8UCHJ2lflO8+pEwGMp4fI3BGosShaTIbmT2eN
 zRPdKBm1Ur/fWTZKlJiL2cZXqCjoKOAQ1799c5TdgPwSi0R6Y4KTRex0EhGjpUNF
 OV2Un+mKgFq4WPhiCpOVCo+XHoFW7uii/Tr+3CfCqt6t6mLUcuZj3YLGTq36izNJ
 hQAqko890sWOmxn5I7Z2k9el1vQLA9wH5YnE1ir7IHj/kpqS9y2+2DBbZ5LfrPrt
 aYebbHYy+N6eNltOHkioZKbonRPjL/GEKMjlklbmxLeTfKPHNBvkivi4Bq+JU5lp
 N76k+ZD365dRvyH39SH/qvXhZBiuA==
X-ME-Sender: <xms:kl6_WYlweD5cBcE-HiPEAc721gTrzGILsdDYitAZH1zFlKnfmxGP-A>
X-Sasl-enc: Ze0AelNBTQ5cZba0qsldvN5o+HlX/8OsIcbZXqJeW/1q 1505713809
Received: from keelia.au.ibm.com (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9E7E7E183;
 Mon, 18 Sep 2017 01:50:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH 2/4] watchdog: aspeed: Fix 'Apseed' typo in Kconfig
Date: Mon, 18 Sep 2017 15:19:03 +0930
Message-Id: <20170918054905.16470-3-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 05:50:12 -0000

Apseed sounds like a good name for a web/mobile start-up incubator, but
isn't a reflection of Aspeed themselves.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c722cbfdc7e6..b562d2e03eb9 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -746,7 +746,7 @@ config ASPEED_WATCHDOG
 	select WATCHDOG_CORE
 	help
 	  Say Y here to include support for the watchdog timer
-	  in Apseed BMC SoCs.
+	  in Aspeed BMC SoCs.
 
 	  This driver is required to reboot the SoC.
 
-- 
2.11.0
