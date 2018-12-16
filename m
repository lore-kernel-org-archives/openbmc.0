Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43HhCw05GzzDqXw
 for <openbmc@lists.ozlabs.org>; Sun, 16 Dec 2018 22:00:59 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBGAUjBX024036;
 Sun, 16 Dec 2018 12:30:45 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 0721062DA4; Sun, 16 Dec 2018 13:00:43 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 11/11] arm: npcm: add configuration for EVB based
 NPCM7xx BMC
Date: Sun, 16 Dec 2018 13:00:35 +0200
Message-Id: <20181216110035.151310-12-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181216110035.151310-1-tmaimon77@gmail.com>
References: <20181216110035.151310-1-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2018 11:01:00 -0000

add configuration definition for evaluation board based
NPCM7xx (Poleg) BMC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/configs/npcm7xx_defconfig | 106 +++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 arch/arm/configs/npcm7xx_defconfig

diff --git a/arch/arm/configs/npcm7xx_defconfig b/arch/arm/configs/npcm7xx_defconfig
new file mode 100644
index 000000000000..f3cefe303a21
--- /dev/null
+++ b/arch/arm/configs/npcm7xx_defconfig
@@ -0,0 +1,106 @@
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_LOG_BUF_SHIFT=21
+CONFIG_CGROUPS=y
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_ARCH_NPCM=y
+CONFIG_ARCH_NPCM7XX=y
+CONFIG_SMP=y
+CONFIG_VMSPLIT_3G_OPT=y
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_CRYPTO=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_DEFAULT_DEADLINE=y
+CONFIG_BINFMT_MISC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_NPCM_FIU=y
+CONFIG_OF_OVERLAY=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_NPCM7XX_LPC_BPC=y
+CONFIG_NPCM7XX_PCI_MBOX=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_NPCM7XX_EMC_ETH=y
+CONFIG_STMMAC_ETH=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_NPCM7XX_KCS_IPMI_BMC=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_NPCM7XX=y
+CONFIG_SPI=y
+CONFIG_SPI_NPCM_PSPI=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_SENSORS_LM75=y
+CONFIG_SENSORS_NPCM7XX=y
+CONFIG_SENSORS_TMP102=y
+CONFIG_WATCHDOG=y
+CONFIG_USB_HIDDEV=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_IIO=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_CIFS=y
+CONFIG_CIFS_XATTR=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_READABLE_ASM=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_FUNCTION_TRACER=y
-- 
2.14.1
