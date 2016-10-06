Return-Path: <clg@kaod.org>
X-Greylist: delayed 1026 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:44:10 AEDT
Received: from 3.mo1.mail-out.ovh.net (3.mo1.mail-out.ovh.net [46.105.60.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmPk0G5KzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:44:09 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9A7A21171D
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:01 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 6A4042A006D;
 Thu,  6 Oct 2016 23:26:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 01/12] aspeed: add CONFIG_AST_SPI_NOR
Date: Thu,  6 Oct 2016 23:26:34 +0200
Message-Id: <1475789205-19618-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13953559020794120962
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:10 -0000

also remove some useless code related the host SPI PNOR

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig             |  2 ++
 arch/arm/mach-aspeed/flash.c | 18 +-----------------
 board/aspeed/Kconfig         |  6 ++++++
 include/configs/ast-common.h |  4 +---
 4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 328dc7fe455a..f155d22b1197 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -902,10 +902,12 @@ config TARGET_THUNDERX_88XX
 config TARGET_AST_G5
        bool "Support Apseed fifth generation SoCs"
        select CPU_ARM1176
+       select AST_SPI_NOR
 
 config TARGET_AST_G4
        bool "Support Aspeed fourth generation SoCs"
        select CPU_ARM926EJS
+       select AST_SPI_NOR
 
 endchoice
 
diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 9c5ead6fd7ae..01c5354b66d4 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -1310,7 +1310,7 @@ unsigned long flash_init (void)
 
 	/* Init: FMC  */
 	/* BANK 0 : FMC CS0 , 1: FMC CS1, */
-	for (i = 0; i < CONFIG_FMC_CS; ++i) {
+	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; ++i) {
 		flash_info[i].sysspi = 0;
 		flash_info[i].reg_base = AST_FMC_BASE;
 		flash_info[i].flash_id = FLASH_UNKNOWN;
@@ -1332,22 +1332,6 @@ unsigned long flash_init (void)
 		}
 	}
 
-	/* BANK 2:SYSSPI CS0 */
-#ifdef CONFIG_SPI0_CS
-	//pin switch by trap[13:12]	-- [0:1] Enable SPI Master
-	ast_scu_spi_master(1);	/* enable SPI master */
-	*((volatile ulong*) AST_FMC_SPI0_BASE) |= 0x10000;	/* enable Flash Write */
-	flash_info[CONFIG_FMC_CS].sysspi = 1;
-	flash_info[CONFIG_FMC_CS].reg_base = AST_FMC_SPI0_BASE;
-	flash_info[CONFIG_FMC_CS].flash_id = FLASH_UNKNOWN;
-	flash_info[CONFIG_FMC_CS].CE = 0;
-	size += flash_info[CONFIG_FMC_CS].size = flash_get_size(AST_SPI0_CS0_BASE, &flash_info[CONFIG_FMC_CS]);
-	if (flash_info[2].flash_id == FLASH_UNKNOWN) {
-		printf ("## Unknown FLASH on Bank 2 SYS SPI - Size = 0x%08lx = %ld MB\n",
-			flash_info[CONFIG_FMC_CS].size, flash_info[CONFIG_FMC_CS].size << 20);
-	}
-#endif
-
 	/* Monitor protection ON by default */
 #if (CONFIG_MONITOR_BASE >= AST_FMC_CS0_BASE)
 	flash_protect (FLAG_PROTECT_SET,
diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
index 5d356e297a7d..3dcf1a26d50e 100644
--- a/board/aspeed/Kconfig
+++ b/board/aspeed/Kconfig
@@ -14,3 +14,9 @@ config ASPEED_NET_NCSI
 	bool  "Use a network controller attached via NSCI"
 
 endchoice
+
+config AST_SPI_NOR
+	bool "Enable Aspeed SMC driver"
+	help
+	  Enable Aspeed SMC driver to access the SPI NOR flash of the
+	  BMC
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index b39ea33ce710..81befc66cd62 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -86,9 +86,7 @@
 
 #define CONFIG_BOOTARGS			"console=ttyS4,115200n8 root=/dev/ram rw"
 
-#define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
-#define CONFIG_FMC_CS			1
-#define CONFIG_SYS_MAX_FLASH_BANKS 	(CONFIG_FMC_CS)
+#define CONFIG_SYS_MAX_FLASH_BANKS 	1
 #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
 #define CONFIG_ENV_IS_IN_FLASH		1
 #define CONFIG_ENV_ADDR			(AST_FMC_CS0_BASE + 0x60000)
-- 
2.7.4
