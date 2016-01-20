Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8D4B61A1854
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 00:30:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14532966364891009.9841902498301;
 Wed, 20 Jan 2016 05:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] Adding org.openbmc.NetworkManager dbus
 interface for network configuation.
Date: Wed, 20 Jan 2016 07:30:34 -0600
Message-Id: <1453296634-21470-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453296634-21470-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453296634-21470-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 13:30:58 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 netman.py | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100755 netman.py

diff --git a/netman.py b/netman.py
new file mode 100755
index 0000000..bc46fd1
--- /dev/null
+++ b/netman.py
@@ -0,0 +1,111 @@
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
+DBUS_NAME = 'org.openbmc.NetworkManager'
+OBJ_NAME = '/org/openbmc/NetworkManager/Interface'
+
+network_providers = {
+	'networkd' : { 
+		'bus_name' : 'org.freedesktop.network1',
+		'object_name' : '/org/freedesktop/network1/network/default',
+		'interface_name' : 'org.freedesktop.network1.Network',
+		'method' : 'org.freedesktop.network1.Network.SetAddr'
+	},
+	'NetworkManager' : {
+		'bus_name' : 'org.freedesktop.NetworkManager',
+		'object_name' : '/org/freedesktop/NetworkManager',
+		'interface_name' : 'org.freedesktop.NetworkManager',
+		'method' : 'org.freedesktop.NetworkManager' # FIXME: 
+	},	
+}
+
+class IfAddr ():
+    def __init__ (self, family, scope, flags, prefixlen, addr, gw):
+        self.family     = family
+        self.scope      = scope
+        self.flags      = flags
+        self.prefixlen  = prefixlen
+        self.addr       = addr
+        self.gw         = gw
+
+class NetMan (dbus.service.Object):
+    def __init__(self, bus, name):
+        self.bus = bus
+        self.name = name
+        dbus.service.Object.__init__(self,bus,name)
+
+    def setNetworkProvider(self, provider):
+        self.provider = provider
+
+    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, gateway):
+        netprov     = network_providers [self.provider]
+        bus_name    = netprov ['bus_name']
+        obj_path    = netprov ['object_name']
+        intf_name   = netprov ['interface_name']
+
+        obj = self.bus.get_object(bus_name, obj_path)
+        intf = dbus.Interface(obj, intf_name)
+        if (op == "add"):
+            return intf.AddAddress (device, ipaddr, netmask, family, flags, scope, gateway)
+
+        if (op == "del"):
+            return intf.DelAddress (device, ipaddr, netmask, family, flags, scope, gateway)
+
+    def _getAddr (self, target, device):
+        netprov     = network_providers [self.provider]
+        bus_name    = netprov ['bus_name']
+        obj_path    = netprov ['object_name']
+
+        if (target == "ip"):
+            intf_name   = 'org.freedesktop.network1.Network'
+
+        if (target == "mac"):
+            intf_name   = 'org.freedesktop.network1.Link'
+
+        obj = self.bus.get_object(bus_name, obj_path)
+        intf = dbus.Interface(obj, intf_name)
+        return intf.GetAddress (device)
+
+
+    @dbus.service.method(DBUS_NAME, "", "")
+    def test(self):
+        print("TEST")
+
+    @dbus.service.method(DBUS_NAME, "ssss", "x")
+    def AddAddress4 (self, device, ipaddr, netmask, gateway):
+        return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
+
+    @dbus.service.method(DBUS_NAME, "ssss", "x")
+    def DelAddress4 (self, device, ipaddr, netmask, gateway):
+        return self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gateway)
+
+    @dbus.service.method(DBUS_NAME, "s", "a(iyyus)s")
+    def GetAddress4 (self, device):
+        return self._getAddr ("ip", device)
+
+    @dbus.service.method(DBUS_NAME, "s", "s")
+    def GetHwAddress (self, device):
+        return self._getAddr ("mac", device)
+
+def main():
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    bus = dbus.SystemBus()
+    name = dbus.service.BusName(DBUS_NAME, bus)
+    obj = NetMan (bus, OBJ_NAME)
+    obj.setNetworkProvider ("networkd")
+    mainloop = gobject.MainLoop()
+    print("Started")
+    mainloop.run()
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.6.4
