Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EFDBB1A03CB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:23:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144539782589329.26202374574723;
 Tue, 20 Oct 2015 20:23:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add UUID support
Date: Tue, 20 Oct 2015 22:23:43 -0500
Message-Id: <1445397823-31569-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445397823-31569-1-git-send-email-patches@stwcx.xyz>
References: <1445397823-31569-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:23:49 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 bin/chassis_control.py | 9 ++++++++-
 bin/ipmi_example.py    | 4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 6283aca..289c6ad 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python
 
 import sys
+import uuid
 #from gi.repository import GObject
 import gobject
 import dbus
@@ -39,6 +40,9 @@ class ChassisControlObject(dbus.service.Object):
 		self.reboot = 0	
 		self.last_power_state = 0
 
+		#uuid
+		self.id = 0
+
 		bus.add_signal_receiver(self.power_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "ButtonPressed", 
 					path="/org/openbmc/buttons/PowerButton_0" )
@@ -55,7 +59,10 @@ class ChassisControlObject(dbus.service.Object):
 	@dbus.service.method(DBUS_NAME,
 		in_signature='', out_signature='s')
 	def getID(self):
-		return id
+		if (self.id==0):
+			#calculate uuuid
+			self.id = uuid.uuid1()
+		return str(self.id)
 
 	@dbus.service.method(DBUS_NAME,
 		in_signature='', out_signature='')
diff --git a/bin/ipmi_example.py b/bin/ipmi_example.py
index 589c0ca..ba13b60 100755
--- a/bin/ipmi_example.py
+++ b/bin/ipmi_example.py
@@ -58,6 +58,10 @@ if __name__ == '__main__':
 	elif (cmd == "poweroff"):
 		intf = getChassisControl()
 		intf.powerOff()
+	elif (cmd == "getid"):
+		intf = getChassisControl()
+		id = intf.getID()
+		print id
 	elif (cmd == "setsensor"):
 		intf_sys = Openbmc.getManagerInterface(bus,"System")
 		obj_info = intf_sys.getObjectFromByteId("SENSOR",chr(int(ipmi_id)))
-- 
2.6.0
