Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FF331A1A21
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482041621825.4570877447981;
 Fri, 18 Dec 2015 15:40:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 08/15] use real names for occ sensors
Date: Fri, 18 Dec 2015 17:40:28 -0600
Message-Id: <1450482035-4530-9-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:48 -0000

From: Norman James <njames@us.ibm.com>

---
 bin/Barreleye.py | 261 +++++++++++++++++++++++++++----------------------------
 bin/hwmon.py     |  94 +++++++++++---------
 2 files changed, 181 insertions(+), 174 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 90655da..2e59392 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -13,7 +13,6 @@ SYSTEM_NAME = "Barreleye"
 ##   - objects specified in EXIT_STATE_DEPEND have started
 SYSTEM_STATES = [
 	'BASE_APPS',
-	'BMC_INIT',
 	'BMC_STARTING',
 	'BMC_STARTING2',
 	'BMC_READY',
@@ -90,12 +89,6 @@ APPS = {
 		'monitor_process' : False,
 		'process_name'    : 'startup_hacks.sh',
 	},
-	'bmc_init' : {
-		'system_state'    : 'BMC_INIT',
-		'start_process'   : True,
-		'monitor_process' : False,
-		'process_name'    : 'control_bmc_barreleye.exe',
-	},
 	'inventory' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
@@ -115,7 +108,7 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'fan_control.py',
 	},
