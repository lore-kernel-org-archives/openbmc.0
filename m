Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRZZp19KfzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 06:11:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458328278488716.9318790416102;
 Fri, 18 Mar 2016 12:11:18 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 4/4] Enumerate with
 org.freedesktop.DBus.ObjectManager
Date: Fri, 18 Mar 2016 14:10:48 -0500
Message-Id: <1458328248-2382-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458328248-2382-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458328248-2382-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 18 Mar 2016 19:11:30 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Previously using a custom enumerate interface.
This is the standard interface.

Also, try to find OM implementing objects higher up in the tree.
This improves performance for sub-tree enumerate calls.

Don't try to get properties for ObjectManager interfaces.
For whatever reason sd-bus chokes on this, but it doesn't
have any properties so it isn't needed anyway.
---
 obmc-rest | 93 ++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/obmc-rest b/obmc-rest
index 949a67c..2eaa223 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -90,6 +90,7 @@ class RouteHandler(object):
         self.mapper = obmc.mapper.Mapper(bus)
         self._verbs = makelist(verbs)
         self._rules = rules
+        self.intf_match = obmc.utils.misc.org_dot_openbmc_match
 
     def _setup(self, **kw):
         request.route_data = {}
@@ -191,53 +192,65 @@ class ListHandler(RouteHandler):
     def do_get(self, path='/'):
         objs = {}
         mapper_data = request.route_data['map']
-        tree = obmc.utils.pathreee.PathTree()
-        for x, y in mapper_data.iteritems():
-            tree[x] = y
+        managers = {}
+        owners = []
 
+        # look for objectmanager implementations as they result
+        # in fewer dbus calls
+        for path, bus_data in mapper_data.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                owners.append(owner)
+                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
+                    managers[owner] = path
+
+        # also look in the parent objects
+        ancestors = self.mapper.get_ancestors(path)
+
+        # finally check the root for one too
         try:
-            # Check to see if the root path implements
-            # enumerate in addition to any sub tree
-            # objects.
-            root = self.try_mapper_call(
-                self.mapper.get_object, path=path)
-            mapper_data[path] = root
-        except:
-            pass
+            ancestors.update({path: self.mapper.get_object(path)})
+        except dbus.exceptions.DBusException, e:
+            if e.get_dbus_name() != obmc.mapper.MAPPER_NOT_FOUND:
+                raise
 
-        have_enumerate = [
-            (x[0], self.enumerate_capable(*x))
-            for x in mapper_data.iteritems() if self.enumerate_capable(*x)]
+        for path, bus_data in ancestors.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
+                    managers[owner] = path
 
-        for x, y in have_enumerate:
-            objs.update(self.call_enumerate(x, y))
-            tmp = tree[x]
-            # remove the subtree
-            del tree[x]
-            # add the new leaf back since enumerate results don't
-            # include the object enumerate is being invoked on
-            tree[x] = tmp
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
 
         # make dbus calls for any remaining objects
-        for x, y in tree.dataitems():
-            objs[x] = self.app.instance_handler.do_get(x)
-
-        return objs
+        for path, bus_data in mapper_data.iteritems():
+            for owner, interfaces in bus_data.iteritems():
+                if results.setdefault(path, {}).setdefault(owner, {}):
+                    continue
+                results.setdefault(path, {}).setdefault(
+                    owner,
+                    self.app.instance_handler.get_properties_on_bus(
+                        path, owner, interfaces))
 
-    @staticmethod
-    def enumerate_capable(path, bus_data):
-        busses = []
-        for name, ifaces in bus_data.iteritems():
-            if obmc.mapper.ENUMERATE_IFACE in ifaces:
-                busses.append(name)
-        return busses
-
-    def call_enumerate(self, path, busses):
         objs = {}
-        for b in busses:
-            obj = self.bus.get_object(b, path, introspect=False)
-            iface = dbus.Interface(obj, obmc.mapper.ENUMERATE_IFACE)
-            objs.update(iface.enumerate())
+        for path, owners in results.iteritems():
+            for owner, properties in owners.iteritems():
+                objs.setdefault(path, {}).update(properties)
+
         return objs
 
 
@@ -442,6 +455,8 @@ class InstanceHandler(RouteHandler):
         properties_iface = dbus.Interface(
             obj, dbus_interface=dbus.PROPERTIES_IFACE)
         for i in interfaces:
+            if not self.intf_match(i):
+                continue
             properties.update(self.get_properties_on_iface(
                 properties_iface, i))
 
-- 
2.7.1
