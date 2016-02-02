Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3AE3C1A01DA
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 15:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454386222917366.5803092811875;
 Mon, 1 Feb 2016 20:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] Update phosphor recipes to pickup latest code
Date: Mon,  1 Feb 2016 22:10:20 -0600
Message-Id: <1454386220-10574-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454386220-10574-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454386220-10574-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 04:10:27 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Update openbmc phosphor recipes to pickup latest functionality from
skeleton, ipmi, networkd, settings, etc.
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/network/network.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/settings/settings.bb     | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 068d395..e6527f6 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -18,7 +18,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = ""
+SRCREV = "83edabb0e05fd71d4905ef255e97f65d966c6e7e"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index b53f7f4..6331678 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -12,7 +12,7 @@ SRC_URI += "git://github.com/openbmc/phosphor-networkd \
             file://80-dhcp.network \
             "
 
-SRCREV = "a657afc9cc76dc6678edb8de9df569f92dd108e1"
+SRCREV = "6b3d6af5b9c38d734f20e859394db275e141328e"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings.bb b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
index 1c5fe28..d1fa639 100644
--- a/meta-phosphor/common/recipes-phosphor/settings/settings.bb
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} += "python-dbus python-pygobject"
 
 SRC_URI += "git://github.com/openbmc/phosphor-settingsd"
 
-SRCREV = "33e0930724c12f83ddf99f7452fc0551ac10ccfc"
+SRCREV = "3bda531d94f4c93473bbedd7d7e5c44d4d9da93b"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index fab50ea..3cc91d6 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -13,10 +13,10 @@ inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-system-mgmt
 
 DEPENDS += "glib-2.0"
-RDEPENDS_${PN} += "python-subprocess python-tftpy"
+RDEPENDS_${PN} += "python-subprocess python-compression"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "abe4953f941f63b4a3f531af15f6dba68870f3a9"
+SRCREV = "695f5d12e33daece376ddf1f9c7041a5bd6a3c7d"
 
 S = "${WORKDIR}"
 
-- 
2.6.4
