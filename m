Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZy1JKjzDqXR
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:49 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596644215129.94306550885176;
 Fri, 10 Jun 2016 15:10:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 10/11] AST2500: Initial AST2500 BSP layer
Date: Fri, 10 Jun 2016 17:10:29 -0500
Message-Id: <20160610221030.3943-11-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
References: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The AST2500 is an ARM SOC made by Aspeed.

This is only a stub; there are a couple missing bits of support
from the kernel/uboot.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-aspeed/meta-ast2500/conf/layer.conf       |  10 +
 .../meta-ast2500/conf/machine/include/ast2500.inc  |  15 ++
 .../recipes-bsp/u-boot/files/fw_env.config         |  24 +++
 .../recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend  |  12 ++
 .../recipes-bsp/u-boot/u-boot_%.bbappend           |   3 +
 .../recipes-kernel/linux/linux-obmc/defconfig      | 208 +++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../meta-aspeed/meta-ast2500/recipes.txt           |   2 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  |   2 +-
 .../recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb   |   2 +-
 .../common/recipes-bsp/u-boot/u-boot_2016.05.bb    |   2 +-
 11 files changed, 279 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/files/fw_env.config
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
new file mode 100644
index 0000000..ad1858a
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_PATTERN_ast2500 = "^${LAYERDIR}/"
+BBFILE_COLLECTIONS += "ast2500"
+LAYERVERSION_ast2500 = "1"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
new file mode 100644
index 0000000..3f016e4
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: Aspeed AST2500
+#@DESCRIPTION: Common machine configuration for the Aspeed AST2500 Chip
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
+
+UBOOT_MACHINE ?= "ast_g5_config"
+UBOOT_ENTRYPOINT ?= "0x80001000"
+UBOOT_LOADADDRESS ?= "0x80001000"
+
+INITRD_IMAGE_ENTRYPOINT = "0x81000000"
+INITRD_IMAGE_LOADADDRESS = "0x81000000"
+
+DEFAULTTUNE = "armv6-novfp"
+require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/files/fw_env.config b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/files/fw_env.config
new file mode 100644
index 0000000..978e4d6
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/files/fw_env.config
@@ -0,0 +1,24 @@
+# Configuration file for fw_(printenv/setenv) utility.
+# Up to two entries are valid, in this case the redundant
+# environment sector is assumed present.
+# Notice, that the "Number of sectors" is ignored on NOR and SPI-dataflash.
+# Futhermore, if the Flash sector size is ommitted, this value is assumed to
+# be the same as the Environment size, which is valid for NOR and SPI-dataflash
+
+# NOR example
+# MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
+#/dev/mtd1		0x0000		0x20000		0x20000
+#/dev/mtd2		0x0000		0x4000		0x4000
+
+# MTD SPI-dataflash example
+# MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
+#/dev/mtd2		0x00000		0x20000
+/run/fw_env		0x00000		0x20000
+#/dev/mtd5		0x4200		0x4200
+#/dev/mtd6		0x4200		0x4200
+
+# NAND example
+#/dev/mtd0		0x4000		0x4000		0x20000			2
+
+# Block device example
+#/dev/mmcblk0		0xc0000		0x20000
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
new file mode 100644
index 0000000..070f389
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://fw_env.config"
+
+do_install_append() {
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -d ${D}${sysconfdir}
+        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+    fi
+}
+
+BBCLASSEXTEND += "native"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot_%.bbappend
new file mode 100644
index 0000000..ef6a709
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://fw_env.config"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
new file mode 100644
index 0000000..6ceb00d
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
@@ -0,0 +1,208 @@
+CONFIG_CROSS_COMPILE="arm-linux-"
+CONFIG_KERNEL_XZ=y
+# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
+CONFIG_USELIB=y
+CONFIG_IRQ_DOMAIN_DEBUG=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_MULTI_V6=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_ASPEED=y
+CONFIG_MACH_ASPEED_G5=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_VMSPLIT_2G=y
+CONFIG_AEABI=y
+CONFIG_UACCESS_WITH_MEMCPY=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_KEXEC=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_NET_NCSI=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_DATAFLASH=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_FLASH_SPI=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_ASPEED_BT_IPMI_HOST=y
+CONFIG_EEPROM_93CX6=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+CONFIG_FTMAC100=y
+CONFIG_FTGMAC100=y
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_MARVELL_PHY=y
+CONFIG_DAVICOM_PHY=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_MICREL_PHY=y
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_LEDS is not set
+CONFIG_INPUT_POLLDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_QT1070=y
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_LEGACY_PTY_COUNT=4
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_SERIAL_8250_DMA is not set
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_SLAVE=y
+CONFIG_I2C_SLAVE_EEPROM=y
+CONFIG_SPI=y
+CONFIG_GPIO_ASPEED=y
+CONFIG_SENSORS_POWER8_OCC_I2C=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_ADM1275=y
+CONFIG_SSB=y
+CONFIG_FB=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_LOGO=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_ACM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_G_SERIAL=y
+CONFIG_MMC=y
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_RTC_DRV_RV3029C2=y
+CONFIG_DMADEVICES=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_MEMORY=y
+CONFIG_PWM=y
+CONFIG_FIRMWARE_MEMMAP=y
+CONFIG_EXT4_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_LL_UART_8250=y
+CONFIG_DEBUG_UART_PHYS=0x1e784000
+CONFIG_DEBUG_UART_VIRT=0xe8784000
+# CONFIG_CRYPTO_ECHAINIV is not set
+CONFIG_CRYPTO_CTR=y
+CONFIG_CRYPTO_GHASH=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=y
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..6d7ae27
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://defconfig"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
new file mode 100644
index 0000000..149509f
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
@@ -0,0 +1,2 @@
+recipes-bsp          - Anything with links to specific hardware or hardware configuration information
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
index 305c2b7..80d90fa 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+SRCREV = "47441cc36bb8e919a066837e4d7c5a8a1c475da4"
 UBRANCH = "v2016.05-ast2500"
 SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
 
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
index eed5f9c..27ed131 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
@@ -5,7 +5,7 @@ SECTION = "bootloader"
 
 DEPENDS = "openssl"
 
-SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+SRCREV = "47441cc36bb8e919a066837e4d7c5a8a1c475da4"
 UBRANCH = "v2016.05-ast2500"
 SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
 
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
index 0a229d5..f1d6318 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
@@ -3,7 +3,7 @@ require recipes-bsp/u-boot/u-boot.inc
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 DEPENDS += "dtc-native"
 
-SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+SRCREV = "47441cc36bb8e919a066837e4d7c5a8a1c475da4"
 UBRANCH = "v2016.05-ast2500"
 SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
 
-- 
2.8.3
