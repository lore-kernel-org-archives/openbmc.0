Return-Path: <vadimp@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3s8LmB4qknzDqRR
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 16:27:21 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 vadimp@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 10 Aug 2016 09:27:16 +0300
Received: from r-mgtswh-236.mtr.labs.mlnx (r-mgtswh-236.mtr.labs.mlnx
 [10.209.1.207])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id u7A6RFYU017775;
 Wed, 10 Aug 2016 09:27:15 +0300
From: vadimp@mellanox.com
To: openbmc@lists.ozlabs.org
Cc: jiri@mellanox.com, michaelsh@mellanox.com, shays@mellanox.com,
 yanivab@mellanox.com
Subject: [patch v2016.07] Added Mellanox BMC board configuration and setup
 files and build recipes. Signed-off-by: Yaniv Abraham <yanivab@mellanox.com>
Date: Wed, 10 Aug 2016 07:31:26 +0000
Message-Id: <1470814286-51626-1-git-send-email-vadimp@mellanox.com>
X-Mailer: git-send-email 2.1.4
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
X-List-Received-Date: Wed, 10 Aug 2016 06:27:24 -0000

From: Yaniv Abraham <yanivab@mellanox.com>

---
 arch/arm/Kconfig                               |   5 +
 board/aspeed/Kconfig                           |   2 +-
 board/mellanox/Kconfig                         |   1 +
 board/mellanox/mlnxast2500bmc/Kconfig          |  18 +++
 board/mellanox/mlnxast2500bmc/Makefile         |  24 ++++
 board/mellanox/mlnxast2500bmc/mlnxast2500bmc.c |  74 ++++++++++
 configs/mlnxast2500bmc_defconfig               |  29 ++++
 include/configs/mlnxast2500bmc.h               | 181 +++++++++++++++++++++++++
 8 files changed, 333 insertions(+), 1 deletion(-)
 create mode 100644 board/mellanox/Kconfig
 create mode 100644 board/mellanox/mlnxast2500bmc/Kconfig
 create mode 100644 board/mellanox/mlnxast2500bmc/Makefile
 create mode 100644 board/mellanox/mlnxast2500bmc/mlnxast2500bmc.c
 create mode 100644 configs/mlnxast2500bmc_defconfig
 create mode 100644 include/configs/mlnxast2500bmc.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 22bb3d4..f3afdc1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -857,6 +857,10 @@ config TARGET_AST_G4
        bool "Support Aspeed fourth generation SoCs"
        select CPU_ARM926EJS
 
+config TARGET_MELLANOX_AST2500BMC
+       bool "Support Mellanox BMC (based on AST2500 SoC)"
+       select CPU_ARM1176
+
 endchoice
 
 source "arch/arm/mach-at91/Kconfig"
@@ -999,6 +1003,7 @@ source "board/woodburn/Kconfig"
 source "board/work-microwave/work_92105/Kconfig"
 source "board/zipitz2/Kconfig"
 source "board/aspeed/Kconfig"
+source "board/mellanox/Kconfig"
 
 source "arch/arm/Kconfig.debug"
 
diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
index 5d356e2..1f142a6 100644
--- a/board/aspeed/Kconfig
+++ b/board/aspeed/Kconfig
@@ -11,6 +11,6 @@ config ASPEED_NET_PHY
 	bool "Use a direct attached PHY"
 
 config ASPEED_NET_NCSI
-	bool  "Use a network controller attached via NSCI"
+	bool  "Use a network controller attached via NCSI"
 
 endchoice
