Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wXrjl3ZG8zDqdW
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 22:07:05 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 24 May 2017 15:06:55 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4OC6tlg018481;
 Wed, 24 May 2017 15:06:55 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc v2] Add extended configuration
 for ast-g5 board
Date: Wed, 24 May 2017 15:05:56 +0300
Message-Id: <20170524120556.34365-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Wed, 24 May 2017 12:07:08 -0000

Add defconfig extends ast_g5_ncsi_defconfig with the number of options:
It allows 2-nd  boot partition, memory testing, boot, image info option,
extra filesystem and environment commands.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 board/aspeed/ast-g5/Kconfig         |  1 +
 configs/ast_g5_ncsi_2boot_defconfig | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
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
