Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxKwM4RL8zDqBH
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:10:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461949854027702.4787870234389;
 Fri, 29 Apr 2016 10:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH pyphosphor v2 4/4] Move common code from REST server
Date: Fri, 29 Apr 2016 12:10:47 -0500
Message-Id: <1461949847-22156-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461949847-22156-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 17:11:00 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Moving a bunch of code with common utility out of the rest server.
No new functionality provided.
---
 obmc/mapper.py | 120 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/obmc/mapper.py b/obmc/mapper.py
index 3f9df5d..68ffb63 100644
--- a/obmc/mapper.py
+++ b/obmc/mapper.py
@@ -15,6 +15,9 @@
 # permissions and limitations under the License.
 
 import dbus
+import obmc.dbuslib.enums
+import obmc.utils.misc
+import obmc.utils.pathtree
 
 MAPPER_NAME = 'org.openbmc.objectmapper'
 MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
@@ -41,3 +44,120 @@ class Mapper:
 
     def get_ancestors(self, path):
         return self.iface.GetAncestors(path)
+
+    @staticmethod
+    def __try_properties_interface(f, *a):
+        try:
+            return f(*a)
+        except dbus.exceptions.DBusException, e:
+            if obmc.dbuslib.enums.DBUS_UNKNOWN_INTERFACE in \
+                    e.get_dbus_message():
+                # interface doesn't have any properties
+                return None
+            if obmc.dbuslib.enums.DBUS_UNKNOWN_METHOD == e.get_dbus_name():
+                # properties interface not implemented at all
+                return None
+            raise
+
+    @staticmethod
+    def __get_properties_on_iface(properties_iface, iface):
+        properties = Mapper.__try_properties_interface(
+            properties_iface.GetAll, iface)
+        if properties is None:
+            return {}
+        return properties
+
+    def __get_properties_on_bus(self, path, bus, interfaces, match):
+        properties = {}
+        obj = self.bus.get_object(bus, path, introspect=False)
+        properties_iface = dbus.Interface(
+            obj, dbus_interface=dbus.PROPERTIES_IFACE)
+        for i in interfaces:
+            if not match(i):
+                continue
+            properties.update(self.__get_properties_on_iface(
+                properties_iface, i))
+
+        return properties
+
+    def enumerate_object(
+            self, path,
+            match=obmc.utils.misc.org_dot_openbmc_match,
+            mapper_data=None):
+        if mapper_data is None:
+            mapper_data = {path: self.get_object(path)}
+
+        obj = {}
+
+        for owner, interfaces in mapper_data[path].iteritems():
+            obj.update(
+                self.__get_properties_on_bus(
+                    path, owner, interfaces, match))
+
+        return obj
+
+    def enumerate_subtree(
+            self, path='/',
+            match=obmc.utils.misc.org_dot_openbmc_match,
+            mapper_data=None):
+        if mapper_data is None:
+            mapper_data = self.get_subtree(path)
+        managers = {}
+        owners = []
+
+        # look for objectmanager implementations as they result
+        # in fewer dbus calls
+        for path, bus_data in mapper_data.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                owners.append(owner)
+                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
+                    managers[owner] = path
+
+        # also look in the parent objects
+        ancestors = self.get_ancestors(path)
+
+        # finally check the root for one too
+        try:
+            ancestors.update({path: self.get_object(path)})
+        except dbus.exceptions.DBusException, e:
+            if e.get_dbus_name() != obmc.mapper.MAPPER_NOT_FOUND:
+                raise
+
+        for path, bus_data in ancestors.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
+                    managers[owner] = path
+
+        # make all the manager gmo (get managed objects) calls
+        results = {}
+        for owner, path in managers.iteritems():
+            if owner not in owners:
+                continue
+            obj = self.bus.get_object(owner, path, introspect=False)
+            iface = dbus.Interface(
+                obj, dbus.BUS_DAEMON_IFACE + '.ObjectManager')
+
+            # flatten (remove interface names) gmo results
+            for path, interfaces in iface.GetManagedObjects().iteritems():
+                if path not in mapper_data.iterkeys():
+                    continue
+                properties = {}
+                for iface, props in interfaces.iteritems():
+                    properties.update(props)
+                results.setdefault(path, {}).setdefault(owner, properties)
+
+        # make dbus calls for any remaining objects
+        for path, bus_data in mapper_data.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                if results.setdefault(path, {}).setdefault(owner, {}):
+                    continue
+                results[path][owner].update(
+                    self.__get_properties_on_bus(
+                        path, owner, interfaces, match))
+
+        objs = obmc.utils.pathtree.PathTree()
+        for path, owners in results.iteritems():
+            for owner, properties in owners.iteritems():
+                objs.setdefault(path, {}).update(properties)
+
+        return objs
-- 
2.8.1
