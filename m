Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDpk224NYzDqNq
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 07:40:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464126035721698.7370662599534;
 Tue, 24 May 2016 14:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump IPMI, networkd, REST, and skeleton versions
Date: Tue, 24 May 2016 16:40:33 -0500
Message-Id: <20160524214033.8970-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524214033.8970-1-openbmc-patches@stwcx.xyz>
References: <20160524214033.8970-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 May 2016 21:40:42 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Pick up:
Fix FRU VPD error messages
Add REST interface to update BMC via local file
Add Barreleye motherboard VPD to the inventory
Handle parallel IPMI SEL reservation requests
Add support to stream the journald log to a remote syslog

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 meta-phosphor/common/recipes-phosphor/network/network.bb           | 2 +-
 meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 06ee00e..ce5fc03 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,7 +18,7 @@ TARGET_CFLAGS += " -fpic -std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "a14239a201443222906864273449a39cfa84118e"
+SRCREV = "9702c89eba59fbf2c665a693317ba0a4f4843872"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
index 1a6959a..f9d6462 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "libsystemd"
 
 SRC_URI += "git://github.com/openbmc/openpower-host-ipmi-oem"
 
-SRCREV = "345932324ce63d42fd88e762cb539c864167b008"
+SRCREV = "ca99efb722ff757707e27f91ba6af293d7e09753"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 432007c..1825eb9 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "eee949f14d921d84497f41df84ab7ae45a0d830d"
+SRCREV = "c6a5b9dc33a8faa8bb8b907e186325b928978510"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index 1e7d84e..7129898 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-networkd"
 
-SRCREV = "682512485947977a8d130a1cf9832b12583ea253"
+SRCREV = "fbf7d68e78684739ff860f20f6cbdd0932003912"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
index bf25cae..7f990aa 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
@@ -21,6 +21,6 @@ SRC_URI += " \
         file://rest-dbus.service \
         "
 
-SRCREV = "c693ba1126dcb493058d4ebeb4604b71e3bb3f08"
+SRCREV = "64077101d9f2b6e51c897db82ffc0a399a34d15b"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 1553314..9d81279 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -20,7 +20,7 @@ SRC_URI += "git://github.com/openbmc/skeleton"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "264009617c231447d6c8fc61264cf3c6ea7f49d5"
+SRCREV = "2f9ee83356fba3f6f843bf2584f3e7e95763ec98"
 
 S = "${WORKDIR}"
 
-- 
2.8.3
