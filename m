Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpg6fnBzDqBP
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:10:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186248805750.3547720708441;
 Sun, 5 Jun 2016 21:10:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr] Performance improvements
Date: Sun,  5 Jun 2016 23:10:46 -0500
Message-Id: <20160606041046.18724-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606041046.18724-1-openbmc-patches@stwcx.xyz>
References: <20160606041046.18724-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:10:52 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Prior to this patch, an excessive ( more than zero ) number of dbus
calls were made to determine if a signal was something we care about.
This patch adds a well-known to unique connection name translation cache
eliminating all outgoing dbus calls.

Also removed the abstraction layer that obscured this as it isn't used.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 phosphor-mapper | 102 ++++++++++++++++++++++++++------------------------------
 1 file changed, 47 insertions(+), 55 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 944f6d4..ea30f1b 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -152,14 +152,14 @@ class Association(dbus.service.Object):
 class Manager(obmc.dbuslib.bindings.DbusObjectManager):
     def __init__(self, bus, path):
         obmc.dbuslib.bindings.DbusObjectManager.__init__(self)
-        dbus.service.Object.__init__(self, bus.dbus, path)
+        dbus.service.Object.__init__(self, bus, path)
 
 
 class ObjectMapper(dbus.service.Object):
     def __init__(self, bus, path,
                  name_match=obmc.utils.misc.org_dot_openbmc_match,
                  intf_match=obmc.utils.misc.org_dot_openbmc_match):
-        super(ObjectMapper, self).__init__(bus.dbus, path)
+        super(ObjectMapper, self).__init__(bus, path)
         self.cache = obmc.utils.pathtree.PathTree()
         self.bus = bus
         self.name_match = name_match
@@ -168,28 +168,29 @@ class ObjectMapper(dbus.service.Object):
         self.service = None
         self.index = {}
         self.manager = Manager(bus, obmc.dbuslib.bindings.OBJ_PREFIX)
-        self.unique = bus.dbus.get_unique_name()
+        self.unique = bus.get_unique_name()
+        self.bus_map = {}
 
         gobject.idle_add(self.discover)
