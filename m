Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SV4cJFzDq8g
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465017654231367.85047430108364;
 Fri, 3 Jun 2016 22:20:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 09/10] AST2500: Initial AST2500 BSP layer
Date: Sat,  4 Jun 2016 00:20:38 -0500
Message-Id: <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 04 Jun 2016 05:20:59 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The AST2500 is an ARM SOC made by Aspeed.

This is only a stub; there are a couple missing bits of support
from the kernel/uboot.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-aspeed/meta-ast2500/conf/layer.conf       |  10 ++
 .../meta-ast2500/conf/machine/include/ast2500.inc  |  14 +++
 .../recipes-kernel/linux/linux-obmc/defconfig      | 104 +++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../meta-aspeed/meta-ast2500/recipes.txt           |   2 +
 5 files changed, 132 insertions(+)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
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
index 0000000..ef55bf7
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: Aspeed AST2500
+#@DESCRIPTION: Common machine configuration for the Aspeed AST2500 Chip
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
+
+UBOOT_MACHINE ?= "ast2500_config"
+UBOOT_ENTRYPOINT ?= "0x80001000"
+UBOOT_LOADADDRESS ?= "0x80001000"
+
+INITRD_IMAGE_ENTRYPOINT = "0x80800000"
+INITRD_IMAGE_LOADADDRESS = "0x80800000"
+
+require conf/machine/include/tune-arm1136jf-s.inc
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
new file mode 100644
index 0000000..84d9fa2
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
@@ -0,0 +1,104 @@
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+CONFIG_USELIB=y
+CONFIG_IRQ_DOMAIN_DEBUG=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_BPF_SYSCALL=y
+# CONFIG_SHMEM is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_CC_STACKPROTECTOR_STRONG=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLOCK is not set
+CONFIG_ARCH_MULTI_V6=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_ASPEED=y
+CONFIG_MACH_ASPEED_G5=y
+CONFIG_DEBUG_RODATA=y
+CONFIG_AEABI=y
+CONFIG_UACCESS_WITH_MEMCPY=y
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_KEXEC=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=y
+CONFIG_INET=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+CONFIG_INET_UDP_DIAG=y
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_NETDEVICES=y
+CONFIG_FTGMAC100=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C_CHARDEV=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_RTC_DRV_DS1307=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_FIRMWARE_MEMMAP=y
+CONFIG_FANOTIFY=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_PAGE_POISONING=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_SHIRQ=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
+# CONFIG_FTRACE is not set
+CONFIG_MEMTEST=y
+CONFIG_UBSAN=y
+CONFIG_UBSAN_ALIGNMENT=y
+CONFIG_DEBUG_USER=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_LL_UART_8250=y
+CONFIG_DEBUG_UART_PHYS=0x1e784000
+CONFIG_DEBUG_UART_VIRT=0xe8784000
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_SET_MODULE_RONX=y
+CONFIG_CRYPTO_ECHAINIV=y
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_POWERPC is not set
+# CONFIG_XZ_DEC_IA64 is not set
+# CONFIG_XZ_DEC_SPARC is not set
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
-- 
2.8.3
