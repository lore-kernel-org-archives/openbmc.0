Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBD1nWMzDrSL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id DD423119F2
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:04 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 9F02E2A0067;
 Thu,  6 Oct 2016 23:27:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 02/12] aspeed: rework top level configuration of the
 Aspeed SoC
Date: Thu,  6 Oct 2016 23:26:35 +0200
Message-Id: <1475789205-19618-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13954403447871081218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

and also add a proper CONFIG_ARCH_ASPEED

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig                               | 16 ++++---------
 {board/aspeed => arch/arm/mach-aspeed}/Kconfig | 32 ++++++++++++++++++++++++--
 board/aspeed/ast-g4/Kconfig                    |  6 -----
 board/aspeed/ast-g5/Kconfig                    |  6 -----
 configs/ast_g4_ncsi_defconfig                  |  1 +
 configs/ast_g4_phy_defconfig                   |  1 +
 configs/ast_g5_ncsi_defconfig                  |  1 +
 configs/ast_g5_phy_defconfig                   |  1 +
 include/configs/ast-common.h                   |  1 -
 9 files changed, 39 insertions(+), 26 deletions(-)
 rename {board/aspeed => arch/arm/mach-aspeed}/Kconfig (52%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f155d22b1197..b75ff1296cc2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -130,6 +130,9 @@ choice
 	prompt "Target select"
 	default TARGET_HIKEY
 
+config ARCH_ASPEED
+       bool "Support Apseed SoCs"
+
 config ARCH_AT91
 	bool "Atmel AT91"
 
@@ -899,18 +902,10 @@ config TARGET_THUNDERX_88XX
 	select OF_CONTROL
 	select SYS_CACHE_SHIFT_7
 
-config TARGET_AST_G5
-       bool "Support Apseed fifth generation SoCs"
-       select CPU_ARM1176
-       select AST_SPI_NOR
-
-config TARGET_AST_G4
-       bool "Support Aspeed fourth generation SoCs"
-       select CPU_ARM926EJS
-       select AST_SPI_NOR
-
 endchoice
 
+source "arch/arm/mach-aspeed/Kconfig"
+
 source "arch/arm/mach-at91/Kconfig"
 
 source "arch/arm/mach-bcm283x/Kconfig"
@@ -1050,7 +1045,6 @@ source "board/vscom/baltos/Kconfig"
 source "board/woodburn/Kconfig"
 source "board/work-microwave/work_92105/Kconfig"
 source "board/zipitz2/Kconfig"
-source "board/aspeed/Kconfig"
 
 source "arch/arm/Kconfig.debug"
 
diff --git a/board/aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
similarity index 52%
rename from board/aspeed/Kconfig
rename to arch/arm/mach-aspeed/Kconfig
index 3dcf1a26d50e..316f4c5815e0 100644
--- a/board/aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -1,5 +1,21 @@
-source "board/aspeed/ast-g5/Kconfig"
-source "board/aspeed/ast-g4/Kconfig"
+if ARCH_ASPEED
+
+
+choice
+	prompt "Aspeed SoC select"
+	optional
+
+config TARGET_AST_G5
+       bool "Support Apseed fifth generation SoCs"
+       select CPU_ARM1176
+       select AST_SPI_NOR
+
+config TARGET_AST_G4
+       bool "Support Aspeed fourth generation SoCs"
+       select CPU_ARM926EJS
+       select AST_SPI_NOR
+
+endchoice
 
 choice
 	prompt "Network configuration"
@@ -20,3 +36,15 @@ config AST_SPI_NOR
 	help
 	  Enable Aspeed SMC driver to access the SPI NOR flash of the
 	  BMC
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_SOC
+	default "aspeed"
+
+
+source "board/aspeed/ast-g5/Kconfig"
+source "board/aspeed/ast-g4/Kconfig"
+
+endif
diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
index 2bec9a733a92..e0892afbb3a1 100644
--- a/board/aspeed/ast-g4/Kconfig
+++ b/board/aspeed/ast-g4/Kconfig
@@ -9,12 +9,6 @@ config SYS_CPU
 config SYS_BOARD
 	default "ast-g4"
 
-config SYS_VENDOR
-	default "aspeed"
-
-config SYS_SOC
-	default "aspeed"
-
 config SYS_CONFIG_NAME
 	default "ast-g4-phy" if ASPEED_NET_PHY
 	default "ast-g4-ncsi" if ASPEED_NET_NCSI
diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
index 9bd3e7de49a4..b809a6b1750f 100644
--- a/board/aspeed/ast-g5/Kconfig
+++ b/board/aspeed/ast-g5/Kconfig
@@ -9,12 +9,6 @@ config SYS_CPU
 config SYS_BOARD
 	default "ast-g5"
 
-config SYS_VENDOR
-	default "aspeed"
-
-config SYS_SOC
-	default "aspeed"
-
 config SYS_CONFIG_NAME
 	default "ast-g5-phy" if ASPEED_NET_PHY
 	default "ast-g5-ncsi" if ASPEED_NET_NCSI
diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
index 4ee71c5d9a2e..0314af82c37e 100644
--- a/configs/ast_g4_ncsi_defconfig
+++ b/configs/ast_g4_ncsi_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_TARGET_AST_G4=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
index 61fd69b46897..7e9e5712a9ef 100644
--- a/configs/ast_g4_phy_defconfig
+++ b/configs/ast_g4_phy_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_TARGET_AST_G4=y
 CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
index 6d11afbbc6c1..b1f4f185a53f 100644
--- a/configs/ast_g5_ncsi_defconfig
+++ b/configs/ast_g5_ncsi_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_TARGET_AST_G5=y
 CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_DHCP=y
diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
index 20f62e08f540..63ff21f65f71 100644
--- a/configs/ast_g5_phy_defconfig
+++ b/configs/ast_g5_phy_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_TARGET_AST_G5=y
 CONFIG_ASPEED_NET_PHY=y
 CONFIG_SYS_PROMPT="ast# "
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 81befc66cd62..d0638158ab25 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -14,7 +14,6 @@
 #ifndef __AST_COMMON_CONFIG_H
 #define __AST_COMMON_CONFIG_H
 
-#define CONFIG_ARCH_ASPEED
 #define CONFIG_EXTRA_ENV_SETTINGS ASPEED_ENV_SETTINGS
 
 #define CONFIG_ARCH_CPU_INIT
-- 
2.7.4
