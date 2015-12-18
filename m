Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6C5721A1A2B
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482042277530.0445463514812;
 Fri, 18 Dec 2015 15:40:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 09/15] add introspect=False to get_object calls for
 performance
Date: Fri, 18 Dec 2015 17:40:29 -0600
Message-Id: <1450482035-4530-10-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:47 -0000
X-List-Received-Date: Fri, 18 Dec 2015 23:40:47 -0000

From: Norman James <njames@us.ibm.com>

---
 bin/chassis_control.py | 2 +-
 bin/fan_control.py     | 2 +-
 bin/obmcutil           | 2 +-
 bin/system_manager.py  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index aa656fd..8ae0f55 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -69,7 +69,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 
 	def getInterface(self,name):
 		o = self.dbus_objects[name]
-		obj = bus.get_object(o['bus_name'],o['object_name'])
+		obj = bus.get_object(o['bus_name'],o['object_name'],introspect=False)
 		return dbus.Interface(obj,o['interface_name'])
 
 
diff --git a/bin/fan_control.py b/bin/fan_control.py
index 1a528fd..bb070e5 100755
--- a/bin/fan_control.py
+++ b/bin/fan_control.py
@@ -34,7 +34,7 @@ class FanControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		## create interface proxies to all fans
 		for fan in FAN_OBJS:
 			print "Initializing fan: "+fan
-			obj = bus.get_object(FAN_BUS,fan)
+			obj = bus.get_object(FAN_BUS,fan,introspect=False)
 			self.fan_intf.append(dbus.Interface(obj,FAN_IFACE))
 		self.InterfacesAdded(name,self.properties)
 			
diff --git a/bin/obmcutil b/bin/obmcutil
index e63fa27..55b5e2d 100755
--- a/bin/obmcutil
+++ b/bin/obmcutil
@@ -175,7 +175,7 @@ elif (len(sys.argv)>0):
 bus_name = objinfo['bus_name']
 obj_path = objinfo['object_name']
 intf_name = objinfo['interface_name']
-obj = bus.get_object(bus_name,obj_path)
+obj = bus.get_object(bus_name,obj_path,introspect=False)
 
 if (method_name != ""):
 	methd = obj.get_dbus_method(method_name,intf_name)
diff --git a/bin/system_manager.py b/bin/system_manager.py
index 63e2319..004d978 100755
--- a/bin/system_manager.py
+++ b/bin/system_manager.py
@@ -86,7 +86,7 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		try:	
 			cb = System.ENTER_STATE_CALLBACK[state_name]
 			for methd in cb.keys():
-				obj = bus.get_object(cb[methd]['bus_name'],cb[methd]['obj_name'])
+				obj = bus.get_object(cb[methd]['bus_name'],cb[methd]['obj_name'],introspect=False)
 				method = obj.get_dbus_method(methd,cb[methd]['interface_name'])
 				method()
 		except:
-- 
2.6.3
