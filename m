Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63s1R6XzDqJ1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kdf+y8BV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PQAVpOzR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D32020A3B;
 Thu, 27 Apr 2017 02:09:43 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=J/UQlx
 cWzCzOHeux4FtOZAx4aCqdR7ehCbCk1EvygWU=; b=kdf+y8BVrqMFrN153kpXS9
 KiRVIzCY4lTiPonwbnTKHm9TIn26Y0vuDT12cEym71PbXQ36SWzW0R3NZyoHFOTL
 fc3vQlfRGTDPHr5rfBOm0ORWEM1m62OvPKpPTYc9l9tYtE2bLl1Fl9bCrz1XpNrK
 OjkCnSHubazylhZoJjzpk0vFjLwHaINr5Fh8xm6ViIAsP3jfPpDDtyBaqdf6Q169
 smphx4urXDDwdvg71OMeeKv2zgZNXG4ftVrXvO1kusdfsrS/yIx8obWuFac853kC
 IUkUGH9t5Clmxu9hQkEXzaZP/F8SI++RfH5FWhu5bKZumGu1c3j7ygiiyEXvlDHw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=J/UQlxcWzCzOHeux4FtOZAx4aCqdR7ehCbCk1Evyg
 WU=; b=PQAVpOzRItntsrNfjVZSEGfDwMQnY41TtN2gMU62QYByt18TrzsdtSN/V
 IhwikgXdg3y5vf36seGHvK6VhdCFkfJYB7psnjMOd0EmKd8TEby6aUUow1K6nbDi
 iAiOWU35g7/FHG/H7TVjpD1iqVySjqENTL5O6tBON4QY2RgDTJOADO5Hes2dtHYx
 jiXLzrAjl7+RuGoh/WOfdAa2ApQY+uXWub/dpsYiazKJD4a90xUh60jsHKkBeJ8l
 /IpyXpCIbRFD82PTZ9L0hkbZixttueQO5kONXS1anKQtQiVUPLWBG8QvmAmlDrYw
 JRHu5eRa0sxveTaRDlVLOi8pG1R6w==
X-ME-Sender: <xms:JosBWWr-602UEB7FYGJ2uIrol7WFt2ndVrI1XfyhZ_BHWqemxcOWHQ>
X-Sasl-enc: YVutuiRECLnR+DtdY9e76eQCZyIFwrwj9pr1u1RlMRmB 1493273382
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1AACF241E1;
 Thu, 27 Apr 2017 02:09:39 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 10/10] aspeed: romulus: Remove manual CS
 decoding window configuration
Date: Thu, 27 Apr 2017 15:38:23 +0930
Message-Id: <20170427060823.32226-11-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:45 -0000

This is now handled by the SMC driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 837649b9fad9..14cea0825199 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -153,12 +153,6 @@ static void __init do_witherspoon_setup(void)
 static void __init do_romulus_setup(void)
 {
 	do_common_setup();
-
-	/* Set SPI1 CE1 decoding window to 0x34000000 */
-	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
-
-	/* Set SPI1 CE0 decoding window to 0x30000000 */
-	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
 #define SCU_PASSWORD	0x1688A8A8
-- 
2.9.3
