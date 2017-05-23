Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wXD3f09bLzDqLS
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 21:35:24 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 23 May 2017 14:35:20 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4NBZJd9009346;
 Tue, 23 May 2017 14:35:20 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Add extended configuration for
 ast-g5 board
Date: Tue, 23 May 2017 14:34:10 +0300
Message-Id: <20170523113410.192036-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Tue, 23 May 2017 11:35:27 -0000

Add defconfig extends ast_g5_ncsi_defconfig with the number of options:
It allows 2-nd  boot partition, memory testing, boot, image info option,
extra filesystem and environment commands.
Add WATCHDOG_RESET macro support for aspeed g5 boards for cases when
HW watchdog is configured.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 board/aspeed/ast-g5/Kconfig         |  1 +
 board/aspeed/ast-g5/ast-g5.c        | 17 +++++++++++++++++
 configs/ast_g5_ncsi_2boot_defconfig | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 configs/ast_g5_ncsi_2boot_defconfig

diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
index 9bd3e7de49..0a8b38b9db 100644
--- a/board/aspeed/ast-g5/Kconfig
+++ b/board/aspeed/ast-g5/Kconfig
@@ -18,5 +18,6 @@ config SYS_SOC
 config SYS_CONFIG_NAME
 	default "ast-g5-phy" if ASPEED_NET_PHY
 	default "ast-g5-ncsi" if ASPEED_NET_NCSI
+	default "ast-g5-ncsi-2boot" if ASPEED_NET_NCSI && FIRMWARE_2ND_BOOT
 
 endif
diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
index da79d7b79a..2965ffea0e 100644
--- a/board/aspeed/ast-g5/ast-g5.c
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -46,3 +46,20 @@ int board_eth_init(bd_t *bd)
         return aspeednic_initialize(bd);
 }
 #endif
+
+/*Called by macro WATCHDOG_RESET*/
+#if defined(CONFIG_HW_WATCHDOG)
+
+#define AST_BASE_WD 0x1E785000 /* Watch DOG */
+#define WDT_28 0x28 /*WDT2 Counter Restart Register*/
+#define WDT_RESTART_VALUE 0x4755 /*value to write into WDT restart register.*/
+
+void hw_watchdog_reset(void)
+{
+	u32 reg = 0;
+	/*restart WD2 timer*/
+	reg = WDT_RESTART_VALUE;
+	writel(reg, AST_BASE_WD | WDT_28);
+}
+
+#endif /* CONFIG_WATCHDOG */
diff --git a/configs/ast_g5_ncsi_2boot_defconfig b/configs/ast_g5_ncsi_2boot_defconfig
new file mode 100644
index 0000000000..f919f237b4
--- /dev/null
+++ b/configs/ast_g5_ncsi_2boot_defconfig
@@ -0,0 +1,36 @@
+CONFIG_ARM=y
+CONFIG_TARGET_AST_G5=y
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTEFI=n
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_PING=y
+CONFIG_EFI_LOADER=n
+CONFIG_FIT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_HUSH_PARSER=y
+CONFIG_OF_LIBFDT=y
+CONFIG_SPI_FLASH=y
+CONFIG_SYS_NS16550=y
+CONFIG_FIRMWARE_2ND_BOOT=y
+CONFIG_AUTOBOOT=y
+CONFIG_AUTOBOOT_KEYED=y
+CONFIG_AUTOBOOT_PROMPT="\nBooting the BMC in %d seconds. Type the password to stop autoboot.\n"
+CONFIG_AUTOBOOT_STOP_STR="0penBmc"
+CONFIG_CMD_SAVEENV=y
+CONFIG_CMDLINE=y
+CONFIG_BOOTDELAY=5
+CONFIG_NETDEVICES=y
+CONFIG_CMD_GREPENV=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_EXT2=y
+CONFIG_CMD_FAT=y
+CONFIG_EXPERT=y
+CONFIG_REGEX=y
+CONFIG_CMD_IMI=y
+CONFIG_CMD_IMLS=y
+CONFIG_CMD_MEMORY=y
+CONFIG_CMD_CRC32=y
+CONFIG_LOOPW=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_MX_CYCLIC=y
+
-- 
2.11.0
