Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8C4821A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 23:10:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456488646744937.6776353954115;
 Fri, 26 Feb 2016 04:10:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3] skeleton: fixed hard-coding of master OCC hwmon
 sysfs path for PowerCap object
Date: Fri, 26 Feb 2016 06:10:45 -0600
Message-Id: <1456488645-11725-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456488645-11725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456488645-11725-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 26 Feb 2016 12:10:51 -0000

From: Yi Li <adamliyi@msn.com>

Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/hwmon3/'.
This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work when
master OCC is initilized as hwmon device other than 'hwmon3'.

'usr_powercap' attribute should be searched when OCC is active.
When skeleton creates 'PowerCap' objects, OCC may not be active.
So do the search each time setting power cap. Raise an exception when
there is no 'user_powercap' attribute.

This would fix the issue: https://github.com/openbmc/skeleton/issues/42

Also raise an exception when setting power cap fails. The exception
will be returned to REST API caller. Need to specify the exception
name to trigger a '400' return code.
This would fix the issue:
https://github.com/openbmc/skeleton/issues/43

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Sensors.py         | 23 +++++++++++++++++++----
 bin/sensor_manager2.py |  3 ---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index f951eeb..a337a4c 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -8,6 +8,7 @@ import dbus
 import dbus.service
 import dbus.mainloop.glib
 import os
+import glob
 import Openbmc
 
 ## Abstract class, must subclass
@@ -137,17 +138,31 @@ class PowerCap(VirtualSensor):
 	def __init__(self, bus, name):
 		VirtualSensor.__init__(self, bus, name)
 		SensorValue.setValue(self, 0)
-		self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
 	##override setValue method
 	@dbus.service.method(SensorValue.IFACE_NAME,
 		in_signature='v', out_signature='')
 	def setValue(self, value):
+		# master occ hwmon path is created dymanically when occ is active
+		# scan hwmon sysfs directory for update
+		for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
+			occ_i2c_dev = os.path.dirname(pcap_file)+'/device'
+			occ_i2c_dev = os.path.realpath(occ_i2c_dev).split('/').pop()
+			if occ_i2c_dev == '3-0050':
+				self.sysfs_attr = pcap_file
+				break
+		else:
+			raise dbus.exceptions.DBusException(
+				"Cannot find user_powercap hwmon attribute, "+
+				"check occ status.",
+				name='org.freedesktop.DBus.Python.TypeError')
+			return
 		try:
-			cmd_str = "echo "+str(value)+" > "+self.sysfs_attr
+			cmd_str = 'echo '+str(value)+' > '+self.sysfs_attr
 			ret = subprocess.check_output(cmd_str, shell=True)
 		except subprocess.CalledProcessError as powerexc:
-			print "Set PowerCap Error", powerexc.returncode,
-			powerexc.output
+			raise dbus.exceptions.DBusException(
+				"Set PowerCap error: check value range",
+				name='org.freedesktop.DBus.Error.InvalidArgs')
 			return
 		print "Set PowerCap: ", value
 		SensorValue.setValue(self, value)
diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index b5aac53..926bfea 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -54,9 +54,6 @@ if __name__ == '__main__':
 
 	obj_path = OBJ_PATH+"/host/PowerCap"
 	sensor_obj = Sensors.PowerCap(bus,obj_path)
-	## hwmon3 is default for master OCC on Barreleye.
-	## should rewrite sensor_manager to remove hardcode
-	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
 	root_sensor.add(obj_path,sensor_obj)
 
 	obj_path = OBJ_PATH+"/host/BootProgress"
-- 
2.7.1