-        self.bus.dbus.add_signal_receiver(
+        self.bus.add_signal_receiver(
             self.bus_handler,
             dbus_interface=
             dbus.BUS_DAEMON_IFACE,
             signal_name='NameOwnerChanged')
-        self.bus.dbus.add_signal_receiver(
+        self.bus.add_signal_receiver(
             self.interfaces_added_handler,
             dbus_interface=
             dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesAdded',
             sender_keyword='sender',
             path_keyword='sender_path')
-        self.bus.dbus.add_signal_receiver(
+        self.bus.add_signal_receiver(
             self.interfaces_removed_handler,
             dbus_interface=dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesRemoved',
             sender_keyword='sender',
             path_keyword='sender_path')
-        self.bus.dbus.add_signal_receiver(
+        self.bus.add_signal_receiver(
             self.properties_changed_handler,
             dbus_interface=dbus.PROPERTIES_IFACE,
             signal_name='PropertiesChanged',
@@ -226,10 +227,10 @@ class ObjectMapper(dbus.service.Object):
         interfaces = self.get_signal_interfaces(owner, iprops.iterkeys())
         if interfaces:
             self.add_new_objmgr(str(kw['sender_path']), owner)
-        cache_entry = self.cache_get(path)
-        old = self.interfaces_get(cache_entry, owner)
-        new = list(set(interfaces).union(old))
-        self.update_interfaces(path, owner, old, new)
+            cache_entry = self.cache_get(path)
+            old = self.interfaces_get(cache_entry, owner)
+            new = list(set(interfaces).union(old))
+            self.update_interfaces(path, owner, old, new)
 
     def interfaces_removed_handler(self, path, interfaces, **kw):
         path = str(path)
@@ -237,10 +238,10 @@ class ObjectMapper(dbus.service.Object):
         interfaces = self.get_signal_interfaces(owner, interfaces)
         if interfaces:
             self.add_new_objmgr(str(kw['sender_path']), owner)
-        cache_entry = self.cache_get(path)
-        old = self.interfaces_get(cache_entry, owner)
-        new = list(set(old).difference(interfaces))
-        self.update_interfaces(path, owner, old, new)
+            cache_entry = self.cache_get(path)
+            old = self.interfaces_get(cache_entry, owner)
+            new = list(set(old).difference(interfaces))
+            self.update_interfaces(path, owner, old, new)
 
     def properties_changed_handler(self, interface, new, old, **kw):
         owner = str(kw['sender'])
@@ -259,31 +260,34 @@ class ObjectMapper(dbus.service.Object):
             self.index_get_associations(path, [owner]),
             associations)
 
-    def process_new_owner(self, owner):
+    def process_new_owner(self, owned_name, owner):
         # unique name
         try:
-            return self.discover([owner])
+            return self.discover([(owned_name, owner)])
         except dbus.exceptions.DBusException, e:
             if obmc.dbuslib.enums.DBUS_UNKNOWN_SERVICE \
                     not in e.get_dbus_name():
                 raise
 
-    def process_old_owner(self, owner):
+    def process_old_owner(self, owned_name, owner):
+        if owner in self.bus_map:
+            del self.bus_map[owner]
+
         for path, item in self.cache.dataitems():
             old = self.interfaces_get(item, owner)
             # remove all interfaces for this service
             self.update_interfaces(
                 path, owner, old=old, new=[])
 
-    def bus_handler(self, owner, old, new):
+    def bus_handler(self, owned_name, old, new):
         valid = False
-        if not obmc.dbuslib.bindings.is_unique(owner):
-            valid = self.valid_signal(owner)
+        if not obmc.dbuslib.bindings.is_unique(owned_name):
+            valid = self.valid_signal(owned_name)
 
         if valid and new:
-            self.process_new_owner(new)
+            self.process_new_owner(owned_name, new)
         if valid and old:
-            self.process_old_owner(old)
+            self.process_old_owner(owned_name, old)
 
     def update_interfaces(self, path, owner, old, new):
         cache_entry = self.cache.setdefault(path, {})
@@ -315,14 +319,19 @@ class ObjectMapper(dbus.service.Object):
             return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' or \
                 self.intf_match(iface)
         if not owners:
-            owners = self.bus.get_owner_names(self.bus_match)
-        for o in owners:
+            owned_names = [x for x in self.bus.list_names()
+                if self.bus_match(x)]
+            owners = [self.bus.get_name_owner(x) for x in owned_names]
+            owners = zip(owned_names, owners)
+        for owned_name, o in owners:
             self.add_items(
                 o,
-                find_dbus_interfaces(self.bus.dbus, o, '/', self.intf_match))
+                find_dbus_interfaces(self.bus, o, '/', self.intf_match))
+            self.bus_map[o] = owned_name
 
         if self.discovery_pending():
             # add my object mananger instance
+            self.bus_map[self.unique] = obmc.mapper.MAPPER_NAME
             self.add_items(
                 self.unique,
                 {obmc.dbuslib.bindings.OBJ_PREFIX:
@@ -331,14 +340,17 @@ class ObjectMapper(dbus.service.Object):
 
             print "ObjectMapper discovery complete..."
             self.service = dbus.service.BusName(
-                obmc.mapper.MAPPER_NAME, self.bus.dbus)
+                obmc.mapper.MAPPER_NAME, self.bus)
+
+    def valid_signal(self, name):
+        if self.discovery_pending():
+            return False
 
-    def valid_signal(self, owner):
-        if obmc.dbuslib.bindings.is_unique(owner):
-            owner = self.bus.get_owned_name(self.bus_match, owner)
+        if obmc.dbuslib.bindings.is_unique(name):
+            name = self.bus_map.get(name)
 
-        return owner is not None and not self.discovery_pending() and \
-            self.bus_match(owner)
+        return name is not None and \
+            self.bus_match(name)
 
     def get_signal_interfaces(self, owner, interfaces):
         filtered = []
@@ -435,7 +447,7 @@ class ObjectMapper(dbus.service.Object):
             del index[path]
 
     def dbus_get_associations(self, path, owner):
-        obj = self.bus.dbus.get_object(owner, path, introspect=False)
+        obj = self.bus.get_object(owner, path, introspect=False)
         iface = dbus.Interface(obj, dbus.PROPERTIES_IFACE)
         return [(str(f), str(r), str(e)) for f, r, e in iface.Get(
             obmc.dbuslib.enums.OBMC_ASSOCIATIONS_IFACE,
@@ -472,7 +484,7 @@ class ObjectMapper(dbus.service.Object):
 
         if added and create:
             self.manager.add(
-                path, Association(self.bus.dbus, path, added))
+                path, Association(self.bus, path, added))
         elif added:
             self.manager.get(path).append(added)
 
@@ -561,30 +573,10 @@ class ObjectMapper(dbus.service.Object):
         return objs
 
 
-class BusWrapper:
-    def __init__(self, bus):
-        self.dbus = bus
-
-    def get_owned_name(self, match, bus):
-        for x in self.get_service_names(match):
-            if self.dbus.get_name_owner(x) == bus:
-                return x
-
-    def get_service_names(self, match):
-        # these are well known names
-        return [x for x in self.dbus.list_names()
-                if match(x)]
-
-    def get_owner_names(self, match):
-        # these are unique connection names
-        return list(set(
-            [self.dbus.get_name_owner(x)
-                for x in self.get_service_names(match)]))
-
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
     bus = dbus.SystemBus()
-    o = ObjectMapper(BusWrapper(bus), obmc.mapper.MAPPER_PATH)
+    o = ObjectMapper(bus, obmc.mapper.MAPPER_PATH)
     loop = gobject.MainLoop()
 
     loop.run()
-- 
2.8.3
