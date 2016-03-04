Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8BE1A1A045D
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 20:50:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457085045057150.64855049273172;
 Fri, 4 Mar 2016 01:50:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v5] skeleton: fixed hard-coding of master OCC hwmon
 sysfs path for PowerCap object
Date: Fri,  4 Mar 2016 03:50:43 -0600
Message-Id: <1457085043-32380-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457085043-32380-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457085043-32380-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 04 Mar 2016 09:50:50 -0000

From: Yi Li <adamliyi@msn.com>

Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/hwmon3/'.
This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work when
master OCC is initilized as hwmon device other than 'hwmon3'.

'usr_powercap' attribute should be searched when OCC is active.
When skeleton creates 'PowerCap' objects, OCC may not be active.
So do the search each time setting power cap. Raise an exception when
there is no 'user_powercap' attribute.
Fixes: openbmc/skeleton#42

Also raise an exception when setting power cap fails. The exception
will be returned to REST API caller. Need to specify the exception
name to trigger a '400' return code.
Fixes: openbmc/skeleton#43

Add code to validate input user powercap value.

Changed the logic of "reading powercap" using PowerCap.getValue().
Previously PowerCap.getValue() returns current user set powercap value.
Now PowerCap.getValue() returns actual system powercap reading from OCC.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Sensors.py         | 84 ++++++++++++++++++++++++++++++++++++++++++++------
 bin/sensor_manager2.py |  3 --
 2 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index f951eeb..6f5bc33 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -1,13 +1,13 @@
 #!/usr/bin/python -u
 
 import sys
-import subprocess
 #from gi.repository import GObject
 import gobject
 import dbus
 import dbus.service
 import dbus.mainloop.glib
 import os
+import glob
 import Openbmc
 
 ## Abstract class, must subclass
@@ -137,21 +137,87 @@ class PowerCap(VirtualSensor):
 	def __init__(self, bus, name):
 		VirtualSensor.__init__(self, bus, name)
 		SensorValue.setValue(self, 0)
-		self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
 	##override setValue method
 	@dbus.service.method(SensorValue.IFACE_NAME,
 		in_signature='v', out_signature='')
 	def setValue(self, value):
 		try:
-			cmd_str = "echo "+str(value)+" > "+self.sysfs_attr
-			ret = subprocess.check_output(cmd_str, shell=True)
-		except subprocess.CalledProcessError as powerexc:
-			print "Set PowerCap Error", powerexc.returncode,
-			powerexc.output
-			return
+			value = int(value)
+		except ValueError:
+			raise dbus.exceptions.DBusException(
+				"Set an integer value",
+				name='org.freedesktop.DBus.Python.TypeError')
+
+		# master occ hwmon path is created dymanically
+		# when occ is active scan hwmon sysfs directory for update
+		for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
+			occ_i2c_dev = os.path.dirname(pcap_file)+'/device'
+			occ_i2c_dev = os.path.realpath(
+					occ_i2c_dev).split('/').pop()
+			if occ_i2c_dev == '3-0050':
+				setcap_file = pcap_file
+				break
+		else:
+			raise dbus.exceptions.DBusException(
+				"Cannot find user_powercap hwmon attribute, "+
+				"check occ status.",
+				name='org.freedesktop.DBus.Python.TypeError')
+
+		# verify the user set value is in the range [min_cap, max_cap]
+		try:
+			caps_file = open(os.path.dirname(setcap_file) +
+					'/caps_min_powercap', 'r')
+			min_cap = caps_file.readline()
+			caps_file = open(os.path.dirname(setcap_file) +
+					'/caps_max_powercap', 'r')
+			max_cap = caps_file.readline()
+		except IOError:
+			raise dbus.exceptions.DBusException(
+				"Cannot get caps_min or caps_max",
+				name='org.freedesktop.DBus.Error.InvalidArgs')
+
+		if value != 0 and (value < int(min_cap)
+				or value > int(max_cap)):
+			raise dbus.exceptions.DBusException(
+				"Set a value in the range [%d, %d]"
+				% (int(min_cap), int(max_cap)),
+				name='org.freedesktop.DBus.Error.InvalidArgs')
+
+		try:
+			open(setcap_file, 'w').write(str(value));
+		except IOError:
+			raise dbus.exceptions.DBusException(
+				"Cannot set PowerCap",
+				name='org.freedesktop.DBus.Python.TypeError')
 		print "Set PowerCap: ", value
 		SensorValue.setValue(self, value)
-		
+	@dbus.service.method(SensorValue.IFACE_NAME,
+		in_signature='', out_signature='v')
+	def getValue(self):
+		# Read current powercap sensor. OCC will set system powercap
+		# based on its algorithm
+		for pcap_file in glob.glob(
+				'/sys/class/hwmon/*/caps_curr_powercap'):
+			occ_i2c_dev = os.path.dirname(pcap_file)+'/device'
+			occ_i2c_dev = os.path.realpath(
+					occ_i2c_dev).split('/').pop()
+			if occ_i2c_dev == '3-0050':
+				curr_cap_file = pcap_file
+				break
+		else:
+			raise dbus.exceptions.DBusException(
+				"Cannot find caps_curr_powercap" +
+				"hwmon attribute, " + "check occ status.",
+				name='org.freedesktop.DBus.Python.TypeError')
+
+		try:
+			cap_val = open(curr_cap_file, 'r').read()
+		except IOError:
+			raise dbus.exceptions.DBusException(
+				"Cannot read current powercap",
+				name='org.freedesktop.DBus.Python.TypeError')
+		return cap_val
+
 class BootProgressSensor(VirtualSensor):
 	def __init__(self,bus,name):
 		VirtualSensor.__init__(self,bus,name)
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
