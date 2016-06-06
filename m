Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNHTZ2XPGzDq5y
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 11:40:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146517724638027.01718091349062;
 Sun, 5 Jun 2016 18:40:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-rest-server v3] The streaming support for obmc-rest.
Date: Sun,  5 Jun 2016 20:40:44 -0500
Message-Id: <20160606014044.13538-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606014044.13538-1-openbmc-patches@stwcx.xyz>
References: <20160606014044.13538-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 01:40:50 -0000

From: shgoupf <shgoupf@cn.ibm.com>

Changes:
1) The main idea of this change is to have a streaming path as below:
    dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notify the client of the signal receiving.
2) Replace rocket with gevent WSGI server to support multiple async accesses.
3) Use gevent queue to notify the dbus signal receiving.
4) The uri to the streaming should be in the form as below:
    https://<ip>/<path>/stream/<signal_name>
---
 obmc-rest | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 106 insertions(+), 12 deletions(-)
 mode change 100644 => 100755 obmc-rest

diff --git a/obmc-rest b/obmc-rest
old mode 100644
new mode 100755
index e7dbbba..304cb41
--- a/obmc-rest
+++ b/obmc-rest
@@ -19,7 +19,9 @@
 import os
 import sys
 import dbus
+import gobject
 import dbus.exceptions
+import dbus.mainloop.glib
 import json
 import logging
 from xml.etree import ElementTree
@@ -32,6 +34,10 @@ import obmc.mapper
 import spwd
 import grp
 import crypt
+import threading
+import gevent
+from gevent.pywsgi import WSGIServer
+from gevent.queue import Queue
 
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
 DBUS_UNKNOWN_INTERFACE_ERROR = 'org.freedesktop.DBus.Error.UnknownInterface'
@@ -72,13 +78,14 @@ class UserInGroup:
 class RouteHandler(object):
     _require_auth = obmc.utils.misc.makelist(valid_user)
 
-    def __init__(self, app, bus, verbs, rules):
+    def __init__(self, app, bus, verbs, rules, skips=[]):
         self.app = app
         self.bus = bus
         self.mapper = obmc.mapper.Mapper(bus)
         self._verbs = obmc.utils.misc.makelist(verbs)
         self._rules = rules
         self.intf_match = obmc.utils.misc.org_dot_openbmc_match
+        self._skips = skips
 
     def _setup(self, **kw):
         request.route_data = {}