diff --git a/board/mellanox/Kconfig b/board/mellanox/Kconfig
new file mode 100644
index 0000000..88de7e4
--- /dev/null
+++ b/board/mellanox/Kconfig
@@ -0,0 +1 @@
+source "board/mellanox/mlnxast2500bmc/Kconfig"
diff --git a/board/mellanox/mlnxast2500bmc/Kconfig b/board/mellanox/mlnxast2500bmc/Kconfig
new file mode 100644
index 0000000..de3efa8
--- /dev/null
+++ b/board/mellanox/mlnxast2500bmc/Kconfig
@@ -0,0 +1,18 @@
+if TARGET_MELLANOX_AST2500BMC
+
+config SYS_CPU
+	default "arm1176"
+
+config SYS_BOARD
+	default "mlnxast2500bmc"
+
+config SYS_VENDOR
+	default "mellanox"
+
+config SYS_SOC
+	default "aspeed"
+
+config SYS_CONFIG_NAME
+	default "mlnxast2500bmc"
+
+endif
diff --git a/board/mellanox/mlnxast2500bmc/Makefile b/board/mellanox/mlnxast2500bmc/Makefile
new file mode 100644
index 0000000..0b25b04
--- /dev/null
+++ b/board/mellanox/mlnxast2500bmc/Makefile
@@ -0,0 +1,24 @@
+#
+# (C) Copyright 2000-2006
+# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+#
+# See file CREDITS for list of people who contributed to this
+# project.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; either version 2 of
+# the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+# MA 02111-1307 USA
+#
+
+obj-y	= mlnxast2500bmc.o
diff --git a/board/mellanox/mlnxast2500bmc/mlnxast2500bmc.c b/board/mellanox/mlnxast2500bmc/mlnxast2500bmc.c
new file mode 100644
index 0000000..81ea88a
--- /dev/null
+++ b/board/mellanox/mlnxast2500bmc/mlnxast2500bmc.c
@@ -0,0 +1,74 @@
+/*
+ * (C) Copyright 2002
+ * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
+ * Marius Groeger <mgroeger@sysgo.de>
+ *
+ * (C) Copyright 2002
+ * David Mueller, ELSOFT AG, <d.mueller@elsoft.ch>
+ *
+ * (C) Copyright 2003
+ * Texas Instruments, <www.ti.com>
+ * Kshitij Gupta <Kshitij@ti.com>
+ *
+ * (C) Copyright 2004
+ * ARM Ltd.
+ * Philippe Robin, <philippe.robin@arm.com>
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <common.h>
+#include <netdev.h>
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/ast-sdmc.h>
+#include <asm/io.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+#if defined(CONFIG_SHOW_BOOT_PROGRESS)
+void show_boot_progress(int progress)
+{
+    printf("Boot reached stage %d\n", progress);
+}
+#endif
+
+int board_init(void)
+{
+	/* adress of boot parameters */
+	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
+	gd->flags = 0;
+	return 0;
+}
+
+int dram_init(void)
+{
+	/* dram_init must store complete ramsize in gd->ram_size */
+	u32 vga = ast_scu_get_vga_memsize();
+	u32 dram = ast_sdmc_get_mem_size();
+	gd->ram_size = (dram - vga);
+
+	return 0;
+}
+
+#ifdef CONFIG_CMD_NET
+int board_eth_init(bd_t *bd)
+{
+        return ftgmac100_initialize(bd);
+}
+#endif
diff --git a/configs/mlnxast2500bmc_defconfig b/configs/mlnxast2500bmc_defconfig
new file mode 100644
index 0000000..d1629e1
--- /dev/null
+++ b/configs/mlnxast2500bmc_defconfig
@@ -0,0 +1,29 @@
+CONFIG_ARM=y
+CONFIG_TARGET_MELLANOX_AST2500BMC=y
+CONFIG_LOCALVERSION="Mellanox AST2500 BMC"
+CONFIG_SPI_FLASH=y
+CONFIG_SYS_NS16550=y
+CONFIG_SYS_PROMPT="mlnx-bmc_loader# "
+CONFIG_CMD_FPGA=y
+CONFIG_CMD_SAVEENV=y
+CONFIG_CMD_FLASH=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_DHCP=y
+CONFIG_HUSH_PARSER=y
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_NETDEVICES=y
+CONFIG_OF_LIBFDT=y
+CONFIG_CMD_GREPENV=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_EXT2=y
+CONFIG_CMD_FAT=y
+# CONFIG_EXPERT is not set
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+# CONFIG_EFI_LOADER is not set
+# CONFIG_CMD_GO is not set
+# CONFIG_CMD_RUN is not set
+# CONFIG_CMD_IMLS is not set
+# CONFIG_CMD_XIMG is not set
diff --git a/include/configs/mlnxast2500bmc.h b/include/configs/mlnxast2500bmc.h
new file mode 100644
index 0000000..8376fe0
--- /dev/null
+++ b/include/configs/mlnxast2500bmc.h
@@ -0,0 +1,181 @@
+/*
+ * Copyright (C) 2016 Mellanox Technologies Ltd.
+ * Yaniv Abraham-Rabinovitch <yanivab@mellanox.com>
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_ARCH_ASPEED
+#define CONFIG_ARCH_AST2500
+#define CONFIG_MAC_NUM 2
+#define CONFIG_EXTRA_ENV_SETTINGS AST2500_ENV_SETTINGS
+
+#define CONFIG_AST_FPGA_VER 4 /* for arm1176 */
+
+/*
+ * High Level Configuration Options
+ * (easy to change)
+ */
+#define CONFIG_ARCH_CPU_INIT
+#define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
+
+#define CONFIG_ASPEEDNIC
+
+#include <asm/arch/platform.h>
+
+/* Misc CPU related */
+#define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
+#define CONFIG_SETUP_MEMORY_TAGS
+#define CONFIG_INITRD_TAG
+
+#define CONFIG_CMDLINE_EDITING		1	/* command line history */
+
+/* Enable cache controller */
+#define CONFIG_SYS_DCACHE_OFF	1
+/* ------------------------------------------------------------------------- */
+/* additions for new relocation code, must added to all boards */
+#define CONFIG_SYS_SDRAM_BASE		(AST_DRAM_BASE)
+#define CONFIG_SYS_INIT_RAM_ADDR	CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
+#define CONFIG_SYS_INIT_RAM_SIZE	(32*1024)
+#define CONFIG_SYS_INIT_RAM_END		(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
+#define CONFIG_SYS_INIT_SP_ADDR 	(CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
+
+#define CONFIG_NR_DRAM_BANKS		1
+
+#define CONFIG_SYS_MEMTEST_START		CONFIG_SYS_SDRAM_BASE + 0x300000
+#define CONFIG_SYS_MEMTEST_END			(CONFIG_SYS_MEMTEST_START + (80*1024*1024))
+/*-----------------------------------------------------------------------*/
+
+#define CONFIG_SYS_TEXT_BASE            0
+#define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
+/*
+ * Memory Info
+ */
+#define CONFIG_SYS_MALLOC_LEN   	(0x1000 + 4*1024*1024) /* malloc() len */
+
+
+/*
+ * Timer Set
+ */
+#define CONFIG_ASPEED_TIMER_CLK		(1*1000*1000) /* use external clk (1M) */
+
+
+/*
+ * NS16550 Configuration
+ */
+#define CONFIG_SYS_NS16550_SERIAL
+#define CONFIG_SYS_NS16550_REG_SIZE		(-4)
+#define CONFIG_SYS_NS16550_CLK			24000000
+#define CONFIG_SYS_NS16550_COM1			AST_UART0_BASE
+#define CONFIG_SYS_LOADS_BAUD_CHANGE
+#define CONFIG_SERIAL1					1
+#define CONFIG_CONS_INDEX				1
+#define CONFIG_BAUDRATE					115200
+
+/*
+ * BOOTP options
+ */
+#define CONFIG_BOOTP_BOOTFILESIZE
+#define CONFIG_BOOTP_BOOTPATH
+#define CONFIG_BOOTP_GATEWAY
+#define CONFIG_BOOTP_HOSTNAME
+#define CONFIG_BOOTP_SUBNETMASK
+
+/*
+ * Environment Config
+ */
+#define CONFIG_BOOTDELAY	2
+#define CONFIG_BOOTFILE		"mlnxast2500bmc_image.bin"
+
+/*
+ * Miscellaneous configurable options
+ */
+#define CONFIG_SYS_LONGHELP	/* undef to save memory */
+#define CONFIG_SYS_CBSIZE	256		/* Console I/O Buffer Size */
+
+/* Print Buffer Size */
+#define CONFIG_SYS_PBSIZE	(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
+#define CONFIG_SYS_MAXARGS	16		/* max number of command args */
+#define CONFIG_SYS_BARGSIZE	CONFIG_SYS_CBSIZE /* Boot Argument Buffer Size */
+
+#define CONFIG_SYS_LOAD_ADDR	0x83000000	/* default load address */
+
+#define CONFIG_BOOTARGS		"console=ttyS4,115200n8 root=/dev/ram ro"
+
+/* ------------------------------------------------------------------------- */
+#define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
+
+#ifdef CONFIG_AST_SPI_NOR
+
+#define CONFIG_FMC_CS			1
+#define CONFIG_SYS_MAX_FLASH_BANKS 	(CONFIG_FMC_CS)
+#define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
+#define CONFIG_ENV_IS_IN_FLASH		1
+#define CONFIG_ENV_ADDR				(AST_FMC_CS0_BASE + 0x60000)
+
+#endif
+
+/* ------------------------------------------------------------------------- */
+#define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
+#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
+
+#define CONFIG_BOOTCOMMAND	"bootm 20080000 20380000"
+#define CONFIG_ENV_OVERWRITE
+
+#define AST2500_ENV_SETTINGS \
+	"verify=yes\0"	\
+	"spi_dma=yes\0" \
+	""
+
+/* ------------------------------------------------------------------------- */
+
+/* Ethernet */
+#ifdef CONFIG_CMD_MII
+#define CONFIG_MII			1
+#define CONFIG_PHY_GIGE
+#define CONFIG_PHYLIB
+#define CONFIG_PHY_ADDR			0
+#define CONFIG_PHY_REALTEK
+#endif
+#ifdef CONFIG_CMD_NET
+#define CONFIG_FTGMAC100
+#define CONFIG_PHY_MAX_ADDR	32	/* this comes from <linux/phy.h> */
+#define CONFIG_FTGMAC100_EGIGA
+
+
+#endif
+
+/* -------------------------------------------------------------------------
+ * 1. DRAM Speed
+ * #define CONFIG_DRAM_1333
+ * #define CONFIG_DRAM_1600        (default)
+ * #define CONFIG_DRAM_1866
+ *  2. UART5 message output
+ * #define	 CONFIG_DRAM_UART_38400
+ * 3. DRAM Type
+ * #define CONFIG_DDR3_8GSTACK     DDR3 8Gbit Stack die
+ * 4. ECC Function enable
+ * #define CONFIG_DRAM_ECC
+ */
+#define	CONFIG_DRAM_ECC_SIZE	0x10000000
+
+#endif	/* __CONFIG_H */
-- 
2.1.4
