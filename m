Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D3BC91A0851
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:17:02 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659420548274.7161577527303;
 Mon, 12 Oct 2015 07:17:00 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/7] Move Palmetto specific metadata to Palmetto layer
Date: Mon, 12 Oct 2015 09:16:39 -0500
Message-Id: <1444659400-4196-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:17:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf |  4 ++++
 .../meta-ibm/meta-palmetto/conf/machine/palmetto.conf     |  2 ++
 .../recipes-kernel/linux/linux-obmc_%.bbappend            |  1 +
 .../meta-openpower/meta-ibm/meta-palmetto/recipes.txt     |  1 +
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc    | 15 +++++++++++++++
 5 files changed, 23 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
 create mode 100644 meta-phosphor/conf/machine/include/obmc-bsp-common.inc

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
index ac8a2a2..b34e780 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
@@ -1,5 +1,9 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
+# We have a recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+	${LAYERDIR}/recipes-*/*/*.bbappend"
+
 BBFILE_COLLECTIONS += "palmetto"
 BBFILE_PATTERN_palmetto = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f846787..82a9b1c 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -19,6 +19,8 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        "
 
 # UBOOT_MACHINE_${MACHINE} = "${MACHINE}_config
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..de6d3d6
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1 @@
+KERNEL_CONFIG_COMMAND = "oe_runmake_call -C ${S} O=${B} ${KMACHINE}_defconfig"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
new file mode 100644
index 0000000..db84c6f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
@@ -0,0 +1 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
new file mode 100644
index 0000000..ca65285
--- /dev/null
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: OpenBMC
+#@DESCRIPTION: Common machine configuration for OpenBMC chips
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+KERNEL_CLASSES ?= "kernel-uimage kernel-cuimage"
+KERNEL_IMAGETYPE ?= "cuImage"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+UBOOT_SUFFIX ?= "bin"
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX}"
+
+MACHINEOVERRIDES =. "openbmc:"
-- 
2.6.0
