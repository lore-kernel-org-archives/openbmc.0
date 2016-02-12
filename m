Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D2021A005A
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 04:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455297026293896.5335712572045;
 Fri, 12 Feb 2016 09:10:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Recipe update: User management, systemd patch,
 IPMI net functions
Date: Fri, 12 Feb 2016 11:10:24 -0600
Message-Id: <1455297024-15339-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455297024-15339-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455297024-15339-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 12 Feb 2016 17:10:32 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Create virtual class to include user management in the image
Add the systemd patch for network support to the systemd recipe
Update the IPMI recipe to pickup the support for network configuration
---
 .../conf/machine/include/openpower.inc             |  2 ++
 meta-phosphor/classes/obmc-phosphor-image.bbclass  |  3 +++
 .../classes/obmc-phosphor-user-mgmt.bbclass        |  4 ++++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  2 +-
 .../files/obmc-phosphor-user.service               |  8 ++++++++
 .../obmc-phosphor-user/obmc-phosphor-user.bb       | 24 ++++++++++++++++++++++
 .../packagegroup-obmc-phosphor-apps.bb             |  7 +++++++
 meta-phosphor/common/recipes-phosphor/user/user.bb | 21 -------------------
 .../common/recipes-phosphor/user/user/user.service | 10 ---------
 meta-phosphor/conf/distro/openbmc-phosphor.conf    |  1 +
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 .../meta/recipes-core/systemd/systemd_225.bb       |  1 +
 12 files changed, 52 insertions(+), 32 deletions(-)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-user-mgmt.bbclass
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/obmc-phosphor-user.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/user/user.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/user/user/user.service

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index 48edd92..ca668b4 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -4,6 +4,7 @@ OBMC_MACHINE_FEATURES += "\
         obmc-phosphor-sensor-mgmt \
         obmc-phosphor-flash-mgmt \
         obmc-phosphor-event-mgmt \
+        obmc-phosphor-user-mgmt \
         "
 
 VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
@@ -30,3 +31,4 @@ PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "skeleton"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "skeleton"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-user"
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 9a13f7f..a4511f9 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -8,6 +8,7 @@
 # - obmc-phosphor-flash-mgmt          - Phosphor OpenBMC flash management
 # - obmc-phosphor-event-mgmt          - Phosphor OpenBMC event management
 # - obmc-phosphor-policy-mgmt         - Phosphor OpenBMC policy management
+# - obmc-phosphor-user-mgmt         - Phosphor OpenBMC user management
 # - obmc-phosphor-system-mgmt         - Phosphor OpenBMC system management
 
 inherit core-image
@@ -19,6 +20,7 @@ FEATURE_PACKAGES_obmc-phosphor-sensor-mgmt ?= "packagegroup-obmc-phosphor-apps-s
 FEATURE_PACKAGES_obmc-phosphor-flash-mgmt ?= "packagegroup-obmc-phosphor-apps-flash-mgmt"
 FEATURE_PACKAGES_obmc-phosphor-event-mgmt ?= "packagegroup-obmc-phosphor-apps-event-mgmt"
 FEATURE_PACKAGES_obmc-phosphor-policy-mgmt ?= "packagegroup-obmc-phosphor-apps-policy-mgmt"
+FEATURE_PACKAGES_obmc-phosphor-user-mgmt ?= "packagegroup-obmc-phosphor-apps-user-mgmt"
 FEATURE_PACKAGES_obmc-phosphor-system-mgmt ?= "packagegroup-obmc-phosphor-apps-system-mgmt"
 
 # Install entire Phosphor application stack by default
@@ -29,6 +31,7 @@ IMAGE_FEATURES += " \
        obmc-phosphor-flash-mgmt \
        obmc-phosphor-event-mgmt \
        obmc-phosphor-policy-mgmt \
+       obmc-phosphor-user-mgmt \
        obmc-phosphor-system-mgmt \
        ssh-server-dropbear \
        "
