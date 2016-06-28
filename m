Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfJPZ2G2jzDqsx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 07:10:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146714825241843.351155493746774;
 Tue, 28 Jun 2016 14:10:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor 5/5] Improve short-lived object handling
Date: Tue, 28 Jun 2016 16:10:46 -0500
Message-Id: <20160628211046.8564-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160628211046.8564-1-openbmc-patches@stwcx.xyz>
References: <20160628211046.8564-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 28 Jun 2016 21:10:59 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Its expected that services will appear on the bus and may or may
not be around log enough for introspection to take place.  Catch
those exceptions and continue.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/introspection.py | 54 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/obmc/dbuslib/introspection.py b/obmc/dbuslib/introspection.py
index 9444d13..805197d 100644
--- a/obmc/dbuslib/introspection.py
+++ b/obmc/dbuslib/introspection.py
@@ -16,6 +16,7 @@
 
 import xml.etree.ElementTree as ET
 import dbus
+import obmc.dbuslib.enums
 
 
 class IntrospectionNodeParser:
@@ -142,17 +143,51 @@ def find_dbus_interfaces(conn, service, path, match):
             self.results = {}
 
         @staticmethod
+        def _get_object(path):
+            try:
+                return conn.get_object(service, path, introspect=False)
+            except dbus.exceptions.DBusException, e:
+                if e.get_dbus_name() in [
+                        obmc.dbuslib.enums.DBUS_UNKNOWN_SERVICE,
+                        obmc.dbuslib.enums.DBUS_NO_REPLY]:
+                    print "Warning: Introspection failure: " \
+                        "service `%s` is not running" % (service)
+                    return None
+                raise
+
+        @staticmethod
+        def _invoke_method(path, iface, method, *args):
+            obj = _FindInterfaces._get_object(path)
+            if not obj:
+                return None
+
+            iface = dbus.Interface(obj, iface)
+            try:
+                f = getattr(iface, method)
+                return f(*args)
+            except dbus.exceptions.DBusException, e:
+                if e.get_dbus_name() in [
+                        obmc.dbuslib.enums.DBUS_UNKNOWN_SERVICE,
+                        obmc.dbuslib.enums.DBUS_NO_REPLY]:
+                    print "Warning: Introspection failure: " \
+                        "service `%s` did not reply to "\
+                        "method call on %s" % (service, path)
+                    return None
+                raise
+
+        @staticmethod
         def _introspect(path):
-            obj = conn.get_object(service, path, introspect=False)
-            iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
-            return iface.Introspect()
+            return _FindInterfaces._invoke_method(
+                path,
+                dbus.INTROSPECTABLE_IFACE,
+                'Introspect')
 
         @staticmethod
         def _get_managed_objects(om):
-            obj = conn.get_object(service, om, introspect=False)
-            iface = dbus.Interface(
-                obj, dbus.BUS_DAEMON_IFACE + '.ObjectManager')
-            return iface.GetManagedObjects()
+            return _FindInterfaces._invoke_method(
+                om,
+                dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+                'GetManagedObjects')
 
         @staticmethod
         def _to_path(elements):
@@ -175,8 +210,11 @@ def find_dbus_interfaces(conn, service, path, match):
         def _find_interfaces(self, path):
             path_elements = self._to_path_elements(path)
             path = self._to_path(path_elements)
-            root = ET.fromstring(self._introspect(path))
+            data = self._introspect(path)
+            if data is None:
+                return
 
+            root = ET.fromstring(data)
             ifaces = filter(
                 self._match,
                 [x.attrib.get('name') for x in root.findall('interface')])
-- 
2.9.0
