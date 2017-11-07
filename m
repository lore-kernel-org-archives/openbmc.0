Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eMxEdb5m"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Vza+oaIr"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjX5GJvzDrKv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DB2120D5F;
 Tue,  7 Nov 2017 02:32:14 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=doJcZfW6Sa1E46xKr
 mGzWhP7rvLM4FBCtrijLplWQ4s=; b=eMxEdb5mJbtZrMi731ghTtOKFpnIRS/Il
 E8YbrJ8ufiMZgVDDH61Q89Z6PVDDlFZEoTYxojH68ql01QI2Wiv9nonZSzs4GIg+
 BwuM7Fq+ugD+P4+3TnAnZ4LlsxXUfhnHWYmAxHDNAC/HOllJqINWDk4LegQdGx+m
 hYIfQRLtgcCPv+/UXD8d7ZyKgj8jeQy9zciWZ5Z70eouvv2Q0BgBe4+DuwY6T1K/
 2RkcsdBpKQYvdARFLOTM6hzBMhEvpetgy28eKu67CdCCoq3zFLum/CmtMITK4c5J
 dDPsrOlVEfgTvrCCmEwyNEPKhUf0JDaat/fnNvoq6qSlReffq21hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=doJcZfW6Sa1E46xKrmGzWhP7rvLM4FBCtrijLplWQ4s=; b=Vza+oaIr
 /x5/IZP0J6BghoPsJXqO/QEX2AaFoHp9q5SgAwslhi+QAgMNXF7cP1ibf03YNVS8
 +9ArFGS4B8HLsVKgtTzB1pqSkP83XZ2pVLwLqRLmZzGeqzyKnoDD9P5OKlOjnEmS
 KXOkONNF6X5j6JIsVh0GNHLbIa0BtH0F6RBcq4joaYWwjUcT1t5zNECgdd3u8PbD
 5BwUZkjEuy72xi0FSYPsVF25X7hheK0Poq3dWBWIwg7xKQAPeOKpiNNZlJ6dziPq
 BZg9IAG2S1Wjoy6wRc3GdyYXRkoDDxla0gSVbTsz6/HMO7nrFJUkqOjZWshar2rX
 3YJFL7xv8ZSa7w==
X-ME-Sender: <xms:fmEBWv9Ukqn0_bLsVz9L8Jlf3Lwr5YoHPUcKG3GrBlXZPgd13auy9g>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E90E8242CF;
 Tue,  7 Nov 2017 02:32:12 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 22/23] watchdog: aspeed: Remove specific
 reference to AST2400 in Kconfig
Date: Tue,  7 Nov 2017 18:00:45 +1030
Message-Id: <20171107073046.13319-23-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:17 -0000

The driver also supports the watchdog in the AST25xx series, and
may work on earlier SoCs as well.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b562d2e03eb9..a1b92ebe74b6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -741,7 +741,7 @@ config RENESAS_RZAWDT
 	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
 
 config ASPEED_WATCHDOG
-	tristate "Aspeed 2400 watchdog support"
+	tristate "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-- 
2.11.0
