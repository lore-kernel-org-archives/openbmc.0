Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYfWd4N2PzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 17:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=nUahkv46; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id t190so775937pfb.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5yMCMiaCY8xJdZg0rAyOWwyHPJIAMaLIjuBxADuFKW8=;
 b=nUahkv46VjNYO4MT6DggvABkgAMuJ1KcrZFKmAtxvR3MR9Ho2Vc9cafMDlJNDEKy2X
 G9zq6rcQsOHYLykS107POfzVDLmr2xdARYOs9cNqMcd4WS400hEKwuc5cLuAA1JM39c3
 RA3wFUoM0pjZM6tdfIyzL7YpxOJGITpQaQNuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5yMCMiaCY8xJdZg0rAyOWwyHPJIAMaLIjuBxADuFKW8=;
 b=AzXRpSaDubFroEKS9bLGLJxI4FhFl08HUsSED65EsBHKPbWwvntM6fdc01YPb8zVoI
 2sEJNxA5EOjZylUgUUYgz971J3JuCg4ExQKzNJchEg/LSpqJZNs2PTDh4SCcaFsba3IB
 FNT5dw2Zq7TKsEUh57vvjbO6PFBeXrR1vKiyn3EAMYIvkZeveeY8bNOUpTmX1alqip4V
 ldDdQ10owsOGWKAElP6PTR8uIAEdPVAkLZ48orBei6cboTITMbhxByKNhlav7NDBvMqR
 UFHsol2ZytXj4Eo3JiUeR5tFgvh/bDD54ePePnzPuXmB1b79LdCsIrABMC7m4zvIK62I
 uK4A==
X-Gm-Message-State: ALyK8tL2xfxAjD1/Bz3PIcoJDOEv0NNOb68vwj6uCywSFJf4YHaU8ms3ZgJo8NpfRw8/Ew==
X-Received: by 10.98.2.74 with SMTP id 71mr26785876pfc.49.1466494203855;
 Tue, 21 Jun 2016 00:30:03 -0700 (PDT)
Received: from aurora.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id zv2sm13096910pac.43.2016.06.21.00.30.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jun 2016 00:30:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: clg@kaod.org,
	teddy.reed@gmail.com,
	andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [u-boot 1/3] ast-g5: Simplify config and board file
Date: Tue, 21 Jun 2016 16:59:43 +0930
Message-Id: <1466494185-24459-2-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466494185-24459-1-git-send-email-joel@jms.id.au>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 07:30:06 -0000

These cleanups make these files easier to adapt for supporting the
ast2400.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 board/aspeed/ast-g5/ast-g5.c |  1 -
 include/configs/ast-g5.h     | 85 ++++++--------------------------------------
 2 files changed, 11 insertions(+), 75 deletions(-)

diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
index 4643ef37c13c..4d68dd0b5878 100644
--- a/board/aspeed/ast-g5/ast-g5.c
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -75,7 +75,6 @@ int dram_init (void)
 	gd->ram_size = (dram - vga);
 
 	return 0;
-
 }
 
 #ifdef CONFIG_CMD_NET
diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
index 6c05e6d216cd..8787a8af7974 100644
--- a/include/configs/ast-g5.h
+++ b/include/configs/ast-g5.h
@@ -26,8 +26,6 @@
 #define CONFIG_MAC_NUM 2
 #define CONFIG_EXTRA_ENV_SETTINGS AST2500_ENV_SETTINGS
 
-/* #define DEBUG	1 */
-/* #define  CONFIG_SKIP_LOWLEVEL_INIT */
 #define CONFIG_AST_FPGA_VER 4 /* for arm1176 */
 
 /*
@@ -36,37 +34,29 @@
  */
 #define CONFIG_ARCH_CPU_INIT
 #define CONFIG_MISC_INIT_R		1
-#define CONFIG_MACH_TYPE				MACH_TYPE_ASPEED
-#ifdef CONFIG_ARCH_AST1070
-#define CONFIG_AST_GPIO
-#endif
+#define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
 
 
 #include <asm/arch/platform.h>
 
 /* Misc CPU related */
