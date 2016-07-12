Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rplJN0mbmzDqG0
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 00:50:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468335037980537.3482687067715;
 Tue, 12 Jul 2016 07:50:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Move ast2400 platforms to the dev-4.6 kernel tree
Date: Tue, 12 Jul 2016 09:50:34 -0500
Message-Id: <20160712145034.15569-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160712145034.15569-1-openbmc-patches@stwcx.xyz>
References: <20160712145034.15569-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jul 2016 14:50:45 -0000

From: Joel Stanley <joel@jms.id.au>

The defconfig is regnerated with the newer kernel base. A large number
of unused options are disabled to reduce the kernel binary size.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../recipes-kernel/linux/linux-obmc/defconfig      | 85 +++++-----------------
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |  5 --
 .../common/recipes-kernel/linux/linux-obmc_4.6.bb  |  2 +-
 3 files changed, 21 insertions(+), 71 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index d2266e9..3e661aa 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -2,7 +2,6 @@ CONFIG_CROSS_COMPILE="arm-linux-"
 CONFIG_KERNEL_XZ=y
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
-CONFIG_FHANDLE=y
 CONFIG_IRQ_DOMAIN_DEBUG=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
@@ -19,7 +18,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ASPEED=y
-CONFIG_MACH_OPP_PALMETTO_BMC=y
+CONFIG_MACH_ASPEED_G4=y
 CONFIG_AEABI=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 # CONFIG_ATAGS is not set
@@ -56,10 +55,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
-CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_LOOP=y
@@ -67,24 +62,21 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_ASPEED_BT_IPMI_HOST=y
+CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_93CX6=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-# CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_EZCHIP is not set
-CONFIG_FTMAC100=y
 CONFIG_FTGMAC100=y
 # CONFIG_NET_VENDOR_HISILICON is not set
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_RENESAS is not set
 # CONFIG_NET_VENDOR_ROCKER is not set
@@ -92,96 +84,54 @@ CONFIG_FTGMAC100=y
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_SMSC is not set
 # CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_MARVELL_PHY=y
-CONFIG_DAVICOM_PHY=y
 CONFIG_BROADCOM_PHY=y
-CONFIG_MICREL_PHY=y
-# CONFIG_USB_NET_DRIVERS is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT_LEDS is not set
-CONFIG_INPUT_POLLDEV=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
-CONFIG_INPUT_JOYDEV=y
+# CONFIG_INPUT_MOUSEDEV is not set
 CONFIG_INPUT_EVDEV=y
-# CONFIG_KEYBOARD_ATKBD is not set
-CONFIG_KEYBOARD_QT1070=y
-CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ADS7846=y
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 CONFIG_LEGACY_PTY_COUNT=4
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_SERIAL_8250_DMA is not set
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_ASPEED_VUART=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
+# CONFIG_HW_RANDOM is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_SLAVE_EEPROM=y
-CONFIG_SPI=y
-CONFIG_DEBUG_PINCTRL=y
 CONFIG_GPIO_ASPEED=y
+CONFIG_SENSORS_NCT7904=y
 CONFIG_SENSORS_POWER8_OCC_I2C=y
 CONFIG_PMBUS=y
-CONFIG_SENSORS_PMBUS=y
 CONFIG_SENSORS_ADM1275=y
-CONFIG_WATCHDOG=y
-CONFIG_ASPEED_24xx_WATCHDOG=y
-CONFIG_SSB=y
-CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
-CONFIG_LOGO=y
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_ACM=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB_SERIAL=y
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_GADGET=y
-CONFIG_USB_G_SERIAL=y
-CONFIG_MMC=y
-CONFIG_MMC_SPI=y
+CONFIG_SENSORS_TMP421=y
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_PWM=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
-CONFIG_RTC_DRV_RV3029C2=y
-CONFIG_DMADEVICES=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_MEMORY=y
-CONFIG_PWM=y
 CONFIG_FIRMWARE_MEMMAP=y
-CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_OVERLAY_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CONFIGFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_FS_XATTR=y
@@ -205,8 +155,13 @@ CONFIG_DEBUG_LL_UART_8250=y
 CONFIG_DEBUG_UART_PHYS=0x1e784000
 CONFIG_DEBUG_UART_VIRT=0xe8784000
 # CONFIG_CRYPTO_ECHAINIV is not set
-CONFIG_CRYPTO_CTR=y
-CONFIG_CRYPTO_GHASH=y
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_JITTERENTROPY=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_CRC_CCITT=y
-CONFIG_AVERAGE=y
+CONFIG_CRC16=y
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC7=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
deleted file mode 100644
index ef854a5..0000000
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-KBRANCH ?= "dev-4.4"
-LINUX_VERSION ?= "4.4"
-SRCREV="openbmc-20160606-1"
-
-require linux-obmc.inc
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
index 78bf3b2..3604087 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
@@ -1,5 +1,5 @@
 KBRANCH ?= "dev-4.6"
 LINUX_VERSION ?= "4.6"
-SRCREV="6bf0b62ef667270f8a8cce46abc6c1f9b68785a5"
+SRCREV="openbmc-20160713-1"
 
 require linux-obmc.inc
-- 
2.9.0
