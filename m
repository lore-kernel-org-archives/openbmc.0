Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzVBV4K2VzDqBh
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 15:30:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462253437287703.262094271124;
 Mon, 2 May 2016 22:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openpower-inventory-upload] Convert inventory-upload to a dbus
 loop
Date: Tue,  3 May 2016 00:30:35 -0500
Message-Id: <1462253435-26734-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462253435-26734-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462253435-26734-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 03 May 2016 05:30:43 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

It runs after every power off.  For the first boot, it listens
for org.openbmc.Inventory NameOwnerChanged and uploads.

Work around wonky dimm naming (array of bytes) - dtc suggests
that the name property be a string.
---
 inventory_upload.py | 106 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 36 deletions(-)

diff --git a/inventory_upload.py b/inventory_upload.py
index 005d387..4a7b8f2 100644
--- a/inventory_upload.py
+++ b/inventory_upload.py
@@ -20,6 +20,8 @@ import obmc.mapper
 import obmc.utils.dtree
 import obmc.utils.pathtree
 import dbus
+import dbus.mainloop.glib
+import gobject
 import os
 import subprocess
 import tempfile
@@ -46,6 +48,13 @@ def transform(path, o):
         rename = name
         revalue = value
 
+        # convert to lower case
+        rename = rename.lower()
+
+        # force name to be a string
+        if rename == 'name' and isinstance(revalue, list):
+            revalue = ''.join([str(x) for x in revalue])
+
         # make is-fru a real boolean
         if rename == 'is_fru':
             revalue = 'True' if revalue == 1 else 'False'
@@ -54,9 +63,6 @@ def transform(path, o):
         rename = rename.replace('_', '-')
         rename = rename.replace(' ', '-')
 
-        # convert to lower case
-        rename = rename.lower()
-
         # strip trailing whitespace from strings
         rename = rename.rstrip()
         if isinstance(revalue, basestring):
@@ -77,39 +83,67 @@ def transform(path, o):
     return path, o
 
 
+class InventoryUpload(object):
+    def __init__(self, bus):
+        self.bus = bus
+        self.bus.add_signal_receiver(
+            self.state_handler,
+            dbus_interface='org.openbmc.Control',
+            signal_name='GotoSystemState')
+        self.bus.add_signal_receiver(
+            self.bus_handler,
+            dbus_interface=dbus.BUS_DAEMON_IFACE,
+            signal_name='NameOwnerChanged')
+
+    def bus_handler(self, name, old, new):
+        if name == 'org.openbmc.Inventory' and new:
+            self.upload()
+
+    def state_handler(self, state):
+        if state == 'HOST_POWERED_OFF':
+            self.upload()
+
+    def upload(self):
+        objs = obmc.utils.pathtree.PathTree()
+
+        mapper = obmc.mapper.Mapper(self.bus)
+        for path, props in \
+                mapper.enumerate_subtree(
+                    path='/org/openbmc/inventory/system').iteritems():
+            item = transform(path, props)
+            if item:
+                objs[item[0]] = item[1]
+
+        rpipe, wpipe = os.pipe()
+        rpipe = os.fdopen(rpipe, 'r')
+        wpipe = os.fdopen(wpipe, 'a')
+
+        wpipe.write('/dts-v1/;')
+        obmc.utils.dtree.dts_encode(objs.dumpd(), wpipe)
+        wpipe.close()
+        h, tmpfile = tempfile.mkstemp()
+        try:
+            wfile = os.fdopen(h, 'w')
+            subprocess.call(
+                ['dtc', '-f', '-O', 'dtb'],
+                stdin=rpipe,
+                stdout=wfile)
+            rpipe.close()
+            wfile.close()
+
+            print "Uploading inventory to PNOR in dtb format..."
+            subprocess.call(
+                ['pflash', '-f', '-e', '-p', tmpfile, '-P', 'BMC_INV'])
+        except:
+            os.remove(tmpfile)
+            raise
+
+        os.remove(tmpfile)
+
 if __name__ == '__main__':
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    loop = gobject.MainLoop()
     bus = dbus.SystemBus()
-    objs = obmc.utils.pathtree.PathTree()
-
-    mapper = obmc.mapper.Mapper(bus)
-    for path, props in \
-            mapper.enumerate_subtree(
-                path='/org/openbmc/inventory/system').iteritems():
-        item = transform(path, props)
-        if item:
-            objs[item[0]] = item[1]
-
-    rpipe, wpipe = os.pipe()
-    rpipe = os.fdopen(rpipe, 'r')
-    wpipe = os.fdopen(wpipe, 'a')
-
-    wpipe.write('/dts-v1/;')
-    obmc.utils.dtree.dts_encode(objs.dumpd(), wpipe)
-    wpipe.close()
-    h, tmpfile = tempfile.mkstemp()
-    try:
-        wfile = os.fdopen(h, 'w')
-        subprocess.call(
-            ['dtc', '-O', 'dtb'],
-            stdin=rpipe,
-            stdout=wfile)
-        rpipe.close()
-        wfile.close()
-
-        print "Uploading inventory to PNOR in dtb format..."
-        subprocess.call(['pflash', '-f', '-e', '-p', tmpfile, '-P', 'BMC_INV'])
-    except:
-        os.remove(tmpfile)
-        raise
+    uploader = InventoryUpload(bus)
 
-    os.remove(tmpfile)
+    loop.run()
-- 
2.8.1
