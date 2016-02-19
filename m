Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E6D761A0791
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2016 06:11:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455909060450107.5473586251984;
 Fri, 19 Feb 2016 11:11:00 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: fixed hard-coding for master OCC hwmon
 sysfs path
Date: Fri, 19 Feb 2016 13:10:58 -0600
Message-Id: <1455909058-21748-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455909058-21748-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909058-21748-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 19 Feb 2016 19:11:04 -0000

From: Yi Li <adamliyi@msn.com>

Currently master OCC hwmon sysfs path is hardcoded to '/sys/class/hwmon/hwmon3/'.
This make the '/org/openbmc/sensors/host/PowerCap' interface cannot work when
master OCC is initilized as hwmon device other than 'hwmon3'.

This would fix the issue: https://github.com/openbmc/skeleton/issues/42

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/sensor_manager2.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
index b5aac53..4fc9dc2 100755
--- a/bin/sensor_manager2.py
+++ b/bin/sensor_manager2.py
@@ -2,6 +2,7 @@
 
 import sys
 import os
+import glob
 import gobject
 import dbus
 import dbus.service
@@ -54,9 +55,13 @@ if __name__ == '__main__':
 
 	obj_path = OBJ_PATH+"/host/PowerCap"
 	sensor_obj = Sensors.PowerCap(bus,obj_path)
-	## hwmon3 is default for master OCC on Barreleye.
-	## should rewrite sensor_manager to remove hardcode
-	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+	## scan hwmon sysfs for master occ's user_powercap attribute
+	for pcap_file in glob.glob('/sys/class/hwmon/*/user_powercap'):
+		occ_i2c_dev = os.path.dirname(pcap_file)+'/device'
+		occ_i2c_dev = os.path.realpath(occ_i2c_dev).split('/').pop()
+		# master OCC address
+		if occ_i2c_dev == '3-0050':
+			sensor_obj.sysfs_attr = pcap_file
 	root_sensor.add(obj_path,sensor_obj)
 
 	obj_path = OBJ_PATH+"/host/BootProgress"
-- 
2.7.1
