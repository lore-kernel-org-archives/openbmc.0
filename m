Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0A511A007F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 11:30:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454373029933185.41396497420806;
 Mon, 1 Feb 2016 16:30:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] AddAddress4 not setting the new IP
Date: Mon,  1 Feb 2016 18:30:28 -0600
Message-Id: <1454373028-5280-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454373028-5280-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454373028-5280-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 00:30:35 -0000

From: Chris Austen <austenc@us.ibm.com>

Just a few changes to make it work...

1) Ensure the .network file is a known name.  It must be
   deleted before the new .network file is added since
   the other file also had the same interface and priority level
2) I got on the systemd channel because restarting the systemd
   service does not change the ip address.  You needed to
   flush the ip instead.

Notes on the networkd subject from the IRC channel...
From the systemd-networkd manpage... "Network configurations applied
 before networkd is started are not removed"

I also learned from the IRC to use the 'ip addr flush <device>' to
force the network cleanup.  ...

<causten__> danderson, so if I setup a server on one subnet, rebooted, then wanted to change the ip I couldn't do it without rebooting?
<causten__> is there a workaround?  I mean switching ips in a lab to a different subnet is common
<danderson> either that, or manually clean up the interface configuration before restarting networkd
<danderson> i.e. `ip addr del 1.2.3.4 dev eno1` or whatever
<danderson> alternatively, you may want to just use a different network configuration manager (e.g. arch's netctl, or network-manager), if your use case is more complex
<danderson> networkd is by design aimed at one-time configuration on startup, and minor maintenance like keeping DHCP going
---
 netman.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/netman.py b/netman.py
index c63921f..9544d07 100755
--- a/netman.py
+++ b/netman.py
@@ -54,7 +54,7 @@ class NetMan (dbus.service.Object):
     def setNetworkProvider(self, provider):
         self.provider = provider
 
-    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, gateway):
+    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, ateway):
         netprov     = network_providers [self.provider]
         bus_name    = netprov ['bus_name']
         obj_path    = netprov ['ip_object_name']
@@ -63,10 +63,10 @@ class NetMan (dbus.service.Object):
         obj = self.bus.get_object(bus_name, obj_path)
         intf = dbus.Interface(obj, intf_name)
         if (op == "add"):
-            return intf.AddAddress (device, ipaddr, netmask, family, flags, scope, gateway)
+            return intf.AddAddress (device, ipaddr, netmask, family, flags, cope, gateway)
 
         if (op == "del"):
-            return intf.DelAddress (device, ipaddr, netmask, family, flags, scope, gateway)
+            return intf.DelAddress (device, ipaddr, netmask, family, flags, cope, gateway)
 
     def _getAddr (self, target, device):
         netprov     = network_providers [self.provider]
@@ -97,9 +97,7 @@ class NetMan (dbus.service.Object):
     @dbus.service.method(DBUS_NAME, "ssss", "x")
     def AddAddress4 (self, device, ipaddr, netmask, gateway):
         prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
-        if os.path.exists(confFile):
-            return 0
+        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
 
         print("Making .network file...")
         networkconf = open (confFile, "w+") 
@@ -108,16 +106,17 @@ class NetMan (dbus.service.Object):
         networkconf.write ('[Network]' + '\n')
         networkconf.write ('Address=' + ipaddr + '/' + str(prefixLen) +  '\n')
         networkconf.write ('Gateway=' + gateway + '\n')
+        networkconf.close()
 
         print("Restarting networkd service...")
-        call(["systemctl", "restart", "systemd-networkd.service"])
+        call(["ip", "addr", "flush", device])
         return 0
-        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
+        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway
 
     @dbus.service.method(DBUS_NAME, "ssss", "x")
     def DelAddress4 (self, device, ipaddr, netmask, gateway):
         prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
+        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
         if not (os.path.exists(confFile)):
             return 1
 
@@ -144,4 +143,4 @@ def main():
     mainloop.run()
 
 if __name__ == '__main__':
-    sys.exit(main())
+    sys.exit(main())
\ No newline at end of file
-- 
2.6.4