-	'virtual_sensors' : {
+	'hwmon' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
 		'monitor_process' : True,
@@ -186,13 +179,12 @@ APPS = {
 		'process_name'    : 'phosphor-read-eeprom',
 		'args'            : ['--eeprom','/sys/devices/platform/ahb/ahb:apb/1e78a000.i2c/1e78a040.i2c-bus/i2c-0/0-0050/eeprom','--fruid','64'],
 	},
-	'hwmon' : {
-		'system_state'    : 'BMC_STARTING',
+	'restore' : {
+		'system_state'    : 'BMC_READY',
 		'start_process'   : True,
-		'monitor_process' : True,
-		'process_name'    : 'sensors_hwmon.py',
-		'args'            : [ SYSTEM_NAME ]
-	}
+		'monitor_process' : False,
+		'process_name'    : 'discover_system_state.py',
+	},
 }
 
 CACHED_INTERFACES = {
@@ -203,7 +195,8 @@ INVENTORY_ROOT = '/org/openbmc/inventory'
 
 FRU_INSTANCES = {
 	'<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
-	'<inventory_root>/system/na' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
+	'<inventory_root>/system/bios' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+	'<inventory_root>/system/misc' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
 
 	'<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
 
@@ -253,14 +246,14 @@ FRU_INSTANCES = {
 	'<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
 	'<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
 	
-	'<inventory_root>/system/chassis/motherboard/centaur0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
-	'<inventory_root>/system/chassis/motherboard/centaur7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
 
 	'<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
 	'<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
@@ -311,14 +304,14 @@ ID_LOOKUP = {
 		0x40 : '<inventory_root>/system/chassis/io_board',
 		0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
                 0x02 : '<inventory_root>/system/chassis/motherboard/cpu1',
-		0x04 : '<inventory_root>/system/chassis/motherboard/centaur0',
-                0x05 : '<inventory_root>/system/chassis/motherboard/centaur1',
-                0x06 : '<inventory_root>/system/chassis/motherboard/centaur2',
-                0x07 : '<inventory_root>/system/chassis/motherboard/centaur3',
-                0x08 : '<inventory_root>/system/chassis/motherboard/centaur4',
-                0x09 : '<inventory_root>/system/chassis/motherboard/centaur5',
-                0x0a : '<inventory_root>/system/chassis/motherboard/centaur6',
-                0x0b : '<inventory_root>/system/chassis/motherboard/centaur7',
+		0x04 : '<inventory_root>/system/chassis/motherboard/membuf0',
+                0x05 : '<inventory_root>/system/chassis/motherboard/membuf1',
+                0x06 : '<inventory_root>/system/chassis/motherboard/membuf2',
+                0x07 : '<inventory_root>/system/chassis/motherboard/membuf3',
+                0x08 : '<inventory_root>/system/chassis/motherboard/membuf4',
+                0x09 : '<inventory_root>/system/chassis/motherboard/membuf5',
+                0x0a : '<inventory_root>/system/chassis/motherboard/membuf6',
+                0x0b : '<inventory_root>/system/chassis/motherboard/membuf7',
 		0x0c : '<inventory_root>/system/chassis/motherboard/dimm0',
 		0x0d : '<inventory_root>/system/chassis/motherboard/dimm1',
 		0x0e : '<inventory_root>/system/chassis/motherboard/dimm2',
@@ -354,11 +347,9 @@ ID_LOOKUP = {
 		0x33 : '<inventory_root>/system',
 	},
 	'FRU_STR' : {
-		'PRODUCT_0'  : '<inventory_root>/system/na',
-		'BOARD_3'    : '<inventory_root>/system/na',
-		'PRODUCT_15' : '<inventory_root>/system',
-		'PRODUCT_33' : '<inventory_root>/system',
-		'PRODUCT_51' : '<inventory_root>/system',
+		'PRODUCT_0'  : '<inventory_root>/system/bios',
+		'BOARD_3'    : '<inventory_root>/system/misc',
+		'PRODUCT_51' : '<inventory_root>/system/misc',
 		'PRODUCT_100': '<inventory_root>/system',
 		'CHASSIS_2'  : '<inventory_root>/system/chassis',
 		'CHASSIS_100': '<inventory_root>/system/chassis',
@@ -366,14 +357,14 @@ ID_LOOKUP = {
 		'CHASSIS_3'  : '<inventory_root>/system/chassis/motherboard',
 		'BOARD_1'    : '<inventory_root>/system/chassis/motherboard/cpu0',
 		'BOARD_2'    : '<inventory_root>/system/chassis/motherboard/cpu1',
-		'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/centaur0',
-		'BOARD_5'    : '<inventory_root>/system/chassis/motherboard/centaur1',
-		'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/centaur2',
-		'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/centaur3',
-		'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/centaur4',
-		'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/centaur5',
-		'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/centaur6',
-		'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/centaur7',
+		'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/membuf0',
+		'BOARD_5'    : '<inventory_root>/system/chassis/motherboard/membuf1',
+		'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/membuf2',
+		'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/membuf3',
+		'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/membuf4',
+		'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/membuf5',
+		'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/membuf6',
+		'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/membuf7',
 		'PRODUCT_12'   : '<inventory_root>/system/chassis/motherboard/dimm0',
 		'PRODUCT_13'   : '<inventory_root>/system/chassis/motherboard/dimm1',
 		'PRODUCT_14'   : '<inventory_root>/system/chassis/motherboard/dimm2',
@@ -442,14 +433,14 @@ ID_LOOKUP = {
                 0xdd : '<inventory_root>/system/chassis/motherboard/cpu1/core9',
                 0xde : '<inventory_root>/system/chassis/motherboard/cpu1/core10',
                 0xdf : '<inventory_root>/system/chassis/motherboard/cpu1/core11',
-		0x40 : '<inventory_root>/system/chassis/motherboard/centaur0',
-    	        0x41 : '<inventory_root>/system/chassis/motherboard/centaur1',
-       		0x42 : '<inventory_root>/system/chassis/motherboard/centaur2',
-       		0x43 : '<inventory_root>/system/chassis/motherboard/centaur3',
-       		0x44 : '<inventory_root>/system/chassis/motherboard/centaur4',
-                0x45 : '<inventory_root>/system/chassis/motherboard/centaur5',
-                0x46 : '<inventory_root>/system/chassis/motherboard/centaur6',
-                0x47 : '<inventory_root>/system/chassis/motherboard/centaur7',
+		0x40 : '<inventory_root>/system/chassis/motherboard/membuf0',
+    	        0x41 : '<inventory_root>/system/chassis/motherboard/membuf1',
+       		0x42 : '<inventory_root>/system/chassis/motherboard/membuf2',
+       		0x43 : '<inventory_root>/system/chassis/motherboard/membuf3',
+       		0x44 : '<inventory_root>/system/chassis/motherboard/membuf4',
+                0x45 : '<inventory_root>/system/chassis/motherboard/membuf5',
+                0x46 : '<inventory_root>/system/chassis/motherboard/membuf6',
+                0x47 : '<inventory_root>/system/chassis/motherboard/membuf7',
 		0x10 : '<inventory_root>/system/chassis/motherboard/dimm0',
 		0x11 : '<inventory_root>/system/chassis/motherboard/dimm1',
 		0x12 : '<inventory_root>/system/chassis/motherboard/dimm2',
@@ -542,94 +533,96 @@ def convertGpio(name):
 
 
 HWMON_CONFIG = {
-	'0-004a' :  { 
-		'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 3000,'scale' : 1000,'units' : 'C' },
+	'0-004a' :  {
+		'names' : { 
+			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
 	},
 	'6-002d' : {
-		'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'in1_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in2_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in3_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in4_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in5_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in6_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in7_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in8_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in9_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'in10_input' : { 'object_path' : 'voltage/P0V97_CPU0','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'in11_input' : { 'object_path' : 'voltage/P1V1_MEM0','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in12_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in13_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in14_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
- 	},
+		'names' : {
+			'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+		}
+	},
 	'6-002e' : {
-		'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
-		'in1_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in2_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in3_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in4_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in5_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in6_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in7_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in8_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in9_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in10_input' : { 'object_path' : 'voltage/P0V97_CPU1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in11_input' : { 'object_path' : 'voltage/P1V1_MEM1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in12_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in13_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-         },
+		'names' : {
+			'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
+		}
+},
 	'3-0050' : {
-		'temp1_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp2_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp3_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp4_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp5_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp6_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp7_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp8_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp9_input' :  { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp10_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp11_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp12_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp13_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp14_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp15_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp16_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp17_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp18_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp19_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp20_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp21_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp22_input' : { 'object_path' : 'temperature/cpu0/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
+		'labels' : {
+		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'102' :  { 'object_path' : 'temperature/dimm0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'103' :  { 'object_path' : 'temperature/dimm1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'104' :  { 'object_path' : 'temperature/dimm2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'105' :  { 'object_path' : 'temperature/dimm3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'106' :  { 'object_path' : 'temperature/dimm4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'107' :  { 'object_path' : 'temperature/dimm5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'108' :  { 'object_path' : 'temperature/dimm6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'109' :  { 'object_path' : 'temperature/dimm7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'110' :  { 'object_path' : 'temperature/dimm8','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'111' :  { 'object_path' : 'temperature/dimm9','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'112' :  { 'object_path' : 'temperature/dimm10','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'113' :  { 'object_path' : 'temperature/dimm11','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'114' :  { 'object_path' : 'temperature/dimm12','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'115' :  { 'object_path' : 'temperature/dimm13','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'116' :  { 'object_path' : 'temperature/dimm14','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'117' :  { 'object_path' : 'temperature/dimm15','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'94' :  { 'object_path' : 'temperature/membuf0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'95' :  { 'object_path' : 'temperature/membuf1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'96' :  { 'object_path' : 'temperature/membuf2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'97' :  { 'object_path' : 'temperature/membuf3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
 	},
 	'3-0051' : {
-		'temp1_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp2_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp3_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp4_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp5_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp6_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp7_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp8_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp9_input' :  { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp10_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp11_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp12_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp13_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp14_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp15_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp16_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp17_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp18_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp19_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp20_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp21_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
-		'temp22_input' : { 'object_path' : 'temperature/cpu1/<label>','poll_interval' : 1000,'scale' : 1000,'units' : 'C' },
+		'labels' :  {
+		'188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'118' :  { 'object_path' : 'temperature/dimm16','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'119' :  { 'object_path' : 'temperature/dimm17','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'120' :  { 'object_path' : 'temperature/dimm18','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'121' :  { 'object_path' : 'temperature/dimm19','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'122' :  { 'object_path' : 'temperature/dimm20','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'123' :  { 'object_path' : 'temperature/dimm21','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'124' :  { 'object_path' : 'temperature/dimm22','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'125' :  { 'object_path' : 'temperature/dimm23','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'126' :  { 'object_path' : 'temperature/dimm24','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'127' :  { 'object_path' : 'temperature/dimm25','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'128' :  { 'object_path' : 'temperature/dimm26','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'129' :  { 'object_path' : 'temperature/dimm27','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'130' :  { 'object_path' : 'temperature/dimm28','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'131' :  { 'object_path' : 'temperature/dimm29','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'132' :  { 'object_path' : 'temperature/dimm30','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'133' :  { 'object_path' : 'temperature/dimm31','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'98' :  { 'object_path' : 'temperature/membuf4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'99' :  { 'object_path' : 'temperature/membuf5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'100' :  { 'object_path' : 'temperature/membuf6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		'101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
 	},
 }
 
diff --git a/bin/hwmon.py b/bin/hwmon.py
index 513c760..9a7a56e 100755
--- a/bin/hwmon.py
+++ b/bin/hwmon.py
@@ -3,13 +3,17 @@
 import sys
 import os
 import gobject
+import glob
 import dbus
 import dbus.service
 import dbus.mainloop.glib
 import Openbmc
+import re
+
 from Sensors import SensorValue as SensorValue
 from Sensors import HwmonSensor as HwmonSensor
 from Sensors import SensorThresholds as SensorThresholds
+
 if (len(sys.argv) < 2):
 	print "Usage:  sensors_hwmon.py [system name]"
 	exit(1)
@@ -18,7 +22,7 @@ System = __import__(sys.argv[1])
 
 SENSOR_BUS = 'org.openbmc.Sensors'
 SENSOR_PATH = '/org/openbmc/sensors'
-DIR_POLL_INTERVAL = 10000
+DIR_POLL_INTERVAL = 30000
 HWMON_PATH = '/sys/class/hwmon'
 
 ## static define which interface each property is under
@@ -55,7 +59,7 @@ class Hwmons():
 	def poll(self,objpath,attribute):
 		try:
 			raw_value = int(self.readAttribute(attribute))
-			obj = bus.get_object(SENSOR_BUS,objpath)
+			obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
 			intf = dbus.Interface(obj,HwmonSensor.IFACE_NAME)
 			rtn = intf.setByPoll(raw_value)
 			if (rtn[0] == True):
@@ -68,48 +72,41 @@ class Hwmons():
 		return True
 
 
-	def addObject(self,dpath,instance_name,attribute):
-		hwmon = System.HWMON_CONFIG[instance_name][attribute]
+	def addObject(self,dpath,hwmon_path,hwmon):
 		objsuf = hwmon['object_path']
-		try:
-			if (objsuf.find('<label>') > -1):
-				label_file = attribute.replace('_input','_label')
-				label = self.readAttribute(dpath+label_file)
-				objsuf = objsuf.replace('<label>',label)
-		except Exception as e:
-			print e
-			return
-
 		objpath = SENSOR_PATH+'/'+objsuf
-		spath = dpath+attribute
+		
 		if (self.sensors.has_key(objpath) == False):
-			if os.path.isfile(spath):
-				print "HWMON add: "+objpath+" : "+spath
-				obj = bus.get_object(SENSOR_BUS,SENSOR_PATH)
-				intf = dbus.Interface(obj,SENSOR_BUS)
-				intf.register("HwmonSensor",objpath)
+			print "HWMON add: "+objpath+" : "+hwmon_path
+
+			## register object with sensor manager
+			obj = bus.get_object(SENSOR_BUS,SENSOR_PATH,introspect=False)
+			intf = dbus.Interface(obj,SENSOR_BUS)
+			intf.register("HwmonSensor",objpath)
+
+			## set some properties in dbus object		
+			obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
+			intf = dbus.Interface(obj,dbus.PROPERTIES_IFACE)
+			intf.Set(HwmonSensor.IFACE_NAME,'filename',hwmon_path)
 			
-				obj = bus.get_object(SENSOR_BUS,objpath)
-				intf = dbus.Interface(obj,dbus.PROPERTIES_IFACE)
-				intf.Set(HwmonSensor.IFACE_NAME,'filename',spath)
-				
-				## check if one of thresholds is defined to know
-				## whether to enable thresholds or not
-				if (hwmon.has_key('critical_upper')):
-					intf.Set(SensorThresholds.IFACE_NAME,'thresholds_enabled',True)
-
-				for prop in hwmon.keys():
-					if (IFACE_LOOKUP.has_key(prop)):
-						intf.Set(IFACE_LOOKUP[prop],prop,hwmon[prop])
-						print "Setting: "+prop+" = "+str(hwmon[prop])
-
-				self.sensors[objpath]=True
-				self.hwmon_root[dpath].append(objpath)
-				gobject.timeout_add(hwmon['poll_interval'],self.poll,objpath,spath)
+			## check if one of thresholds is defined to know
+			## whether to enable thresholds or not
+			if (hwmon.has_key('critical_upper')):
+				intf.Set(SensorThresholds.IFACE_NAME,'thresholds_enabled',True)
+
+			for prop in hwmon.keys():
+				if (IFACE_LOOKUP.has_key(prop)):
+					intf.Set(IFACE_LOOKUP[prop],prop,hwmon[prop])
+					print "Setting: "+prop+" = "+str(hwmon[prop])
+
+			self.sensors[objpath]=True
+			self.hwmon_root[dpath].append(objpath)
+			gobject.timeout_add(hwmon['poll_interval'],self.poll,objpath,hwmon_path)
 	
 	def scanDirectory(self):
 	 	devices = os.listdir(HWMON_PATH)
 		found_hwmon = {}
+		regx = re.compile('([a-z]+)\d+\_')
 		for d in devices:
 			dpath = HWMON_PATH+'/'+d+'/'
 			found_hwmon[dpath] = True
@@ -117,11 +114,28 @@ class Hwmons():
 				self.hwmon_root[dpath] = []
 			## the instance name is a soft link
 			instance_name = os.path.realpath(dpath+'device').split('/').pop()
+			
+			
 			if (System.HWMON_CONFIG.has_key(instance_name)):
-	 			for attribute in System.HWMON_CONFIG[instance_name].keys():
-					self.addObject(dpath,instance_name,attribute)
+				hwmon = System.HWMON_CONFIG[instance_name]
+	 			
+				if (hwmon.has_key('labels')):
+					label_files = glob.glob(dpath+'/*_label')
+					for f in label_files:
+						label_key = self.readAttribute(f)
+						if (hwmon['labels'].has_key(label_key)):
+							namef = f.replace('_label','_input')
+							self.addObject(dpath,namef,hwmon['labels'][label_key])
+						else:
+							pass
+							#print "WARNING - hwmon: label ("+label_key+") not found in lookup: "+f
+							
+				if hwmon.has_key('names'):
+					for attribute in hwmon['names'].keys():
+						self.addObject(dpath,dpath+attribute,hwmon['names'][attribute])
+						
 			else:
-				print "WARNING: Unhandled hwmon: "+dpath
+				print "WARNING - hwmon: Unhandled hwmon: "+dpath
 	
 
 		for k in self.hwmon_root.keys():
@@ -132,7 +146,7 @@ class Hwmons():
 					if (self.sensors.has_key(objpath) == True):
 						print "HWMON remove: "+objpath
 						self.sensors.pop(objpath,None)
-						obj = bus.get_object(SENSOR_BUS,SENSOR_PATH)
+						obj = bus.get_object(SENSOR_BUS,SENSOR_PATH,introspect=False)
 						intf = dbus.Interface(obj,SENSOR_BUS)
 						intf.delete(objpath)
 
-- 
2.6.3
