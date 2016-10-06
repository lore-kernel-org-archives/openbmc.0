Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqm2Y5lywzDrSV
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:27:33 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E9DFA11E5B
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:30 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id BF2F72A0067;
 Thu,  6 Oct 2016 23:27:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 10/12] aspeed: remove CONFIG_PHY_MAX_ADDR
Date: Thu,  6 Oct 2016 23:26:43 +0200
Message-Id: <1475789205-19618-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13961721796109175554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 06 Oct 2016 21:27:34 -0000

PHY_MAX_ADDR has the same value

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/ftgmac100.c      | 3 ++-
 include/configs/ast-g4-phy.h | 2 --
 include/configs/ast-g5-phy.h | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index b690e6c2330c..f82ea5f35e89 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -16,6 +16,7 @@
 #include <net.h>
 #include <asm/io.h>
 #include <linux/mii.h>
+#include <phy.h>
 
 #include <i2c.h>
 
@@ -306,7 +307,7 @@ static int ftgmac100_phy_init(struct eth_device *dev)
 	int i;
 
 	/* Check if the PHY is up to snuff... */
-	for (phy_addr = 0; phy_addr < CONFIG_PHY_MAX_ADDR; phy_addr++) {
+	for (phy_addr = 0; phy_addr < PHY_MAX_ADDR; phy_addr++) {
 
 		ftgmac100_phy_read(dev, phy_addr, MII_PHYSID1, &phy_id1);
 		ftgmac100_phy_read(dev, phy_addr, MII_PHYSID2, &phy_id2);
diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
index 66881f6cb8be..8e1ce2bfd10b 100644
--- a/include/configs/ast-g4-phy.h
+++ b/include/configs/ast-g4-phy.h
@@ -21,7 +21,5 @@
 /* Ethernet */
 #define CONFIG_HAS_ETH0
 #define CONFIG_HAS_ETH1
-#define CONFIG_PHY_MAX_ADDR		32
-
 
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 469ef01e31f2..c10767467bb9 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -22,6 +22,5 @@
 /* Ethernet */
 #define CONFIG_HAS_ETH0
 #define CONFIG_HAS_ETH1
-#define CONFIG_PHY_MAX_ADDR		32
 
 #endif	/* __AST_G5_PHY_CONFIG_H */
-- 
2.7.4
