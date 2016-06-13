Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT4DD4xWtzDqd1
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 06:30:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465849842709924.1110749817963;
 Mon, 13 Jun 2016 13:30:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] Add virtual workbook / config-in-skeleton classes
Date: Mon, 13 Jun 2016 15:30:34 -0500
Message-Id: <20160613203034.26033-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613203034.26033-1-openbmc-patches@stwcx.xyz>
References: <20160613203034.26033-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 20:30:53 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This patch introduces a new abstraction 'obmc-phosphor-workbook'
for representing a system configuration.  At present it is
pulled in by the skeleton recipe so the requirement on what is
implemented by a package providing obmc-phosphor-workbook is something
compatible with the existing System.py python modules in skeleton.

Additionally this patch adds a new recipe for each system using
a configuration file from skeleton today, and a class for common
configuration.

This enables a couple of things:
 - No need to patch skeleton.service for each system.
 - New systems don't have to put their configuration in the skeleton repository.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/firestone.patch              | 11 --------
 .../recipes-phosphor/workbook/firestone-config.bb  |  8 ++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/garrison.patch               | 11 --------
 .../recipes-phosphor/workbook/garrison-config.bb   |  8 ++++++
 .../recipes-phosphor/workbook/palmetto-config.bb   |  8 ++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  2 --
 .../skeleton/skeleton/skeleton.patch               | 12 ---------
 .../recipes-phosphor/workbook/barreleye-config.bb  |  8 ++++++
 meta-phosphor/classes/config-in-skeleton.bbclass   | 29 ++++++++++++++++++++++
 .../classes/obmc-phosphor-workbook.bbclass         |  5 ++++
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 23 ++++++-----------
 .../skeleton/skeleton/skeleton.service             |  2 +-
 14 files changed, 75 insertions(+), 54 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
 create mode 100644 meta-phosphor/classes/config-in-skeleton.bbclass
 create mode 100644 meta-phosphor/classes/obmc-phosphor-workbook.bbclass

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
index 1edbf31..6c14b22 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
@@ -1,4 +1,3 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
-SRC_URI += "file://firestone.patch"
 SRC_URI += "file://poweron.patch"
 SRC_URI += "file://occ-path.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
deleted file mode 100644
index 2cb6ab4..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
-+++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
-@@ -2,7 +2,7 @@
- Description=Temp placeholder for skeleton function
- 
- [Service]
--ExecStart=/usr/sbin/system_manager.py Palmetto
-+ExecStart=/usr/sbin/system_manager.py Firestone
- 
- [Install]
- WantedBy=multi-user.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
new file mode 100644
index 0000000..0f4de06
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Firestone board wiring"
+DESCRIPTION = "Board wiring information for the Firestone system."
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+inherit config-in-skeleton
+inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
index f7f16da..6c14b22 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
@@ -1,4 +1,3 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
-SRC_URI += "file://garrison.patch"
 SRC_URI += "file://poweron.patch"
 SRC_URI += "file://occ-path.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
deleted file mode 100644
index 23aabc5..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
-+++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
-@@ -2,7 +2,7 @@
- Description=Temp placeholder for skeleton function
- 
- [Service]
--ExecStart=/usr/sbin/system_manager.py Palmetto
-+ExecStart=/usr/sbin/system_manager.py Garrison
- 
- [Install]
- WantedBy=multi-user.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
new file mode 100644
index 0000000..00bc2ec
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Garrison board wiring"
+DESCRIPTION = "Board wiring information for the Garrison system."
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+inherit config-in-skeleton
+inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
new file mode 100644
index 0000000..730ba1a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Palmetto board wiring"
+DESCRIPTION = "Board wiring information for the Palmetto system."
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+inherit config-in-skeleton
+inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
deleted file mode 100644
index c3aad86..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
-SRC_URI += "file://skeleton.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
deleted file mode 100644
index 288e68a..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/skeleton.service	2015-10-28 07:47:55.337712001 -0500
-+++ b/skeleton.service	2015-10-28 07:34:05.277712001 -0500
-@@ -2,8 +2,8 @@
- Description=Temp placeholder for skeleton function
- 
- [Service]
- Restart=always
--ExecStart=/usr/sbin/system_manager.py Palmetto
-+ExecStart=/usr/sbin/system_manager.py Barreleye
- 
- [Install]
- WantedBy=multi-user.target
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
new file mode 100644
index 0000000..a8c9bb7
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Barreleye board wiring"
+DESCRIPTION = "Board wiring information for the Barreleye system."
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
+inherit config-in-skeleton
+inherit obmc-phosphor-license
diff --git a/meta-phosphor/classes/config-in-skeleton.bbclass b/meta-phosphor/classes/config-in-skeleton.bbclass
new file mode 100644
index 0000000..c2d178c
--- /dev/null
+++ b/meta-phosphor/classes/config-in-skeleton.bbclass
@@ -0,0 +1,29 @@
+# In general this class should only be used by board layers
+# that keep their machine-readable-workbook in the skeleton repository.
+
+inherit allarch
+inherit setuptools
+inherit obmc-phosphor-workbook
+
+SRC_URI += "git://github.com/openbmc/skeleton;subpath=configs"
+S = "${WORKDIR}/configs"
+
+python() {
+	machine = d.getVar('MACHINE', True).capitalize() + '.py'
+	d.setVar('_config_in_skeleton', machine)
+}
+
+do_make_setup() {
+        cp ${S}/${_config_in_skeleton} \
+                ${S}/obmc_system_config.py
+        cat <<EOF > ${S}/setup.py
+from distutils.core import setup
+
+setup(name='${BPN}',
+    version='${PR}',
+    py_modules=['obmc_system_config'],
+    )
+EOF
+}
+
+addtask make_setup after do_patch before do_configure
diff --git a/meta-phosphor/classes/obmc-phosphor-workbook.bbclass b/meta-phosphor/classes/obmc-phosphor-workbook.bbclass
new file mode 100644
index 0000000..d848c1b
--- /dev/null
+++ b/meta-phosphor/classes/obmc-phosphor-workbook.bbclass
@@ -0,0 +1,5 @@
+# Recipes that provide a machine readable workbook should
+# inherit this class.
+
+RPROVIDES_${PN} += "virtual/obmc-phosphor-workbook"
+PROVIDES += "virtual/obmc-phosphor-workbook"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 1d45d16..be8c6c3 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -11,34 +11,27 @@ inherit obmc-phosphor-flash-mgmt
 inherit obmc-phosphor-policy-mgmt
 inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-system-mgmt
+inherit python-dir
 
 DEPENDS += "glib-2.0 systemd"
-RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
+RDEPENDS_${PN} += "python-subprocess python-compression libsystemd virtual/obmc-phosphor-workbook"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
 # RDEPEND on pflash if the openpower-pflash machine feature is set.
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "b2f3fd7a29ddf16ea6171b4b4649d9a0ea8be58d"
+SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
 
 S = "${WORKDIR}"
 
 do_compile() {
-        oe_runmake -C git
-
-        # Remove deprecated files.
-        rm ${S}/git/bin/pflash
+	oe_runmake -C git
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
+		DESTDIR=${D} \
+		PREFIX=/usr
 }
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
index b001abf..35b6e6c 100755
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
@@ -3,7 +3,7 @@ Description=Temp placeholder for skeleton function
 
 [Service]
 Restart=always
-ExecStart=/usr/sbin/system_manager.py Palmetto
+ExecStart=/usr/sbin/system_manager.py
 
 [Install]
 WantedBy=multi-user.target
-- 
2.8.4
