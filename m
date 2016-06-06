Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpW5wZTzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186238281624.8273552796975;
 Sun, 5 Jun 2016 21:10:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openpower-inventory-upload] Change upload triggering mechanism
Date: Sun,  5 Jun 2016 23:10:36 -0500
Message-Id: <20160606041036.18631-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606041036.18631-1-openbmc-patches@stwcx.xyz>
References: <20160606041036.18631-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:10:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This reverts most of dbc81d6.  The previous triggering mechanism
did not prevent a user from powering the system on while the PNOR
is updated and vise versa.  The new mechanism just does the upload
prior to stating the host.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 inventory_upload.py | 96 ++++++++++++++++++-----------------------------------
 1 file changed, 33 insertions(+), 63 deletions(-)

diff --git a/inventory_upload.py b/inventory_upload.py
index 4a7b8f2..70c11ea 100644
--- a/inventory_upload.py
+++ b/inventory_upload.py
@@ -20,8 +20,6 @@ import obmc.mapper
 import obmc.utils.dtree
 import obmc.utils.pathtree
 import dbus
-import dbus.mainloop.glib
-import gobject
 import os
 import subprocess
 import tempfile
@@ -83,67 +81,39 @@ def transform(path, o):
     return path, o
 
 
-class InventoryUpload(object):
-    def __init__(self, bus):
-        self.bus = bus
-        self.bus.add_signal_receiver(
-            self.state_handler,
-            dbus_interface='org.openbmc.Control',
-            signal_name='GotoSystemState')
-        self.bus.add_signal_receiver(
-            self.bus_handler,
-            dbus_interface=dbus.BUS_DAEMON_IFACE,
-            signal_name='NameOwnerChanged')
-
-    def bus_handler(self, name, old, new):
-        if name == 'org.openbmc.Inventory' and new:
-            self.upload()
-
-    def state_handler(self, state):
-        if state == 'HOST_POWERED_OFF':
-            self.upload()
-
-    def upload(self):
-        objs = obmc.utils.pathtree.PathTree()
-
-        mapper = obmc.mapper.Mapper(self.bus)
-        for path, props in \
-                mapper.enumerate_subtree(
-                    path='/org/openbmc/inventory/system').iteritems():
-            item = transform(path, props)
-            if item:
-                objs[item[0]] = item[1]
-
-        rpipe, wpipe = os.pipe()
-        rpipe = os.fdopen(rpipe, 'r')
-        wpipe = os.fdopen(wpipe, 'a')
-
-        wpipe.write('/dts-v1/;')
-        obmc.utils.dtree.dts_encode(objs.dumpd(), wpipe)
-        wpipe.close()
-        h, tmpfile = tempfile.mkstemp()
-        try:
-            wfile = os.fdopen(h, 'w')
-            subprocess.call(
-                ['dtc', '-f', '-O', 'dtb'],
-                stdin=rpipe,
-                stdout=wfile)
-            rpipe.close()
-            wfile.close()
-
-            print "Uploading inventory to PNOR in dtb format..."
-            subprocess.call(
-                ['pflash', '-f', '-e', '-p', tmpfile, '-P', 'BMC_INV'])
-        except:
-            os.remove(tmpfile)
-            raise
-
-        os.remove(tmpfile)
-
 if __name__ == '__main__':
-    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-    loop = gobject.MainLoop()
     bus = dbus.SystemBus()
-    uploader = InventoryUpload(bus)
+    objs = obmc.utils.pathtree.PathTree()
+
+    mapper = obmc.mapper.Mapper(bus)
+    for path, props in \
+            mapper.enumerate_subtree(
+                path='/org/openbmc/inventory/system').iteritems():
+        item = transform(path, props)
+        if item:
+            objs[item[0]] = item[1]
+
+    rpipe, wpipe = os.pipe()
+    rpipe = os.fdopen(rpipe, 'r')
+    wpipe = os.fdopen(wpipe, 'a')
+
+    wpipe.write('/dts-v1/;')
+    obmc.utils.dtree.dts_encode(objs.dumpd(), wpipe)
+    wpipe.close()
+    h, tmpfile = tempfile.mkstemp()
+    try:
+        wfile = os.fdopen(h, 'w')
+        subprocess.call(
+            ['dtc', '-O', 'dtb'],
+            stdin=rpipe,
+            stdout=wfile)
+        rpipe.close()
+        wfile.close()
+
+        print "Uploading inventory to PNOR in dtb format..."
+        subprocess.call(['pflash', '-f', '-e', '-p', tmpfile, '-P', 'BMC_INV'])
+    except:
+        os.remove(tmpfile)
+        raise
 
-    loop.run()
+    os.remove(tmpfile)
-- 
2.8.3
