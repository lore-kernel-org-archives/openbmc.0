Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmd2R0jb3zDqDT
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 23:01:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460725256701774.1739097057523;
 Fri, 15 Apr 2016 06:00:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 6/7] Add support for associations
Date: Fri, 15 Apr 2016 08:00:46 -0500
Message-Id: <1460725247-4587-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460725247-4587-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460725247-4587-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 13:01:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

General overview:
Monitor objects that implement org.openbmc.Associations.
React by creating objects implementing org.openbmc.Association.
Include org.freedesktop.DBus.ObjectManager support.

Details:
Implemented properties changed handler for changes to associations
property of org.openbmc.Associations objects.
Updated interfaces added/removed handlers to react to
org.openbmc.Associations.
Required an index to react to endpoint state changes.

For additional on associations information check:
https://github.com/openbmc/docs/blob/master/dbus-interfaces.md
---
 phosphor-mapper | 266 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 265 insertions(+), 1 deletion(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index a00beaa..77b0f7c 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -26,6 +26,7 @@ import obmc.utils.pathtree
 import obmc.utils.misc
 import obmc.mapper
 import obmc.dbuslib.bindings
+import obmc.dbuslib.enums
 
 
 class MapperNotFoundException(dbus.exceptions.DBusException):
@@ -36,6 +37,59 @@ class MapperNotFoundException(dbus.exceptions.DBusException):
             "path or object not found: %s" % path)
 
 
