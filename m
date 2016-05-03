Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzSQL3kFMzDq6B
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 14:10:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462248645664810.2955599837246;
 Mon, 2 May 2016 21:10:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr] Add an accessor function for cache entries
Date: Mon,  2 May 2016 23:10:42 -0500
Message-Id: <1462248642-23400-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462248642-23400-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462248642-23400-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 03 May 2016 04:10:51 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Determining the difference between a directory path element
and a path element that doesn't exist with pyphosphor is
awkward.  Create an accessor function to funnel this weirdness
in one spot.

Make sure objectmanagers adhere to match rules before adding them.
---
 phosphor-mapper | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index fa6bb60..675ad40 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -139,12 +139,18 @@ class ObjectMapper(dbus.service.Object):
     def discovery_pending(self):
         return not bool(self.service)
 
+    def cache_get(self, path):
+        cache_entry = self.cache.get(path, {})
+        if cache_entry is None:
+            # hide path elements without any interfaces
+            cache_entry = {}
+        return cache_entry
+
     def add_new_objmgr(self, path, owner):
         # We don't get a signal for the ObjectManager
         # interface itself, so if we see a signal from
         # make sure its in our cache, and add it if not.
-        cache_entry = self.cache.get(path, {})
-        cache_entry = cache_entry if cache_entry is not None else {}
+        cache_entry = self.cache_get(path)
         old = self.interfaces_get(cache_entry, owner)
         new = list(set(old).union([dbus.BUS_DAEMON_IFACE + '.ObjectManager']))
         self.update_interfaces(path, owner, old, new)
@@ -152,9 +158,10 @@ class ObjectMapper(dbus.service.Object):
     def interfaces_added_handler(self, path, iprops, **kw):
         path = str(path)
         owner = str(kw['sender'])
-        self.add_new_objmgr(str(kw['sender_path']), owner)
         interfaces = self.get_signal_interfaces(owner, iprops.iterkeys())
-        cache_entry = self.cache.get(path, {})
+        if interfaces:
+            self.add_new_objmgr(str(kw['sender_path']), owner)
+        cache_entry = self.cache_get(path)
         old = self.interfaces_get(cache_entry, owner)
         new = list(set(interfaces).union(old))
         self.update_interfaces(path, owner, old, new)
@@ -162,9 +169,10 @@ class ObjectMapper(dbus.service.Object):
     def interfaces_removed_handler(self, path, interfaces, **kw):
         path = str(path)
         owner = str(kw['sender'])
-        self.add_new_objmgr(str(kw['sender_path']), owner)
         interfaces = self.get_signal_interfaces(owner, interfaces)
-        cache_entry = self.cache.get(path, {})
+        if interfaces:
+            self.add_new_objmgr(str(kw['sender_path']), owner)
+        cache_entry = self.cache_get(path)
         old = self.interfaces_get(cache_entry, owner)
         new = list(set(old).difference(interfaces))
         self.update_interfaces(path, owner, old, new)
@@ -307,7 +315,7 @@ class ObjectMapper(dbus.service.Object):
 
     @dbus.service.method(obmc.mapper.MAPPER_IFACE, 's', 'a{sas}')
     def GetObject(self, path):
-        o = self.cache.get(path)
+        o = self.cache_get(path)
         if not o:
             raise MapperNotFoundException(path)
         return o
@@ -431,7 +439,7 @@ class ObjectMapper(dbus.service.Object):
                 'reverse', endpoint, owner, forward_path)
 
             # create the association if the endpoint exists
-            if self.cache.get(endpoint, None) is None:
+            if not self.cache_get(endpoint):
                 continue
 
             self.update_association(forward_path, [], [endpoint])
@@ -481,8 +489,8 @@ class ObjectMapper(dbus.service.Object):
             paths.append('/')
 
         for path in paths:
-            obj = self.cache.get(path, None)
-            if obj is None:
+            obj = self.cache_get(path)
+            if not obj:
                 continue
             objs[path] = obj
 
-- 
2.8.1
