Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD9F61A0163
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 22:50:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452772240401444.7241445602069;
 Thu, 14 Jan 2016 03:50:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v3 3/4] Remove reboot function in power button,
 reboot is in reset button.
Date: Thu, 14 Jan 2016 05:50:36 -0600
Message-Id: <1452772237-6542-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452772237-6542-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452772237-6542-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 11:50:47 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/chassis_control.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 27e9152..0a0b44d 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -57,9 +57,6 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		bus.add_signal_receiver(self.power_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
 					path="/org/openbmc/buttons/power0" )
-		bus.add_signal_receiver(self.reset_button_signal_handler, 
-					dbus_interface = "org.openbmc.Button", signal_name = "PressedLong", 
-					path="/org/openbmc/buttons/power0" )
 		bus.add_signal_receiver(self.softreset_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
 					path="/org/openbmc/buttons/reset0" )
@@ -184,7 +181,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		self.reboot();
 
 	def softreset_button_signal_handler(self):
-		self.softReboot();
+		self.reboot();
 		
 	def host_watchdog_signal_handler(self):
 		print "Watchdog Error, Hard Rebooting"
-- 
2.6.4
