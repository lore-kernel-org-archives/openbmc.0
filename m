Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rX8fN4KplzDqj7
 for <openbmc@lists.ozlabs.org>; Sun, 19 Jun 2016 07:00:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466283636362386.5586145182408;
 Sat, 18 Jun 2016 14:00:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump versions for skeleton, rest, inarp, event
Date: Sat, 18 Jun 2016 16:00:34 -0500
Message-Id: <20160618210034.27707-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160618210034.27707-1-openbmc-patches@stwcx.xyz>
References: <20160618210034.27707-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 18 Jun 2016 21:00:46 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Bump recipe versions and add python dependencies.
The rest-dbus recipe was adding pythong packages needed
by other processes, so when rest-dbus was removed from the
Barreleye image, these processes (skeleton and obmc-rest)
would fail, so adding the python dependencies to those recipes.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 .../meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb        | 2 +-
 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb               | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb    | 2 +-
 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb                  | 2 +-
 .../recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb            | 4 ++--
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
index 730ba1a..c0a4efa 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
@@ -3,6 +3,6 @@ DESCRIPTION = "Board wiring information for the Palmetto system."
 HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
 inherit config-in-skeleton
 inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
index a8c9bb7..8f0d16c 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
@@ -3,6 +3,6 @@ DESCRIPTION = "Board wiring information for the Barreleye system."
 HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
 inherit config-in-skeleton
 inherit obmc-phosphor-license
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index af69578..0e4f5ba 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -17,6 +17,7 @@ RDEPENDS_${PN} += " \
         python-rocket \
         python-bottle \
         python-spwd \
+        python-netserver \
         pyphosphor \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-rest-server"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 41435b7..3ed0d7a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "bf9385f56f715426ff2ac3a1d77af6b6d1575fe1"
+SRCREV = "a26ed7375261ebcfffa68cf478bcb8f2204c6c92"
 
 FILES_SOLIBSDEV += "${libdir}/host-ipmid/lib*${SOLIBSDEV}"
 FILES_${PN} += "${libdir}/host-ipmid/lib*${SOLIBS}"
diff --git a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
index d7d96c0..11d2414 100644
--- a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
+++ b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
@@ -11,7 +11,7 @@ TARGET_CFLAGS   += "-fpic -O2"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/inarp"
 
-SRCREV = "e3f27cf06cc2ca93ae9746ba705a0d9fc307cec2"
+SRCREV = "04d1f97f2e6e471d63c7d56dce7bd8472eb8fbfb"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "inarp"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 307fe90..aeb0707 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -13,7 +13,7 @@ TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "d8fbb0a07dc0c68b3f5d074bddca96eccaca14b4"
+SRCREV = "d4a7217f42f065396e509b94940319261682f144"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 4dc9dff..4402227 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -17,7 +17,7 @@ inherit python-dir
 VIRTUAL-RUNTIME_skeleton_workbook ?= ""
 
 DEPENDS += "glib-2.0 systemd python"
-RDEPENDS_${PN} += "python-subprocess python-compression libsystemd ${VIRTUAL-RUNTIME_skeleton_workbook}"
+RDEPENDS_${PN} += "python-json python-subprocess python-compression libsystemd ${VIRTUAL-RUNTIME_skeleton_workbook}"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
@@ -26,7 +26,7 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "40187443840d0e419c13391b2091fda29d63dea4"
+SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
 
 S = "${WORKDIR}"
 
-- 
2.8.4
