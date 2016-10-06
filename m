Return-Path: <clg@kaod.org>
X-Greylist: delayed 597 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:44:09 AEDT
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmPj4Sv5zDrSL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:44:09 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8AA3111F8F
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:24 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 5B6AE2A006F;
 Thu,  6 Oct 2016 23:27:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 08/12] aspeed: remove CONFIG_MAC_NUM
Date: Thu,  6 Oct 2016 23:26:41 +0200
Message-Id: <1475789205-19618-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13960032948603095810
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:10 -0000

and use the standard CONFIG_HAS_ETHX instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/ftgmac100.c       | 11 +++++------
 include/configs/ast-g4-ncsi.h |  4 ++++
 include/configs/ast-g4-phy.h  |  3 ++-
 include/configs/ast-g5-ncsi.h |  4 ++++
 include/configs/ast-g5-phy.h  |  3 ++-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 16cfac87cb8e..b690e6c2330c 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -747,14 +747,13 @@ int ftgmac100_initialize(bd_t *bd)
 
 #if 1   //Ryan Chen for more mac use
 	int i, card_number = 0, mac_no;
-	unsigned int			iobase[CONFIG_MAC_NUM];
+	unsigned int iobase[2] = { AST_MAC0_BASE, AST_MAC1_BASE };
 
-	mac_no = CONFIG_MAC_NUM;
-	iobase[0] = AST_MAC0_BASE;
-
-#ifdef AST_MAC1_BASE
-	iobase[1] = AST_MAC1_BASE;
+	mac_no = 1;
+#ifdef CONFIG_HAS_ETH1
+	mac_no++;
 #endif
+
 	for (i = 0; i < mac_no; i++)
 	{
 		ast_scu_multi_func_eth(i);
diff --git a/include/configs/ast-g4-ncsi.h b/include/configs/ast-g4-ncsi.h
index bd7ca818db87..43787f39ac90 100644
--- a/include/configs/ast-g4-ncsi.h
+++ b/include/configs/ast-g4-ncsi.h
@@ -18,5 +18,9 @@
 #include <asm/arch/ast2400_platform.h>
 #include <configs/ast-common.h>
 
+/* Ethernet */
+#define CONFIG_HAS_ETH0
+#define CONFIG_HAS_ETH1
+
 
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
index c0208625c9ab..66881f6cb8be 100644
--- a/include/configs/ast-g4-phy.h
+++ b/include/configs/ast-g4-phy.h
@@ -19,7 +19,8 @@
 #include <configs/ast-common.h>
 
 /* Ethernet */
-#define CONFIG_MAC_NUM			2
+#define CONFIG_HAS_ETH0
+#define CONFIG_HAS_ETH1
 #define CONFIG_PHY_MAX_ADDR		32
 
 
diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index 049d1a5b0be8..486fe28152c2 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -19,6 +19,10 @@
 /* arm1176/start.S */
 #define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
 
+/* Ethernet */
+#define CONFIG_HAS_ETH0
+#define CONFIG_HAS_ETH1
+
 /* platform.S settings */
 #define	CONFIG_DRAM_ECC_SIZE		0x10000000
 
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 1d8aad815d02..1cd0387b0508 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -20,7 +20,8 @@
 #define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
 
 /* Ethernet */
-#define CONFIG_MAC_NUM			2
+#define CONFIG_HAS_ETH0
+#define CONFIG_HAS_ETH1
 #define CONFIG_PHY_MAX_ADDR		32
 
 /* platform.S */
-- 
2.7.4
