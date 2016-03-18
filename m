Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRZZS4bjvzDqgm
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 06:11:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458328266591799.5507916032235;
 Fri, 18 Mar 2016 12:11:06 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 2/4] Use pyobmc package
Date: Fri, 18 Mar 2016 14:10:46 -0500
Message-Id: <1458328248-2382-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 19:11:13 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

No functional changes here.  Just module/package namespace updates
to use the pyobmc library.
---
 obmc-rest | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/obmc-rest b/obmc-rest
index f2e268b..7c4ddfd 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -9,8 +9,10 @@ import logging
 from xml.etree import ElementTree
 from rocket import Rocket
 from bottle import Bottle, abort, request, response, JSONPlugin, HTTPError
-import OpenBMCMapper
-from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
+import obmc.utils.misc
+import obmc.utils.pathtree
+from obmc.dbuslib.introspection import IntrospectionNodeParser
+import obmc.mapper
 import spwd
 import grp
 import crypt
@@ -69,7 +71,7 @@ class RouteHandler(object):
     def __init__(self, app, bus, verbs, rules):
         self.app = app
         self.bus = bus
-        self.mapper = Mapper(bus)
+        self.mapper = obmc.mapper.Mapper(bus)
         self._verbs = makelist(verbs)
         self._rules = rules
 
@@ -95,7 +97,7 @@ class RouteHandler(object):
         try:
             return f(**kw)
         except dbus.exceptions.DBusException, e:
-            if e.get_dbus_name() != OpenBMCMapper.MAPPER_NOT_FOUND:
+            if e.get_dbus_name() != obmc.mapper.MAPPER_NOT_FOUND:
                 raise
             if callback is None:
                 def callback(e, **kw):
@@ -173,7 +175,7 @@ class ListHandler(RouteHandler):
     def do_get(self, path='/'):
         objs = {}
         mapper_data = request.route_data['map']
-        tree = PathTree()
+        tree = obmc.utils.pathreee.PathTree()
         for x, y in mapper_data.iteritems():
             tree[x] = y
 
@@ -210,7 +212,7 @@ class ListHandler(RouteHandler):
     def enumerate_capable(path, bus_data):
         busses = []
         for name, ifaces in bus_data.iteritems():
-            if OpenBMCMapper.ENUMERATE_IFACE in ifaces:
+            if obmc.mapper.ENUMERATE_IFACE in ifaces:
                 busses.append(name)
         return busses
 
@@ -218,7 +220,7 @@ class ListHandler(RouteHandler):
         objs = {}
         for b in busses:
             obj = self.bus.get_object(b, path, introspect=False)
-            iface = dbus.Interface(obj, OpenBMCMapper.ENUMERATE_IFACE)
+            iface = dbus.Interface(obj, obmc.mapper.ENUMERATE_IFACE)
             objs.update(iface.enumerate())
         return objs
 
@@ -275,7 +277,7 @@ class MethodHandler(RouteHandler):
         data = iface.Introspect()
         parser = IntrospectionNodeParser(
             ElementTree.fromstring(data),
-            intf_match=ListMatch(interfaces))
+            intf_match=obmc.utils.misc.ListMatch(interfaces))
         for x, y in parser.get_interfaces().iteritems():
             m = self.find_method_in_interface(
                 method, obj, x, y.get('method'))
@@ -722,7 +724,7 @@ class RestApp(Bottle):
     def __init__(self, bus):
         super(RestApp, self).__init__(autojson=False)
         self.bus = bus
-        self.mapper = Mapper(bus)
+        self.mapper = obmc.mapper.Mapper(bus)
 
         self.install_hooks()
         self.install_plugins()
-- 
2.7.1
