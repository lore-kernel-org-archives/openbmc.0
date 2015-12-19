Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2BACF1A1AF5
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 11:00:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14504832443580.6767080231501268;
 Fri, 18 Dec 2015 16:00:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 5/5] Extract latest Barreleye.py
Date: Fri, 18 Dec 2015 18:00:40 -0600
Message-Id: <1450483240-5182-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450483240-5182-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450483240-5182-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 19 Dec 2015 00:00:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 98 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 19 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index e93f881..f068ea1 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -36,7 +36,7 @@ EXIT_STATE_DEPEND = {
 		'/org/openbmc/inventory/system/chassis/io_board' : 0,
 	},
 	'BMC_STARTING2' : {
-		'/org/openbmc/control/fans' : 0,	
+		'/org/openbmc/control/fans' : 0,
 		'/org/openbmc/control/chassis0': 0,
 	},
 }
@@ -44,7 +44,7 @@ EXIT_STATE_DEPEND = {
 ## method will be called when state is entered
 ENTER_STATE_CALLBACK = {
 	'HOST_POWERED_ON' : {
-		'boot' : { 
+		'boot' : {
 			'bus_name'    : 'org.openbmc.control.Host',
 			'obj_name'    : '/org/openbmc/control/host0',
 			'interface_name' : 'org.openbmc.control.Host',
@@ -53,19 +53,32 @@ ENTER_STATE_CALLBACK = {
 			'bus_name'    : 'org.openbmc.control.Fans',
 			'obj_name'    : '/org/openbmc/control/fans',
 			'interface_name' : 'org.openbmc.control.Fans',
+		},
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'interface_name' : 'org.openbmc.Led',
 		}
 	},
+	'HOST_POWERED_OFF' : {
+		'setOff' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'interface_name' : 'org.openbmc.Led',
+		}
+
+	},
 	'BMC_READY' : {
 		'setOn' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'obj_name'   : '/org/openbmc/control/led/BEEP',
 			'interface_name' : 'org.openbmc.Led',
 		},
 		'init' : {
 			'bus_name'   : 'org.openbmc.control.Flash',
 			'obj_name'   : '/org/openbmc/control/flash/bios',
 			'interface_name' : 'org.openbmc.Flash',
-		},
+		}
 	}
 }
 
@@ -115,7 +128,7 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'host_watchdog.exe',
 	},
-	'power_control' : {	
+	'power_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
 		'monitor_process' : True,
@@ -128,6 +141,15 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'button_power.exe',
 	},
+
+        'reset_button' : {
+                'system_state'    : 'BMC_STARTING',
+                'start_process'   : True,
+                'monitor_process' : True,
+                'process_name'    : 'button_reset.exe',
+        },
+
+
 	'led_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
@@ -232,7 +254,7 @@ FRU_INSTANCES = {
 	'<inventory_root>/system/chassis/motherboard/cpu1/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
 	'<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
 	'<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
-	
+
 	'<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
 	'<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
 	'<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
@@ -393,7 +415,7 @@ ID_LOOKUP = {
 		0x37 : '<inventory_root>/system/chassis/motherboard/refclock',
 		0x38 : '<inventory_root>/system/chassis/motherboard/pcieclock',
 		0x39 : '<inventory_root>/system/chassis/motherboard/todclock',
-		0x3A : '<inventory_root>/system/chassis/motherboard/apss', 
+		0x3A : '<inventory_root>/system/chassis/motherboard/apss',
 		0x0c : '<inventory_root>/system/chassis/motherboard/cpu0',
                 0x0e : '<inventory_root>/system/chassis/motherboard/cpu1',
 		0xc8 : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
@@ -459,7 +481,7 @@ ID_LOOKUP = {
                 0x2c : '<inventory_root>/system/chassis/motherboard/dimm28',
                 0x2d : '<inventory_root>/system/chassis/motherboard/dimm29',
                 0x2e : '<inventory_root>/system/chassis/motherboard/dimm30',
-                0x2f : '<inventory_root>/system/chassis/motherboard/dimm31',	
+                0x2f : '<inventory_root>/system/chassis/motherboard/dimm31',
 		0x09 : '/org/openbmc/sensors/host/BootCount',
 		0x05 : '/org/openbmc/sensors/host/BootProgress',
 		0x04 : '/org/openbmc/sensors/host/HostStatus',
@@ -468,14 +490,14 @@ ID_LOOKUP = {
 		0x33 : '/org/openbmc/sensors/host/powercap',
 	},
 	'GPIO_PRESENT' : {
-		'SLOT0_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0_riser', 
-		'SLOT1_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1_riser', 
-		'SLOT2_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2_riser', 
-		'SLOT0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0', 
-		'SLOT1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1', 
-		'SLOT2_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2', 
-		'MEZZ0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz0', 
-		'MEZZ1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz1', 
+		'SLOT0_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0_riser',
+		'SLOT1_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1_riser',
+		'SLOT2_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2_riser',
+		'SLOT0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0',
+		'SLOT1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1',
+		'SLOT2_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2',
+		'MEZZ0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz0',
+		'MEZZ1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz1',
 	}
 }
 
@@ -491,6 +513,16 @@ GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'H2', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
+
+GPIO_CONFIG['BEEP']       = { 'gpio_pin': 'N7', 'direction': 'out' }
+GPIO_CONFIG['HEART_BEAT']       = { 'gpio_pin': 'R4', 'direction': 'out' }
+GPIO_CONFIG['BMC_THROTTLE']       = { 'gpio_pin': 'J3', 'direction': 'out' }
+GPIO_CONFIG['RESET_BUTTON']       = { 'gpio_pin': 'E2', 'direction': 'both' }
+GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
+
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
@@ -511,7 +543,7 @@ def convertGpio(name):
 
 HWMON_CONFIG = {
 	'0-004a' :  {
-		'names' : { 
+		'names' : {
 			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
 		}
 	},
@@ -519,7 +551,21 @@ HWMON_CONFIG = {
 		'names' : {
 			'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-			'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in1_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in2_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in3_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in4_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in5_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in6_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in7_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in8_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in9_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in10_input' : { 'object_path' : 'voltage/P0V97_CPU0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in11_input' : { 'object_path' : 'voltage/P1V1_MEM0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in12_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in13_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in14_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 		}
 	},
 	'6-002e' : {
@@ -527,8 +573,22 @@ HWMON_CONFIG = {
 			'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
+   			'in1_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in2_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in3_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in4_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in5_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in6_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in7_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in8_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in9_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in10_input' : { 'object_path' : 'voltage/P0V97_CPU1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in11_input' : { 'object_path' : 'voltage/P1V1_MEM1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in12_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in13_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                        'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 		}
-	},
+         },
 	'3-0050' : {
 		'labels' : {
 		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
-- 
2.6.3
