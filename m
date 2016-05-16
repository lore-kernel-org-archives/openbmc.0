Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7w060cq5zDq7j
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 08:20:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463437246800624.2991474857969;
 Mon, 16 May 2016 15:20:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr] Avoid introspection during discovery
Date: Mon, 16 May 2016 17:20:42 -0500
Message-Id: <1463437242-18424-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463437242-18424-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463437242-18424-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 May 2016 22:20:54 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Speed up discovery by calling GetManagedObjects on any ObjectManagers.
Fall back on introspection for parent elements or services that don't
implement one.
---
 phosphor-mapper | 90 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 13 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 675ad40..944f6d4 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -21,7 +21,7 @@ import dbus.service
 import dbus.exceptions
 import dbus.mainloop.glib
 import gobject
-from obmc.dbuslib.introspection import IntrospectionParser
+import xml.etree.ElementTree as ET
 import obmc.utils.pathtree
 import obmc.utils.misc
 import obmc.mapper
@@ -37,6 +37,71 @@ class MapperNotFoundException(dbus.exceptions.DBusException):
             "path or object not found: %s" % path)
 
 
+def find_dbus_interfaces(conn, service, path, match):
+    class __FindInterfaces(object):
+        def __init__(self):
+            self.results = {}
+
+        @staticmethod
+        def __introspect(service, path):
+            obj = conn.get_object(service, path, introspect=False)
+            iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+            return iface.Introspect()
+
+        @staticmethod
+        def __get_managed_objects(service, om):
+            obj = conn.get_object(service, om, introspect=False)
+            iface = dbus.Interface(
+                obj, dbus.BUS_DAEMON_IFACE + '.ObjectManager')
+            return iface.GetManagedObjects()
+
+        @staticmethod
+        def __to_path(elements):
+            return '/' + '/'.join(elements)
+
+        @staticmethod
+        def __to_path_elements(path):
+            return filter(bool, path.split('/'))
+
+        def __call__(self, service, path):
+            self.results = {}
+            self.__find_interfaces(service, path)
+            return self.results
+
+        @staticmethod
+        def __match(iface):
+            return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' \
+                or match(iface)
+
+        def __find_interfaces(self, service, path):
+            path_elements = self.__to_path_elements(path)
+            path = self.__to_path(path_elements)
+            root = ET.fromstring(self.__introspect(service, path))
+
+            ifaces = filter(
+                self.__match,
+                [x.attrib.get('name') for x in root.findall('interface')])
+            self.results[path] = ifaces
+
+            if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in ifaces:
+                objs = self.__get_managed_objects(service, path)
+                for k, v in objs.iteritems():
+                    self.results[k] = v.keys()
+            else:
+                children = filter(
+                    bool,
+                    [x.attrib.get('name') for x in root.findall('node')])
+                children = [
+                    self.__to_path(
+                        path_elements + self.__to_path_elements(x))
+                    for x in children]
+                for child in children:
+                    if child not in self.results:
+                        self.__find_interfaces(service, child)
+
+    return __FindInterfaces()(service, path)
+
+
 class Association(dbus.service.Object):
     def __init__(self, bus, path, endpoints):
         super(Association, self).__init__(bus, path)
@@ -196,10 +261,12 @@ class ObjectMapper(dbus.service.Object):
 
     def process_new_owner(self, owner):
         # unique name
-        return self.discover([IntrospectionParser(owner,
-                             self.bus.dbus,
-                             self.tag_match,
-                             self.intf_match)])
+        try:
+            return self.discover([owner])
+        except dbus.exceptions.DBusException, e:
+            if obmc.dbuslib.enums.DBUS_UNKNOWN_SERVICE \
+                    not in e.get_dbus_name():
+                raise
 
     def process_old_owner(self, owner):
         for path, item in self.cache.dataitems():
@@ -240,7 +307,7 @@ class ObjectMapper(dbus.service.Object):
     def add_items(self, owner, bus_items):
         for path, items in bus_items.iteritems():
             # convert dbus types to native.
-            interfaces = [str(i) for i in items.get('interfaces', [])]
+            interfaces = [str(i) for i in items]
             self.update_interfaces(path, str(owner), old=[], new=interfaces)
 
     def discover(self, owners=[]):
@@ -248,14 +315,11 @@ class ObjectMapper(dbus.service.Object):
             return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' or \
                 self.intf_match(iface)
         if not owners:
-            owners = [
-                IntrospectionParser(
-                    x, self.bus.dbus,
-                    self.tag_match,
-                    match)
-                for x in self.bus.get_owner_names(self.bus_match)]
+            owners = self.bus.get_owner_names(self.bus_match)
         for o in owners:
-            self.add_items(o.name, o.introspect())
+            self.add_items(
+                o,
+                find_dbus_interfaces(self.bus.dbus, o, '/', self.intf_match))
 
         if self.discovery_pending():
             # add my object mananger instance
-- 
2.8.2
