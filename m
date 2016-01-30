Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B02A41A05D2
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2016 02:00:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454166021487256.36762810969117;
 Sat, 30 Jan 2016 07:00:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add settings dbus object to openbmc image
Date: Sat, 30 Jan 2016 09:00:19 -0600
Message-Id: <1454166019-11927-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454166019-11927-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454166019-11927-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Jan 2016 15:00:28 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Create settings recipe and service files
Add dependency to settings to the ipmid recipe
since the upcoming ipmi boot flags use this
settings dbus object
---
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  3 +--
 .../common/recipes-phosphor/settings/settings.bb   | 22 ++++++++++++++++++++++
 .../settings/settings/settings.service             | 10 ++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/settings/settings.bb
 create mode 100755 meta-phosphor/common/recipes-phosphor/settings/settings/settings.service

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 24c4045..174110f 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,12 +14,11 @@ inherit obmc-phosphor-c-daemon
 
 TARGET_CFLAGS   += "-fpic"
 
-
+RDEPENDS_${PN} += "settings"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
 SRCREV = "e90d8bf6a342649dba2fd1589a3cddb3cd051bb1"
 
-
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
 
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings.bb b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
new file mode 100644
index 0000000..1c5fe28
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Settings DBUS object"
+DESCRIPTION = "Settings DBUS object"
+HOMEPAGE = "http://github.com/openbmc/phosphor-settingsd"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+
+RDEPENDS_${PN} += "python-dbus python-pygobject"
+
+SRC_URI += "git://github.com/openbmc/phosphor-settingsd"
+
+SRCREV = "33e0930724c12f83ddf99f7452fc0551ac10ccfc"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}/${sbindir}
+        install ${S}/settings_file.py ${D}/${sbindir}
+        install ${S}/settings_manager.py ${D}/${sbindir}
+}
+
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
new file mode 100755
index 0000000..24c4a5a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Settings DBUS Object
+Requires=skeleton.service
+After=skeleton.service
+
+[Service]
+ExecStart=/usr/sbin/settings_manager.py
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.4
