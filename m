Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N+7dBo6A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KZEEatu2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjV4VJ1zDrKr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 746E620C89;
 Tue,  7 Nov 2017 02:32:12 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1wLKaH1b3ALglAU0S
 sZG+2d0VTTxg2GeTKxSBHMWR0o=; b=N+7dBo6A1CaJBLOhBHcN7TWmd98AvCzlE
 6OI3JXAw78GeW88vjJvVmiSR8yL7K1eIs5p5pYraGuYXs5RPF+GKcDNAy2Y/XBlF
 ETRBBULBEe7kSJEXyfvcUdRtcS5Fl+y9uPpEgAjvwn3k1MhCXWTOkvXJLpmPPUFC
 6IpAVsmDvwpwWqRlxzwGNU+Owa7YoO/ZWTJzO+cKxF2Rk2pSIrOqQqS/LJ4/OdnA
 iqjCqb/gE2udoN61lYOLce3Um9iMF13C9FOfXUx2Sk2Mv8hZC2dXARf9A9ViXJPM
 pdhpZvRJbsjiBqq9kDymLIuIxg9D5znRgbzY23qLXcE0weH9yWxyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1wLKaH1b3ALglAU0SsZG+2d0VTTxg2GeTKxSBHMWR0o=; b=KZEEatu2
 BiVsKBMVwvX4e3n8FZG80NTpvrWF0YRe1Y1NG47uth16RvwSp2117JA15dnYFECH
 5FWY5Lxl3c9TZaBhCRN66V8ms0CUFze+AbxeRx9vLMwpMW1CXwxv873+0YxzTfmZ
 eKwg38QkRNTDXu0YiprFOXnzJKRxz2Wmh2GOm5xWdYe6VhFQgL7+ibWDrLph3er7
 RR0oDke5SkRicz8r12PNJe/A7dCIPm3OxKEnCJHQwaA72eclEKSCjw9U+TuekqbA
 W2wXOvdYH2vHnZ5VteRSq8GpBKyzzOY5/QeXnRDNmt8TME2wF1VvdKryB8fqOtg9
 nTsLgLtZ7KKTGg==
X-ME-Sender: <xms:fGEBWp9Cp9cslhjytSeBB1KB7yXjceE6buOGks345ZpPMum1imA2AA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECD98242CF;
 Tue,  7 Nov 2017 02:32:10 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 21/23] watchdog: aspeed: Fix 'Apseed' typo in
 Kconfig
Date: Tue,  7 Nov 2017 18:00:44 +1030
Message-Id: <20171107073046.13319-22-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:15 -0000

Apseed sounds like a good name for a web/mobile start-up incubator, but
isn't a reflection of Aspeed themselves.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
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
