Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rr7f039YyzDqyS
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 07:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468530642264241.3071719730881;
 Thu, 14 Jul 2016 14:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH phosphor-networkd] networking: ip address validation
Date: Thu, 14 Jul 2016 16:10:40 -0500
Message-Id: <20160714211040.12708-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160714211040.12708-1-openbmc-patches@stwcx.xyz>
References: <20160714211040.12708-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jul 2016 21:10:49 -0000

From: "Edward A. James" <eajames@us.ibm.com>

issue # 202

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 netman.py | 69 +++++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/netman.py b/netman.py
index 90cb022..c75675f 100755
--- a/netman.py
+++ b/netman.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python
 
 from subprocess import call, Popen, PIPE
+from IPy import IP
 import sys
 import subprocess
 import dbus
@@ -82,29 +83,45 @@ class NetMan (dbus.service.Object):
         if re.compile(macre).search(mac) : return True
         else: return False
 
-    def _isvalidip(self, family, ipaddr):
-        if family == socket.AF_INET:
-            try:
-                socket.inet_pton(socket.AF_INET, ipaddr)
-            except AttributeError:  # no inet_pton here, sorry
-                try:
-                    socket.inet_aton(ipaddr)
-                except socket.error:
-                    return False
-                return ipaddr.count('.') == 3
-            except socket.error:  # not a valid address
-                return False
-
-            return True
-
-        elif family == socket.AF_INET6:
-            try:
-                socket.inet_pton(socket.AF_INET6, ipaddr)
-            except socket.error:  # not a valid address
-                return False
-            return True
-
-        else: return False
+    def _isvalidip(self, ipaddr, netmask = '0'):
+	try:
+	    ip = IP(ipaddr)
+	except ValueError:
+	    return False
+
+	ipstr = ip.strNormal(0)
+
+	if ip.version() == 4:	# no special considerations for ipv6 now
+	    ip_parts = ipstr.split(".")
+	    if len(ip_parts) != 4:
+		return False
+
+	    first, second, third, fourth = [int(part) for part in ip_parts]
+	    if first == 0 and second == 0 and third == 0 and fourth == 0:
+		return False 	# "this" network disallowed
+	    if first >= 224:
+		return False	# class D multicast and class E disallowed
+	    if first == 192 and second == 88 and third == 99:
+		return False	# ipv6 relay
+	    if fourth == 0 or fourth == 255:	# possibly invalid, check mask
+		ipstr_masked = ip.strNormal(1)
+		if ipstr_masked.count("/") == 0:
+		    if netmask == '0':
+			return True	# no netmask available
+
+		    try:
+			maskedip = IP(ipaddr + "/" + netmask, make_net=True)
+		    except:
+			return False	# must be bad netmask
+
+		    ipstr_masked = maskedip.strNormal(1)
+
+		parts = ipstr_masked.split("/")
+		mask_bin = int(parts[1])
+		if mask_bin >= 24:
+		    return False	# no .0 or .255 is valid
+
+	return True
 
     def _getAddr (self, target, device):
         netprov     = network_providers [self.provider]
@@ -165,8 +182,8 @@ class NetMan (dbus.service.Object):
     @dbus.service.method(DBUS_NAME, "ssss", "x")
     def SetAddress4 (self, device, ipaddr, netmask, gateway):
         if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
-        if not self._isvalidip (socket.AF_INET, ipaddr) : raise ValueError, "Malformed IP Address"
-        if not self._isvalidip (socket.AF_INET, gateway) : raise ValueError, "Malformed GW Address"
+        if not self._isvalidip (ipaddr, netmask) : raise ValueError, "Malformed IP Address"
+        if not self._isvalidip (gateway) : raise ValueError, "Malformed GW Address"
         if not self._isvalidmask (netmask) : raise ValueError, "Invalid Mask"
 
         prefixLen = getPrefixLen (netmask)
@@ -254,7 +271,7 @@ class NetMan (dbus.service.Object):
         file_opened = False
         if len(dns_entry) > 0:
             for dns in dns_entry:
-                if not self._isvalidip (socket.AF_INET, dns):
+                if not self._isvalidip (dns):
                     if dns == "DHCP_AUTO=":
                         #This DNS is supplied by DHCP.
                         dhcp_auto = True
-- 
2.9.0
