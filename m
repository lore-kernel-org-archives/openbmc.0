Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2AE801A01DC
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:10:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454382634060897.9237543897706;
 Mon, 1 Feb 2016 19:10:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd v2] Fix typos
Date: Mon,  1 Feb 2016 21:10:32 -0600
Message-Id: <1454382632-9193-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454382632-9193-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454382632-9193-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 03:10:38 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Fix argument typos.
---
 netman.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/netman.py b/netman.py
index 9544d07..8f0fb80 100755
--- a/netman.py
+++ b/netman.py
@@ -54,7 +54,7 @@ class NetMan (dbus.service.Object):
     def setNetworkProvider(self, provider):
         self.provider = provider
 
-    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, ateway):
+    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, gateway):
         netprov     = network_providers [self.provider]
         bus_name    = netprov ['bus_name']
         obj_path    = netprov ['ip_object_name']
@@ -63,10 +63,10 @@ class NetMan (dbus.service.Object):
         obj = self.bus.get_object(bus_name, obj_path)
         intf = dbus.Interface(obj, intf_name)
         if (op == "add"):
-            return intf.AddAddress (device, ipaddr, netmask, family, flags, cope, gateway)
+            return intf.AddAddress (device, ipaddr, netmask, family, flags, scope, gateway)
 
         if (op == "del"):
-            return intf.DelAddress (device, ipaddr, netmask, family, flags, cope, gateway)
+            return intf.DelAddress (device, ipaddr, netmask, family, flags, scope, gateway)
 
     def _getAddr (self, target, device):
         netprov     = network_providers [self.provider]
@@ -143,4 +143,4 @@ def main():
     mainloop.run()
 
 if __name__ == '__main__':
-    sys.exit(main())
\ No newline at end of file
+    sys.exit(main())
-- 
2.6.4
