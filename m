Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5Yp6BFLzDr7H
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465431639239796.4323844501879;
 Wed, 8 Jun 2016 17:20:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 04/11] Remove duplicate kernel config fragments
Date: Wed,  8 Jun 2016 19:20:25 -0500
Message-Id: <20160609002032.984-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:20:47 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Enable CONFIG_HWMON and nothing else in the base Phosphor layer.
Enable system specific modules in their respective layers.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg            | 4 ----
 .../meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend           | 2 +-
 .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg      | 3 ---
 .../meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg        | 3 ---
 .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg        | 1 -
 .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg      | 3 +++
 .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend         | 2 ++
 meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg        | 1 +
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb           | 1 +
 9 files changed, 8 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
deleted file mode 100644
index 053fea3..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_HWMON=y
-CONFIG_SENSORS_NCT7904=y
-CONFIG_SENSORS_LM75=y
-CONFIG_EEPROM_AT24=y
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
index bb6f06c..6d7ae27 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,2 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-SRC_URI += "file://defconfig file://hwmon.cfg"
+SRC_URI += "file://defconfig"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
index 2594dec..63891b6 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
@@ -1,4 +1 @@
-CONFIG_HWMON=y
-CONFIG_SENSORS_NCT7904=y
-CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
index 2594dec..63891b6 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
@@ -1,4 +1 @@
-CONFIG_HWMON=y
-CONFIG_SENSORS_NCT7904=y
-CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
index 2594dec..498497e 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
@@ -1,4 +1,3 @@
-CONFIG_HWMON=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
new file mode 100644
index 0000000..f778394
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
@@ -0,0 +1,3 @@
+CONFIG_SENSORS_NCT7904=y
+CONFIG_SENSORS_LM75=y
+CONFIG_EEPROM_AT24=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..9e74ab4
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://barreleye.cfg"
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
new file mode 100644
index 0000000..ff2b329
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
@@ -0,0 +1 @@
+CONFIG_HWMON=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
index 47e3698..c0d8e38 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
@@ -6,6 +6,7 @@ KBRANCH ?= "dev-4.4"
 KCONFIG_MODE="--alldefconfig"
 
 SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
+SRC_URI += "file://hwmon.cfg"
 
 LINUX_VERSION ?= "4.4"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
-- 
2.8.3
