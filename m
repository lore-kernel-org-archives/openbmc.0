Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 539401A0065
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:40:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144614040334647.816964407160754;
 Thu, 29 Oct 2015 10:40:03 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH rest-dbus 3/3] Address sdbus service discovery issue
Date: Thu, 29 Oct 2015 12:39:37 -0500
Message-Id: <1446140377-7626-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
References: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:40:10 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Objects created with sdbus bindings present
themselves differently than python-dbus and gdbus
when introspected.  The OpenBMCMapper module
has a parser that hides that so use that for
service discovery.
---
 rest-dbus | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/rest-dbus b/rest-dbus
index 34fcb65..ddd958b 100644
--- a/rest-dbus
+++ b/rest-dbus
@@ -6,7 +6,7 @@ import SocketServer
 import json
 import os
 import sys
-from xml.etree import ElementTree
+from OpenBMCMapper import IntrospectionParser
 
 busses = {
     'system': dbus.SystemBus,
@@ -98,35 +98,9 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
         return obj
 
     def handle_service(self, bus_name):
-        objects = []
-
-        def parse_introspection_data(data):
-            tree = ElementTree.fromstring(data)
-            children = []
-            has_interfaces = False
-            for node in tree:
-                if node.tag == 'node':
-                    children.append(node.attrib['name'])
-                elif node.tag == 'interface':
-                    has_interfaces = True
-            return (has_interfaces, children)
-
-        def walk_object_tree(obj_path):
-            obj = self.get_object_or_404(bus_name, obj_path)
-
-            iface = dbus.Interface(obj, 'org.freedesktop.DBus.Introspectable')
-            data = iface.Introspect()
-            (has_interfaces, children) = parse_introspection_data(data)
-            if has_interfaces:
-                objects.append({'path': obj_path})
-            for child in children:
-                if obj_path == '/':
-                    obj_path = ''
-
-                walk_object_tree('/'.join([obj_path, child]))
-                
+        data = IntrospectionParser(bus_name, self.bus).introspect()
+        objects = [ { 'path': x } for x in data.iterkeys() ]
 
-        walk_object_tree('/')
         return DBusRestJSONResponse({
             'status': 'ok',
             'bus_name': bus_name,
-- 
2.6.0
