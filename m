Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D2B811A0661
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:52 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998050074982.1473596900121;
 Fri, 16 Oct 2015 05:20:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/2] linux-obmc: Remove unnecessary config patches
Date: Fri, 16 Oct 2015 07:20:45 -0500
Message-Id: <1444998046-17813-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
References: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:54 -0000

From: Jeremy Kerr <jk@ozlabs.org>

These are both present in the current linux tree.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../recipes-kernel/linux/linux-obmc/initrd-source.patch       | 11 -----------
 .../common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch |  8 --------
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb   |  1 -
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
deleted file mode 100644
index a685df5..0000000
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/arch/arm/configs/aspeed_defconfig
-+++ b/arch/arm/configs/aspeed_defconfig
-@@ -6,7 +6,7 @@ CONFIG_SYSVIPC=y
- CONFIG_IRQ_DOMAIN_DEBUG=y
- CONFIG_LOG_BUF_SHIFT=14
- CONFIG_BLK_DEV_INITRD=y
--CONFIG_INITRAMFS_SOURCE="~/ibm/openbmc/buildroot-arm-rootfs.cpio.gz"
-+CONFIG_INITRAMFS_SOURCE=""
- CONFIG_CC_OPTIMIZE_FOR_SIZE=y
- CONFIG_KALLSYMS_ALL=y
- CONFIG_EMBEDDED=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch
deleted file mode 100644
index f6530d7..0000000
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- a/arch/arm/configs/aspeed_defconfig
-+++ b/arch/arm/configs/aspeed_defconfig
-@@ -192,3 +192,5 @@ CONFIG_CRYPTO_GHASH=y
- # CONFIG_CRYPTO_HW is not set
- CONFIG_CRC_CCITT=y
- CONFIG_AVERAGE=y
-+CONFIG_CGROUPS=y
-+CONFIG_FHANDLE=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index b38d1a8..3e5bc94 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -5,7 +5,6 @@ LICENSE = "GPLv2"
 KBRANCH ?= "dev"
 
 SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
-SRC_URI += "file://systemd-reqs.patch file://initrd-source.patch"
 SRC_URI += "file://obmc-bsp.scc \
             file://obmc-bsp.cfg \
             file://obmc-bsp-user-config.cfg \
-- 
2.6.0
