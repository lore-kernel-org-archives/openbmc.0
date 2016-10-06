Return-Path: <clg@kaod.org>
X-Greylist: delayed 988 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:44:09 AEDT
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmPj2Z3VzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:44:08 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5739A11E13
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:21 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 2050F2A0067;
 Thu,  6 Oct 2016 23:27:18 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 07/12] aspeed: add configuration for the network devices
Date: Thu,  6 Oct 2016 23:26:40 +0200
Message-Id: <1475789205-19618-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13959188522891315970
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:09 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 configs/ast_g4_ncsi_defconfig |  2 ++
 configs/ast_g4_phy_defconfig  |  3 +++
 configs/ast_g5_ncsi_defconfig |  2 ++
 configs/ast_g5_phy_defconfig  |  3 +++
 drivers/net/Kconfig           | 19 ++++++++++++++++++-
 include/configs/ast-g4-ncsi.h |  4 ----
 include/configs/ast-g4-phy.h  |  2 --
 include/configs/ast-g5-ncsi.h |  4 ----
 include/configs/ast-g5-phy.h  |  2 --
 9 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
index 0314af82c37e..fb56224b095c 100644
--- a/configs/ast_g4_ncsi_defconfig
+++ b/configs/ast_g4_ncsi_defconfig
@@ -6,3 +6,5 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
+CONFIG_NETDEVICES=y
+CONFIG_ASPEEDNIC=y
diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
index 7e9e5712a9ef..e5e22fa6d9c0 100644
--- a/configs/ast_g4_phy_defconfig
+++ b/configs/ast_g4_phy_defconfig
@@ -7,3 +7,6 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
+CONFIG_NETDEVICES=y
+CONFIG_FTGMAC100=y
+CONFIG_FTGMAC100_EGIGA=y
diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
index b1f4f185a53f..094f22526a47 100644
--- a/configs/ast_g5_ncsi_defconfig
+++ b/configs/ast_g5_ncsi_defconfig
@@ -6,3 +6,5 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
+CONFIG_NETDEVICES=y
+CONFIG_ASPEEDNIC=y
diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
index 63ff21f65f71..b952b118ef7f 100644
--- a/configs/ast_g5_phy_defconfig
+++ b/configs/ast_g5_phy_defconfig
@@ -7,3 +7,6 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
+CONFIG_NETDEVICES=y
+CONFIG_FTGMAC100=y
+CONFIG_FTGMAC100_EGIGA=y
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index b8ccd92184cf..ed152296ded3 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -199,10 +199,27 @@ config PIC32_ETH
 
 config ASPEEDNIC
 	bool "Aspeed ethernet support"
-	depends on MACH_ARM
+	depends on ARCH_ASPEED
 	select PHYLIB
 	help
 	  Network support for the Aspeed ast2400 and ast2500 series network
 	  devices including NC-SI support.
 
+config FTGMAC100
+	bool "Faraday's FTGMAC100 Gigabit SoC Ethernet"
+	select PHYLIB
+	select MII
+	help
+	  Support for Faraday's FTGMAC100 Gigabit SoC Ethernet
+
+config FTGMAC100_EGIGA
+	bool "Define this if FTGMAC100 is connected to gigabit PHY"
+	depends on FTGMAC100
+	help
+	  If your system has 10/100 PHY only, it might not occur wrong
+	  behavior. Because PHY usually return timeout or useless data
+	  when polling gigabit status and gigabit control registers.
+	  This behavior won't affect the correctness of 10/100 link
+	  speed update.
+
 endif # NETDEVICES
diff --git a/include/configs/ast-g4-ncsi.h b/include/configs/ast-g4-ncsi.h
index 9a17a3bd0cd3..bd7ca818db87 100644
--- a/include/configs/ast-g4-ncsi.h
+++ b/include/configs/ast-g4-ncsi.h
@@ -18,9 +18,5 @@
 #include <asm/arch/ast2400_platform.h>
 #include <configs/ast-common.h>
 
-/* Ethernet */
-#define CONFIG_LIB_RAND
-#define CONFIG_ASPEEDNIC
-
 
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
index 250abf5a2f44..c0208625c9ab 100644
--- a/include/configs/ast-g4-phy.h
+++ b/include/configs/ast-g4-phy.h
@@ -20,9 +20,7 @@
 
 /* Ethernet */
 #define CONFIG_MAC_NUM			2
-#define CONFIG_FTGMAC100
 #define CONFIG_PHY_MAX_ADDR		32
-#define CONFIG_FTGMAC100_EGIGA
 
 
 #endif	/* __AST_G4_NCSI_CONFIG_H */
diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index 907ff9a5bb9d..049d1a5b0be8 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -19,10 +19,6 @@
 /* arm1176/start.S */
 #define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
 
-/* Ethernet */
-#define CONFIG_LIB_RAND
-#define CONFIG_ASPEEDNIC
-
 /* platform.S settings */
 #define	CONFIG_DRAM_ECC_SIZE		0x10000000
 
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 738fb93419f4..1d8aad815d02 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -21,9 +21,7 @@
 
 /* Ethernet */
 #define CONFIG_MAC_NUM			2
-#define CONFIG_FTGMAC100
 #define CONFIG_PHY_MAX_ADDR		32
-#define CONFIG_FTGMAC100_EGIGA
 
 /* platform.S */
 #define	CONFIG_DRAM_ECC_SIZE		0x10000000
-- 
2.7.4