-/* #define CONFIG_ARCH_CPU_INIT */
 #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
 #define CONFIG_SETUP_MEMORY_TAGS
 #define CONFIG_INITRD_TAG
 
 #define CONFIG_CMDLINE_EDITING		1	/* command line history */
-/* #define CONFIG_SYS_HUSH_PARSER		1 */	/* Use the HUSH parser		*/
-
-/* ------------------------------------------------------------------------- */
 
 /* Enable cache controller */
 #define CONFIG_SYS_DCACHE_OFF	1
-
 /* ------------------------------------------------------------------------- */
 /* additions for new relocation code, must added to all boards */
-#define CONFIG_SYS_SDRAM_BASE			(AST_DRAM_BASE)
-#define CONFIG_SYS_INIT_RAM_ADDR		CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
-#define CONFIG_SYS_INIT_RAM_SIZE		(32*1024)
-#define CONFIG_SYS_INIT_RAM_END     (CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
+#define CONFIG_SYS_SDRAM_BASE		(AST_DRAM_BASE)
+#define CONFIG_SYS_INIT_RAM_ADDR	CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
+#define CONFIG_SYS_INIT_RAM_SIZE	(32*1024)
+#define CONFIG_SYS_INIT_RAM_END		(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
 #define CONFIG_SYS_INIT_SP_ADDR 	(CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
 
-#define CONFIG_NR_DRAM_BANKS	1
+#define CONFIG_NR_DRAM_BANKS		1
 
 #define CONFIG_SYS_MEMTEST_START		CONFIG_SYS_SDRAM_BASE + 0x300000
 #define CONFIG_SYS_MEMTEST_END			(CONFIG_SYS_MEMTEST_START + (80*1024*1024))
@@ -85,18 +75,12 @@
  */
 #define CONFIG_ASPEED_TIMER_CLK		(1*1000*1000) /* use external clk (1M) */
 
-/*
- * Hardware drivers
- */
-
-/* #define CONFIG_FARADAYNIC */
-/* #define CONFIG_DRIVER_ASPEED_I2C */
 
 /*
  * NS16550 Configuration
  */
 #define CONFIG_SYS_NS16550_SERIAL
-#define CONFIG_SYS_NS16550_REG_SIZE		-4
+#define CONFIG_SYS_NS16550_REG_SIZE		(-4)
 #define CONFIG_SYS_NS16550_CLK			24000000
 #define CONFIG_SYS_NS16550_COM1			AST_UART0_BASE
 #define CONFIG_SYS_LOADS_BAUD_CHANGE
@@ -104,11 +88,6 @@
 #define CONFIG_CONS_INDEX				1
 #define CONFIG_BAUDRATE					115200
 
-/* #define CONFIG_SYS_BAUDRATE_TABLE		{ 9600, 19200, 38400, 57600, 115200 } */
-
-/* #define CONFIG_SYS_MAX_FLASH_BANKS      1 */
-/* #define CONFIG_SYS_MAX_FLASH_SECT       (256) */           /* max number of sectors on one chip */
-
 /*
  * BOOTP options
  */
@@ -137,23 +116,18 @@
 #define CONFIG_SYS_MAXARGS	16		/* max number of command args */
 #define CONFIG_SYS_BARGSIZE	CONFIG_SYS_CBSIZE /* Boot Argument Buffer Size */
 
-#define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
+#define CONFIG_SYS_LOAD_ADDR	0x83000000	/* default load address */
 
 #define CONFIG_BOOTARGS		"console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
 
 /* ------------------------------------------------------------------------- */
-
-/* ------------------------------------------------------------------------- */
 #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
 
 #ifdef CONFIG_AST_SPI_NOR
 
 #define CONFIG_FMC_CS			1
-/*#define CONFIG_SPI0_CS		1 */
 
-/*#define CONFIG_FLASH_DMA */
 #define CONFIG_SYS_MAX_FLASH_BANKS 	(CONFIG_FMC_CS)
