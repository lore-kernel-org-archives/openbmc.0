Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlbYg1PnWzDqBZ
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 06:51:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460580657527771.4376977868659;
 Wed, 13 Apr 2016 13:50:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 5/6] Minor refactoring
Date: Wed, 13 Apr 2016 15:50:44 -0500
Message-Id: <1460580645-5232-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460580645-5232-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460580645-5232-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Apr 2016 20:51:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

No functional changes.
Changed any bus name references to "owner".
A couple whitespace changes.
---
 phosphor-mapper | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index bf0e832..a00beaa 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -33,7 +33,7 @@ class MapperNotFoundException(dbus.exceptions.DBusException):
 
     def __init__(self, path):
         super(MapperNotFoundException, self).__init__(
-            "path or object not found: %s" % (path))
+            "path or object not found: %s" % path)
 
 
 class ObjectMapper(dbus.service.Object):
@@ -66,10 +66,10 @@ class ObjectMapper(dbus.service.Object):
             signal_name='InterfacesRemoved',
             sender_keyword='sender')
 
-    def bus_match(self, name):
-        if name == obmc.mapper.MAPPER_NAME:
-            return False
-        return self.name_match(name)
+    def bus_match(self, owner):
+        # Ignore my own signals
+        return owner != obmc.mapper.MAPPER_NAME and \
+            self.name_match(owner)
 
     def discovery_pending(self):
         return not bool(self.service)
@@ -92,19 +92,19 @@ class ObjectMapper(dbus.service.Object):
         new = list(set(old).difference(interfaces))
         self.update_interfaces(path, owner, old, new)
 
-    def process_new_owner(self, name):
+    def process_new_owner(self, owner):
         # unique name
-        return self.discover([IntrospectionParser(name,
+        return self.discover([IntrospectionParser(owner,
                              self.bus.dbus,
                              self.tag_match,
                              self.intf_match)])
 
-    def process_old_owner(self, name):
+    def process_old_owner(self, owner):
         for path, item in self.cache.dataitems():
-            old = self.interfaces_get(item, name)
+            old = self.interfaces_get(item, owner)
             # remove all interfaces for this service
             self.update_interfaces(
-                path, name, old=old, new=[])
+                path, owner, old=old, new=[])
 
     def bus_handler(self, owner, old, new):
         valid = False
@@ -129,12 +129,14 @@ class ObjectMapper(dbus.service.Object):
             interfaces = [str(i) for i in items.get('interfaces', [])]
             self.update_interfaces(path, str(owner), old=[], new=interfaces)
 
-    def discover(self, owners=None):
+    def discover(self, owners=[]):
         if not owners:
-            owners = [IntrospectionParser(x, self.bus.dbus,
-                                          self.tag_match,
-                                          self.intf_match)
-                      for x in self.bus.get_owner_names(self.bus_match)]
+            owners = [
+                IntrospectionParser(
+                    x, self.bus.dbus,
+                    self.tag_match,
+                    self.intf_match)
+                for x in self.bus.get_owner_names(self.bus_match)]
         for o in owners:
             self.add_items(o.name, o.introspect())
 
-- 
2.7.1
