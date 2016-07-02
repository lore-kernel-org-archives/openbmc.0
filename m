Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rhbYn4gXVzDqhC
 for <openbmc@lists.ozlabs.org>; Sun,  3 Jul 2016 00:41:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467470454727644.5505150228216;
 Sat, 2 Jul 2016 07:40:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: chassis_control - Add an ESEL when
 emergency shutdown host
Date: Sat,  2 Jul 2016 09:40:52 -0500
Message-Id: <20160702144052.9068-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160702144052.9068-1-openbmc-patches@stwcx.xyz>
References: <20160702144052.9068-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 02 Jul 2016 14:41:02 -0000

From: Yi Li <adamliyi@msn.com>

This patch fixes issue: https://github.com/openbmc/skeleton/issues/64
According to BMC Firmware Specification, on occasion the BMC will be required
to shut down the host due to high ambient or fan fails. A SEL must be
present in this case.

Signed-off-by: Yi Li <adamliyi@msn.com>

Change-Id: I65ea7e3284eab3e10e14604306f6d8e23f77d57e
---
 pychassisctl/chassis_control.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/pychassisctl/chassis_control.py b/pychassisctl/chassis_control.py
index 56a2116..94fac78 100755
--- a/pychassisctl/chassis_control.py
+++ b/pychassisctl/chassis_control.py
@@ -232,6 +232,18 @@ class ChassisControlObject(DbusProperties, DbusObjectManager):
 
     def emergency_shutdown_signal_handler(self):
         print "Emergency Shutdown!"
+        # log an esel
+        try:
+            obj = bus.get_object("org.openbmc.records.events",
+                                 "/org/openbmc/records/events", introspect=False)
+            intf = dbus.Interface(obj, "org.openbmc.recordlog")
+            desc = message
+            sev = "critical error"
+            details = "Get emergency shutdown signal. Shutdown the host."
+            debug = dbus.ByteArray("")
+            intf.acceptBMCMessage(desc, sev, details, debug)
+        except:
+            print "Emergency shutdown: log esel error."
         self.powerOff()
 
 
-- 
2.9.0
