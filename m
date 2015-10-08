Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 11F941A020A
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:20:38 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444262691395781.2987133309189;
 Wed, 7 Oct 2015 17:04:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Added example BT/IPMI to DBus implemention in Python
Date: Wed,  7 Oct 2015 19:04:48 -0500
Message-Id: <1444262688-18897-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444262688-18897-1-git-send-email-patches@stwcx.xyz>
References: <1444262688-18897-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:20:39 -0000

From: Alistair Popple <alistair@popple.id.au>

---
 bin/ipmid.py | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 bin/ipmid.py

diff --git a/bin/ipmid.py b/bin/ipmid.py
new file mode 100644
index 0000000..99f88a9
--- /dev/null
+++ b/bin/ipmid.py
@@ -0,0 +1,79 @@
+#!/usr/bin/env python
+
+import sys
+import subprocess
+import dbus
+import string
+import os
+import fcntl
+import glib
+import gobject
+import dbus.service
+import dbus.mainloop.glib
+
+DBUS_NAME = 'org.openbmc.HostIpmi'
+OBJ_NAME = '/org/openbmc/HostIpmi/1'
+
+def print_packet(seq, netfn, cmd, data):
+    print 'seq:   0x%02x\nnetfn: 0x%02x\ncmd:   0x%02x\ndata:  [%s]' % (
+            seq, netfn, cmd,
+            ", ".join(['0x%02x' % x for x in data]))
+
+
+class Ipmid(dbus.service.Object):
+    def __init__(self, bus, name):
+        dbus.service.Object.__init__(self,bus,name)
+
+    def setReader(self, reader):
+        self.reader = reader
+
+    @dbus.service.signal(DBUS_NAME, "yyyay")
+    def ReceivedMessage(self, seq, netfn, cmd, data):
+        print("IPMI packet from host. Seq = 0x%x Netfn = 0x%x Cmd = 0x%x" %
+              (ord(seq), ord(netfn), ord(cmd)))
+
+    @dbus.service.method(DBUS_NAME, "", "")
+    def test(self):
+        print("TEST")
+
+    @dbus.service.method(DBUS_NAME, "yyyay", "x")
+    def sendMessage(self, seq, netfn, cmd, data):
+        print("IPMI packet sent to host. Seq = 0x%x Netfn = 0x%x Cmd = 0x%x" %
+              (int(seq), int(netfn), int(cmd)))
+
+        self.reader.write(seq, netfn, cmd, data)
+
+        return 0
+
+class BtReader(object):
+    def __init__(self, ipmi_obj):
+        self.ipmi_obj = ipmi_obj
+        flags = os.O_NONBLOCK | os.O_RDWR
+        self.bt = os.open("/dev/bt", flags)
+        glib.io_add_watch(self.bt, glib.IO_IN, self.io_callback)
+        ipmi_obj.setReader(self)
+
+    def write(self, seq, netfn, cmd, data):
+        # Untested
+        val = chr(netfn) + chr(seq) + chr(cmd)
+        val += reduce(lambda a, b: a + chr(b), data, "")
+        val = chr(len(val)) + val
+        os.write(self.bt, val)
+
+    def io_callback(self, fd, condition):
+        data = os.read(self.bt, 128)
+        self.ipmi_obj.ReceivedMessage(data[2], data[1], data[3], data[4:])
+        return True
+
+def main():
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    bus = dbus.SessionBus()
+    name = dbus.service.BusName(DBUS_NAME, bus)
+    obj = Ipmid(bus, OBJ_NAME)
+    r = BtReader(obj)
+    mainloop = gobject.MainLoop()
+    print("Started")
+    mainloop.run()
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.6.0
