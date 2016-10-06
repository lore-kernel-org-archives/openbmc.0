Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBD0RmCzDrSJ
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B667C1202E
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:27 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 8F67D2A0072;
 Thu,  6 Oct 2016 23:27:24 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 09/12] aspeed: add CONFIG_DRAM_ECC
Date: Thu,  6 Oct 2016 23:26:42 +0200
Message-Id: <1475789205-19618-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13960877373227567874
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
X-List-Received-Date: Thu, 06 Oct 2016 21:34:12 -0000

There is still a warning  I need to get rid of :

      board/aspeed/ast-g5/Kconfig:22:warning: config symbol defined without type

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 board/aspeed/ast-g5/Kconfig   | 9 +++++++++
 include/configs/ast-g5-ncsi.h | 3 ---
 include/configs/ast-g5-phy.h  | 3 ---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
index b809a6b1750f..b8e10686e369 100644
--- a/board/aspeed/ast-g5/Kconfig
+++ b/board/aspeed/ast-g5/Kconfig
@@ -13,4 +13,13 @@ config SYS_CONFIG_NAME
 	default "ast-g5-phy" if ASPEED_NET_PHY
 	default "ast-g5-ncsi" if ASPEED_NET_NCSI
 
+config DRAM_ECC
+	bool "Enable ECC function"
+	default n
+	help
+	  Enable ECC function on Aspeed SoC AST2500
+
+config DRAM_ECC_SIZE
+	default 0x10000000
+
 endif
diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index 486fe28152c2..06574b5432f0 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -23,7 +23,4 @@
 #define CONFIG_HAS_ETH0
 #define CONFIG_HAS_ETH1
 
-/* platform.S settings */
-#define	CONFIG_DRAM_ECC_SIZE		0x10000000
-
 #endif	/* __AST_G5_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 1cd0387b0508..469ef01e31f2 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -24,7 +24,4 @@
 #define CONFIG_HAS_ETH1
 #define CONFIG_PHY_MAX_ADDR		32
 
-/* platform.S */
-#define	CONFIG_DRAM_ECC_SIZE		0x10000000
-
 #endif	/* __AST_G5_PHY_CONFIG_H */
-- 
2.7.4
