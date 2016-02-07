Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63B631A02CF
 for <openbmc@lists.ozlabs.org>; Sun,  7 Feb 2016 15:30:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454819439005787.4225886006576;
 Sat, 6 Feb 2016 20:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH rest-dbus] Fix pep8 errors
Date: Sat,  6 Feb 2016 22:30:37 -0600
Message-Id: <1454819437-24544-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454819437-24544-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454819437-24544-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 07 Feb 2016 04:30:46 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 rest-dbus | 29 ++++++++++++++++++-----------
 setup.py  |  2 +-
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/rest-dbus b/rest-dbus
index d756dc8..8d759f6 100644
--- a/rest-dbus
+++ b/rest-dbus
@@ -13,17 +13,22 @@ busses = {
     'system': dbus.SystemBus,
 }
 
+
 class DBusRestException(Exception):
+
     def __init__(self, message, code=403):
         self.code = code
         super(DBusRestException, self).__init__(message)
-        
+
+
 class DBusRestResponse(object):
 
     def render(self, handler):
         raise NotImplemented()
 
+
 class DBusRestJSONResponse(DBusRestResponse):
+
     def __init__(self, data):
         self.data = data
 
@@ -33,6 +38,7 @@ class DBusRestJSONResponse(DBusRestResponse):
         handler.end_headers()
         handler.wfile.write(json.dumps(self.data, indent=2, sort_keys=True))
 
+
 class DBusRestResourceResponse(DBusRestResponse):
     mime_map = {
         'html': 'text/html',
@@ -42,12 +48,12 @@ class DBusRestResourceResponse(DBusRestResponse):
         'gif': 'image/gif',
     }
     resource_base = os.path.join(sys.prefix, 'share',
-		    os.path.basename(__file__), 'resources')
+                                 os.path.basename(__file__), 'resources')
 
     def __init__(self, name):
         (_, ext) = os.path.splitext(name)
         self.content_type = self.mime_map.get(ext[1:],
-                'application/octet-stream')
+                                              'application/octet-stream')
         try:
             self.data = open(os.path.join(self.resource_base, name)).read()
         except IOError:
@@ -56,11 +62,13 @@ class DBusRestResourceResponse(DBusRestResponse):
     def render(self, handler):
         handler.send_response(200)
         handler.send_header('Content-Type',
-                self.content_type + '; charset=utf-8')
+                            self.content_type + '; charset=utf-8')
         handler.end_headers()
         handler.wfile.write(self.data)
 
+
 class DBusRestErrorResonse(DBusRestResponse):
+
     def __init__(self, ex):
         self.ex = ex
 
@@ -80,7 +88,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
     def handle_root(self):
         return DBusRestJSONResponse({
             'status': 'ok',
-            'busses': [ {'name': x} for x in busses.keys() ],
+            'busses': [{'name': x} for x in busses.keys()],
         })
 
     def handle_bus(self):
@@ -88,7 +96,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
         objects.sort()
         return DBusRestJSONResponse({
             'status': 'ok',
-            'objects': [ {'name': x} for x in objects ],
+            'objects': [{'name': x} for x in objects],
         })
 
     def get_object_or_404(self, bus_name, obj_path):
@@ -100,7 +108,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 
     def handle_service(self, bus_name):
         data = IntrospectionParser(bus_name, self.bus).introspect()
-        objects = [ { 'path': x } for x in data.iterkeys() ]
+        objects = [{'path': x} for x in data.iterkeys()]
 
         return DBusRestJSONResponse({
             'status': 'ok',
@@ -141,8 +149,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
         methods = []
         signals = []
         base_uri = ('/bus/' + self.bus_name + '/' + obj.requested_bus_name +
-                obj.object_path + '/' + interface_name);
-
+                    obj.object_path + '/' + interface_name)
 
         def parse_method(node):
             args = []
@@ -237,7 +244,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 
         if not parts:
             return self.handle_object(obj)
-                
+
         interface_name = parts.pop(0)
         if not parts:
             return self.handle_interface(obj, interface_name)
@@ -322,7 +329,7 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 
         if not parts:
             raise DBusRestException("Not Found", 404)
-                
+
         interface_name = parts.pop(0)
         if not parts:
             raise DBusRestException("Not Found", 404)
diff --git a/setup.py b/setup.py
index 33d8567..2c35fc4 100644
--- a/setup.py
+++ b/setup.py
@@ -1,7 +1,7 @@
 from distutils.core import setup
 from os import listdir
 
-resources = [ 'resources/%s' %(x) for x in listdir('resources') ]
+resources = ['resources/%s' % (x) for x in listdir('resources')]
 setup(name='rest-dbus',
       version='1.0',
       scripts=['rest-dbus'],
-- 
2.6.4
