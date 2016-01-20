Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 427581A1803
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 10:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453331424318493.8915435204109;
 Wed, 20 Jan 2016 15:10:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH openbmc 4/6] u-boot : switch to repro, add fw_env.config
Date: Wed, 20 Jan 2016 17:10:18 -0600
Message-Id: <1453331420-6524-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 23:10:28 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Switch to the obmc repro so that u-boot can effectively download the
kernel and initrd for recovery from corrupted flash partitions.

Add the fw_env.config pointing to /dev/mtd2 as 128k, which the
current flash layout.
---
 .../meta-ast2400/recipes-bsp/u-boot/files/fw_env.config          | 4 ++--
 .../meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend     | 7 ++-----
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb        | 9 +++++----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
index 9cb3ad2..07be77a 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
@@ -7,8 +7,8 @@
 
 # NOR example
 # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
-/dev/mtd1		0x0000		0x20000		0x20000
-#/dev/mtd2		0x0000		0x4000		0x4000
+#/dev/mtd1		0x0000		0x20000		0x20000
+/dev/mtd2		0x0000		0x20000		0x10000
 
 # MTD SPI-dataflash example
 # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
index 6d4a18f..50adb9f 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
@@ -1,10 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
-#SRC_URI += "file://fw_env.config
-SRC_URI += "file://patch-2013.07/0000-u-boot-aspeed-064.patch \
-           file://patch-2013.07/0001-u-boot-openbmc.patch \
-           file://config.patch \
-           "
+SRC_URI += "file://fw_env.config"
+SRC_URI += "file://config.patch"
 
 # Do not install u-boot in rootfs
 #do_install[postfuncs] += "remove_uboot_from_rootfs"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
index f3e2f56..6349d97 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -12,13 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 
 # This revision corresponds to the tag "v2013.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV="${AUTOREV}"
+
 
 PV = "v2013.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch \
-          "
+UBRANCH = "v2013.07-aspeed-openbmc"
+SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.6.4
