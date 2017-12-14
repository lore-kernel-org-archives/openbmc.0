Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yy7nq6KnvzDrYD
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 20:39:56 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBE9M9c3017051;
 Thu, 14 Dec 2017 11:22:09 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id B66F95A933; Thu, 14 Dec 2017 11:39:45 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, joel.stan@gmail.com, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 1/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 14 Dec 2017 11:39:29 +0200
Message-Id: <1513244371-10369-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
References: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 14 Dec 2017 09:40:01 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Based on [v8,1/3] arm: npcm: add basic support for Nuvoton BMCs patch:
Brendan Higgins : - https://patchwork.kernel.org/patch/10063409/

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/Kconfig                    |   2 +
 arch/arm/Makefile                   |   1 +
 arch/arm/configs/PolegSVB_defconfig | 428 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-npcm/Kconfig          |  61 +++++
 arch/arm/mach-npcm/Makefile         |   6 +
 arch/arm/mach-npcm/headsmp.S        |  22 ++
 arch/arm/mach-npcm/npcm7xx.c        |  27 +++
 arch/arm/mach-npcm/platsmp.c        |  86 ++++++++
 8 files changed, 633 insertions(+)
 create mode 100644 arch/arm/configs/PolegSVB_defconfig
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 61a0cb15067e..05543f1cfbde 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -782,6 +782,8 @@ source "arch/arm/mach-netx/Kconfig"
 
 source "arch/arm/mach-nomadik/Kconfig"
 
+source "arch/arm/mach-npcm/Kconfig"
+
 source "arch/arm/mach-nspire/Kconfig"
 
 source "arch/arm/plat-omap/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 47d3a1ab08d2..60ca50c7d762 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
 machine-$(CONFIG_ARCH_MXS)		+= mxs
 machine-$(CONFIG_ARCH_NETX)		+= netx
 machine-$(CONFIG_ARCH_NOMADIK)		+= nomadik
+machine-$(CONFIG_ARCH_NPCM)		+= npcm
 machine-$(CONFIG_ARCH_NSPIRE)		+= nspire
 machine-$(CONFIG_ARCH_OXNAS)		+= oxnas
 machine-$(CONFIG_ARCH_OMAP1)		+= omap1
