Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfJPW75H8zDqsy
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 07:10:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467148249770560.3593771497467;
 Tue, 28 Jun 2016 14:10:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor 2/5] Add find_dbus_interfaces to introspection utils
Date: Tue, 28 Jun 2016 16:10:43 -0500
Message-Id: <20160628211046.8564-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 28 Jun 2016 21:10:56 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This is a straight copy from phosphor-objmgr.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/introspection.py | 69 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/obmc/dbuslib/introspection.py b/obmc/dbuslib/introspection.py
index db83c6e..26f0555 100644
--- a/obmc/dbuslib/introspection.py
+++ b/obmc/dbuslib/introspection.py
@@ -14,7 +14,7 @@
 # implied. See the License for the specific language governing
 # permissions and limitations under the License.
 
-from xml.etree import ElementTree
+import xml.etree.ElementTree as ET
 import dbus
 
 
@@ -98,7 +98,7 @@ class IntrospectionParser:
             return None
 
         return IntrospectionNodeParser(
-            ElementTree.fromstring(data),
+            ET.fromstring(data),
             self.tag_match,
             self.intf_match)
 
@@ -134,3 +134,68 @@ class IntrospectionParser:
             items.update(callback(path + k, parser))
 
         return items
+
+
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
+                    self.results[k] = v
+            else:
+                children = filter(
+                    bool,
+                    [x.attrib.get('name') for x in root.findall('node')])
+                children = [
+                    self.__to_path(
+                        path_elements + self.__to_path_elements(x))
+                    for x in sorted(children)]
+                for child in children:
+                    if child not in self.results:
+                        self.__find_interfaces(service, child)
+
+    return __FindInterfaces()(service, path)
-- 
2.9.0