diff --git a/meta-phosphor/classes/obmc-phosphor-user-mgmt.bbclass b/meta-phosphor/classes/obmc-phosphor-user-mgmt.bbclass
new file mode 100644
index 0000000..4b82f60
--- /dev/null
+++ b/meta-phosphor/classes/obmc-phosphor-user-mgmt.bbclass
@@ -0,0 +1,4 @@
+# Common code for recipes that implement Phosphor OpenBMC user management.
+
+RPROVIDES_${PN} += "virtual/obmc-phosphor-user-mgmt"
+PROVIDES += "virtual/obmc-phosphor-user-mgmt"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 4819d2d..68bd38b 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "bec22bb7cf730147bf4b036fa9237b8495be4e75"
+SRCREV = "5d8c424a5c125b3cc5dcf67238e174b9dcaf22e6"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
new file mode 100644
index 0000000..fecf835
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC user management daemon
+
+[Service]
+ExecStart=/usr/sbin/obmc-phosphor-userd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/obmc-phosphor-user.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/obmc-phosphor-user.bb
new file mode 100644
index 0000000..d1e7637
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/obmc-phosphor-user.bb
@@ -0,0 +1,24 @@
+SUMMARY = "User DBUS object"
+DESCRIPTION = "User DBUS object"
+HOMEPAGE = "http://github.com/openbmc/phosphor-networkd"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-user-mgmt
+inherit obmc-phosphor-systemd
+
+RDEPENDS_${PN} += "python-dbus python-pygobject python-pexpect"
+
+SRC_URI += "git://github.com/openbmc/phosphor-networkd"
+
+SRCREV = "cb3613575fd6fb18a7d2f7e7d86e7b6fd75f4269"
+
+S = "${WORKDIR}/git"
+INSTALL_NAME = "userman.py"
+
+do_install() {
+echo "***installing $INSTALL_NAME"
+        install -d ${D}/${sbindir}
+        install ${S}/${INSTALL_NAME} ${D}/${sbindir}/obmc-phosphor-userd
+}
+
diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index cac7b1b..21b4a2d 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -19,6 +19,7 @@ PACKAGES = " \
         ${@mf_enabled("obmc-phosphor-flash-mgmt", "packagegroup-obmc-phosphor-apps-flash-mgmt", d)} \
         ${@df_enabled("obmc-phosphor-event-mgmt", "packagegroup-obmc-phosphor-apps-event-mgmt", d)} \
         ${@df_enabled("obmc-phosphor-policy-mgmt", "packagegroup-obmc-phosphor-apps-policy-mgmt", d)} \
+        ${@df_enabled("obmc-phosphor-user-mgmt", "packagegroup-obmc-phosphor-apps-user-mgmt", d)} \
         ${@df_enabled("obmc-phosphor-system-mgmt", "packagegroup-obmc-phosphor-apps-system-mgmt", d)} \
         "
 
@@ -69,6 +70,12 @@ RDEPENDS_packagegroup-obmc-phosphor-apps-policy-mgmt = " \
                 virtual/obmc-phosphor-policy-mgmt \
         ", d)}"
 
+SUMMARY_packagegroup-obmc-phosphor-apps-user-mgmt = "User management support"
+RDEPENDS_packagegroup-obmc-phosphor-apps-user-mgmt = " \
+        ${@df_enabled("obmc-phosphor-user-mgmt", " \
+                virtual/obmc-phosphor-user-mgmt \
+        ", d)}"
+
 SUMMARY_packagegroup-obmc-phosphor-apps-system-mgmt = "System management support"
 RDEPENDS_packagegroup-obmc-phosphor-apps-system-mgmt = " \
         ${@df_enabled("obmc-phosphor-system-mgmt", " \
diff --git a/meta-phosphor/common/recipes-phosphor/user/user.bb b/meta-phosphor/common/recipes-phosphor/user/user.bb
deleted file mode 100644
index a68766c..0000000
--- a/meta-phosphor/common/recipes-phosphor/user/user.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "User DBUS object"
-DESCRIPTION = "User DBUS object"
-HOMEPAGE = "http://github.com/openbmc/phosphor-networkd"
-PR = "r1"
-
-inherit obmc-phosphor-license
-inherit obmc-phosphor-systemd
-
-RDEPENDS_${PN} += "python-dbus python-pygobject python-pexpect"
-
-SRC_URI += "git://github.com/openbmc/phosphor-networkd"
-
-SRCREV = "9f804290dd0bf200a1ba28e107eae55bdb4076da"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-        install -d ${D}/${sbindir}
-        install ${S}/userman.py ${D}/${sbindir}
-}
-
diff --git a/meta-phosphor/common/recipes-phosphor/user/user/user.service b/meta-phosphor/common/recipes-phosphor/user/user/user.service
deleted file mode 100644
index 8c87a5b..0000000
--- a/meta-phosphor/common/recipes-phosphor/user/user/user.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=User DBUS object
-Requires=skeleton.service
-After=skeleton.service
-
-[Service]
-ExecStart=/usr/sbin/userman.py
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/meta-phosphor/conf/distro/openbmc-phosphor.conf
index 418a98e..4af4a4b 100644
--- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
+++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
@@ -26,6 +26,7 @@ DISTRO_FEATURES = "\
         obmc-phosphor-flash-mgmt \
         obmc-phosphor-event-mgmt \
         obmc-phosphor-policy-mgmt \
+        obmc-phosphor-user-mgmt \
         obmc-phosphor-system-mgmt \
         ${DISTRO_FEATURES_LIBC} \
         "
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index f6fe46d..e66dc77 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -30,3 +30,4 @@ PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "obmc-phosphor-sensord"
 PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "obmc-phosphor-sysd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-userd"
diff --git a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
index f7d4c7d..e3d55ec 100644
--- a/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
+++ b/yocto-poky/meta/recipes-core/systemd/systemd_225.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0012-implment-systemd-sysv-install-for-OE.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0100-systemd_networkd_dbus_setaddress.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
2.7.1
