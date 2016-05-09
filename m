Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3FFR6NjBzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 18:01:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146278087074576.41014370465814;
 Mon, 9 May 2016 01:01:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2] [skeleton]: Fix hard-coded path name when
 creating sensor object
Date: Mon,  9 May 2016 03:01:07 -0500
Message-Id: <1462780867-13772-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462780867-13772-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462780867-13772-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 08:01:16 -0000

From: Yi Li <adamliyi@msn.com>

This patch fixes skeleton issue: https://github.com/openbmc/skeleton/issues/33
The non-poll sensors have system specific properties. Define the sensor properties
in System files, and generate sensor object dynamically.
---
 bin/Barreleye.py       | 13 +++++++++++++
 bin/Firestone.py       | 15 +++++++++++++++
 bin/Garrison.py        | 14 ++++++++++++++
 bin/Palmetto.py        | 12 ++++++++++++
 bin/sensor_manager2.py | 35 +++++++++--------------------------
 5 files changed, 63 insertions(+), 26 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 0cf55a1..401f6f2 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -718,3 +718,16 @@ HWMON_CONFIG = {
 	},
 }
 
+# Miscellaneous non-poll sensor with system specific properties.
+# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
+MISC_SENSORS = {
+	0x09 : { 'class' : 'BootCountSensor' },
+	0x05 : { 'class' : 'BootProgressSensor' },
+	0x08 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+	0x0A : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
+	0x32 : { 'class' : 'OperatingSystemStatusSensor' },
+	0x33 : { 'class' : 'PowerCap',
+		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
+}
diff --git a/bin/Firestone.py b/bin/Firestone.py
index 91a6099..2cadf40 100755
--- a/bin/Firestone.py
+++ b/bin/Firestone.py
@@ -608,3 +608,18 @@ HWMON_CONFIG = {
         }
     },
 }
+
+
+# Miscellaneous non-poll sensor with system specific properties.
+# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
+MISC_SENSORS = {
+	0x5f : { 'class' : 'BootCountSensor' },
+	0x05 : { 'class' : 'BootProgressSensor' },
+	0x08 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+	0x09 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
+	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
+	0xb3 : { 'class' : 'PowerCap',
+		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
+}
diff --git a/bin/Garrison.py b/bin/Garrison.py
index 5564162..3f09836 100755
--- a/bin/Garrison.py
+++ b/bin/Garrison.py
@@ -608,3 +608,17 @@ HWMON_CONFIG = {
         }
     },
 }
+
+# Miscellaneous non-poll sensor with system specific properties.
+# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
+MISC_SENSORS = {
+	0x5f : { 'class' : 'BootCountSensor' },
+	0x05 : { 'class' : 'BootProgressSensor' },
+	0x08 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+	0x09 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
+	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
+	0xb3 : { 'class' : 'PowerCap',
+		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
+}
diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 09fbe06..4c23068 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -306,3 +306,15 @@ HWMON_CONFIG = {
 		}
 	}
 }
+
+# Miscellaneous non-poll sensor with system specific properties.
+# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
+MISC_SENSORS = {
+	0x09 : { 'class' : 'BootCountSensor' },
+	0x05 : { 'class' : 'BootProgressSensor' },
+	0x08 : { 'class' : 'OccStatusSensor',
+		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+	0x32 : { 'class' : 'OperatingSystemStatusSensor' },
+	0x33 : { 'class' : 'PowerCap',
+		'os_path' : '/sys/class/hwmon/hwmon1/user_powercap' },
+}
diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index b5aac53..619e8e5 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -9,6 +9,8 @@ import dbus.mainloop.glib
 import Openbmc
 import Sensors
 
+System = __import__(sys.argv[1])
+
 DBUS_NAME = 'org.openbmc.Sensors'
 OBJ_PATH = '/org/openbmc/sensors'
 
@@ -50,32 +52,13 @@ if __name__ == '__main__':
 
 	## instantiate non-polling sensors
 	## these don't need to be in seperate process
-	## TODO: this should not be hardcoded
-
-	obj_path = OBJ_PATH+"/host/PowerCap"
-	sensor_obj = Sensors.PowerCap(bus,obj_path)
-	## hwmon3 is default for master OCC on Barreleye.
-	## should rewrite sensor_manager to remove hardcode
-	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
-	root_sensor.add(obj_path,sensor_obj)
-
-	obj_path = OBJ_PATH+"/host/BootProgress"
-	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
-
-	obj_path = OBJ_PATH+"/host/cpu0/OccStatus"
-	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
-	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
-	root_sensor.add(obj_path,sensor_obj)
-
-	obj_path = OBJ_PATH+"/host/cpu1/OccStatus"
-	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
-	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0051/online"
-	root_sensor.add(obj_path,sensor_obj)
-
-	obj_path = OBJ_PATH+"/host/BootCount"
-	root_sensor.add(obj_path,Sensors.BootCountSensor(bus,obj_path))
-	obj_path = OBJ_PATH+"/host/OperatingSystemStatus"
-	root_sensor.add(obj_path,Sensors.OperatingSystemStatusSensor(bus,obj_path))
+	for (id, the_sensor) in System.MISC_SENSORS.items():
+		sensor_class = the_sensor['class']
+		obj_path = System.ID_LOOKUP['SENSOR'][id]
+		sensor_obj = getattr(Sensors, sensor_class)(bus, obj_path)
+		if 'os_path' in the_sensor:
+			sensor_obj.sysfs_attr = the_sensor['os_path']
+		root_sensor.add(obj_path, sensor_obj)
 
 	mainloop = gobject.MainLoop()
 	print "Starting sensor manager"
-- 
2.8.1
