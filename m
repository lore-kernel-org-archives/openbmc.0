Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1558C1A0D12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 00:40:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453210838607856.5201788075693;
 Tue, 19 Jan 2016 05:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Rewrite setValue() method for Dbus object
 /org/openbmc/sensors/host/PowerCap
Date: Tue, 19 Jan 2016 07:40:36 -0600
Message-Id: <1453210836-15319-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453210836-15319-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453210836-15319-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Jan 2016 13:40:45 -0000

From: Yi Li <adamliyi@msn.com>

obmc uses dbus interface 'org.openbmc.SensorValue' of the object
'/org/openbmc/sensors/host/PowerCap' to set Host PowerCap.
Rewrite the setValue() method to set PowerCap via the
"/sys/class/hwmon/hwmonX/user_powercap" OCC-HWMON sysfs attribute.
BMC will sends a "Set User PowerCap" command to OCC.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Sensors.py         | 22 ++++++++++++++++++----
 bin/sensor_manager2.py |  7 ++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index 81a593a..d31f513 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -1,6 +1,7 @@
 #!/usr/bin/python -u
 
 import sys
+import subprocess
 #from gi.repository import GObject
 import gobject
 import dbus
@@ -133,10 +134,23 @@ class HwmonSensor(SensorValue,SensorThresholds):
 		
 CONTROL_IFACE = 'org.openbmc.Control'
 class PowerCap(VirtualSensor):
-	def __init__(self,bus,name):
-		VirtualSensor.__init__(self,bus,name)
-		self.setValue(100)
-
+	def __init__(self, bus, name):
+		VirtualSensor.__init__(self, bus, name)
+		SensorValue.setValue(self, 0)
+		self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+	##override setValue method
+	@dbus.service.method(SensorValue.IFACE_NAME,
+		in_signature='v', out_signature='')
+	def setValue(self, value):
+		try:
+			cmd_str = "echo "+str(value)+" > "+self.sysfs_attr
+			ret = subprocess.check_output(cmd_str, shell=True)
+		except subprocess.CalledProcessError as powerexc:
+			print "Set PowerCap Error", powerexc.returncode,
+			powerexc.output
+			return
+		print "Set PowerCap: ", value
+		SensorValue.setValue(self, value)
 		
 class BootProgressSensor(VirtualSensor):
 	def __init__(self,bus,name):
diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index 5964263..c924a75 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -53,7 +53,12 @@ if __name__ == '__main__':
 	## TODO: this should not be hardcoded
 
 	obj_path = OBJ_PATH+"/host/PowerCap"
-	root_sensor.add(obj_path,Sensors.PowerCap(bus,obj_path))
+	sensor_obj = Sensors.PowerCap(bus,obj_path)
+	## hwmon3 is default for master OCC on Barreleye.
+	## should rewrite sensor_manager to remove hardcode
+	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+	root_sensor.add(obj_path,sensor_obj)
+
 	obj_path = OBJ_PATH+"/host/BootProgress"
 	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
 	obj_path = OBJ_PATH+"/host/OccStatus"
-- 
2.6.4