@@ -94,7 +101,7 @@ class RouteHandler(object):
 
     def install(self):
         self.app.route(
-            self._rules, callback=self,
+            self._rules, callback=self, skip=self._skips,
             method=['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
 
     @staticmethod
@@ -126,6 +133,57 @@ class RouteHandler(object):
                 return None
             raise
 
+class SignalHandler(RouteHandler):
+    verbs = ['GET']
+    rules = '<path:path>/stream/<signal>'
+
+    def __init__(self, app, bus):
+        super(SignalHandler, self).__init__(
+                app, bus, self.verbs, self.rules)
+
+    def find(self, path, signal):
+        busses = self.try_mapper_call(self.mapper.get_object,
+                path = path)
+        for items in busses.iteritems():
+            s = self.find_signal_on_bus(path, signal, *items)
+            if s:
+                return s
+
+        abort(404, _4034_msg %('signal', 'found', signal))
+
+    def setup(self, path, signal):
+        request.route_data['map'] = self.find(path, signal)
+
+    def do_get(self, path, signal):
+                body = Queue()
+                dsignal = DbusSignal(bus, request.route_data['map'][0],
+                                     request.route_data['map'][1], path)
+                dsignal.onData(body.put)
+                dsignal.onFinish(lambda: body.put(StopIteration))
+                dsignal.signalSnooping()
+                return body
+
+    @staticmethod
+    def find_signal(signal, signals):
+        if signals is None:
+            return None
+
+        signal = find_case_insensitive(signal, signals.keys())
+        if signal is not None:
+                        return signal
+
+    def find_signal_on_bus(self, path, signal, bus, interfaces):
+        obj = self.bus.get_object(bus, path, introspect = False)
+        iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+        data = iface.Introspect()
+        parser = IntrospectionNodeParser(
+                ElementTree.fromstring(data),
+                intf_match = ListMatch(interfaces))
+        for x,y in parser.get_interfaces().iteritems():
+            s = self.find_signal(signal,
+                                             y.get('signal'))
+            if s:
+                return (x,s)
 
 class DirectoryHandler(RouteHandler):
     verbs = 'GET'
@@ -702,7 +760,8 @@ class RestApp(Bottle):
         self.install(AuthorizationPlugin())
         self.install(JsonpPlugin(**json_kw))
         self.install(JSONPlugin(**json_kw))
-        self.install(JsonApiResponsePlugin())
+        self.json_response_plugin = JsonApiResponsePlugin()
+        self.install(self.json_response_plugin)
         self.install(JsonApiRequestPlugin())
         self.install(JsonApiRequestTypePlugin())
 
@@ -713,6 +772,7 @@ class RestApp(Bottle):
 
     def create_handlers(self):
         # create route handlers
+        self.signal_handler = SignalHandler(self, self.bus)
         self.session_handler = SessionHandler(self, self.bus)
         self.directory_handler = DirectoryHandler(self, self.bus)
         self.list_names_handler = ListNamesHandler(self, self.bus)
@@ -723,6 +783,11 @@ class RestApp(Bottle):
         self.instance_handler = InstanceHandler(self, self.bus)
 
     def install_handlers(self):
+        # Skip json response for signal handler because it requires to
+        # return a gevent iterable which cannot be handled by json
+        # response plugin
+        self.signal_handler._skips = [self.json_response_plugin]
+        self.signal_handler.install()
         self.session_handler.install()
         self.directory_handler.install()
         self.list_names_handler.install()
@@ -754,19 +819,48 @@ class RestApp(Bottle):
         parts = filter(bool, path.split('/'))
         request.environ['PATH_INFO'] = '/' + '/'.join(parts) + trailing
 
+class DbusSignal():
+    def __init__(self, bus, dbus_interface, signal_name, path):
+        # Register the dbus recieve handler
+        bus.add_signal_receiver(self.signalReciever,
+                                dbus_interface = dbus_interface,
+                                signal_name = signal_name,
+                                path = path)
+
+        self.snooping = True
+
+    def signalReciever(self, msg):
+        self.send("Recieved message: %s" % msg)
+        self.snooping = False
+
+    def onData(self, send):
+        self.send = send
+
+    def onFinish(self, f):
+        self.finish = f
+
+    def signalSnooping(self):
+        while self.snooping:
+            mainloop = gobject.MainLoop()
+            gevent.sleep(1)
+            gobject.timeout_add(1, mainloop.quit)
+            mainloop.run()
+
+        self.finish()
+
 if __name__ == '__main__':
     log = logging.getLogger('Rocket.Errors')
     log.setLevel(logging.INFO)
     log.addHandler(logging.StreamHandler(sys.stdout))
 
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
     bus = dbus.SystemBus()
     app = RestApp(bus)
-    default_cert = os.path.join(
-        sys.prefix, 'share', os.path.basename(__file__), 'cert.pem')
-
-    server = Rocket(
-        ('0.0.0.0', 443, default_cert, default_cert),
-        'wsgi', {'wsgi_app': app},
-        min_threads=1,
-        max_threads=1)
-    server.start()
+
+    default_cert = os.path.join(sys.prefix, 'share',
+            os.path.basename(__file__), 'cert.pem')
+
+    server = WSGIServer(("0.0.0.0", 443), app, keyfile = default_cert,
+                        certfile = default_cert)
+
+    server.serve_forever()
-- 
2.8.3
