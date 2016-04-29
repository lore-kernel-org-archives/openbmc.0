Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxLZt3b6GzDqBM
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:40:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461951645070345.3278188488707;
 Fri, 29 Apr 2016 10:40:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] Added DBus method GetAddressType to
 identify if the interface is configured with static IP address or configured
 by DHCP.
Date: Fri, 29 Apr 2016 12:40:42 -0500
Message-Id: <1461951642-23562-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461951642-23562-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461951642-23562-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 17:40:55 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 netman.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/netman.py b/netman.py
index 377833d..e2b89ca 100755
--- a/netman.py
+++ b/netman.py
@@ -192,6 +192,32 @@ class NetMan (dbus.service.Object):
         rc = call(["systemctl", "restart", "systemd-networkd.service"])
         return rc
 
+    @dbus.service.method(DBUS_NAME, "s", "s")
+    def GetAddressType (self, device):
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
+
+        confFile = "/etc/systemd/network/00-bmc-" + device + ".network"
+        if not os.path.exists(confFile): 
+            print "Config file (%s) not found !" % confFile
+            netprov     = network_providers [self.provider]
+            bus_name    = netprov ['bus_name']
+            obj_name    = netprov ['ip_object_name']
+            o = self.bus.get_object(bus_name, obj_name, introspect=False)
+            i = dbus.Interface(o, 'org.freedesktop.DBus.Properties')
+            f = i.Get (netprov ['ip_if_name'], "SourcePath")
+            print "Using default networkd config file (%s)" % f
+            confFile = f
+
+        with open(confFile, "r") as f:
+            for line in f:
+                config = line.split ("=")
+                if (len (config) < 2) : continue
+                if config [0].upper() == "DHCP":
+                    v = config[1].strip().upper()
+                    if (v=="YES" or v=="IPV4" or v=="IPV6"):
+                        return "DHCP"
+        return "STATIC"
+
     #family, prefixlen, ip, defgw
     @dbus.service.method(DBUS_NAME, "s", "iyss")
     def GetAddress4 (self, device):
-- 
2.8.1
