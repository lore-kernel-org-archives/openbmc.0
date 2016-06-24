Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnx03TNNzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:11:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795453660782.130419432447;
 Fri, 24 Jun 2016 12:10:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr 2/2] More performance fixes
Date: Fri, 24 Jun 2016 14:10:49 -0500
Message-Id: <20160624191049.26382-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624191049.26382-1-openbmc-patches@stwcx.xyz>
References: <20160624191049.26382-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:11:01 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Sort introspected children nodes to improve the chance of finding
ObjectManagers sooner rather than later (systemd does a recursive
listing of child nodes).

Remove unnecessary dbus calls when processing interfaces for
associations.  The existing code assumes that only object interfaces
are available to it but the new discovery mechanism uses
GetManagedObjects which includes the object properties.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 phosphor-mapper | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index a2d007c..d44e8f6 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -86,7 +86,7 @@ def find_dbus_interfaces(conn, service, path, match):
             if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in ifaces:
                 objs = self.__get_managed_objects(service, path)
                 for k, v in objs.iteritems():
-                    self.results[k] = v.keys()
+                    self.results[k] = v
             else:
                 children = filter(
                     bool,
@@ -94,7 +94,7 @@ def find_dbus_interfaces(conn, service, path, match):
                 children = [
                     self.__to_path(
                         path_elements + self.__to_path_elements(x))
-                    for x in children]
+                    for x in sorted(children)]
                 for child in children:
                     if child not in self.results:
                         self.__find_interfaces(service, child)
@@ -288,10 +288,23 @@ class ObjectMapper(dbus.service.Object):
             self.process_old_owner(owned_name, old)
 
     def update_interfaces(self, path, owner, old, new):
+        # __xx -> intf list
+        # xx -> intf dict
+        if isinstance(old, dict):
+            __old = old.keys()
+        else:
+            __old = old
+            old = {x: {} for x in old}
+        if isinstance(new, dict):
+            __new = new.keys()
+        else:
+            __new = new
+            new = {x: {} for x in new}
+
         cache_entry = self.cache.setdefault(path, {})
         created = [] if self.has_interfaces(cache_entry) else [path]
-        added = list(set(new).difference(old))
-        removed = list(set(old).difference(new))
+        added = list(set(__new).difference(__old))
+        removed = list(set(__old).difference(__new))
         self.interfaces_append(cache_entry, owner, added)
         self.interfaces_remove(cache_entry, owner, removed, path)
         destroyed = [] if self.has_interfaces(cache_entry) else [path]
@@ -300,7 +313,7 @@ class ObjectMapper(dbus.service.Object):
         new_assoc = []
         old_assoc = []
         if self.is_association(added):
-            new_assoc = self.dbus_get_associations(path, owner)
+            new_assoc = self.dbus_get_associations(path, owner, new)
         if self.is_association(removed):
             old_assoc = self.index_get_associations(path, [owner])
         self.update_associations(
@@ -308,9 +321,7 @@ class ObjectMapper(dbus.service.Object):
 
     def add_items(self, owner, bus_items):
         for path, items in bus_items.iteritems():
-            # convert dbus types to native.
-            interfaces = [str(i) for i in items]
-            self.update_interfaces(path, str(owner), old=[], new=interfaces)
+            self.update_interfaces(path, str(owner), old=[], new=items)
 
     def discover(self, owners=[]):
         def match(iface):
@@ -444,7 +455,12 @@ class ObjectMapper(dbus.service.Object):
         if not owners:
             del index[path]
 
-    def dbus_get_associations(self, path, owner):
+    def dbus_get_associations(self, path, owner, obj):
+        iface = obmc.dbuslib.enums.OBMC_ASSOCIATIONS_IFACE
+        if 'associations' in obj[iface]:
+            return obj[iface]['associations']
+
+        # fallback to dbus
         obj = self.bus.get_object(owner, path, introspect=False)
         iface = dbus.Interface(obj, dbus.PROPERTIES_IFACE)
         return [(str(f), str(r), str(e)) for f, r, e in iface.Get(
-- 
2.9.0
