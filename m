Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qtPTG687TzDq5y
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 08:40:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461537644278277.27738324043787;
 Sun, 24 Apr 2016 15:40:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server v2 1/3] Moved functions to pyobmc library
Date: Sun, 24 Apr 2016 17:40:40 -0500
Message-Id: <1461537642-10215-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461537642-10215-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461537642-10215-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 24 Apr 2016 22:40:51 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The functions here for enumerating a tree of objects have
utility elsewhere and were added to pyobmc so removing
the duplicated code.
---
 obmc-rest | 95 ++++-----------------------------------------------------------
 1 file changed, 6 insertions(+), 89 deletions(-)

diff --git a/obmc-rest b/obmc-rest
index 0bc67ef..3a36406 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -190,68 +190,9 @@ class ListHandler(RouteHandler):
         request.route_data['map'] = self.find(path)
 
     def do_get(self, path='/'):
-        objs = {}
-        mapper_data = request.route_data['map']
-        managers = {}
-        owners = []
-
-        # look for objectmanager implementations as they result
-        # in fewer dbus calls
-        for path, bus_data in mapper_data.iteritems():
-            for owner, interfaces in bus_data.iteritems():
-                owners.append(owner)
-                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
-                    managers[owner] = path
-
-        # also look in the parent objects
-        ancestors = self.mapper.get_ancestors(path)
-
-        # finally check the root for one too
-        try:
-            ancestors.update({path: self.mapper.get_object(path)})
-        except dbus.exceptions.DBusException, e:
-            if e.get_dbus_name() != obmc.mapper.MAPPER_NOT_FOUND:
-                raise
-
-        for path, bus_data in ancestors.iteritems():
-            for owner, interfaces in bus_data.iteritems():
-                if dbus.BUS_DAEMON_IFACE + '.ObjectManager' in interfaces:
-                    managers[owner] = path
-
-        # make all the manager gmo (get managed objects) calls
-        results = {}
-        for owner, path in managers.iteritems():
-            if owner not in owners:
-                continue
-            obj = self.bus.get_object(owner, path, introspect=False)
-            iface = dbus.Interface(
-                obj, dbus.BUS_DAEMON_IFACE + '.ObjectManager')
-
-            # flatten (remove interface names) gmo results
-            for path, interfaces in iface.GetManagedObjects().iteritems():
-                if path not in mapper_data.iterkeys():
-                    continue
-                properties = {}
-                for iface, props in interfaces.iteritems():
-                    properties.update(props)
-                results.setdefault(path, {}).setdefault(owner, properties)
-
-        # make dbus calls for any remaining objects
-        for path, bus_data in mapper_data.iteritems():
-            for owner, interfaces in bus_data.iteritems():
-                if results.setdefault(path, {}).setdefault(owner, {}):
-                    continue
-                results.setdefault(path, {}).setdefault(
-                    owner,
-                    self.app.instance_handler.get_properties_on_bus(
-                        path, owner, interfaces))
-
-        objs = {}
-        for path, owners in results.iteritems():
-            for owner, properties in owners.iteritems():
-                objs.setdefault(path, {}).update(properties)
-
-        return objs
+        return {x: y for x, y in self.mapper.enumerate_subtree(
+                path,
+                mapper_data=request.route_data['map']).dataitems()}
 
 
 class MethodHandler(RouteHandler):
@@ -434,33 +375,9 @@ class InstanceHandler(RouteHandler):
             request.route_data['map'] = self.find(path, callback)
 
     def do_get(self, path):
-        properties = {}
-        for item in request.route_data['map'][path].iteritems():
-            properties.update(self.get_properties_on_bus(
-                path, *item))
-
-        return properties
-
-    @staticmethod
-    def get_properties_on_iface(properties_iface, iface):
-        properties = InstanceHandler.try_properties_interface(
-            properties_iface.GetAll, iface)
-        if properties is None:
-            return {}
-        return properties
-
-    def get_properties_on_bus(self, path, bus, interfaces):
-        properties = {}
-        obj = self.bus.get_object(bus, path, introspect=False)
-        properties_iface = dbus.Interface(
-            obj, dbus_interface=dbus.PROPERTIES_IFACE)
-        for i in interfaces:
-            if not self.intf_match(i):
-                continue
-            properties.update(self.get_properties_on_iface(
-                properties_iface, i))
-
-        return properties
+        return self.mapper.enumerate_object(
+            path,
+            mapper_data=request.route_data['map'])
 
     def do_put(self, path):
         # make sure all properties exist in the request
-- 
2.8.1
