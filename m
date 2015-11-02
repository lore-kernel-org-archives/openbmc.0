Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 928611A040B
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:18 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469935164427.9958351177862;
 Mon, 2 Nov 2015 05:12:15 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Update rest-dbus
Date: Mon,  2 Nov 2015 07:12:11 -0600
Message-Id: <1446469931-23318-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469931-23318-1-git-send-email-patches@stwcx.xyz>
References: <1446469931-23318-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:19 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Removed upstreamed patches to makefile.
Updated path in systemd service file.
Add dependency on mapper.
---
 .../rest-dbus/files/makefile.patch                 | 24 ----------------------
 .../rest-dbus/files/no-session-bus.patch           | 12 -----------
 .../rest-dbus/files/resources-path.patch           | 13 ------------
 .../rest-dbus/files/rest-dbus.service              |  2 +-
 .../common/recipes-phosphor/rest-dbus/rest-dbus.bb | 13 +++++-------
 5 files changed, 6 insertions(+), 58 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/makefile.patch
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/no-session-bus.patch
 delete mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/resources-path.patch

diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/makefile.patch b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/makefile.patch
deleted file mode 100644
index 96a82c1..0000000
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/makefile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff --git a/Makefile b/Makefile
-new file mode 100644
-index 0000000..3d79547
---- /dev/null
-+++ b/Makefile
-@@ -0,0 +1,18 @@
-+PACKAGE=rest-dbus
-+
-+prefix?=/usr/local
-+bin=$(prefix)/usr/bin
-+share=$(prefix)/usr/share/$(PACKAGE)
-+
-+build clean all:
-+
-+install:
-+	@install -d $(bin) $(share)/resources $(srv)
-+	@install -m 755 $(PACKAGE) $(bin)
-+	@for f in resources/*; do \
-+		install -m644 $$f $(share)/resources; \
-+	done
-+
-+uninstall:
-+	@rm -f $(bin)/$(PACKAGE)
-+	@rm -rf $(share)
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/no-session-bus.patch b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/no-session-bus.patch
deleted file mode 100644
index d68a037..0000000
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/no-session-bus.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: git/rest-dbus
-===================================================================
---- git.orig/rest-dbus
-+++ git/rest-dbus
-@@ -8,7 +8,6 @@ import os
- from xml.etree import ElementTree
- 
- busses = {
--    'session': dbus.SessionBus,
-     'system': dbus.SystemBus,
- }
- 
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/resources-path.patch b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/resources-path.patch
deleted file mode 100644
index dee4404..0000000
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/resources-path.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/rest-dbus b/rest-dbus
-index 56ec1f9..078b1cf 100755
---- a/rest-dbus
-+++ b/rest-dbus
-@@ -40,7 +40,7 @@ class DBusRestResourceResponse(DBusRestResponse):
-         'png': 'image/png',
-         'gif': 'image/gif',
-     }
--    resource_base = 'resources'
-+    resource_base = '/usr/share/rest-dbus/resources'
- 
-     def __init__(self, name):
-         (_, ext) = os.path.splitext(name)
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
index 686cf69..b6f9b97 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
@@ -2,7 +2,7 @@
 Description=DBUS introspecting REST server.
 
 [Service]
-ExecStart=/usr/bin/rest-dbus
+ExecStart=/usr/sbin/rest-dbus
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
index e7e31cf..fa551f5 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
@@ -6,24 +6,21 @@ PR = "r1"
 inherit allarch
 inherit obmc-phosphor-license
 inherit obmc-phosphor-systemd
+inherit setuptools
 
 RDEPENDS_${PN} += " \
         python-netserver \
         python-json \
         python-dbus \
         python-xml \
+        obmc-mapper \
         "
+
 SRC_URI += " \
         git://github.com/openbmc/rest-dbus.git \
-        file://makefile.patch \
-        file://resources-path.patch \
-        file://no-session-bus.patch \
+        file://rest-dbus.service \
         "
 
-SRCREV = "9b0e0bab5150ccc4333ce442932f8969f365155e"
+SRCREV = "b10a57e2f34e94b13697328cc22f876f738feb0e"
 
 S = "${WORKDIR}/git"
-
-do_install() {
-        oe_runmake prefix=${D} install
-}
-- 
2.6.0
