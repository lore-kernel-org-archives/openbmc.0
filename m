Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsk6WWjzDrGr
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467309044736340.967448152255;
 Thu, 30 Jun 2016 10:50:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 6/6] Switch to per-application skeleton recipes
Date: Thu, 30 Jun 2016 12:50:33 -0500
Message-Id: <20160630175033.5212-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
References: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This patch switches the build to use the per-application
skeleton recipes added previously.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 61 +++++++++-------------
 .../skeleton/skeleton/skeleton.service             | 12 -----
 2 files changed, 25 insertions(+), 48 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 77a2980..f5c5fbf 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -3,47 +3,36 @@ DESCRIPTION = "Temp placeholder for skeleton repository"
 HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
+inherit packagegroup
 inherit obmc-phosphor-license
-inherit obmc-phosphor-systemd
+
 inherit obmc-phosphor-chassis-mgmt
 inherit obmc-phosphor-fan-mgmt
 inherit obmc-phosphor-flash-mgmt
 inherit obmc-phosphor-policy-mgmt
 inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-system-mgmt
-inherit pythonnative
-inherit python-dir
-
-VIRTUAL-RUNTIME_skeleton_workbook ?= ""
-
-DEPENDS += "glib-2.0 systemd python"
-RDEPENDS_${PN} += "python-json python-subprocess python-compression libsystemd ${VIRTUAL-RUNTIME_skeleton_workbook}"
-SRC_URI += "git://github.com/openbmc/skeleton"
-
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
-
-# RDEPEND on pflash if the openpower-pflash machine feature is set.
-PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
-PACKAGECONFIG[openpower-pflash] = ",,,pflash"
-
-SRCREV = "fa8f6166a05410472e8a3ef6a2f2e3b9b5f8d8e4"
-
-S = "${WORKDIR}"
-
-# needed to invoke setuptools
-export STAGING_INCDIR
-export STAGING_LIBDIR
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_SITEPACKAGES_DIR
-
-do_compile() {
-        oe_runmake -C git PYTHON=${PYTHON}
-}
 
-do_install() {
-        oe_runmake -C git install \
-                PYTHON=${PYTHON} \
-                DESTDIR=${D} \
-                PREFIX=/usr
-}
+RDEPENDS_${PN} += " \
+        obmc-button-power \
+        obmc-button-reset \
+        obmc-control-chassis \
+        obmc-hostcheckstop \
+        obmc-mgr-inventory \
+        obmc-op-control-power \
+        obmc-pcie-detect \
+        obmc-watchdog \
+        obmc-pydevtools \
+        obmc-control-fan \
+        obmc-flash-bios \
+        obmc-flash-bmc \
+        obmc-mgr-download \
+        obmc-op-flasher \
+        obmc-op-control-host \
+        obmc-control-led \
+        obmc-hwmon \
+        obmc-mgr-sensor \
+        obmc-control-bmc \
+        obmc-mgr-state \
+        obmc-mgr-system \
+        "
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
deleted file mode 100644
index 3a8e52e..0000000
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Temp placeholder for skeleton function
-Requires=obmc-mapper.service
-After=obmc-mapper.service
-
-[Service]
-Restart=always
-ExecStart=/usr/sbin/system_manager.py
-Environment="PYTHONUNBUFFERED=1"
-
-[Install]
-WantedBy=multi-user.target
-- 
2.9.0
