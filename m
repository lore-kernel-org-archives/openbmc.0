Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D65D11A029F
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 16:40:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448257222624275.1319149900845;
 Sun, 22 Nov 2015 21:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Update kernel version
Date: Mon, 23 Nov 2015 00:40:18 -0500
Message-Id: <1448257218-4033-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448257218-4033-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448257218-4033-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 05:40:27 -0000

From: Joel Stanley <joel@jms.id.au>

The kernel contains many changes, including

  - rewritten i2c driver
  - interrupt facilities for the iBT host driver
  - drop dts patches, we now use the in-tree device tree
  - rebased on Linux 4.3

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../common/recipes-kernel/linux/linux-obmc_4.2.bb        | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index 1d8106d..42f3ce3 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Linux kernel for OpenBMC"
 SECTION = "kernel"
 LICENSE = "GPLv2"
 
-KBRANCH ?= "dev"
+KBRANCH ?= "dev-4.3"
 KCONFIG_MODE="--alldefconfig"
 
 SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 
-LINUX_VERSION ?= "4.2"
+LINUX_VERSION ?= "4.3"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20151104-1"
+SRCREV="openbmc-20151123-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
@@ -18,13 +18,3 @@ COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
-
-do_patch_append() {
-        for DTB in "${KERNEL_DEVICETREE}"; do
-		DT=`basename ${DTB} .dtb`
-                if [ -r "${WORKDIR}/${DT}.dts" ]; then
-                        cp ${WORKDIR}/${DT}.dts \
-                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
-		fi
-	done
-}
-- 
2.6.3
