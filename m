Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sX/Kig6H"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gz5lg6Xq"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxpHz5zJyzDqXw;
 Wed, 20 Sep 2017 15:31:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B373821180;
 Wed, 20 Sep 2017 01:31:09 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 20 Sep 2017 01:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=piamhm
 GWU1D+LC3R+hmkfdOs2K30OTFSsDxNvKPm1ts=; b=sX/Kig6HZ4PLcTHeIoq6Pn
 vp82zEUmrLo8tb2sMIr97OrXZxWJ1AfidoU4dXrVc0mFElBl36Bu3j0CoMqY1ZjK
 hlpSpM/C7EI3j5vLY/A7Nd5ie2kpU2B5ZUiApohcMl2Qyvb5/gWtHs2tH2D6wDO5
 RJ3vR94T83ED8rOD8vY/hn/XeRGncmufsgc/Drb8y0cxCx4UhxIya725ObbSaNxR
 8g2n/4QmPFETgBX6D1/aEXTstj/WDFBeRofsofx5xY/bfOKuN9MGvEoy7Iq2PaGF
 LpXd+66CaqcsDaRhKhW/dz69Lr3+F6OiWCdiRnEVkH58xvBdMl/aQSwC5eQmTENA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=piamhmGWU1D+LC3R+hmkfdOs2K30OTFSsDxNvKPm1
 ts=; b=gz5lg6XqtzS4lyd/UbDsKLTOvqc1bsOfz18T8uPw95I5FIvYkTavrWIgR
 wwJ5q4LnTW0qlsBQynkjMpjRX2tJ/lvsikaPlIvR+tvoacgs8V6teBE4WlV4wBGF
 BCbXdc7j1gVZRxflLO9DVU8iHqaBXgnAFC2vrxbHFJZNDv1N6Sb7STJiMBm8YIDo
 ra5v3qsoHbShD/NtMfJHuXQHVFu32jx5vXeupO8uVmvA6ohM1w+emLu4ZaAl1AQh
 Q3kTE8VYdUJ2tFMvs8LBUzcZCHWRESz0+8ht82jTH5HOtMDRpbU3Diuac75HVa6e
 cRi58GTFSEtN8hGSFdGWdqqw/8xFg==
X-ME-Sender: <xms:Hf3BWdx-n3HQBornNOwQWzABmhsvVUI92nD7cEW9wdIVfvCLnCjRuw>
X-Sasl-enc: C+n/PyTIbKm3hP+ZGTOtMesS1c7tXyi/aDZf0Wo9tio8 1505885468
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BEDE7E5EE;
 Wed, 20 Sep 2017 01:31:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH v2 4/4] watchdog: aspeed: Move init to arch_initcall
Date: Wed, 20 Sep 2017 15:00:20 +0930
Message-Id: <20170920053020.6860-5-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 20 Sep 2017 05:31:14 -0000

Probing at device_initcall time lead to perverse cases where the
watchdog was probed after, say, I2C devices, which then leaves a
potentially running watchdog at the mercy of I2C device behaviour and
bus conditions.

Load the watchdog driver early to ensure that the kernel is patting it
well before initialising peripherals.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 6c6dd3f4c48d..ca5b91e2eb92 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -316,7 +316,18 @@ static struct platform_driver aspeed_watchdog_driver = {
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
+
+static void __exit aspeed_wdt_exit(void)
+{
+	platform_driver_unregister(&aspeed_watchdog_driver);
+}
+module_exit(aspeed_wdt_exit);
 
 MODULE_DESCRIPTION("Aspeed Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.11.0
