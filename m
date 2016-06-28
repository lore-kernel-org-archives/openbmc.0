Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfJPY13QXzDqsx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 07:10:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467148251648401.6163749272123;
 Tue, 28 Jun 2016 14:10:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor 4/5] Remove unnecessary variable
Date: Tue, 28 Jun 2016 16:10:45 -0500
Message-Id: <20160628211046.8564-5-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 28 Jun 2016 21:10:57 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/introspection.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/obmc/dbuslib/introspection.py b/obmc/dbuslib/introspection.py
index ec252c6..9444d13 100644
--- a/obmc/dbuslib/introspection.py
+++ b/obmc/dbuslib/introspection.py
@@ -142,13 +142,13 @@ def find_dbus_interfaces(conn, service, path, match):
             self.results = {}
 
         @staticmethod
-        def _introspect(service, path):
+        def _introspect(path):
             obj = conn.get_object(service, path, introspect=False)
             iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
             return iface.Introspect()
 
         @staticmethod
-        def _get_managed_objects(service, om):
+        def _get_managed_objects(om):
             obj = conn.get_object(service, om, introspect=False)
             iface = dbus.Interface(
                 obj, dbus.BUS_DAEMON_IFACE + '.ObjectManager')
@@ -162,9 +162,9 @@ def find_dbus_interfaces(conn, service, path, match):
         def _to_path_elements(path):
             return filter(bool, path.split('/'))
 
-        def __call__(self, service, path):
+        def __call__(self, path):
             self.results = {}
-            self._find_interfaces(service, path)
+            self._find_interfaces(path)
             return self.results
 
         @staticmethod
@@ -172,10 +172,10 @@ def find_dbus_interfaces(conn, service, path, match):
             return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' \
                 or match(iface)
 
-        def _find_interfaces(self, service, path):
+        def _find_interfaces(self, path):
             path_elements = self._to_path_elements(path)
             path = self._to_path(path_elements)
-            root = ET.fromstring(self._introspect(service, path))
+            root = ET.fromstring(self._introspect(path))
 
             ifaces = filter(
                 self._match,
@@ -183,7 +183,7 @@ def find_dbus_interfaces(conn, service, path, match):
             self.results[path] = ifaces
 
             if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in ifaces:
-                objs = self._get_managed_objects(service, path)
+                objs = self._get_managed_objects(path)
                 for k, v in objs.iteritems():
                     self.results[k] = v
             else:
@@ -196,6 +196,6 @@ def find_dbus_interfaces(conn, service, path, match):
                     for x in sorted(children)]
                 for child in children:
                     if child not in self.results:
-                        self._find_interfaces(service, child)
+                        self._find_interfaces(child)
 
-    return _FindInterfaces()(service, path)
+    return _FindInterfaces()(path)
-- 
2.9.0
