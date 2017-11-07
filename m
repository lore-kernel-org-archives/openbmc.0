Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fYrHXZqX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dQEQCRzL"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjZ4tJxzDrKS
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A11020CAA;
 Tue,  7 Nov 2017 02:32:16 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b9rqZ6PY6LAL0pgKk
 0SMxpW3NSh8UO7Gt7zI7i7X44Y=; b=fYrHXZqXzxKpx8+902R7a8FRHHwPMfv5N
 4mu6MA/FTCIkw5QgO6vN5KKAX8BaoCYoHUcDD/I1gvVoCNrf6oiQbIKNdPsV3ee7
 ngqmbO9hS9G0muVPugDIkrLbHwFYJyq+qgTeVS0mMFesZts1JGU2C3y36WBXKiZC
 n8dd0Pq/x584/ebIBl1JNpLJWYDz3WYMKyKx2gdjEjGHfep8RBUDbCtPTsqnAi4y
 cUdWpizPkBeOr9asABAunnWicTHccXaE2rBvQ0Q2NyleKP/sYY0aGfNV33ofmCw8
 nfSbVeiCUbYigHJR/GcwUUAMSVjykw+AFehqTURmO2WD9InVt8gcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=b9rqZ6PY6LAL0pgKk0SMxpW3NSh8UO7Gt7zI7i7X44Y=; b=dQEQCRzL
 5+pfBwwJ4tpYIcszEO0LOLHUTI+1SZr/U0FBUlS2WwVtr3iE4ZFnWY+RaLUGKhP2
 t2Zy5RMWrinrbFnsN7+iQ/qCsKaz6Sl60Le9rgomJ+UdbnXU2NSICtDhNbskUJ8W
 JXhTLTLXyfh/BvPrhFu6vt/U9wUyr9QKTnZjVILNmzuuANGZptUl6FzvnbRmshwF
 Oi5FqdN4kzkFi6RXTPquxYjrztRNVPgxveFj3vzWkeW8zjRo94pSKL7y4+CvJxeL
 p7cAKokMyXQ10SUkQEKneBvySHJ6fgJLN8+D2ya8CcDIOADPxrcKn5Lk/I+Zzgad
 bDz0sCrN50Eauw==
X-ME-Sender: <xms:gGEBWhb2LuTLsxgM2GYFoiodIBqVm8KN3k4JlNTXHXPihjDP5V7RPw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0AC4324108;
 Tue,  7 Nov 2017 02:32:14 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 23/23] watchdog: aspeed: Move init to
 arch_initcall
Date: Tue,  7 Nov 2017 18:00:46 +1030
Message-Id: <20171107073046.13319-24-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:19 -0000

Probing at device_initcall time lead to perverse cases where the
watchdog was probed after, say, I2C devices, which then leaves a
potentially running watchdog at the mercy of I2C device behaviour and
bus conditions.

Load the watchdog driver early to ensure that the kernel is patting it
well before initialising peripherals.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
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
