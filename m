Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B87611A0FCD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 17:00:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453269641606953.0998580299851;
 Tue, 19 Jan 2016 22:00:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Update setValue() method dbus object
 '/org/openbmc/sensors/host/OccStatus'
Date: Wed, 20 Jan 2016 00:00:40 -0600
Message-Id: <1453269640-25140-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453269640-25140-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453269640-25140-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 06:00:47 -0000

From: Yi Li <adamliyi@msn.com>

In recent occ_i2c driver, a new hwmon sysfs attribte
'/sys/class/i2c-adapter/i2c-X/X-0050/online' has been used to
instantiate occ_i2c device. Update the 'OccStatus' dbus object
to use the new interface.
Do not use '/sys/class/i2c-adapter/i2c-X/new_device' anymore.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Sensors.py         | 11 ++++-------
 bin/sensor_manager2.py |  6 +++++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index 81a593a..d31eed3 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -163,6 +163,8 @@ class BootProgressSensor(VirtualSensor):
 		
 class OccStatusSensor(VirtualSensor):
 	def __init__(self,bus,name):
+		## default path. can be override
+		self.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
 		VirtualSensor.__init__(self,bus,name)
 		self.setValue("Disabled")
 		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
@@ -170,7 +172,6 @@ class OccStatusSensor(VirtualSensor):
 	def SystemStateHandler(self,state):
 		if (state == "HOST_POWERED_OFF"):
 			self.setValue("Disabled")
-			
 
 	##override setValue method
 	@dbus.service.method(SensorValue.IFACE_NAME,
@@ -178,14 +179,10 @@ class OccStatusSensor(VirtualSensor):
 	def setValue(self,value):
 		if (value == "Enabled"):
 			print "Installing OCC device"
-			os.system("echo occ-i2c 0x50 >  /sys/bus/i2c/devices/i2c-3/new_device")
-			os.system("echo occ-i2c 0x51 >  /sys/bus/i2c/devices/i2c-3/new_device")
+			os.system("echo 1 > " +  self.sysfs_attr)
 		else:
 			print "Deleting OCC device"
-			os.system("echo 0x50 >  /sys/bus/i2c/devices/i2c-3/delete_device")
-			os.system("echo 0x51 >  /sys/bus/i2c/devices/i2c-3/delete_device")
-
-
+			os.system("echo 0 > " +  self.sysfs_attr)
 		SensorValue.setValue(self,value)
 			
 	@dbus.service.signal(CONTROL_IFACE,signature='s')
diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index 5964263..ca5c2c8 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -56,8 +56,12 @@ if __name__ == '__main__':
 	root_sensor.add(obj_path,Sensors.PowerCap(bus,obj_path))
 	obj_path = OBJ_PATH+"/host/BootProgress"
 	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
+
 	obj_path = OBJ_PATH+"/host/OccStatus"
-	root_sensor.add(obj_path,Sensors.OccStatusSensor(bus,obj_path))
+	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
+	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
+	root_sensor.add(obj_path,sensor_obj)
+
 	obj_path = OBJ_PATH+"/host/BootCount"
 	root_sensor.add(obj_path,Sensors.BootCountSensor(bus,obj_path))
 	obj_path = OBJ_PATH+"/host/OperatingSystemStatus"
-- 
2.6.4
