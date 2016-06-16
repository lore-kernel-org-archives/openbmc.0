Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVRty3WXWzDqdx
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 12:20:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14660436358141023.3071581564111;
 Wed, 15 Jun 2016 19:20:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Fix Garrison/Firestone build breaks
Date: Wed, 15 Jun 2016 21:20:33 -0500
Message-Id: <20160616022033.22873-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616022033.22873-1-openbmc-patches@stwcx.xyz>
References: <20160616022033.22873-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 02:20:43 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A number of skeleton patches no longer applied due to 40a360c
and 54decc8.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   3 +-
 ...r-control-support-for-the-Garrison-system.patch |   1 +
 .../skeleton/skeleton/occ-path.patch               |   1 -
 .../skeleton/skeleton/poweron.patch                |   1 -
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   3 +-
 ...r-control-support-for-the-Garrison-system.patch | 128 +++++++++++++++++++++
 .../skeleton/skeleton/occ-path.patch               |  20 ----
 .../skeleton/skeleton/poweron.patch                | 113 ------------------
 8 files changed, 131 insertions(+), 139 deletions(-)
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
 delete mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
 delete mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
index 6c14b22..bfac343 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
@@ -1,3 +1,2 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
-SRC_URI += "file://poweron.patch"
-SRC_URI += "file://occ-path.patch"
+SRC_URI += "file://0001-Add-power-control-support-for-the-Garrison-system.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
new file mode 120000
index 0000000..afd75d8
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
@@ -0,0 +1 @@
+../../../../meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
deleted file mode 120000
index 2fc0f2c..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
deleted file mode 120000
index 27acaeb..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
\ No newline at end of file
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
index 6c14b22..bfac343 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
@@ -1,3 +1,2 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
-SRC_URI += "file://poweron.patch"
-SRC_URI += "file://occ-path.patch"
+SRC_URI += "file://0001-Add-power-control-support-for-the-Garrison-system.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
new file mode 100644
index 0000000..ac54655
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
@@ -0,0 +1,128 @@
+From c2f1b1115f6a7f814a05622a33984f5a4797fede Mon Sep 17 00:00:00 2001
+From: Brad Bishop <bradleyb@fuzziesquirrel.com>
+Date: Wed, 15 Jun 2016 21:16:43 -0400
+Subject: [PATCH] Add power control support for the Garrison system
+
+Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
+---
+ op-pwrctl/power_control_obj.c | 70 +++++++++++++++++++++++++++++--------------
+ 1 file changed, 48 insertions(+), 22 deletions(-)
+
+diff --git a/op-pwrctl/power_control_obj.c b/op-pwrctl/power_control_obj.c
+index 85a8cff..f6bc996 100644
+--- a/git/op-pwrctl/power_control_obj.c
++++ b/git/op-pwrctl/power_control_obj.c
+@@ -17,11 +17,15 @@ static const gchar* instance_name = "power0";
+ static const gchar* dbus_name = "org.openbmc.control.Power";
+ 
+ //This object will use these GPIOs
+-GPIO power_pin    = (GPIO){ "POWER_PIN" };
+-GPIO pgood        = (GPIO){ "PGOOD" };
+-GPIO usb_reset    = (GPIO){ "USB_RESET" };
+-GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
+-
++GPIO power_pin = (GPIO){ "BMC_POWER_UP" };
++GPIO pgood = (GPIO){ "SYS_PWROK_BUFF" };
++GPIO bmc_wd_clear_pulse_n = (GPIO){ "BMC_WD_CLEAR_PULSE_N" };
++GPIO cm1_oe_r_n = (GPIO){ "CM1_OE_R_N" };
++GPIO bmc_cp0_reset_n = (GPIO){ "BMC_CP0_RESET_N" };
++GPIO bmc_cfam_reset_n_r = (GPIO){ "BMC_CFAM_RESET_N_R" };
++GPIO pcie_reset = (GPIO){ "PEX8718_DEVICES_RESET_N" };
++GPIO cp0_devices_reset_n = (GPIO){ "CP0_DEVICES_RESET_N" };
++GPIO cp1_devices_reset_n = (GPIO){ "CP1_DEVICES_RESET_N" };
+ 
+ static GDBusObjectManagerServer *manager = NULL;
+ 
+@@ -67,27 +71,36 @@ poll_pgood(gpointer user_data)
+ 			{
+ 				control_power_emit_power_lost(control_power);
+ 				control_emit_goto_system_state(control,"HOST_POWERED_OFF");
+-				rc = gpio_open(&pcie_reset);
+-				rc = gpio_write(&pcie_reset,0);
+-				gpio_close(&pcie_reset);
+-
+-				rc = gpio_open(&usb_reset);
+-				rc = gpio_write(&usb_reset,0);
+-				gpio_close(&usb_reset);
+-
+ 			}
+ 			else
+ 			{
+ 				control_power_emit_power_good(control_power);
+ 				control_emit_goto_system_state(control,"HOST_POWERED_ON");
+-				rc = gpio_open(&pcie_reset);
+-				rc = gpio_write(&pcie_reset,1);
+-				gpio_close(&pcie_reset);
+-
+-				rc = gpio_open(&usb_reset);
+-				rc = gpio_write(&usb_reset,1);
+-				gpio_close(&usb_reset);
+ 			}
++
++			gpio_open(&cm1_oe_r_n);
++			gpio_write(&cm1_oe_r_n, !gpio);
++			gpio_close(&cm1_oe_r_n);
++
++			gpio_open(&bmc_cp0_reset_n);
++			gpio_write(&bmc_cp0_reset_n, gpio);
++			gpio_close(&bmc_cp0_reset_n);
++
++			gpio_open(&bmc_cfam_reset_n_r);
++			gpio_write(&bmc_cfam_reset_n_r, gpio);
++			gpio_close(&bmc_cfam_reset_n_r);
++
++			gpio_open(&pcie_reset);
++			gpio_write(&pcie_reset, gpio);
++			gpio_close(&pcie_reset);
++
++			gpio_open(&cp0_devices_reset_n);
++			gpio_write(&cp0_devices_reset_n, gpio);
++			gpio_close(&cp0_devices_reset_n);
++
++			gpio_open(&cp1_devices_reset_n);
++			gpio_write(&cp1_devices_reset_n, gpio);
++			gpio_close(&cp1_devices_reset_n);
+ 		}
+ 	} else {
+ 		printf("ERROR PowerControl: GPIO read error (gpio=%s,rc=%d)\n",pgood.name,rc);
+@@ -138,11 +151,13 @@ on_set_power_state(ControlPower *pwr,
+ 			} else {
+ 				control_emit_goto_system_state(control,"HOST_POWERING_OFF");
+ 			}
++
+ 			error = gpio_open(&power_pin);
+ 			if(error != GPIO_OK) { break;	}
+-			error = gpio_write(&power_pin,!state);
++			error = gpio_write(&power_pin, state);
+ 			if(error != GPIO_OK) { break;	}
+ 			gpio_close(&power_pin);
++
+ 			control_power_set_state(pwr,state);
+ 		} while(0);
+ 		if(error != GPIO_OK)
+@@ -230,10 +245,21 @@ on_bus_acquired(GDBusConnection *connection,
+ 		if(rc != GPIO_OK) { break; }
+ 		rc = gpio_init(connection,&pgood);
+ 		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_wd_clear_pulse_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&cm1_oe_r_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_cp0_reset_n);
++		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&bmc_cfam_reset_n_r);
++		if(rc != GPIO_OK) { break; }
+ 		rc = gpio_init(connection,&pcie_reset);
+ 		if(rc != GPIO_OK) { break; }
+-		rc = gpio_init(connection,&usb_reset);
++		rc = gpio_init(connection,&cp0_devices_reset_n);
+ 		if(rc != GPIO_OK) { break; }
++		rc = gpio_init(connection,&cp1_devices_reset_n );
++		if(rc != GPIO_OK) { break; }
++
+ 
+ 		uint8_t gpio;
+ 		rc = gpio_open(&pgood);
+-- 
+2.1.4
+
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
deleted file mode 100644
index 04304e4..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/git/bin/sensor_manager2.py
-+++ b/git/bin/sensor_manager2.py
-@@ -63,13 +63,13 @@ if __name__ == '__main__':
- 	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
- 
- 	obj_path = OBJ_PATH+"/host/cpu0/OccStatus"
--	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
--	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
-+	sensor_obj = Sensors.OccStatusSensor(bus,obj_path,
-+			"/sys/class/i2c-adapter/i2c-4/4-0050/online")
- 	root_sensor.add(obj_path,sensor_obj)
- 
- 	obj_path = OBJ_PATH+"/host/cpu1/OccStatus"
--	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
--	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0051/online"
-+	sensor_obj = Sensors.OccStatusSensor(bus,obj_path,
-+			"/sys/class/i2c-adapter/i2c-5/5-0050/online")
- 	root_sensor.add(obj_path,sensor_obj)
- 
- 	obj_path = OBJ_PATH+"/host/BootCount"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
deleted file mode 100644
index c50ce3d..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
+++ /dev/null
@@ -1,113 +0,0 @@
---- a/git/objects/power_control_obj.c
-+++ b/git/objects/power_control_obj.c
-@@ -17,11 +17,15 @@ static const gchar* instance_name = "power0";
- static const gchar* dbus_name = "org.openbmc.control.Power";
- 
- //This object will use these GPIOs
--GPIO power_pin    = (GPIO){ "POWER_PIN" };
--GPIO pgood        = (GPIO){ "PGOOD" };
--GPIO usb_reset    = (GPIO){ "USB_RESET" };
--GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
--
-+GPIO power_pin = (GPIO){ "BMC_POWER_UP" };
-+GPIO pgood = (GPIO){ "SYS_PWROK_BUFF" };
-+GPIO bmc_wd_clear_pulse_n = (GPIO){ "BMC_WD_CLEAR_PULSE_N" };
-+GPIO cm1_oe_r_n = (GPIO){ "CM1_OE_R_N" };
-+GPIO bmc_cp0_reset_n = (GPIO){ "BMC_CP0_RESET_N" };
-+GPIO bmc_cfam_reset_n_r = (GPIO){ "BMC_CFAM_RESET_N_R" };
-+GPIO pcie_reset = (GPIO){ "PEX8718_DEVICES_RESET_N" };
-+GPIO cp0_devices_reset_n = (GPIO){ "CP0_DEVICES_RESET_N" };
-+GPIO cp1_devices_reset_n = (GPIO){ "CP1_DEVICES_RESET_N" };
- 
- static GDBusObjectManagerServer *manager = NULL;
- 
-@@ -67,27 +71,36 @@ poll_pgood(gpointer user_data)
- 			{
- 				control_power_emit_power_lost(control_power);
- 				control_emit_goto_system_state(control,"HOST_POWERED_OFF");
--				rc = gpio_open(&pcie_reset);
--				rc = gpio_write(&pcie_reset,0);
--				gpio_close(&pcie_reset);
--
--				rc = gpio_open(&usb_reset);
--				rc = gpio_write(&usb_reset,0);
--				gpio_close(&usb_reset);
--
- 			}
- 			else
- 			{
- 				control_power_emit_power_good(control_power);
- 				control_emit_goto_system_state(control,"HOST_POWERED_ON");
--				rc = gpio_open(&pcie_reset);
--				rc = gpio_write(&pcie_reset,1);
--				gpio_close(&pcie_reset);
--
--				rc = gpio_open(&usb_reset);
--				rc = gpio_write(&usb_reset,1);
--				gpio_close(&usb_reset);
- 			}
-+
-+			gpio_open(&cm1_oe_r_n);
-+			gpio_write(&cm1_oe_r_n, !gpio);
-+			gpio_close(&cm1_oe_r_n);
-+
-+			gpio_open(&bmc_cp0_reset_n);
-+			gpio_write(&bmc_cp0_reset_n, gpio);
-+			gpio_close(&bmc_cp0_reset_n);
-+
-+			gpio_open(&bmc_cfam_reset_n_r);
-+			gpio_write(&bmc_cfam_reset_n_r, gpio);
-+			gpio_close(&bmc_cfam_reset_n_r);
-+
-+			gpio_open(&pcie_reset);
-+			gpio_write(&pcie_reset, gpio);
-+			gpio_close(&pcie_reset);
-+
-+			gpio_open(&cp0_devices_reset_n);
-+			gpio_write(&cp0_devices_reset_n, gpio);
-+			gpio_close(&cp0_devices_reset_n);
-+
-+			gpio_open(&cp1_devices_reset_n);
-+			gpio_write(&cp1_devices_reset_n, gpio);
-+			gpio_close(&cp1_devices_reset_n);
- 		}
- 	} else {
- 		printf("ERROR PowerControl: GPIO read error (gpio=%s,rc=%d)\n",pgood.name,rc);
-@@ -138,11 +151,13 @@ on_set_power_state(ControlPower *pwr,
- 			} else {
- 				control_emit_goto_system_state(control,"HOST_POWERING_OFF");
- 			}
-+
- 			error = gpio_open(&power_pin);
- 			if(error != GPIO_OK) { break;	}
--			error = gpio_write(&power_pin,!state);
-+			error = gpio_write(&power_pin, state);
- 			if(error != GPIO_OK) { break;	}
- 			gpio_close(&power_pin);
-+
- 			control_power_set_state(pwr,state);
- 		} while(0);
- 		if(error != GPIO_OK)
-@@ -230,10 +245,21 @@ on_bus_acquired(GDBusConnection *connection,
- 		if(rc != GPIO_OK) { break; }
- 		rc = gpio_init(connection,&pgood);
- 		if(rc != GPIO_OK) { break; }
-+		rc = gpio_init(connection,&bmc_wd_clear_pulse_n);
-+		if(rc != GPIO_OK) { break; }
-+		rc = gpio_init(connection,&cm1_oe_r_n);
-+		if(rc != GPIO_OK) { break; }
-+		rc = gpio_init(connection,&bmc_cp0_reset_n);
-+		if(rc != GPIO_OK) { break; }
-+		rc = gpio_init(connection,&bmc_cfam_reset_n_r);
-+		if(rc != GPIO_OK) { break; }
- 		rc = gpio_init(connection,&pcie_reset);
- 		if(rc != GPIO_OK) { break; }
--		rc = gpio_init(connection,&usb_reset);
-+		rc = gpio_init(connection,&cp0_devices_reset_n);
- 		if(rc != GPIO_OK) { break; }
-+		rc = gpio_init(connection,&cp1_devices_reset_n );
-+		if(rc != GPIO_OK) { break; }
-+
- 
- 		uint8_t gpio;
- 		rc = gpio_open(&pgood);
-- 
2.8.4
