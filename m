Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZq6CBBzDqX6
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596638499211.49343285533257;
 Fri, 10 Jun 2016 15:10:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 04/11] Remove duplicate kernel config fragments
Date: Fri, 10 Jun 2016 17:10:23 -0500
Message-Id: <20160610221030.3943-5-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:44 -0000
X-List-Received-Date: Fri, 10 Jun 2016 22:10:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Enable system specific modules in their respective layers.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg            | 4 ----
 .../meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend           | 2 +-
 .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg      | 2 --
 .../meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg        | 2 --
 .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg      | 4 ++++
 .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend         | 2 ++
 6 files changed, 7 insertions(+), 9 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

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
index 2594dec..99efe89 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
@@ -1,4 +1,2 @@
 CONFIG_HWMON=y
-CONFIG_SENSORS_NCT7904=y
-CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
index 2594dec..99efe89 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
@@ -1,4 +1,2 @@
 CONFIG_HWMON=y
-CONFIG_SENSORS_NCT7904=y
-CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
new file mode 100644
index 0000000..053fea3
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
@@ -0,0 +1,4 @@
+CONFIG_HWMON=y
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
-- 
2.8.3
