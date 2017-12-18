Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0fN86DV2zDrcm
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 22:44:54 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBIBR5LK025130;
 Mon, 18 Dec 2017 13:27:05 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8785F5A927; Mon, 18 Dec 2017 13:44:43 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v3 2/4] arm: npcm: add configuration for EVB
 based NPCM7xx BMC
Date: Mon, 18 Dec 2017 13:44:38 +0200
Message-Id: <1513597480-2913-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513597480-2913-1-git-send-email-tmaimon77@gmail.com>
References: <1513597480-2913-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 11:44:57 -0000

add configuration definition for evaluation board based
NPCM7xx (Poleg) BMC

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/configs/poleg_svb_defconfig | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 arch/arm/configs/poleg_svb_defconfig

diff --git a/arch/arm/configs/poleg_svb_defconfig b/arch/arm/configs/poleg_svb_defconfig
new file mode 100644
index 000000000000..465da49bb400
--- /dev/null
+++ b/arch/arm/configs/poleg_svb_defconfig
@@ -0,0 +1,105 @@
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
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_DEFAULT_DEADLINE=y
+CONFIG_ARCH_NPCM=y
+CONFIG_ARCH_NPCM7XX=y
+CONFIG_AEABI=y
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=/dev/ram0 console=ttyS0,115200n8 initrd=0x1d00000,6000000 ramdisk_size=24000 mem=64M"
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
+CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_NUVOTON=y
+CONFIG_OF_OVERLAY=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_NPCM750_EMC_ETH=y
+CONFIG_STMMAC_ETH=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_SERIAL_NPCMX50=y
+CONFIG_SERIAL_NPCMX50_CONSOLE=y
+CONFIG_NPCM750_OTP=y
+CONFIG_NPCM750_OTP_WRITE_ENABLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_NPCMX50=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_SENSORS_LM75=y
+CONFIG_SENSORS_TMP102=y
+CONFIG_SENSORS_NPCM750=y
+CONFIG_WATCHDOG=y
+CONFIG_USB_HIDDEV=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_NPCMX50_USB2=y
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_EDM_KBD_MOUSE=m
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_NPCM750=y
+CONFIG_IIO=y
+CONFIG_NPCM750_ADC=y
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
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_READABLE_ASM=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_DEBUG_LL=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CTR=y
+CONFIG_CRYPTO_CMAC=y
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_CRYPTO_DEV_NPCMX50=y
+CONFIG_ARM_CRYPTO=y
-- 
2.14.1
