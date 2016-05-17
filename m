Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8JPn1wMrzDqBP
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 23:41:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463492452016318.71844828985945;
 Tue, 17 May 2016 06:40:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-settingsd] Use pyphosphor rather than skeleton
 Openbmc.py
Date: Tue, 17 May 2016 08:40:47 -0500
Message-Id: <1463492447-25545-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463492447-25545-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463492447-25545-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 13:41:01 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The Openbmc module in skeleton is going away so move to using the
bindings add ons in the pyphosphor package.

Signed-of-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 settings_manager.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/settings_manager.py b/settings_manager.py
index 3d5cf14..d667a86 100755
--- a/settings_manager.py
+++ b/settings_manager.py
@@ -6,16 +6,16 @@ import dbus.service
 import dbus.mainloop.glib
 import os
 import os.path as path
-import Openbmc
+from obmc.dbuslib.bindings import DbusProperties, get_dbus
 import settings_file as s
 
 DBUS_NAME = 'org.openbmc.settings.Host'
 OBJ_NAME = '/org/openbmc/settings/host0'
 CONTROL_INTF = 'org.openbmc.Settings'
 
-class HostSettingsObject(Openbmc.DbusProperties):
+class HostSettingsObject(DbusProperties):
     def __init__(self, bus, name, settings, path):
-        Openbmc.DbusProperties.__init__(self)
+        DbusProperties.__init__(self)
         dbus.service.Object.__init__(self, bus, name)
 
         self.path = path
@@ -79,7 +79,7 @@ class HostSettingsObject(Openbmc.DbusProperties):
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-    bus = Openbmc.getDBus()
+    bus = get_dbus()
     name = dbus.service.BusName(DBUS_NAME, bus)
     obj = HostSettingsObject(bus, OBJ_NAME, s.SETTINGS, "/var/lib/obmc/")
     mainloop = gobject.MainLoop()
-- 
2.8.2