diff --git a/arch/arm/configs/PolegSVB_defconfig b/arch/arm/configs/PolegSVB_defconfig
new file mode 100644
index 000000000000..149e422a24ef
--- /dev/null
+++ b/arch/arm/configs/PolegSVB_defconfig
@@ -0,0 +1,428 @@
+CONFIG_ARM=y
+CONFIG_FIQ=y
+
+#
+# General setup
+#
+CONFIG_SYSVIPC=y
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_BSD_PROCESS_ACCT=y
+
+#
+# RCU Subsystem
+#
+CONFIG_LOG_BUF_SHIFT=21
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_EMBEDDED=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_SLAB=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_MSDOS_PARTITION=y
+
+#
+# IO Schedulers
+#
+CONFIG_DEFAULT_DEADLINE=y
+
+#
+# System Type
+#
+CONFIG_ARCH_NPCM=y
+
+#
+# NPCM7xx Architecture
+#
+CONFIG_ARCH_NPCM7XX=y
+CONFIG_ARCH_NPCM750=y
+
+#
+# Processor Type
+#
+CONFIG_CPU_USE_DOMAINS=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_L1_CACHE_SHIFT_6=y
+CONFIG_MULTI_IRQ_HANDLER=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_SMP=y
+CONFIG_OF_OVERLAY=y
+CONFIG_AEABI=y
+CONFIG_HAVE_ARCH_PFN_VALID=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=/dev/ram0 console=ttyS0,115200n8 initrd=0x1d00000,6000000 ramdisk_size=24000 mem=64M"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_INET_TCP_DIAG=y
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+
+#
+# Bus devices
+#
+CONFIG_MTD=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_NUVOTON=y
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_BLOCK=y
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_RAM=y
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+
+#
+# Device Tree and Open Firmware support
+#
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+
+#
+# Misc devices
+#
+
+#
+# Nuvoton Miscellaneous optional drivers
+#
+CONFIG_NPCMX50_GPIO=y
+CONFIG_NPCMX50_KCS=y
+CONFIG_NPCMX50_BIOS_POST_CODE=y
+CONFIG_NPCMX50_PSPI=y
+CONFIG_NPCMX50_VDM=y
+
+#
+# SCSI device support
+#
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+
+#
+# SCSI Transports
+#
+CONFIG_NETDEVICES=y
+#CONFIG_TIGON3=y depend on PCI
+
+#
+# Distributed Switch Architecture drivers
+#
+#CONFIG_E1000E=y depend on PCI
+CONFIG_NET_VENDOR_NUVOTON=y
+CONFIG_NPCM750_EMC_ETH=y
+CONFIG_STMMAC_ETH=y
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+CONFIG_BROADCOM_PHY=y
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_NPCMX50=y
+CONFIG_SERIAL_NPCMX50_CONSOLE=y
+CONFIG_NPCM750_OTP=y
+CONFIG_NPCM750_OTP_WRITE_ENABLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_NPCM750=y
+
+#
+# I2C support
+#
+CONFIG_I2C=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_NPCMX50=y
+
+#
+# Native drivers
+#
+CONFIG_SENSORS_LM75=y
+CONFIG_SENSORS_TMP102=y
+CONFIG_WATCHDOG=y
+
+#
+# Watchdog Device Drivers
+#
+CONFIG_NPCM750_WATCHDOG=y
+#
+# hwmon drivers
+#
+CONFIG_SENSORS_NPCM750=y
+
+#
+# USB HID support
+#
+CONFIG_USB_HIDDEV=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# USB Host Controller Drivers
+#
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_OHCI_HCD=y
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+CONFIG_USB_CHIPIDEA=y     # maybe can be removed
+CONFIG_USB_CHIPIDEA_UDC=y # maybe can be removed
+
+#
+# USB Physical Layer drivers
+#
+CONFIG_USB_GADGET=y
+
+#
+# USB Peripheral Controller
+#
+CONFIG_USB_GADGET_NPCMX50_USB2=y
+CONFIG_USB_NPCMX50_USB2=y
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_EDM_KBD_MOUSE=m
+CONFIG_MMC=y
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_NPCM750=y
+
+#
+# SOC (System On Chip) specific Drivers
+#
+CONFIG_IIO=y
+CONFIG_NPCM750_ADC=y
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+
+#
+# Pseudo filesystems
+#
+CONFIG_TMPFS=y
+CONFIG_CONFIGFS_FS=m
+CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_CIFS=y
+CONFIG_CIFS_SMB2=y
+CONFIG_CIFS_XATTR=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+
+#
+# Kernel hacking
+#
+
+#
+# printk and dmesg options
+#
+
+#
+# Compile-time checks and compiler options
+#
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_READABLE_ASM=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_FRAME_POINTER=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_LL=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_NPCMX50_UART=y
+
+#
+# Memory Debugging
+#
+
+#
+# Debug Lockups and Hangs
+#
+CONFIG_SCHED_DEBUG=y
+
+#
+# Lock Debugging (spinlocks, mutexes, etc...)
+#
+
+#
+# RCU Debugging
+#
+CONFIG_FUNCTION_TRACER=y
+CONFIG_FUNCTION_GRAPH_TRACER=y
+CONFIG_BRANCH_PROFILE_NONE=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Runtime Testing
+#
+
+#
+# Security options
+#
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_TEST in not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+CONFIG_CRYPTO_SEQIV=y
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CTR=y
+CONFIG_CRYPTO_ECB=y
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_CMAC=y
+CONFIG_CRYPTO_HMAC=y
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_SHA256=y
+
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_DES=m
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+
+#
+# Random Number Generation
+#
+CONFIG_CRYPTO_USER_API=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_CRYPTO_HASH_INFO=y
+CONFIG_CRYPTO_HW=y
+CONFIG_CRYPTO_DEV_NPCMX50=y
+CONFIG_CRYPTO_DEV_NPCM750_SHA=y
+CONFIG_CRYPTO_DEV_NPCM750_AES=y
+CONFIG_ARM_CRYPTO=y
+#systemd
+CONFIG_DEVTMPFS=y
+CONFIG_CGROUPS=y
+
+CONFIG_PRINTK=y
+CONFIG_DEBUG_FS=y
+CONFIG_DYNAMIC_DEBUG=y
diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
new file mode 100644
index 000000000000..9da4c595a045
--- /dev/null
+++ b/arch/arm/mach-npcm/Kconfig
@@ -0,0 +1,61 @@
+menuconfig ARCH_NPCM
+	bool "Nuvoton NPCM Architecture"
+	select ARCH_REQUIRE_GPIOLIB
+	select USE_OF
+	select PINCTRL
+	select PINCTRL_NPCM7XX
+
+if ARCH_NPCM
+
+comment "NPCM Architecture type"
+
+config ARCH_NPCM7XX
+	depends on ARCH_NPCM && ARCH_MULTI_V7
+	bool "Support for NPCM7xx BMC (Poleg)"
+	select CACHE_L2X0
+	select CPU_V7
+	select ARM_GIC
+	select HAVE_ARM_SCU
+	select ARM_ERRATA_720789
+	select ARM_ERRATA_754322
+	select ARM_ERRATA_764369
+	select ARM_ERRATA_794072
+	select PL310_ERRATA_588369
+	select PL310_ERRATA_727915
+	select FIQ
+	select CPU_USE_DOMAINS
+	select GENERIC_CLOCKEVENTS
+	select CLKDEV_LOOKUP
+	select COMMON_CLK if OF
+	select NPCM7XX_TIMER
+	select MFD_SYSCON
+	help
+	  General support for NPCM7xx BMC (Poleg).
+
+	  Nuvoton NPCM7xx BMC based on the Cortex A9.
+
+choice
+prompt "NPCM7xx BMC type"
+
+config ARCH_NPCM750
+	depends on ARCH_NPCM7XX
+	bool "Support for NPCM750 BMC"
+	select SMP
+	select SMP_ON_UP
+	select HAVE_ARM_TWD if SMP
+	select USB_EHCI_ROOT_HUB_TT
+	select USB_ARCH_HAS_HCD
+	select USB_ARCH_HAS_EHCI
+	select USB_EHCI_HCD
+	select USB_ARCH_HAS_OHCI
+	select USB_OHCI_HCD
+	select USB
+    default y
+	help
+	  General support for NPCM750 BMC (Poleg).
+
+	  Nuvoton NPCM750 BMC based on the Cortex A9.
+
+endchoice
+
+endif
diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
new file mode 100644
index 000000000000..37f05e4bd0b3
--- /dev/null
+++ b/arch/arm/mach-npcm/Makefile
@@ -0,0 +1,6 @@
+AFLAGS_headsmp.o		+= -march=armv7-a
+
+obj-$(CONFIG_ARCH_NPCM7XX)	+= npcm7xx.o
+obj-$(CONFIG_ARCH_NPCM750)	+= platsmp.o headsmp.o
+
+
diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
new file mode 100644
index 000000000000..5456268453f0
--- /dev/null
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -0,0 +1,22 @@
+/*
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/linkage.h>
+#include <linux/init.h>
+#include <asm/assembler.h>
+
+/*
+ * The boot ROM does not start secondary CPUs in SVC mode, so we need to do that
+ * here.
+ */
+ENTRY(npcm7xx_secondary_startup)
+	safe_svcmode_maskall r0
+
+	b	secondary_startup
+ENDPROC(npcm7xx_secondary_startup)
diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
new file mode 100644
index 000000000000..fa1759b85300
--- /dev/null
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <asm/mach/arch.h>
+#include <asm/mach-types.h>
+#include <asm/mach/map.h>
+#include <asm/hardware/cache-l2x0.h>
+
+static const char *const npcm7xx_dt_match[] = {
+	"nuvoton,npcm750",
+	NULL
+};
+
+DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
+	.atag_offset	= 0x100,
+	.dt_compat	= npcm7xx_dt_match,
+	.l2c_aux_val	= 0x0,
+	.l2c_aux_mask	= ~0x0,
+MACHINE_END
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
new file mode 100644
index 000000000000..7505ba4990ea
--- /dev/null
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -0,0 +1,86 @@
+/*
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define pr_fmt(fmt) "nuvoton,npcm7xx-smp: " fmt
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/smp.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <asm/cacheflush.h>
+#include <asm/smp.h>
+#include <asm/smp_plat.h>
+#include <asm/smp_scu.h>
+
+#define NPCM7XX_SCRPAD_REG 0x13c
+
+extern void npcm7xx_secondary_startup(void);
+
+static int npcm7xx_smp_boot_secondary(unsigned int cpu,
+				      struct task_struct *idle)
+{
+	struct device_node *gcr_np;
+	void __iomem *gcr_base;
+	int ret = 0;
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	if (!gcr_np) {
+		pr_err("no gcr device node\n");
+		ret = -ENODEV;
+		goto out;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	if (!gcr_base) {
+		pr_err("could not iomap gcr");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* give boot ROM kernel start address. */
+	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
+		  NPCM7XX_SCRPAD_REG);
+	/* make sure the previous write is seen by all observers. */
+	dsb_sev();
+
+	iounmap(gcr_base);
+out:
+	return ret;
+}
+
+static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *scu_np;
+	void __iomem *scu_base;
+
+	scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
+	if (!scu_np) {
+		pr_err("no scu device node\n");
+		return;
+	}
+	scu_base = of_iomap(scu_np, 0);
+	if (!scu_base) {
+		pr_err("could not iomap scu");
+		return;
+	}
+
+	scu_enable(scu_base);
+
+	iounmap(scu_base);
+}
+
+static struct smp_operations npcm7xx_smp_ops __initdata = {
+	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
+	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+};
+
+CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
-- 
2.14.1
