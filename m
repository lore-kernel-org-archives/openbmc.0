Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmd2T4W4QzDqHF
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 23:01:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460725258114224.12944906951145;
 Fri, 15 Apr 2016 06:00:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 7/7] Add ObjectManager interfaces automatically
Date: Fri, 15 Apr 2016 08:00:47 -0500
Message-Id: <1460725247-4587-8-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 13:01:06 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

We don't get signals for the ObjectManager itself, so if one is
detected (from one of its signals) that we don't know about add
it to the cache.
---
 phosphor-mapper | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 77b0f7c..fa6bb60 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -116,12 +116,14 @@ class ObjectMapper(dbus.service.Object):
             dbus_interface=
             dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesAdded',
-            sender_keyword='sender')
+            sender_keyword='sender',
+            path_keyword='sender_path')
         self.bus.dbus.add_signal_receiver(
             self.interfaces_removed_handler,
             dbus_interface=dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesRemoved',
-            sender_keyword='sender')
+            sender_keyword='sender',
+            path_keyword='sender_path')
         self.bus.dbus.add_signal_receiver(
             self.properties_changed_handler,
             dbus_interface=dbus.PROPERTIES_IFACE,
@@ -137,9 +139,20 @@ class ObjectMapper(dbus.service.Object):
     def discovery_pending(self):
         return not bool(self.service)
 
+    def add_new_objmgr(self, path, owner):
+        # We don't get a signal for the ObjectManager
+        # interface itself, so if we see a signal from
+        # make sure its in our cache, and add it if not.
+        cache_entry = self.cache.get(path, {})
+        cache_entry = cache_entry if cache_entry is not None else {}
+        old = self.interfaces_get(cache_entry, owner)
+        new = list(set(old).union([dbus.BUS_DAEMON_IFACE + '.ObjectManager']))
+        self.update_interfaces(path, owner, old, new)
+
     def interfaces_added_handler(self, path, iprops, **kw):
         path = str(path)
         owner = str(kw['sender'])
+        self.add_new_objmgr(str(kw['sender_path']), owner)
         interfaces = self.get_signal_interfaces(owner, iprops.iterkeys())
         cache_entry = self.cache.get(path, {})
         old = self.interfaces_get(cache_entry, owner)
@@ -149,6 +162,7 @@ class ObjectMapper(dbus.service.Object):
     def interfaces_removed_handler(self, path, interfaces, **kw):
         path = str(path)
         owner = str(kw['sender'])
+        self.add_new_objmgr(str(kw['sender_path']), owner)
         interfaces = self.get_signal_interfaces(owner, interfaces)
         cache_entry = self.cache.get(path, {})
         old = self.interfaces_get(cache_entry, owner)
-- 
2.7.1
