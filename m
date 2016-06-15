Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTqGm3t93zDqhR
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:50:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465955434514204.820846891957;
 Tue, 14 Jun 2016 18:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v4 2/3] Bump skeleton version
Date: Tue, 14 Jun 2016 20:50:29 -0500
Message-Id: <20160615015030.32526-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615015030.32526-1-openbmc-patches@stwcx.xyz>
References: <20160615015030.32526-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 01:50:41 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This bump picks up a refactored version of skeleton with a new
directory layout.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 31 ++++++++++++----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 1d45d16..2ace59d 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -11,34 +11,37 @@ inherit obmc-phosphor-flash-mgmt
 inherit obmc-phosphor-policy-mgmt
 inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-system-mgmt
+inherit pythonnative
+inherit python-dir
 
 DEPENDS += "glib-2.0 systemd"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
+
 # RDEPEND on pflash if the openpower-pflash machine feature is set.
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "b2f3fd7a29ddf16ea6171b4b4649d9a0ea8be58d"
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
 
 S = "${WORKDIR}"
 
-do_compile() {
-        oe_runmake -C git
+# needed to invoke setuptools
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+export PYTHON_SITEPACKAGES_DIR
 
-        # Remove deprecated files.
-        rm ${S}/git/bin/pflash
+do_compile() {
+        oe_runmake -C git PYTHON=${PYTHON}
 }
 
 do_install() {
-        source=${S}/git
-
-        install -d ${D}/${sbindir} ${D}${libdir}
-        for i in ${source}/bin/*; do
-                install $i ${D}/${sbindir}
-        done
-        for i in ${source}/lib/*; do
-                install $i ${D}/${libdir}
-        done
+        oe_runmake -C git install \
+		PYTHON=${PYTHON} \
+		DESTDIR=${D} \
+		PREFIX=/usr
 }
-- 
2.8.4
