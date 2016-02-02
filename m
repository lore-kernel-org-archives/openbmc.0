Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 77DDF1A007F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 11:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454374229493892.1440189344647;
 Mon, 1 Feb 2016 16:50:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] Enable DHCP
Date: Mon,  1 Feb 2016 18:50:28 -0600
Message-Id: <1454374228-5742-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454374228-5742-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454374228-5742-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 00:50:36 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Enable DHCP when network service starts by creating an 80-dhcp.network
file. Only setup if file doesn't exist already, this allows for a one
time setup.
---
 netman.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/netman.py b/netman.py
index c63921f..8ddeb93 100755
--- a/netman.py
+++ b/netman.py
@@ -51,6 +51,15 @@ class NetMan (dbus.service.Object):
         self.name = name
         dbus.service.Object.__init__(self,bus,name)
 
+        #Setup DHCP
+        dhcpfile = "/etc/systemd/network/80-dhcp.network"
+        if (not os.path.isfile(dhcpfile)):
+            with open(dhcpfile, 'w') as f:
+                f.write('[Match]' + '\n')
+                f.write('Name=eth0' + '\n')
+                f.write('[Network]' + '\n')
+                f.write('DHCP=yes' + '\n')
+
     def setNetworkProvider(self, provider):
         self.provider = provider
 
-- 
2.6.4
