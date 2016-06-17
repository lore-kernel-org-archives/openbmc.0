Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW6y220jTzDqsQ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 14:40:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466138435002875.3069280432552;
 Thu, 16 Jun 2016 21:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 1/2] Initial Witherspoon layer
Date: Thu, 16 Jun 2016 23:40:30 -0500
Message-Id: <20160617044031.15231-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160617044031.15231-1-openbmc-patches@stwcx.xyz>
References: <20160617044031.15231-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 04:40:43 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Witherspoon is an IBM branded OpenPOWER system aimed at the HPC
market.

It should be noted that this doesn't boot cleanly with the current
4.6 branch.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-witherspoon/conf/bblayers.conf.sample     | 27 ++++++++++
 .../meta-ibm/meta-witherspoon/conf/conf-notes.txt  |  2 +
 .../meta-ibm/meta-witherspoon/conf/layer.conf      |  9 ++++
 .../meta-witherspoon/conf/local.conf.sample        | 21 ++++++++
 .../meta-witherspoon/conf/machine/witherspoon.conf |  8 +++
 .../0001-Witherspoon-OpenBMC-configuration.patch   | 29 +++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend           |  2 +
 ...d-flash-and-layout-to-Witherspoon-devtree.patch | 57 ++++++++++++++++++++++
 .../linux/linux-obmc/witherspoon.cfg               |  2 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |  3 ++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  2 +
 ...-Set-witherspoon-power-pin-and-pgood-nets.patch | 30 ++++++++++++
 .../workbook/witherspoon-config.bb                 |  8 +++
 .../meta-ibm/meta-witherspoon/recipes.txt          |  2 +
 14 files changed, 202 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/files/0001-Witherspoon-OpenBMC-configuration.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/0001-Add-flash-and-layout-to-Witherspoon-devtree.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/witherspoon.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes.txt

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
new file mode 100644
index 0000000..333c7ef
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
@@ -0,0 +1,27 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "6"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon \
+  "
+BBLAYERS_NON_REMOVABLE ?= " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-aspeed \
+  ##OEROOT##/meta-aspeed/meta-ast2500 \
+  ##OEROOT##/meta-openpower \
+  ##OEROOT##/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openpower/meta-ibm/meta-witherspoon\
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/conf-notes.txt
new file mode 100644
index 0000000..9b3c01a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/layer.conf
new file mode 100644
index 0000000..01848da
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "witherspoon"
+BBFILE_PATTERN_witherspoon = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/local.conf.sample
new file mode 100644
index 0000000..6e774ff
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/local.conf.sample
@@ -0,0 +1,21 @@
+MACHINE ??= "witherspoon"
+DISTRO ?= "openbmc-phosphor"
+PACKAGE_CLASSES ?= "package_rpm"
+SANITY_TESTED_DISTROS_append ?= " *"
+EXTRA_IMAGE_FEATURES = "debug-tweaks"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+PATCHRESOLVE = "noop"
+BB_DISKMON_DIRS = "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K \
+    ABORT,/tmp,10M,1K"
+CONF_VERSION = "1"
+INHERIT += "extrausers"
+EXTRA_USERS_PARAMS = " \
+  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
+  "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf
new file mode 100644
index 0000000..19ada2a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf
@@ -0,0 +1,8 @@
+KMACHINE = "aspeed"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+
+UBOOT_MACHINE = "witherspoon_bmc_config"
+
+require conf/machine/include/ast2500.inc
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/ibm.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/files/0001-Witherspoon-OpenBMC-configuration.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/files/0001-Witherspoon-OpenBMC-configuration.patch
new file mode 100644
index 0000000..e09f846
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/files/0001-Witherspoon-OpenBMC-configuration.patch
@@ -0,0 +1,29 @@
+From 809f469b92b9f2248a49f250bc002de0c6bd48f5 Mon Sep 17 00:00:00 2001
+From: Brad Bishop <bradleyb@fuzziesquirrel.com>
+Date: Wed, 8 Jun 2016 14:57:23 -0400
+Subject: [PATCH] Witherspoon OpenBMC configuration
+
+Set default boot arguments for OpenBMC.
+
+Signed-off-by: Brad Bishop <bradleyb@us.ibm.com>
+---
+ include/configs/witherspoon-bmc.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/configs/witherspoon-bmc.h b/include/configs/witherspoon-bmc.h
+index f9da307..f0f0ba9 100644
+--- a/include/configs/witherspoon-bmc.h
++++ b/include/configs/witherspoon-bmc.h
+@@ -91,6 +91,9 @@
+ 
+ #define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
+ 
++#define CONFIG_BOOTARGS		"console=ttyS4,115200 earlyprintk"
++#define CONFIG_BOOTCOMMAND	"bootm 20080000 20300000"
++
+ #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
+ 
+ #define CONFIG_FMC_CS			1
+-- 
+2.1.4
+
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/u-boot_%.bbappend
new file mode 100644
index 0000000..9db981f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+SRC_URI += "file://0001-Witherspoon-OpenBMC-configuration.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/0001-Add-flash-and-layout-to-Witherspoon-devtree.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/0001-Add-flash-and-layout-to-Witherspoon-devtree.patch
new file mode 100644
index 0000000..d8343a9
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/0001-Add-flash-and-layout-to-Witherspoon-devtree.patch
@@ -0,0 +1,57 @@
+From 2e7be544f38127097b44799c5ec8004a3faafe2a Mon Sep 17 00:00:00 2001
+From: Brad Bishop <bradleyb@fuzziesquirrel.com>
+Date: Thu, 16 Jun 2016 22:17:45 -0400
+Subject: [PATCH] Add flash and layout to Witherspoon devtree
+
+Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
+---
+ arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 33 ++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+index bb5ec59..e0bbaf8 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+@@ -19,6 +19,39 @@
+ 	memory {
+ 		reg = <0x80000000 0x40000000>;
+ 	};
++
++	ahb {
++
++		fmc@1e620000 {
++			reg = < 0x1e620000 0x94
++				0x20000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,fmc";
++
++			flash@0 {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++#include "aspeed-bmc-opp-flash-layout.dtsi"
++			};
++		};
++		spi@1e630000 {
++			reg = < 0x1e630000 0x18
++				0x30000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,smc";
++			flash {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++				label = "pnor";
++				/* spi-max-frequency = <>; */
++				/* m25p,fast-read; */
++			};
++		};
++
++	};
++
+ };
+ 
+ &uart5 {
+-- 
+1.8.3.1
+
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/witherspoon.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/witherspoon.cfg
new file mode 100644
index 0000000..99efe89
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/witherspoon.cfg
@@ -0,0 +1,2 @@
+CONFIG_HWMON=y
+CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..9c31713
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://witherspoon.cfg"
+SRC_URI += "file://0001-Add-flash-and-layout-to-Witherspoon-devtree.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton.bbappend
new file mode 100644
index 0000000..be66c92
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+SRC_URI += "file://0001-Set-witherspoon-power-pin-and-pgood-nets.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
new file mode 100644
index 0000000..b0a0037
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
@@ -0,0 +1,30 @@
+From 840d78ae902fa8ce7ba356de4aa685c1ebab3efc Mon Sep 17 00:00:00 2001
+From: Brad Bishop <bradleyb@fuzziesquirrel.com>
+Date: Thu, 16 Jun 2016 11:01:24 -0400
+Subject: [PATCH] Set witherspoon power pin and pgood nets
+
+Currently pointed at barreleye nets.
+
+Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
+---
+ op-pwrctl/power_control_obj.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/op-pwrctl/power_control_obj.c b/op-pwrctl/power_control_obj.c
+index 85a8cff..7bb7004 100644
+--- a/git/op-pwrctl/power_control_obj.c
++++ b/git/op-pwrctl/power_control_obj.c
+@@ -17,8 +17,8 @@ static const gchar* instance_name = "power0";
+ static const gchar* dbus_name = "org.openbmc.control.Power";
+ 
+ //This object will use these GPIOs
+-GPIO power_pin    = (GPIO){ "POWER_PIN" };
+-GPIO pgood        = (GPIO){ "PGOOD" };
++GPIO power_pin = (GPIO){ "BMC_POWER_UP" };
++GPIO pgood = (GPIO){ "SYS_PWROK_BUFF" };
+ GPIO usb_reset    = (GPIO){ "USB_RESET" };
+ GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
+ 
+-- 
+2.1.4
+
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
new file mode 100644
index 0000000..b36cc81
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Witherspoon board wiring"
+DESCRIPTION = "Board wiring information for the Witherspoon OpenPOWER system."
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+SRCREV = "5774d44aa3dca936b6ddc118e2b3b0ea8e1c5f26"
+inherit config-in-skeleton
+inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes.txt
new file mode 100644
index 0000000..3ec3f4a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes.txt
@@ -0,0 +1,2 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
+recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.8.4
