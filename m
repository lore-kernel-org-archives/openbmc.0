Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR7G16jYXzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 02:40:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465576833957295.7615463928282;
 Fri, 10 Jun 2016 09:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump phosphor recipe versions
Date: Fri, 10 Jun 2016 11:40:31 -0500
Message-Id: <20160610164031.25371-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160610164031.25371-1-openbmc-patches@stwcx.xyz>
References: <20160610164031.25371-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 16:40:43 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Enable one-time vs permanent host boot option
Handle endianness in IPMI eSEL function
Improve IPMI error handling
Add IPMI Travis CI
Fix host hanging due to inventory upload
Performance improvements
---
 .../common/recipes-phosphor/inventory-upload/inventory-upload.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 meta-phosphor/common/recipes-phosphor/settings/settings.bb              | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb            | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
index c3a2361..2dfcf58 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
 
 SRC_URI += "git://github.com/openbmc/openpower-inventory-upload"
 
-SRCREV = "867e058dd246739ab9c93df64e82b7526f42d67f"
+SRCREV = "b07de872ac18710dbf0d393a206e2598c6580f46"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 615207a..c53e687 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "f7aa902e465bfe1cf19b9079f1555633a88e7190"
+SRCREV = "0bdc22a259720ee3a7ca78ee3aa07ab83bb39743"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index ce5fc03..47a8a34 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "9702c89eba59fbf2c665a693317ba0a4f4843872"
+SRCREV = "2f5a3cfd2412c7e10d128a856ad2c37c8a1b4a10"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index f9d6462..8f8ab4c 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "libsystemd"
 
 SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
 
-SRCREV = "ca99efb722ff757707e27f91ba6af293d7e09753"
+SRCREV = "5e22faeae1f3d3f197b4a6df2ec6f8231582f3d9"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 1825eb9..f341938 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "c6a5b9dc33a8faa8bb8b907e186325b928978510"
+SRCREV = "93a753f01b464e120c88a28c463a909a952585bb"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings.bb b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
index d1fa639..f5c6b14 100644
--- a/meta-phosphor/common/recipes-phosphor/settings/settings.bb
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-settingsd"
 
-SRCREV = "3bda531d94f4c93473bbedd7d7e5c44d4d9da93b"
+SRCREV = "df9b8ad2d53df7893ff0a49708ef05c3289653d4"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
index 22f059e..d90c8e5 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
@@ -10,6 +10,6 @@ inherit setuptools
 
 SRC_URI += "git://github.com/openbmc/pyphosphor"
 
-SRCREV = "7c8263573fb5ed25001db9c78eb4a149c057358a"
+SRCREV = "362fb80c081e114236cc5d29b166f45fd4539041"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 9d81279..1d45d16 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -20,7 +20,7 @@ SRC_URI += "git://github.com/openbmc/skeleton"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "2f9ee83356fba3f6f843bf2584f3e7e95763ec98"
+SRCREV = "b2f3fd7a29ddf16ea6171b4b4649d9a0ea8be58d"
 
 S = "${WORKDIR}"
 
-- 
2.8.3