+class Association(dbus.service.Object):
+    def __init__(self, bus, path, endpoints):
+        super(Association, self).__init__(bus, path)
+        self.endpoints = endpoints
+
+    def __getattr__(self, name):
+        if name == 'properties':
+            return {
+                obmc.dbuslib.enums.OBMC_ASSOC_IFACE: {
+                    'endpoints': self.endpoints}}
+        return super(Association, self).__getattr__(name)
+
+    def emit_signal(self, old):
+        if old != self.endpoints:
+            self.PropertiesChanged(
+                obmc.dbuslib.enums.OBMC_ASSOC_IFACE,
+                {'endpoints': self.endpoints}, ['endpoints'])
+
+    def append(self, endpoints):
+        old = self.endpoints
+        self.endpoints = list(set(endpoints).union(self.endpoints))
+        self.emit_signal(old)
+
+    def remove(self, endpoints):
+        old = self.endpoints
+        self.endpoints = list(set(self.endpoints).difference(endpoints))
+        self.emit_signal(old)
+
+    @dbus.service.method(dbus.PROPERTIES_IFACE, 'ss', 'as')
+    def Get(self, interface_name, property_name):
+        if property_name != 'endpoints':
+            raise dbus.exceptions.DBusException(name=DBUS_UNKNOWN_PROPERTY)
+        return self.GetAll(interface_name)[property_name]
+
+    @dbus.service.method(dbus.PROPERTIES_IFACE, 's', 'a{sas}')
+    def GetAll(self, interface_name):
+        if interface_name != obmc.dbuslib.enums.OBMC_ASSOC_IFACE:
+            raise dbus.exceptions.DBusException(DBUS_UNKNOWN_INTERFACE)
+        return {'endpoints': self.endpoints}
+
+    @dbus.service.signal(
+        dbus.PROPERTIES_IFACE, signature='sa{sas}as')
+    def PropertiesChanged(
+            self, interface_name, changed_properties, invalidated_properties):
+        pass
+
+
+class Manager(obmc.dbuslib.bindings.DbusObjectManager):
+    def __init__(self, bus, path):
+        obmc.dbuslib.bindings.DbusObjectManager.__init__(self)
+        dbus.service.Object.__init__(self, bus.dbus, path)
+
+
 class ObjectMapper(dbus.service.Object):
     def __init__(self, bus, path,
                  name_match=obmc.utils.misc.org_dot_openbmc_match,
@@ -47,6 +101,9 @@ class ObjectMapper(dbus.service.Object):
         self.intf_match = intf_match
         self.tag_match = obmc.utils.misc.ListMatch(['children', 'interface'])
         self.service = None
+        self.index = {}
+        self.manager = Manager(bus, obmc.dbuslib.bindings.OBJ_PREFIX)
+        self.unique = bus.dbus.get_unique_name()
 
         gobject.idle_add(self.discover)
         self.bus.dbus.add_signal_receiver(
@@ -65,6 +122,12 @@ class ObjectMapper(dbus.service.Object):
             dbus_interface=dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesRemoved',
             sender_keyword='sender')
+        self.bus.dbus.add_signal_receiver(
+            self.properties_changed_handler,
+            dbus_interface=dbus.PROPERTIES_IFACE,
+            signal_name='PropertiesChanged',
+            path_keyword='path',
+            sender_keyword='sender')
 
     def bus_match(self, owner):
         # Ignore my own signals
@@ -92,6 +155,23 @@ class ObjectMapper(dbus.service.Object):
         new = list(set(old).difference(interfaces))
         self.update_interfaces(path, owner, old, new)
 
+    def properties_changed_handler(self, interface, new, old, **kw):
+        owner = str(kw['sender'])
+        path = str(kw['path'])
+        interfaces = self.get_signal_interfaces(owner, [interface])
+        if not self.is_association(interfaces):
+            return
+        associations = new.get('associations', None)
+        if associations is None:
+            return
+
+        associations = [
+            (str(x), str(y), str(z)) for x, y, z in associations]
+        self.update_associations(
+            path, owner,
+            self.index_get_associations(path, [owner]),
+            associations)
+
     def process_new_owner(self, owner):
         # unique name
         return self.discover([IntrospectionParser(owner,
@@ -118,10 +198,22 @@ class ObjectMapper(dbus.service.Object):
 
     def update_interfaces(self, path, owner, old, new):
         cache_entry = self.cache.setdefault(path, {})
+        created = [] if self.has_interfaces(cache_entry) else [path]
         added = list(set(new).difference(old))
         removed = list(set(old).difference(new))
         self.interfaces_append(cache_entry, owner, added)
         self.interfaces_remove(cache_entry, owner, removed, path)
+        destroyed = [] if self.has_interfaces(cache_entry) else [path]
+
+        # react to anything that requires association updates
+        new_assoc = []
+        old_assoc = []
+        if self.is_association(added):
+            new_assoc = self.dbus_get_associations(path, owner)
+        if self.is_association(removed):
+            old_assoc = self.index_get_associations(path, [owner])
+        self.update_associations(
+            path, owner, old_assoc, new_assoc, created, destroyed)
 
     def add_items(self, owner, bus_items):
         for path, items in bus_items.iteritems():
@@ -130,17 +222,27 @@ class ObjectMapper(dbus.service.Object):
             self.update_interfaces(path, str(owner), old=[], new=interfaces)
 
     def discover(self, owners=[]):
+        def match(iface):
+            return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' or \
+                self.intf_match(iface)
         if not owners:
             owners = [
                 IntrospectionParser(
                     x, self.bus.dbus,
                     self.tag_match,
-                    self.intf_match)
+                    match)
                 for x in self.bus.get_owner_names(self.bus_match)]
         for o in owners:
             self.add_items(o.name, o.introspect())
 
         if self.discovery_pending():
+            # add my object mananger instance
+            self.add_items(
+                self.unique,
+                {obmc.dbuslib.bindings.OBJ_PREFIX:
+                    {'interfaces':
+                        [dbus.BUS_DAEMON_IFACE + '.ObjectManager']}})
+
             print "ObjectMapper discovery complete..."
             self.service = dbus.service.BusName(
                 obmc.mapper.MAPPER_NAME, self.bus.dbus)
@@ -210,6 +312,168 @@ class ObjectMapper(dbus.service.Object):
         except KeyError:
             raise MapperNotFoundException(path)
 
+    @staticmethod
+    def has_interfaces(item):
+        for owner in item.iterkeys():
+            if ObjectMapper.interfaces_get(item, owner):
+                return True
+        return False
+
+    @staticmethod
+    def is_association(interfaces):
+        return obmc.dbuslib.enums.OBMC_ASSOCIATIONS_IFACE in interfaces
+
+    def index_get(self, index, path, owners):
+        items = []
+        item = self.index.get(index, {})
+        item = item.get(path, {})
+        for o in owners:
+            items.extend(item.get(o, []))
+        return items
+
+    def index_append(self, index, path, owner, assoc):
+        item = self.index.setdefault(index, {})
+        item = item.setdefault(path, {})
+        item = item.setdefault(owner, [])
+        item.append(assoc)
+
+    def index_remove(self, index, path, owner, assoc):
+        index = self.index.get(index, {})
+        owners = index.get(path, {})
+        items = owners.get(owner, [])
+        if assoc in items:
+            items.remove(assoc)
+        if not items:
+            del owners[owner]
+        if not owners:
+            del index[path]
+
+    def dbus_get_associations(self, path, owner):
+        obj = self.bus.dbus.get_object(owner, path, introspect=False)
+        iface = dbus.Interface(obj, dbus.PROPERTIES_IFACE)
+        return [(str(f), str(r), str(e)) for f, r, e in iface.Get(
+            obmc.dbuslib.enums.OBMC_ASSOCIATIONS_IFACE,
+            'associations')]
+
+    def index_get_associations(self, path, owners=[], direction='forward'):
+        forward = 'forward' if direction == 'forward' else 'reverse'
+        reverse = 'reverse' if direction == 'forward' else 'forward'
+
+        associations = []
+        if not owners:
+            index = self.index.get(forward, {})
+            owners = index.get(path, {}).keys()
+
+        # f: forward
+        # r: reverse
+        for rassoc in self.index_get(forward, path, owners):
+            elements = rassoc.split('/')
+            rtype = ''.join(elements[-1:])
+            fendpoint = '/'.join(elements[:-1])
+            for fassoc in self.index_get(reverse, fendpoint, owners):
+                elements = fassoc.split('/')
+                ftype = ''.join(elements[-1:])
+                rendpoint = '/'.join(elements[:-1])
+                if rendpoint != path:
+                    continue
+                associations.append((ftype, rtype, fendpoint))
+
+        return associations
+
+    def update_association(self, path, removed, added):
+        iface = obmc.dbuslib.enums.OBMC_ASSOC_IFACE
+        create = [] if self.manager.get(path, False) else [iface]
+
+        if added and create:
+            self.manager.add(
+                path, Association(self.bus.dbus, path, added))
+        elif added:
+            self.manager.get(path).append(added)
+
+        obj = self.manager.get(path, None)
+        if obj and removed:
+            obj.remove(removed)
+
+        if obj and not obj.endpoints:
+            self.manager.remove(path)
+
+        delete = [] if self.manager.get(path, False) else [iface]
+
+        if create != delete:
+            self.update_interfaces(
+                path, self.unique, delete, create)
+
+    def update_associations(
+            self, path, owner, old, new, created=[], destroyed=[]):
+        added = list(set(new).difference(old))
+        removed = list(set(old).difference(new))
+        for forward, reverse, endpoint in added:
+            # update the index
+            forward_path = str(path + '/' + forward)
+            reverse_path = str(endpoint + '/' + reverse)
+            self.index_append(
+                'forward', path, owner, reverse_path)
+            self.index_append(
+                'reverse', endpoint, owner, forward_path)
+
+            # create the association if the endpoint exists
+            if self.cache.get(endpoint, None) is None:
+                continue
+
+            self.update_association(forward_path, [], [endpoint])
+            self.update_association(reverse_path, [], [path])
+
+        for forward, reverse, endpoint in removed:
+            # update the index
+            forward_path = str(path + '/' + forward)
+            reverse_path = str(endpoint + '/' + reverse)
+            self.index_remove(
+                'forward', path, owner, reverse_path)
+            self.index_remove(
+                'reverse', endpoint, owner, forward_path)
+
+            # destroy the association if it exists
+            self.update_association(forward_path, [endpoint], [])
+            self.update_association(reverse_path, [path], [])
+
+        # If the associations interface endpoint comes
+        # or goes create or destroy the appropriate
+        # associations
+        for path in created:
+            for forward, reverse, endpoint in \
+                    self.index_get_associations(path, direction='reverse'):
+                forward_path = str(path + '/' + forward)
+                reverse_path = str(endpoint + '/' + reverse)
+                self.update_association(forward_path, [], [endpoint])
+                self.update_association(reverse_path, [], [path])
+
+        for path in destroyed:
+            for forward, reverse, endpoint in \
+                    self.index_get_associations(path, direction='reverse'):
+                forward_path = str(path + '/' + forward)
+                reverse_path = str(endpoint + '/' + reverse)
+                self.update_association(forward_path, [endpoint], [])
+                self.update_association(reverse_path, [path], [])
+
+    @dbus.service.method(obmc.mapper.MAPPER_IFACE, 's', 'a{sa{sas}}')
+    def GetAncestors(self, path):
+        elements = filter(bool, path.split('/'))
+        paths = []
+        objs = {}
+        while elements:
+            elements.pop()
+            paths.append('/' + '/'.join(elements))
+        if path != '/':
+            paths.append('/')
+
+        for path in paths:
+            obj = self.cache.get(path, None)
+            if obj is None:
+                continue
+            objs[path] = obj
+
+        return objs
+
 
 class BusWrapper:
     def __init__(self, bus):
-- 
2.7.1
