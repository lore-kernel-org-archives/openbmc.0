Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3pJl4bWMzDqCH
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 15:51:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462859460202214.37975050458533;
 Mon, 9 May 2016 22:51:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v9 10/23] Modify the hard-coded hwmon ID for PowerCap
Date: Tue, 10 May 2016 00:50:36 -0500
Message-Id: <1462859449-5466-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 05:51:04 -0000

From: johnhcwang <hsienchiang@gmail.com>

After we enable I2C-6 lm75 outlet sensor in device stree, the hwmon ID
of PowerCap won't be 3 anymore. So we have to modify it as real ID.
---
 bin/Sensors.py         | 2 +-
 bin/sensor_manager2.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index f951eeb..1c6a961 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -137,7 +137,7 @@ class PowerCap(VirtualSensor):
 	def __init__(self, bus, name):
 		VirtualSensor.__init__(self, bus, name)
 		SensorValue.setValue(self, 0)
-		self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+		self.sysfs_attr = "/sys/class/hwmon/hwmon4/user_powercap"
 	##override setValue method
 	@dbus.service.method(SensorValue.IFACE_NAME,
 		in_signature='v', out_signature='')
diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index b5aac53..6aaef3e 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -54,9 +54,9 @@ if __name__ == '__main__':
 
 	obj_path = OBJ_PATH+"/host/PowerCap"
 	sensor_obj = Sensors.PowerCap(bus,obj_path)
-	## hwmon3 is default for master OCC on Barreleye.
+	## hwmon4 is default for master OCC on Barreleye.
 	## should rewrite sensor_manager to remove hardcode
-	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon4/user_powercap"
 	root_sensor.add(obj_path,sensor_obj)
 
 	obj_path = OBJ_PATH+"/host/BootProgress"
-- 
2.8.1
