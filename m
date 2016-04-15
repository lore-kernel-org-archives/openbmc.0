Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmd2P3PRnzDqHc
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 23:01:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146072525435245.000793766643824;
 Fri, 15 Apr 2016 06:00:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 4/7] Add cache access and signal validation
 wrappers
Date: Fri, 15 Apr 2016 08:00:44 -0500
Message-Id: <1460725247-4587-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 13:01:02 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use of the main cache structure will grow so added some wrappers
that automate initialization and cleanup.

Refactored duplicate signal handler bus/interface validation
logic into reusable functions.

Updated discovery and signal handlers to make use of all these
new functions.
---
 phosphor-mapper | 139 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 82 insertions(+), 57 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 5995ee0..bf0e832 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -25,6 +25,7 @@ from obmc.dbuslib.introspection import IntrospectionParser
 import obmc.utils.pathtree
 import obmc.utils.misc
 import obmc.mapper
+import obmc.dbuslib.bindings
 
 
 class MapperNotFoundException(dbus.exceptions.DBusException):
@@ -74,41 +75,22 @@ class ObjectMapper(dbus.service.Object):
         return not bool(self.service)
 
     def interfaces_added_handler(self, path, iprops, **kw):
-        name = self.bus.get_owned_name(self.bus_match, kw['sender'])
-        if self.discovery_pending() or \
-                not self.bus_match(name):
-            return
-
-        matches = [x for x in iprops.iterkeys() if self.intf_match(x)]
-        self.add_interfaces(path, kw['sender'], matches)
+        path = str(path)
+        owner = str(kw['sender'])
+        interfaces = self.get_signal_interfaces(owner, iprops.iterkeys())
+        cache_entry = self.cache.get(path, {})
+        old = self.interfaces_get(cache_entry, owner)
+        new = list(set(interfaces).union(old))
+        self.update_interfaces(path, owner, old, new)
 
     def interfaces_removed_handler(self, path, interfaces, **kw):
-        name = self.bus.get_owned_name(self.bus_match, kw['sender'])
-        if self.discovery_pending() or \
-                not self.bus_match(name):
-            return
-        item = self.cache[path]
-        sender = kw['sender']
-        for x in interfaces:
-            if self.intf_match(x):
-                try:
-                    item[sender].remove(x)
-                except ValueError:
-                    pass
-
-        # remove the owner if there aren't any interfaces left
-        if not item[sender]:
-            del item[sender]
-
-        # update if interfaces remain
-        if item:
-            self.cache[path] = item
-        # mark for removal if no interfaces remain
-        elif self.cache.get_children(path):
-            self.cache.demote(path)
-        # delete the entire path if everything is gone
-        else:
-            del self.cache[path]
+        path = str(path)
+        owner = str(kw['sender'])
+        interfaces = self.get_signal_interfaces(owner, interfaces)
+        cache_entry = self.cache.get(path, {})
+        old = self.interfaces_get(cache_entry, owner)
+        new = list(set(old).difference(interfaces))
+        self.update_interfaces(path, owner, old, new)
 
     def process_new_owner(self, name):
         # unique name
@@ -118,35 +100,34 @@ class ObjectMapper(dbus.service.Object):
                              self.intf_match)])
 
     def process_old_owner(self, name):
-        for x, y in self.cache.dataitems():
-            if name not in y:
-                continue
-            del y[name]
-            if y:
-                self.cache[x] = y
-            elif self.cache.get_children(x):
-                self.cache.demote(x)
-            else:
-                del self.cache[x]
-
-    def bus_handler(self, service, old, new):
-        if self.discovery_pending() or \
-                not self.bus_match(service):
-            return
-
-        if new:
+        for path, item in self.cache.dataitems():
+            old = self.interfaces_get(item, name)
+            # remove all interfaces for this service
+            self.update_interfaces(
+                path, name, old=old, new=[])
+
+    def bus_handler(self, owner, old, new):
+        valid = False
+        if not obmc.dbuslib.bindings.is_unique(owner):
+            valid = self.valid_signal(owner)
+
+        if valid and new:
             self.process_new_owner(new)
-        if old:
+        if valid and old:
             self.process_old_owner(old)
 
-    def add_interfaces(self, path, owner, interfaces):
-        d = self.cache.setdefault(path, {})
-        d = d.setdefault(owner, [])
-        self.cache[path][owner] = list(set(d + interfaces))
+    def update_interfaces(self, path, owner, old, new):
+        cache_entry = self.cache.setdefault(path, {})
+        added = list(set(new).difference(old))
+        removed = list(set(old).difference(new))
+        self.interfaces_append(cache_entry, owner, added)
+        self.interfaces_remove(cache_entry, owner, removed, path)
 
     def add_items(self, owner, bus_items):
-        for x, y in bus_items.iteritems():
-            self.add_interfaces(x, owner, y['interfaces'])
+        for path, items in bus_items.iteritems():
+            # convert dbus types to native.
+            interfaces = [str(i) for i in items.get('interfaces', [])]
+            self.update_interfaces(path, str(owner), old=[], new=interfaces)
 
     def discover(self, owners=None):
         if not owners:
@@ -162,6 +143,50 @@ class ObjectMapper(dbus.service.Object):
             self.service = dbus.service.BusName(
                 obmc.mapper.MAPPER_NAME, self.bus.dbus)
 
+    def valid_signal(self, owner):
+        if obmc.dbuslib.bindings.is_unique(owner):
+            owner = self.bus.get_owned_name(self.bus_match, owner)
+
+        return owner is not None and not self.discovery_pending() and \
+            self.bus_match(owner)
+
+    def get_signal_interfaces(self, owner, interfaces):
+        filtered = []
+        if self.valid_signal(owner):
+            filtered = [str(x) for x in interfaces if self.intf_match(x)]
+
+        return filtered
+
+    @staticmethod
+    def interfaces_get(item, owner, default=[]):
+        return item.get(owner, default)
+
+    @staticmethod
+    def interfaces_append(item, owner, append):
+        interfaces = item.setdefault(owner, [])
+        item[owner] = list(set(append).union(interfaces))
+
+    def interfaces_remove(self, item, owner, remove, path):
+        interfaces = item.get(owner, [])
+        item[owner] = list(set(interfaces).difference(remove))
+
+        if not item[owner]:
+            # remove the owner if there aren't any interfaces left
+            del item[owner]
+
+        if item:
+            # other owners remain
+            return
+
+        if self.cache.get_children(path):
+            # there are still references to this path
+            # from objects further down the tree.
+            # mark it for removal if that changes
+            self.cache.demote(path)
+        else:
+            # delete the entire path if everything is gone
+            del self.cache[path]
+
     @dbus.service.method(obmc.mapper.MAPPER_IFACE, 's', 'a{sas}')
     def GetObject(self, path):
         o = self.cache.get(path)
-- 
2.7.1
