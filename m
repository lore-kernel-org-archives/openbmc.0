Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3mPX2JFCzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 17:26:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eg+sPqqk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AT8MfXZN"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AA9E20777;
 Fri,  7 Jul 2017 03:26:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 07 Jul 2017 03:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=aAnv0CpVAYyg3xtAjYFAFA3X9kFe4z
 AsQEcqOuFHqes=; b=eg+sPqqkF2bkLkTBkb3FwdX12F1M4uJDZHktBpbpmV46U1
 VH3JAiac1wUxUcMebFk3llPC6X9pzKxTTpjxT5debOWDtgXOwaqyJ+sjxjfC6fZ/
 kNMQyEEMm2OXEoZU46AZN1BUO9m1bP2ezS0svtk/R9klomqSYdT/D/qHWLM0F6s0
 rA2tV1nxpu7zljBvYsXXkYZc+DrkyYnAV2neII9PA0gAoLxcCIqgQr2tUYgZoDYm
 sUi2FPp6WJDTRCXK5Cjou3NRNQf4NTrAwsqSkTOM1A9lyYge5GBThd24G8lLnEGH
 iOmmsU01nAjna4MEIumXdtVH/2cSPE/kXn6jrurg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=aAnv0C
 pVAYyg3xtAjYFAFA3X9kFe4zAsQEcqOuFHqes=; b=AT8MfXZNHoa6W3SP59b+Ze
 aTuOPRTSqPVsSehWBFZRSMfdIyFlEUuWbxB0sGWgqKBA7paWV/JD494Q9o13dKcz
 MfAF13OFrrklHZmO7156KAatr8WTQVYyMAzq0VFfYABPxdGa5ksRkJrupVugD6DV
 oeC/A4wl5PcVtHfQNZ7PCcnv2C+jCliHTQrHS6gPMdbP50U5RcVIlk9nbI7cUYcR
 tH3I4JWWhQPIqq18t9M1cN1czkjECS+UaH4WRbe2UVJ45v+8txmkRsjU111KgBHS
 W5KmRq+c35/lxIEGkqcq2jZip+N2rmn0rjDQ5Q2F/kF2SuaZgNt2B2Q2uZz04HLw
 ==
X-ME-Sender: <xms:mjdfWSp1shx6_iKxWcYn7V9zqJiR1v2_35tPkHOonl684fhVOdoZ9g>
X-Sasl-enc: uJ0gEZ9y8dz2zavy9m6LRLkvkKUD0EHUxT26sXWZYYiJ 1499412377
Received: from keelia.aj.id.au (220-253-43-190.dyn.iinet.net.au
 [220.253.43.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB09224251;
 Fri,  7 Jul 2017 03:26:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, geissonator@gmail.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: aspeed: witherspoon: Add reset tolerance
 for host power GPIOs
Date: Fri,  7 Jul 2017 16:55:44 +0930
Message-Id: <20170707072544.25003-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 07 Jul 2017 07:26:26 -0000

Enables the host to stay up across BMC reboots. This is a temporary
approach. Ultimately bindings support and reset tolerance capability
will be added to the GPIO driver, and the behaviour will be described
in the devicetree.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 74611a9c2c79..100805e8c263 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -177,7 +177,17 @@ static void __init do_zaius_setup(void)
 
 static void __init do_witherspoon_setup(void)
 {
+	unsigned long reg;
+
 	do_common_setup();
+
+	/* Reset tolerance for BMC_POWER_UP (GPIOD1) */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x01C));
+	writel(reg | BIT(25), AST_IO(AST_BASE_GPIO | 0x01C));
+
+	/* Reset tolerance for SOFTWARE_PGOOD (GPIOR1) */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x12C));
+	writel(reg | BIT(9), AST_IO(AST_BASE_GPIO | 0x12C));
 }
 
 static void __init do_romulus_setup(void)
-- 
2.11.0
