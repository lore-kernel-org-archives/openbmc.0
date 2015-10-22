Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C5E0F1A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:21 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536818074444.08311618422545;
 Thu, 22 Oct 2015 11:00:18 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Start watchdog with 30s timeout on poweron
Date: Thu, 22 Oct 2015 13:00:15 -0500
Message-Id: <1445536815-14833-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536815-14833-1-git-send-email-patches@stwcx.xyz>
References: <1445536815-14833-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:22 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Per the OpenPower Host IPMI Spec, start the watchdog from the BMC
with a 30s timeout at power on. Once the host starts booting, it
will reset it and refresh it.
---
 bin/chassis_control.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 289c6ad..683c1da 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -18,6 +18,12 @@ POWER_ON = 1
 
 BOOTED = 100
 
+def getWatchdog():
+    obj =  bus.get_object('org.openbmc.watchdog.Host',
+            '/org/openbmc/watchdog/HostWatchdog_0')
+    intf = dbus.Interface(obj, 'org.openbmc.Watchdog' )
+    return intf
+
 class ChassisControlObject(dbus.service.Object):
 	def __init__(self,bus,name):
 		self.dbus_objects = { }
@@ -88,6 +94,11 @@ class ChassisControlObject(dbus.service.Object):
 		if (self.getPowerState()==0):
 			intf = self.getInterface('power_control')
 			intf.setPowerState(POWER_ON)
+			intfwatchdog = getWatchdog()
+			#Start watchdog with 30s timeout per the OpenPower Host IPMI Spec
+			#Once the host starts booting, it'll reset and refresh the timer
+			intfwatchdog.set(30000)
+			intfwatchdog.start()
 		return None
 
 	@dbus.service.method(DBUS_NAME,
-- 
2.6.0