-/*#define CONFIG_SYS_MAX_FLASH_SECT	(1024)	*/	/* max number of sectors on one chip */
 #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
 #define CONFIG_ENV_IS_IN_FLASH		1
 #define CONFIG_ENV_ADDR				(AST_FMC_CS0_BASE + 0x60000)
@@ -161,16 +135,15 @@
 #endif
 
 /* ------------------------------------------------------------------------- */
-#define CONFIG_ENV_OFFSET				0x60000	/* environment starts here  */
-#define CONFIG_ENV_SIZE					0x20000		/* Total Size of Environment Sector */
+#define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
+#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
 
 #define CONFIG_BOOTCOMMAND	"bootm 20080000 20300000"
 #define CONFIG_ENV_OVERWRITE
 
-#define AST2500_ENV_SETTINGS					\
+#define AST2500_ENV_SETTINGS \
 	"verify=yes\0"	\
 	"spi_dma=yes\0" \
-	"update=tftp 80800000 ast2500.scr; so 80800000\0" \
 	""
 
 /* ------------------------------------------------------------------------- */
@@ -183,48 +156,12 @@
 #define CONFIG_PHY_ADDR			0
 #define CONFIG_PHY_REALTEK
 #endif
-
 #ifdef CONFIG_CMD_NET
-/* #define CONFIG_MAC_NUM	2 */
 #define CONFIG_FTGMAC100
 #define CONFIG_PHY_MAX_ADDR	32	/* this comes from <linux/phy.h> */
-/* #define CONFIG_SYS_DISCOVER_PHY */
 #define CONFIG_FTGMAC100_EGIGA
 
-#define CONFIG_GATEWAYIP		192.168.0.1
-#define CONFIG_NETMASK			255.255.255.0
-#define CONFIG_IPADDR			192.168.0.45
-#define CONFIG_SERVERIP			192.168.0.81
-#define CONFIG_ETHADDR			00:C0:A8:12:34:56
-#define CONFIG_ETH1ADDR			00:C0:A8:12:34:57
-
-#endif
 
-#ifdef CONFIG_PCI
-#define CONFIG_CMD_PCI
-#define CONFIG_PCI_PNP
-#define CONFIG_PCI_SCAN_SHOW
-#define CONFIG_PCI_CONFIG_HOST_BRIDGE
-
-#define CONFIG_SYS_PCIE1_BASE		0x8c000000
-#define CONFIG_SYS_PCIE1_CFG_BASE	0x8c000000
-#define CONFIG_SYS_PCIE1_CFG_SIZE	0x01000000
-#define CONFIG_SYS_PCIE1_MEM_BASE	0x8d000000
-#define CONFIG_SYS_PCIE1_MEM_PHYS	0x8d000000
-#define CONFIG_SYS_PCIE1_MEM_SIZE	0x01000000
-#define CONFIG_SYS_PCIE1_IO_BASE	0x8e000000
-#define CONFIG_SYS_PCIE1_IO_PHYS	0x8e000000
-#define CONFIG_SYS_PCIE1_IO_SIZE	0x00100000
-
-#define CONFIG_SYS_PCIE2_BASE		0x8f000000
-#define CONFIG_SYS_PCIE2_CFG_BASE	0x8f000000
-#define CONFIG_SYS_PCIE2_CFG_SIZE	0x01000000
-#define CONFIG_SYS_PCIE2_MEM_BASE	0x90000000
-#define CONFIG_SYS_PCIE2_MEM_PHYS	0x90000000
-#define CONFIG_SYS_PCIE2_MEM_SIZE	0x00100000
-#define CONFIG_SYS_PCIE2_IO_BASE	0x91000000
-#define CONFIG_SYS_PCIE2_IO_PHYS	0x91000000
-#define CONFIG_SYS_PCIE2_IO_SIZE	0x00100000
 #endif
 
 /* -------------------------------------------------------------------------
-- 
2.8.1
