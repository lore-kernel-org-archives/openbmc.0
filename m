Return-Path: <clg@kaod.org>
X-Greylist: delayed 4194 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Oct 2016 00:48:34 AEDT
Received: from 16.mo1.mail-out.ovh.net (16.mo1.mail-out.ovh.net
 [178.33.104.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swTTG0DyTzDt2X
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 00:48:33 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B25ED14C9D
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:48:29 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 9954A2A0083;
 Fri, 14 Oct 2016 15:48:24 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] arm/aspeed: Enable SPI Master on ast2500evb
Date: Fri, 14 Oct 2016 15:48:19 +0200
Message-Id: <1476452899-25924-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16297401151875156738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeigdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 14 Oct 2016 13:48:34 -0000

The default is OFF.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/mach-aspeed/aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 12a63db27a21..96713ecd8501 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -159,9 +159,12 @@ static void __init do_ast2500evb_setup(void)
 
 	do_ast2500_common_setup();
 
-	/* Set strap to RGMII for dedicated PHY networking */
 	reg = readl(AST_IO(AST_BASE_SCU | 0x70));
+
+	/* Set strap to RGMII for dedicated PHY networking */
 	reg |= BIT(6) | BIT(7);
+	/* Enable SPI Master and SPI Slave to AHB Bridge */
+	reg |= BIT(13);
 	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
 }
 
-- 
2.7.4
