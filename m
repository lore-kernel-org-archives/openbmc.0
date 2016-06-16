Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVt501WcvzDqsd
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 05:00:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466103644461465.899630548239;
 Thu, 16 Jun 2016 12:00:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation v2] Port automation suite from the
 mkumatag personal repo with history
Date: Thu, 16 Jun 2016 14:00:40 -0500
Message-Id: <20160616190040.28577-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616190040.28577-1-openbmc-patches@stwcx.xyz>
References: <20160616190040.28577-1-openbmc-patches@stwcx.xyz>
X-Mailman-Approved-At: Fri, 17 Jun 2016 05:18:31 +1000
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
X-List-Received-Date: Thu, 16 Jun 2016 19:00:55 -0000

From: Chris Austen <austenc@us.ibm.com>

All these files came from https://github.com/mkumatag/openbmc-automation
The decision to remove the commit history was because most of the 122
commits did not follow commit comment AND content best practices.
The ability to remove the commit history was possible because all
contributors where from the same company (IBM) making the coordination /
notification/acceptence easy.  See all the gory details about the
first try to commit with history here...
https://github.com/openbmc/openbmc-test-automation/pull/1

This suite of tests will run against an OpenBMC based server.  It will
run good/bad path testing against the REST interface.  There are tests
that will also run ipmitool on the victim BMC too.

If you want to support a new system in to the suite you should only
have to edit two files...
    data/<system>.py
    tox.ini

The README.md contains details on how to setup for the first time along
with how to execute the test suite

NOTE: some test cases require tools that do not exist on the system.
Currently the ipmitool is needed and if you do not manually copy / link
it in to the tools directory some suites will fail.
---
 .gitignore                                      |   6 +
 .project                                        |  17 +
 .pydevproject                                   |   7 +
 LICENSE                                         |   1 -
 README.md                                       |  69 +++
 data/Barreleye.py                               | 756 ++++++++++++++++++++++++
 data/Firestone.py                               | 626 ++++++++++++++++++++
 data/Garrison.py                                | 626 ++++++++++++++++++++
 data/Palmetto.py                                | 327 ++++++++++
 data/model.py                                   |  59 ++
 data/variables.py                               | 148 +++++
 lib/disable_warning_urllib.py                   |  16 +
 lib/ipmi_client.robot                           |  36 ++
 lib/pdu/pdu.robot                               |  15 +
 lib/pdu/synaccess.robot                         |  16 +
 lib/pythonutil.py                               |  11 +
 lib/resource.txt                                |  37 ++
 lib/rest_client.robot                           | 149 +++++
 lib/utilities.py                                | 105 ++++
 lib/utils.robot                                 |  54 ++
 requirements.txt                                |   5 +
 tests/data.json                                 |   1 +
 tests/security/test_ssl.robot                   |  38 ++
 tests/test_ac_cycles.robot                      |  25 +
 tests/test_association.robot                    | 219 +++++++
 tests/test_boot.robot                           | 161 +++++
 tests/test_bootpolicy.robot                     | 136 +++++
 tests/test_esel.robot                           |  61 ++
 tests/test_eventlog.robot                       | 196 ++++++
 tests/test_fan.robot                            |   6 +
 tests/test_fw_version.robot                     |  22 +
 tests/test_generic_conf.robot                   |  93 +++
 tests/test_inventory.robot                      |  97 +++
 tests/test_led.robot                            | 195 ++++++
 tests/test_networkd.robot                       | 314 ++++++++++
 tests/test_obmcrest.robot                       | 333 +++++++++++
 tests/test_occ_powercap.robot                   | 130 ++++
 tests/test_openbmc_service_restart_policy.robot |  60 ++
 tests/test_power_restore.robot                  |  82 +++
 tests/test_sensors.robot                        | 281 +++++++++
 tests/test_syslog.robot                         | 145 +++++
 tests/test_time.robot                           |  67 +++
 tests/test_user.robot                           | 301 ++++++++++
 tests/test_warmreset.robot                      |  52 ++
 tools/generate_argumentfile.sh                  |  13 +
 tox.ini                                         |  71 +++
 46 files changed, 6184 insertions(+), 1 deletion(-)
 create mode 100644 .gitignore
 create mode 100644 .project
 create mode 100644 .pydevproject
 create mode 100755 README.md
 create mode 100755 data/Barreleye.py
 create mode 100755 data/Firestone.py
 create mode 100755 data/Garrison.py
 create mode 100755 data/Palmetto.py
 create mode 100755 data/model.py
 create mode 100644 data/variables.py
 create mode 100644 lib/disable_warning_urllib.py
 create mode 100755 lib/ipmi_client.robot
 create mode 100644 lib/pdu/pdu.robot
 create mode 100644 lib/pdu/synaccess.robot
 create mode 100644 lib/pythonutil.py
 create mode 100755 lib/resource.txt
 create mode 100644 lib/rest_client.robot
 create mode 100755 lib/utilities.py
 create mode 100644 lib/utils.robot
 create mode 100644 requirements.txt
 create mode 100755 tests/data.json
 create mode 100644 tests/security/test_ssl.robot
 create mode 100644 tests/test_ac_cycles.robot
 create mode 100755 tests/test_association.robot
 create mode 100644 tests/test_boot.robot
 create mode 100644 tests/test_bootpolicy.robot
 create mode 100644 tests/test_esel.robot
 create mode 100644 tests/test_eventlog.robot
 create mode 100644 tests/test_fan.robot
 create mode 100644 tests/test_fw_version.robot
 create mode 100755 tests/test_generic_conf.robot
 create mode 100644 tests/test_inventory.robot
 create mode 100644 tests/test_led.robot
 create mode 100755 tests/test_networkd.robot
 create mode 100644 tests/test_obmcrest.robot
 create mode 100644 tests/test_occ_powercap.robot
 create mode 100644 tests/test_openbmc_service_restart_policy.robot
 create mode 100644 tests/test_power_restore.robot
 create mode 100644 tests/test_sensors.robot
 create mode 100755 tests/test_syslog.robot
 create mode 100755 tests/test_time.robot
 create mode 100755 tests/test_user.robot
 create mode 100644 tests/test_warmreset.robot
 create mode 100755 tools/generate_argumentfile.sh
 create mode 100755 tox.ini

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..eb901c8
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+*.pyc
+/log.html
+/output.xml
+/report.html
+/.idea/
+/.tox/
\ No newline at end of file
diff --git a/.project b/.project
new file mode 100644
index 0000000..c81831e
--- /dev/null
+++ b/.project
@@ -0,0 +1,17 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<projectDescription>
+	<name>openbmc-test-automation</name>
+	<comment></comment>
+	<projects>
+	</projects>
+	<buildSpec>
+		<buildCommand>
+			<name>org.python.pydev.PyDevBuilder</name>
+			<arguments>
+			</arguments>
+		</buildCommand>
+	</buildSpec>
+	<natures>
+		<nature>org.python.pydev.pythonNature</nature>
+	</natures>
+</projectDescription>
diff --git a/.pydevproject b/.pydevproject
new file mode 100644
index 0000000..08ea93f
--- /dev/null
+++ b/.pydevproject
@@ -0,0 +1,7 @@
+<?xml version="1.0" encoding="UTF-8"?><?eclipse-pydev version="1.0"?><pydev_project>
+<pydev_pathproperty name="org.python.pydev.PROJECT_SOURCE_PATH">
+<path>/${PROJECT_DIR_NAME}</path>
+</pydev_pathproperty>
+<pydev_property name="org.python.pydev.PYTHON_PROJECT_VERSION">python 2.7</pydev_property>
+<pydev_property name="org.python.pydev.PYTHON_PROJECT_INTERPRETER">Default</pydev_property>
+</pydev_project>
\ No newline at end of file
diff --git a/LICENSE b/LICENSE
index 8f71f43..8dada3e 100644
--- a/LICENSE
+++ b/LICENSE
@@ -199,4 +199,3 @@
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-
diff --git a/README.md b/README.md
new file mode 100755
index 0000000..9f36c01
--- /dev/null
+++ b/README.md
@@ -0,0 +1,69 @@
+#openbmc-automation
+
+Quickstart
+----------
+
+To run openbmc-automation first you need to install the prerequisite python
+packages which will help to invoke tests through tox.
+
+Install the python dependencies for tox
+```shell
+    $ easy_install tox==2.1.1
+    $ easy_install pip
+```
+
+Initilize the following environment variable which will used while testing
+```shell
+    $ export OPENBMC_HOST=<openbmc machine ip address>
+    $ export OPENBMC_PASSWORD=<openbmc username>
+    $ export OPENBMC_USERNAME=<openbmc password>
+    $ export OPENBMC_MODEL=[./data/Barreleye.py, ./data/Palmetto.py, etc]
+
+
+Use Following Variables for networking test cases
+===========================================================    
+    $export NEW_BMC_IP=<openbmc machine ip address>
+    $export NEW_SUBNET_MASK=<openbmc new subnet mask>
+    $export NEW_GATEWAY=<openbmc new gateway>    
+==========================================================
+
+    Use following parameters for PDU:
+    $ export PDU_IP=<PDU IP address>
+    $ export PDU_USERNAME=<PDU username>
+    $ export PDU_PASSWORD=<PDU password>
+    $ export PDU_TYPE=<PDU type>
+    $ export PDU_SLOT_NO=<SLOT number>
+
+    for PDU_TYPE we support only synaccess at the moment
+
+Use following variables for syslog test cases
+==========================================================
+    $ export SYSLOG_IP_ADDRESS=<remote syslog system ip>
+    $ export SYSLOG_PORT=<remote syslog system port>
+
+```
+
+Run tests
+```shell
+    $ tox -e tests
+```
+
+How to test individual test
+```shell
+    One specific test
+    $ tox -e custom -- -t '"DIMM0 no fault"' tests/test_sensors.robot
+
+    No preset environment variables, one test case from one test suite
+    $ OPENBMC_HOST=x.x.x.x tox -e barreleye -- -t '"DIMM0 no fault"' tests/test_sensors.robot
+
+    No preset environment variables, one test suite  for a palmetto system
+    $ OPENBMC_HOST=x.x.x.x tox -e palmetto -- tests/test_sensors.robot
+
+    No preset environment variables, the entire test suite for a barreleye system
+    $ OPENBMC_HOST=x.x.x.x tox -e barreleye -- tests
+```
+
+It can also be run by pasing variables from the cli...
+```shell
+    $  pybot -v OPENBMC_HOST:<ip> -v OPENBMC_USERNAME:root -v OPENBMC_PASSWORD:0penBmc -v OPENBMC_MODEL:<model path>
+```
diff --git a/data/Barreleye.py b/data/Barreleye.py
new file mode 100755
index 0000000..6c28fc2
--- /dev/null
+++ b/data/Barreleye.py
@@ -0,0 +1,756 @@
+#! /usr/bin/python
+
+HOME_PATH = './'
+CACHE_PATH = '/var/cache/obmc/'
+FLASH_DOWNLOAD_PATH = "/tmp"
+GPIO_BASE = 320
+SYSTEM_NAME = "Barreleye"
+
+
+## System states
+##   state can change to next state in 2 ways:
+##   - a process emits a GotoSystemState signal with state name to goto
+##   - objects specified in EXIT_STATE_DEPEND have started
+SYSTEM_STATES = [
+	'BASE_APPS',
+	'BMC_STARTING',
+	'BMC_STARTING2',
+	'BMC_READY',
+	'HOST_POWERING_ON',
+	'HOST_POWERED_ON',
+	'HOST_BOOTING',
+	'HOST_BOOTED',
+	'HOST_POWERED_OFF',
+]
+
+EXIT_STATE_DEPEND = {
+	'BASE_APPS' : {
+		'/org/openbmc/sensors': 0,
+	},
+	'BMC_STARTING' : {
+		'/org/openbmc/control/power0' : 0,
+		'/org/openbmc/control/host0' : 0,
+		'/org/openbmc/control/flash/bios' : 0,
+		'/org/openbmc/sensors/speed/fan5': 0,
+		'/org/openbmc/inventory/system/chassis/io_board' : 0,
+	},
+	'BMC_STARTING2' : {
+		'/org/openbmc/control/fans' : 0,
+		'/org/openbmc/control/chassis0': 0,
+	},
+}
+
+## method will be called when state is entered
+ENTER_STATE_CALLBACK = {
+	'HOST_POWERED_ON' : {
+		'boot' : {
+			'bus_name'    : 'org.openbmc.control.Host',
+			'obj_name'    : '/org/openbmc/control/host0',
+			'interface_name' : 'org.openbmc.control.Host',
+		},
+		'setMax' : {
+			'bus_name'    : 'org.openbmc.control.Fans',
+			'obj_name'    : '/org/openbmc/control/fans',
+			'interface_name' : 'org.openbmc.control.Fans',
+		},
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/identify',
+			'interface_name' : 'org.openbmc.Led',
+		}
+	},
+	'HOST_POWERED_OFF' : {
+		'setOff' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/identify',
+			'interface_name' : 'org.openbmc.Led',
+		}
+
+	},
+	'BMC_READY' : {
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/beep',
+			'interface_name' : 'org.openbmc.Led',
+		},
+		'init' : {
+			'bus_name'   : 'org.openbmc.control.Flash',
+			'obj_name'   : '/org/openbmc/control/flash/bios',
+			'interface_name' : 'org.openbmc.Flash',
+		}
+	}
+}
+
+APPS = {
+	'startup_hacks' : {
+		'system_state'    : 'BASE_APPS',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'startup_hacks.sh',
+	},
+	'inventory' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'inventory_items.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'pcie_present' : {
+		'system_state'    : 'HOST_POWERED_ON',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'pcie_slot_present.exe',
+	},
+	'fan_control' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'fan_control.py',
+	},
+	'hwmon' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'hwmon.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'sensor_manager' : {
+		'system_state'    : 'BASE_APPS',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'sensor_manager2.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'host_watchdog' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'host_watchdog.exe',
+	},
+	'power_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name' : 'power_control.exe',
+		'args' : [ '3000', '10' ]
+	},
+	'power_button' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'button_power.exe',
+	},
+        'reset_button' : {
+                'system_state'    : 'BMC_STARTING',
+                'start_process'   : True,
+                'monitor_process' : True,
+                'process_name'    : 'button_reset.exe',
+        },
+	'led_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'led_controller.exe',
+	},
+	'flash_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'flash_bios.exe',
+	},
+	'bmc_flash_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'bmc_update.py',
+	},
+	'download_manager' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'download_manager.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'host_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'control_host.exe',
+	},
+	'chassis_control' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'chassis_control.py',
+	},
+	'board_vpd' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'phosphor-read-eeprom',
+		'args'            : ['--eeprom','/sys/bus/i2c/devices/0-0050/eeprom','--fruid','64'],
+	},
+	'exp_vpd' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'phosphor-read-eeprom',
+		'args'            : ['--eeprom','/sys/bus/i2c/devices/6-0051/eeprom','--fruid','65'],
+	},
+	'hdd_vpd' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'phosphor-read-eeprom',
+		'args'            : ['--eeprom','/sys/bus/i2c/devices/6-0055/eeprom','--fruid','66'],
+	},
+	'restore' : {
+		'system_state'    : 'BMC_READY',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'discover_system_state.py',
+	},
+	'bmc_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'control_bmc.exe',
+	},
+}
+
+CACHED_INTERFACES = {
+		"org.openbmc.InventoryItem" : True,
+		"org.openbmc.control.Chassis" : True,
+	}
+INVENTORY_ROOT = '/org/openbmc/inventory'
+
+FRU_INSTANCES = {
+	'<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+	'<inventory_root>/system/bios' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+	'<inventory_root>/system/misc' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
+
+	'<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+
+	'<inventory_root>/system/chassis/motherboard' : { 'fru_type' : 'MAIN_PLANAR','is_fru' : True, },
+	'<inventory_root>/system/chassis/io_board' : { 'fru_type' : 'DAUGHTER_CARD','is_fru' : True, },
+	'<inventory_root>/system/chassis/sas_expander' : { 'fru_type' : 'DAUGHTER_CARD','is_fru' : True, },
+	'<inventory_root>/system/chassis/hdd_backplane' : { 'fru_type' : 'DAUGHTER_CARD','is_fru' : True, },
+
+	'<inventory_root>/system/systemevent'                  : { 'fru_type' : 'SYSTEM_EVENT', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/refclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/pcieclock': { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/todclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/apss'     : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+
+	'<inventory_root>/system/chassis/fan0' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan1' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan2' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan3' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan4' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan5' : { 'fru_type' : 'FAN','is_fru' : True, },
+
+	'<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 'manufacturer' : 'ASPEED' },
+
+	'<inventory_root>/system/chassis/motherboard/cpu0' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+	'<inventory_root>/system/chassis/motherboard/cpu1' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+
+	'<inventory_root>/system/chassis/motherboard/cpu0/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core10': { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core11': { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+	'<inventory_root>/system/chassis/motherboard/cpu1/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+	'<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+
+	'<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm2' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm3' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm4' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm5' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm6' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm7' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm8' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm9' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm10' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm11' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm12' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm13' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm14' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm15' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm16' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm17' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm18' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm19' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm20' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm21' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm22' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm23' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm24' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm25' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm26' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm27' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm28' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm29' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm30' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm31' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+
+	'<inventory_root>/system/chassis/io_board/pcie_slot0_riser' : { 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot1_riser' : { 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot2_riser' : { 'fru_type' : 'PCIE_RISER', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot0' : { 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot1' :	{ 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot2' :	{ 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_mezz0' :	{ 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_mezz1' :	{ 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+}
+
+ID_LOOKUP = {
+	'FRU' : {
+		0x03 : '<inventory_root>/system/chassis/motherboard',
+		0x40 : '<inventory_root>/system/chassis/io_board',
+		0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
+                0x02 : '<inventory_root>/system/chassis/motherboard/cpu1',
+		0x04 : '<inventory_root>/system/chassis/motherboard/membuf0',
+                0x05 : '<inventory_root>/system/chassis/motherboard/membuf1',
+                0x06 : '<inventory_root>/system/chassis/motherboard/membuf2',
+                0x07 : '<inventory_root>/system/chassis/motherboard/membuf3',
+                0x08 : '<inventory_root>/system/chassis/motherboard/membuf4',
+                0x09 : '<inventory_root>/system/chassis/motherboard/membuf5',
+                0x0a : '<inventory_root>/system/chassis/motherboard/membuf6',
+                0x0b : '<inventory_root>/system/chassis/motherboard/membuf7',
+		0x0c : '<inventory_root>/system/chassis/motherboard/dimm0',
+		0x0d : '<inventory_root>/system/chassis/motherboard/dimm1',
+		0x0e : '<inventory_root>/system/chassis/motherboard/dimm2',
+		0x0f : '<inventory_root>/system/chassis/motherboard/dimm3',
+                0x10 : '<inventory_root>/system/chassis/motherboard/dimm4',
+                0x11 : '<inventory_root>/system/chassis/motherboard/dimm5',
+                0x12 : '<inventory_root>/system/chassis/motherboard/dimm6',
+                0x13 : '<inventory_root>/system/chassis/motherboard/dimm7',
+                0x14 : '<inventory_root>/system/chassis/motherboard/dimm8',
+                0x15 : '<inventory_root>/system/chassis/motherboard/dimm9',
+		0x16 : '<inventory_root>/system/chassis/motherboard/dimm10',
+		0x17 : '<inventory_root>/system/chassis/motherboard/dimm11',
+		0x18 : '<inventory_root>/system/chassis/motherboard/dimm12',
+		0x19 : '<inventory_root>/system/chassis/motherboard/dimm13',
+		0x1a : '<inventory_root>/system/chassis/motherboard/dimm14',
+		0x1b : '<inventory_root>/system/chassis/motherboard/dimm15',
+		0x1c : '<inventory_root>/system/chassis/motherboard/dimm16',
+		0x1d : '<inventory_root>/system/chassis/motherboard/dimm17',
+		0x1e : '<inventory_root>/system/chassis/motherboard/dimm18',
+		0x1f : '<inventory_root>/system/chassis/motherboard/dimm19',
+		0x20 : '<inventory_root>/system/chassis/motherboard/dimm20',
+                0x21 : '<inventory_root>/system/chassis/motherboard/dimm21',
+                0x22 : '<inventory_root>/system/chassis/motherboard/dimm22',
+                0x23 : '<inventory_root>/system/chassis/motherboard/dimm23',
+                0x24 : '<inventory_root>/system/chassis/motherboard/dimm24',
+                0x25 : '<inventory_root>/system/chassis/motherboard/dimm25',
+                0x26 : '<inventory_root>/system/chassis/motherboard/dimm26',
+                0x27 : '<inventory_root>/system/chassis/motherboard/dimm27',
+                0x28 : '<inventory_root>/system/chassis/motherboard/dimm28',
+                0x29 : '<inventory_root>/system/chassis/motherboard/dimm29',
+                0x2a : '<inventory_root>/system/chassis/motherboard/dimm30',
+                0x2b : '<inventory_root>/system/chassis/motherboard/dimm31',
+		0x33 : '<inventory_root>/system',
+	},
+	'FRU_STR' : {
+		'PRODUCT_0'  : '<inventory_root>/system/bios',
+		'BOARD_3'    : '<inventory_root>/system/misc',
+		'PRODUCT_51' : '<inventory_root>/system/misc',
+		'PRODUCT_100': '<inventory_root>/system',
+		'CHASSIS_100': '<inventory_root>/system/chassis',
+		'BOARD_100'  : '<inventory_root>/system/chassis/io_board',
+		'BOARD_101'  : '<inventory_root>/system/chassis/sas_expander',
+		'BOARD_102'  : '<inventory_root>/system/chassis/hdd_backplane',
+		'CHASSIS_3'  : '<inventory_root>/system/chassis/motherboard',
+		'BOARD_1'    : '<inventory_root>/system/chassis/motherboard/cpu0',
+		'BOARD_2'    : '<inventory_root>/system/chassis/motherboard/cpu1',
+		'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/membuf0',
+		'BOARD_5'    : '<inventory_root>/system/chassis/motherboard/membuf1',
+		'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/membuf2',
+		'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/membuf3',
+		'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/membuf4',
+		'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/membuf5',
+		'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/membuf6',
+		'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/membuf7',
+		'PRODUCT_12'   : '<inventory_root>/system/chassis/motherboard/dimm0',
+		'PRODUCT_13'   : '<inventory_root>/system/chassis/motherboard/dimm1',
+		'PRODUCT_14'   : '<inventory_root>/system/chassis/motherboard/dimm2',
+		'PRODUCT_15'   : '<inventory_root>/system/chassis/motherboard/dimm3',
+		'PRODUCT_16'   : '<inventory_root>/system/chassis/motherboard/dimm4',
+		'PRODUCT_17'   : '<inventory_root>/system/chassis/motherboard/dimm5',
+		'PRODUCT_18'   : '<inventory_root>/system/chassis/motherboard/dimm6',
+		'PRODUCT_19'   : '<inventory_root>/system/chassis/motherboard/dimm7',
+		'PRODUCT_20'   : '<inventory_root>/system/chassis/motherboard/dimm8',
+		'PRODUCT_21'   : '<inventory_root>/system/chassis/motherboard/dimm9',
+		'PRODUCT_22'   : '<inventory_root>/system/chassis/motherboard/dimm10',
+		'PRODUCT_23'   : '<inventory_root>/system/chassis/motherboard/dimm11',
+		'PRODUCT_24'   : '<inventory_root>/system/chassis/motherboard/dimm12',
+		'PRODUCT_25'   : '<inventory_root>/system/chassis/motherboard/dimm13',
+		'PRODUCT_26'   : '<inventory_root>/system/chassis/motherboard/dimm14',
+		'PRODUCT_27'   : '<inventory_root>/system/chassis/motherboard/dimm15',
+		'PRODUCT_28'   : '<inventory_root>/system/chassis/motherboard/dimm16',
+		'PRODUCT_29'   : '<inventory_root>/system/chassis/motherboard/dimm17',
+		'PRODUCT_30'   : '<inventory_root>/system/chassis/motherboard/dimm18',
+		'PRODUCT_31'   : '<inventory_root>/system/chassis/motherboard/dimm19',
+		'PRODUCT_32'   : '<inventory_root>/system/chassis/motherboard/dimm20',
+		'PRODUCT_33'   : '<inventory_root>/system/chassis/motherboard/dimm21',
+		'PRODUCT_34'   : '<inventory_root>/system/chassis/motherboard/dimm22',
+		'PRODUCT_35'   : '<inventory_root>/system/chassis/motherboard/dimm23',
+		'PRODUCT_36'   : '<inventory_root>/system/chassis/motherboard/dimm24',
+		'PRODUCT_37'   : '<inventory_root>/system/chassis/motherboard/dimm25',
+		'PRODUCT_38'   : '<inventory_root>/system/chassis/motherboard/dimm26',
+		'PRODUCT_39'   : '<inventory_root>/system/chassis/motherboard/dimm27',
+		'PRODUCT_40'   : '<inventory_root>/system/chassis/motherboard/dimm28',
+		'PRODUCT_41'   : '<inventory_root>/system/chassis/motherboard/dimm29',
+		'PRODUCT_42'   : '<inventory_root>/system/chassis/motherboard/dimm30',
+		'PRODUCT_43'   : '<inventory_root>/system/chassis/motherboard/dimm31',
+	},
+	'SENSOR' : {
+		0x35 : '<inventory_root>/system/systemevent',
+		0x36 : '<inventory_root>/system/powerlimit',
+                0x34 : '<inventory_root>/system/chassis/motherboard',
+		0x31 : '<inventory_root>/system/chassis/motherboard/pcielink',
+		0x37 : '<inventory_root>/system/chassis/motherboard/refclock',
+		0x38 : '<inventory_root>/system/chassis/motherboard/pcieclock',
+		0x39 : '<inventory_root>/system/chassis/motherboard/todclock',
+		0x3A : '<inventory_root>/system/chassis/motherboard/apss',
+		0x0c : '<inventory_root>/system/chassis/motherboard/cpu0',
+                0x0e : '<inventory_root>/system/chassis/motherboard/cpu1',
+		0xc8 : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+		0xc9 : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+		0xca : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+		0xcb : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+		0xcc : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+		0xcd : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+		0xce : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+		0xcf : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+		0xd0 : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+		0xd1 : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+		0xd2 : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+		0xd3 : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+                0xd4 : '<inventory_root>/system/chassis/motherboard/cpu1/core0',
+                0xd5 : '<inventory_root>/system/chassis/motherboard/cpu1/core1',
+                0xd6 : '<inventory_root>/system/chassis/motherboard/cpu1/core2',
+                0xd7 : '<inventory_root>/system/chassis/motherboard/cpu1/core3',
+                0xd8 : '<inventory_root>/system/chassis/motherboard/cpu1/core4',
+                0xd9 : '<inventory_root>/system/chassis/motherboard/cpu1/core5',
+                0xda : '<inventory_root>/system/chassis/motherboard/cpu1/core6',
+                0xdb : '<inventory_root>/system/chassis/motherboard/cpu1/core7',
+                0xdc : '<inventory_root>/system/chassis/motherboard/cpu1/core8',
+                0xdd : '<inventory_root>/system/chassis/motherboard/cpu1/core9',
+                0xde : '<inventory_root>/system/chassis/motherboard/cpu1/core10',
+                0xdf : '<inventory_root>/system/chassis/motherboard/cpu1/core11',
+		0x40 : '<inventory_root>/system/chassis/motherboard/membuf0',
+    	        0x41 : '<inventory_root>/system/chassis/motherboard/membuf1',
+       		0x42 : '<inventory_root>/system/chassis/motherboard/membuf2',
+       		0x43 : '<inventory_root>/system/chassis/motherboard/membuf3',
+       		0x44 : '<inventory_root>/system/chassis/motherboard/membuf4',
+                0x45 : '<inventory_root>/system/chassis/motherboard/membuf5',
+                0x46 : '<inventory_root>/system/chassis/motherboard/membuf6',
+                0x47 : '<inventory_root>/system/chassis/motherboard/membuf7',
+		0x10 : '<inventory_root>/system/chassis/motherboard/dimm0',
+		0x11 : '<inventory_root>/system/chassis/motherboard/dimm1',
+		0x12 : '<inventory_root>/system/chassis/motherboard/dimm2',
+		0x13 : '<inventory_root>/system/chassis/motherboard/dimm3',
+                0x14 : '<inventory_root>/system/chassis/motherboard/dimm4',
+                0x15 : '<inventory_root>/system/chassis/motherboard/dimm5',
+                0x16 : '<inventory_root>/system/chassis/motherboard/dimm6',
+                0x17 : '<inventory_root>/system/chassis/motherboard/dimm7',
+                0x18 : '<inventory_root>/system/chassis/motherboard/dimm8',
+                0x19 : '<inventory_root>/system/chassis/motherboard/dimm9',
+                0x1a : '<inventory_root>/system/chassis/motherboard/dimm10',
+                0x1b : '<inventory_root>/system/chassis/motherboard/dimm11',
+                0x1c : '<inventory_root>/system/chassis/motherboard/dimm12',
+                0x1d : '<inventory_root>/system/chassis/motherboard/dimm13',
+                0x1e : '<inventory_root>/system/chassis/motherboard/dimm14',
+                0x1f : '<inventory_root>/system/chassis/motherboard/dimm15',
+                0x20 : '<inventory_root>/system/chassis/motherboard/dimm16',
+                0x21 : '<inventory_root>/system/chassis/motherboard/dimm17',
+                0x22 : '<inventory_root>/system/chassis/motherboard/dimm18',
+                0x23 : '<inventory_root>/system/chassis/motherboard/dimm19',
+                0x24 : '<inventory_root>/system/chassis/motherboard/dimm20',
+                0x25 : '<inventory_root>/system/chassis/motherboard/dimm21',
+                0x26 : '<inventory_root>/system/chassis/motherboard/dimm22',
+                0x27 : '<inventory_root>/system/chassis/motherboard/dimm23',
+                0x28 : '<inventory_root>/system/chassis/motherboard/dimm24',
+                0x29 : '<inventory_root>/system/chassis/motherboard/dimm25',
+                0x2a : '<inventory_root>/system/chassis/motherboard/dimm26',
+                0x2b : '<inventory_root>/system/chassis/motherboard/dimm27',
+                0x2c : '<inventory_root>/system/chassis/motherboard/dimm28',
+                0x2d : '<inventory_root>/system/chassis/motherboard/dimm29',
+                0x2e : '<inventory_root>/system/chassis/motherboard/dimm30',
+                0x2f : '<inventory_root>/system/chassis/motherboard/dimm31',
+		0x09 : '/org/openbmc/sensors/host/BootCount',
+		0x05 : '/org/openbmc/sensors/host/BootProgress',
+		0x04 : '/org/openbmc/sensors/host/HostStatus',
+		0x08 : '/org/openbmc/sensors/host/cpu0/OccStatus',
+		0x0A : '/org/openbmc/sensors/host/cpu1/OccStatus',
+		0x32 : '/org/openbmc/sensors/host/OperatingSystemStatus',
+		0x33 : '/org/openbmc/sensors/host/powercap',
+	},
+	'GPIO_PRESENT' : {
+		'SLOT0_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0_riser',
+		'SLOT1_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1_riser',
+		'SLOT2_RISER_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2_riser',
+		'SLOT0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0',
+		'SLOT1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1',
+		'SLOT2_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot2',
+		'MEZZ0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz0',
+		'MEZZ1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_mezz1',
+	}
+}
+
+GPIO_CONFIG = {}
+GPIO_CONFIG['FSI_CLK']    =   { 'gpio_pin': 'A4', 'direction': 'out' }
+GPIO_CONFIG['FSI_DATA']   =   { 'gpio_pin': 'A5', 'direction': 'out' }
+GPIO_CONFIG['FSI_ENABLE'] =   { 'gpio_pin': 'D0', 'direction': 'out' }
+GPIO_CONFIG['POWER_PIN']  =   { 'gpio_pin': 'E1', 'direction': 'out'  }
+GPIO_CONFIG['CRONUS_SEL'] =   { 'gpio_pin': 'A6', 'direction': 'out'  }
+GPIO_CONFIG['PGOOD']      =   { 'gpio_pin': 'C7', 'direction': 'in'  }
+GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
+GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
+GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
+
+GPIO_CONFIG['IDBTN']       = { 'gpio_pin': 'Q7', 'direction': 'out' }
+GPIO_CONFIG['BMC_THROTTLE']       = { 'gpio_pin': 'J3', 'direction': 'out' }
+GPIO_CONFIG['RESET_BUTTON']       = { 'gpio_pin': 'E2', 'direction': 'both' }
+GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
+
+GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
+GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
+GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
+GPIO_CONFIG['SLOT0_PRESENT'] =         { 'gpio_pin': 'N3', 'direction': 'in' }
+GPIO_CONFIG['SLOT1_PRESENT'] =         { 'gpio_pin': 'N4', 'direction': 'in' }
+GPIO_CONFIG['SLOT2_PRESENT'] =         { 'gpio_pin': 'N5', 'direction': 'in' }
+GPIO_CONFIG['MEZZ0_PRESENT'] =         { 'gpio_pin': 'O0', 'direction': 'in' }
+GPIO_CONFIG['MEZZ1_PRESENT'] =         { 'gpio_pin': 'O1', 'direction': 'in' }
+
+def convertGpio(name):
+	name = name.upper()
+	c = name[0:1]
+	offset = int(name[1:])
+	a = ord(c)-65
+	base = a*8+GPIO_BASE
+	return base+offset
+
+
+HWMON_CONFIG = {
+	'0-004a' :  {
+		'names' : {
+			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
+	},
+	'6-002d' : {
+		'names' : {
+			'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
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
+		}
+	},
+	'6-002e' : {
+		'names' : {
+			'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
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
+		}
+         },
+	'3-0050' : {
+		'names' : {
+			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+		},
+		'labels' : {
+		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
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
+	},
+	'3-0051' : {
+		'labels' :  {
+		'188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+		'199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
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
+	},
+	'4-0010' :  {
+		'names' : {
+			# Barreleye uses 0.25 millioohms sense resistor for adm1278
+			# To convert Iout register value Y to real-world value X, use an equation:
+			# X= 1/m * (Y * 10^-R - b), here m = 800 * R_sense, and R_sense is expressed in milliohms.
+			# The adm1278 driver did the conversion, but the R_sense is set here as a scale factor. 
+			'curr1_input' : { 'object_path' : 'HSCA/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCA/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'5-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCB/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCB/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'6-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCC/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCC/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+}
+
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
diff --git a/data/Firestone.py b/data/Firestone.py
new file mode 100755
index 0000000..4767178
--- /dev/null
+++ b/data/Firestone.py
@@ -0,0 +1,626 @@
+#! /usr/bin/python
+
+HOME_PATH = './'
+CACHE_PATH = '/var/cache/obmc/'
+FLASH_DOWNLOAD_PATH = "/tmp"
+GPIO_BASE = 320
+SYSTEM_NAME = "Firestone"
+
+
+## System states
+##   state can change to next state in 2 ways:
+##   - a process emits a GotoSystemState signal with state name to goto
+##   - objects specified in EXIT_STATE_DEPEND have started
+SYSTEM_STATES = [
+    'BASE_APPS',
+    'BMC_STARTING',
+    'BMC_READY',
+    'HOST_POWERING_ON',
+    'HOST_POWERED_ON',
+    'HOST_BOOTING',
+    'HOST_BOOTED',
+    'HOST_POWERED_OFF',
+]
+
+EXIT_STATE_DEPEND = {
+    'BASE_APPS' : {
+        '/org/openbmc/sensors': 0,
+    },
+    'BMC_STARTING' : {
+        '/org/openbmc/control/chassis0': 0,
+        '/org/openbmc/control/power0' : 0,
+        '/org/openbmc/control/host0' : 0,
+        '/org/openbmc/control/flash/bios' : 0,
+    },
+}
+
+## method will be called when state is entered
+ENTER_STATE_CALLBACK = {
+    'HOST_POWERED_ON' : {
+        'boot' : {
+            'bus_name'    : 'org.openbmc.control.Host',
+            'obj_name'    : '/org/openbmc/control/host0',
+            'interface_name' : 'org.openbmc.control.Host',
+        },
+    },
+    'HOST_POWERED_OFF' : {
+        'setOff' : {
+            'bus_name'   : 'org.openbmc.control.led',
+            'obj_name'   : '/org/openbmc/control/led/identify',
+            'interface_name' : 'org.openbmc.Led',
+        }
+    },
+    'BMC_READY' : {
+        'setOn' : {
+            'bus_name'   : 'org.openbmc.control.led',
+            'obj_name'   : '/org/openbmc/control/led/beep',
+            'interface_name' : 'org.openbmc.Led',
+        },
+        'init' : {
+            'bus_name'   : 'org.openbmc.control.Flash',
+            'obj_name'   : '/org/openbmc/control/flash/bios',
+            'interface_name' : 'org.openbmc.Flash',
+        }
+    }
+}
+
+APPS = {
+    'startup_hacks' : {
+        'system_state'    : 'BASE_APPS',
+        'start_process'   : True,
+        'monitor_process' : False,
+        'process_name'    : 'startup_hacks.sh',
+    },
+    'inventory' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'inventory_items.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'hwmon' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'hwmon.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'sensor_manager' : {
+        'system_state'    : 'BASE_APPS',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'sensor_manager2.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'host_watchdog' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'host_watchdog.exe',
+    },
+    'power_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name' : 'power_control.exe',
+        'args' : [ '3000', '10' ]
+    },
+    'power_button' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'button_power.exe',
+    },
+    'reset_button' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'button_reset.exe',
+    },
+    'led_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'led_controller.exe',
+    },
+    'flash_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'flash_bios.exe',
+    },
+    'bmc_flash_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'bmc_update.py',
+    },
+    'download_manager' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'download_manager.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'host_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'control_host.exe',
+    },
+    'chassis_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'chassis_control.py',
+    },
+    'restore' : {
+        'system_state'    : 'BMC_READY',
+        'start_process'   : True,
+        'monitor_process' : False,
+        'process_name'    : 'discover_system_state.py',
+    },
+    'bmc_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'control_bmc.exe',
+    },
+}
+
+CACHED_INTERFACES = {
+        "org.openbmc.InventoryItem" : True,
+        "org.openbmc.control.Chassis" : True,
+}
+
+INVENTORY_ROOT = '/org/openbmc/inventory'
+
+FRU_INSTANCES = {
+    '<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/bios' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/misc' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
+
+    '<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+
+    '<inventory_root>/system/chassis/motherboard' : { 'fru_type' : 'MAIN_PLANAR','is_fru' : True, },
+
+    '<inventory_root>/system/systemevent'                  : { 'fru_type' : 'SYSTEM_EVENT', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/refclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/pcieclock': { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/todclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/apss'     : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/fan0' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan1' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan2' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan3' : { 'fru_type' : 'FAN','is_fru' : True, },
+
+    '<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 'manufacturer' : 'ASPEED' },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+    '<inventory_root>/system/chassis/motherboard/cpu1' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core10': { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core11': { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu1/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm2' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm3' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm4' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm5' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm6' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm7' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm8' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm9' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm10' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm11' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm12' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm13' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm14' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm15' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm16' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm17' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm18' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm19' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm20' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm21' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm22' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm23' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm24' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm25' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm26' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm27' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm28' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm29' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm30' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm31' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+}
+
+ID_LOOKUP = {
+    'FRU' : {
+        0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x02 : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x03 : '<inventory_root>/system/chassis/motherboard',
+        0x04 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0x05 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0x06 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0x07 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0x08 : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0x09 : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0x0c : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x0d : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x0e : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x0f : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x10 : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x11 : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x12 : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x13 : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x14 : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x15 : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x16 : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x17 : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x18 : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x19 : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x1a : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x1b : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x1c : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x1d : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm31',
+    },
+    'FRU_STR' : {
+        'PRODUCT_0'  : '<inventory_root>/system/bios',
+        'BOARD_1'    : '<inventory_root>/system/chassis/motherboard/cpu0',
+        'BOARD_2'    : '<inventory_root>/system/chassis/motherboard/cpu1',
+        'CHASSIS_3'  : '<inventory_root>/system/chassis/motherboard',
+        'BOARD_3'    : '<inventory_root>/system/misc',
+        'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/membuf0',
+        'BOARD_5'    : '<inventory_root>/system/chassis/motherboard/membuf1',
+        'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/membuf2',
+        'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/membuf3',
+        'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/membuf4',
+        'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/membuf5',
+        'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/membuf6',
+        'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/membuf7',
+        'PRODUCT_12'   : '<inventory_root>/system/chassis/motherboard/dimm0',
+        'PRODUCT_13'   : '<inventory_root>/system/chassis/motherboard/dimm1',
+        'PRODUCT_14'   : '<inventory_root>/system/chassis/motherboard/dimm2',
+        'PRODUCT_15'   : '<inventory_root>/system/chassis/motherboard/dimm3',
+        'PRODUCT_16'   : '<inventory_root>/system/chassis/motherboard/dimm4',
+        'PRODUCT_17'   : '<inventory_root>/system/chassis/motherboard/dimm5',
+        'PRODUCT_18'   : '<inventory_root>/system/chassis/motherboard/dimm6',
+        'PRODUCT_19'   : '<inventory_root>/system/chassis/motherboard/dimm7',
+        'PRODUCT_20'   : '<inventory_root>/system/chassis/motherboard/dimm8',
+        'PRODUCT_21'   : '<inventory_root>/system/chassis/motherboard/dimm9',
+        'PRODUCT_22'   : '<inventory_root>/system/chassis/motherboard/dimm10',
+        'PRODUCT_23'   : '<inventory_root>/system/chassis/motherboard/dimm11',
+        'PRODUCT_24'   : '<inventory_root>/system/chassis/motherboard/dimm12',
+        'PRODUCT_25'   : '<inventory_root>/system/chassis/motherboard/dimm13',
+        'PRODUCT_26'   : '<inventory_root>/system/chassis/motherboard/dimm14',
+        'PRODUCT_27'   : '<inventory_root>/system/chassis/motherboard/dimm15',
+        'PRODUCT_28'   : '<inventory_root>/system/chassis/motherboard/dimm16',
+        'PRODUCT_29'   : '<inventory_root>/system/chassis/motherboard/dimm17',
+        'PRODUCT_30'   : '<inventory_root>/system/chassis/motherboard/dimm18',
+        'PRODUCT_31'   : '<inventory_root>/system/chassis/motherboard/dimm19',
+        'PRODUCT_32'   : '<inventory_root>/system/chassis/motherboard/dimm20',
+        'PRODUCT_33'   : '<inventory_root>/system/chassis/motherboard/dimm21',
+        'PRODUCT_34'   : '<inventory_root>/system/chassis/motherboard/dimm22',
+        'PRODUCT_35'   : '<inventory_root>/system/chassis/motherboard/dimm23',
+        'PRODUCT_36'   : '<inventory_root>/system/chassis/motherboard/dimm24',
+        'PRODUCT_37'   : '<inventory_root>/system/chassis/motherboard/dimm25',
+        'PRODUCT_38'   : '<inventory_root>/system/chassis/motherboard/dimm26',
+        'PRODUCT_39'   : '<inventory_root>/system/chassis/motherboard/dimm27',
+        'PRODUCT_40'   : '<inventory_root>/system/chassis/motherboard/dimm28',
+        'PRODUCT_41'   : '<inventory_root>/system/chassis/motherboard/dimm29',
+        'PRODUCT_42'   : '<inventory_root>/system/chassis/motherboard/dimm30',
+        'PRODUCT_43'   : '<inventory_root>/system/chassis/motherboard/dimm31',
+        'PRODUCT_47'   : '<inventory_root>/system/misc',
+    },
+    'SENSOR' : {
+        0x04 : '/org/openbmc/sensors/host/HostStatus',
+        0x05 : '/org/openbmc/sensors/host/BootProgress',
+        0x08 : '/org/openbmc/sensors/host/cpu0/OccStatus',
+        0x09 : '/org/openbmc/sensors/host/cpu1/OccStatus',
+        0x0c : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x0e : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x2c : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x2d : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x2e : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x2f : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x30 : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x31 : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x32 : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x33 : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x34 : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x35 : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x36 : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x37 : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x38 : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x39 : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x3a : '<inventory_root>/system/chassis/motherboard/dimm31',
+        0x3b : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x3c : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x3d : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x3e : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+        0x3f : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+        0x40 : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+        0x41 : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+        0x42 : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+        0x43 : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+        0x44 : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+        0x45 : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+        0x46 : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+        0x47 : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+        0x48 : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+        0x49 : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+        0x4a : '<inventory_root>/system/chassis/motherboard/cpu1/core0',
+        0x4b : '<inventory_root>/system/chassis/motherboard/cpu1/core1',
+        0x4c : '<inventory_root>/system/chassis/motherboard/cpu1/core2',
+        0x4d : '<inventory_root>/system/chassis/motherboard/cpu1/core3',
+        0x4e : '<inventory_root>/system/chassis/motherboard/cpu1/core4',
+        0x4f : '<inventory_root>/system/chassis/motherboard/cpu1/core5',
+        0x50 : '<inventory_root>/system/chassis/motherboard/cpu1/core6',
+        0x51 : '<inventory_root>/system/chassis/motherboard/cpu1/core7',
+        0x52 : '<inventory_root>/system/chassis/motherboard/cpu1/core8',
+        0x53 : '<inventory_root>/system/chassis/motherboard/cpu1/core9',
+        0x54 : '<inventory_root>/system/chassis/motherboard/cpu1/core10',
+        0x55 : '<inventory_root>/system/chassis/motherboard/cpu1/core11',
+        0x56 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0x57 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0x58 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0x59 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0x5a : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0x5b : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0x5c : '<inventory_root>/system/chassis/motherboard/membuf6',
+        0x5d : '<inventory_root>/system/chassis/motherboard/membuf7',
+        0x5f : '/org/openbmc/sensors/host/BootCount',
+        0x60 : '<inventory_root>/system/chassis/motherboard',
+        0x61 : '<inventory_root>/system/systemevent',
+        0x62 : '<inventory_root>/system/powerlimit',
+        0x63 : '<inventory_root>/system/chassis/motherboard/refclock',
+        0x64 : '<inventory_root>/system/chassis/motherboard/pcieclock',
+        0xb1 : '<inventory_root>/system/chassis/motherboard/todclock',
+        0xb2 : '<inventory_root>/system/chassis/motherboard/apss',
+        0xb3 : '/org/openbmc/sensors/host/powercap',
+        0xb5 : '/org/openbmc/sensors/host/OperatingSystemStatus',
+        0xb6 : '<inventory_root>/system/chassis/motherboard/pcielink',
+    },
+    'GPIO_PRESENT' : {}
+}
+
+GPIO_CONFIG = {}
+GPIO_CONFIG['BMC_POWER_UP'] = \
+        {'gpio_pin': 'D1', 'direction': 'out'}
+GPIO_CONFIG['SYS_PWROK_BUFF'] = \
+        {'gpio_pin': 'D2', 'direction': 'in'}
+GPIO_CONFIG['BMC_WD_CLEAR_PULSE_N'] = \
+        {'gpio_pin': 'N4', 'direction': 'out'}
+GPIO_CONFIG['CM1_OE_R_N'] = \
+        {'gpio_pin': 'Q6', 'direction': 'out'}
+GPIO_CONFIG['BMC_CP0_RESET_N'] = \
+        {'gpio_pin': 'O2', 'direction': 'out'}
+GPIO_CONFIG['BMC_CFAM_RESET_N_R'] = \
+        {'gpio_pin': 'J2', 'direction': 'out'}
+GPIO_CONFIG['PEX8718_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'B6', 'direction': 'out'}
+GPIO_CONFIG['CP0_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N3', 'direction': 'out'}
+GPIO_CONFIG['CP1_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N5', 'direction': 'out'}
+GPIO_CONFIG['IDBTN']       = \
+        { 'gpio_pin': 'Q7', 'direction': 'out' }
+GPIO_CONFIG['FSI_DATA'] = \
+        {'gpio_pin': 'A5', 'direction': 'out'}
+GPIO_CONFIG['FSI_CLK'] = \
+        {'gpio_pin': 'A4', 'direction': 'out'}
+GPIO_CONFIG['FSI_ENABLE'] = \
+        {'gpio_pin': 'D0', 'direction': 'out'}
+GPIO_CONFIG['CRONUS_SEL'] = \
+        {'gpio_pin': 'A6', 'direction': 'out'}
+GPIO_CONFIG['BMC_THROTTLE'] = \
+        {'gpio_pin': 'J3', 'direction': 'out'}
+
+GPIO_CONFIG['POWER_BUTTON'] = \
+        {'gpio_pin': 'E0', 'direction': 'both'}
+GPIO_CONFIG['RESET_BUTTON'] = \
+        {'gpio_pin': 'E4', 'direction': 'both'}
+
+GPIO_CONFIG['PS0_PRES_N'] = \
+        {'gpio_pin': 'P7', 'direction': 'in'}
+GPIO_CONFIG['PS1_PRES_N'] = \
+        {'gpio_pin': 'N0', 'direction': 'in'}
+GPIO_CONFIG['CARD_PRES_N'] = \
+        {'gpio_pin': 'J0', 'direction': 'in'}
+
+
+
+
+def convertGpio(name):
+    name = name.upper()
+    c = name[0:1]
+    offset = int(name[1:])
+    a = ord(c)-65
+    base = a*8+GPIO_BASE
+    return base+offset
+
+
+HWMON_CONFIG = {
+    '4-0050' : {
+        'names' : {
+            'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+        },
+        'labels' : {
+        '176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '102' :  { 'object_path' : 'temperature/dimm0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '103' :  { 'object_path' : 'temperature/dimm1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '104' :  { 'object_path' : 'temperature/dimm2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '105' :  { 'object_path' : 'temperature/dimm3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '106' :  { 'object_path' : 'temperature/dimm4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '107' :  { 'object_path' : 'temperature/dimm5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '108' :  { 'object_path' : 'temperature/dimm6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '109' :  { 'object_path' : 'temperature/dimm7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '110' :  { 'object_path' : 'temperature/dimm8','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '111' :  { 'object_path' : 'temperature/dimm9','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '112' :  { 'object_path' : 'temperature/dimm10','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '113' :  { 'object_path' : 'temperature/dimm11','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '114' :  { 'object_path' : 'temperature/dimm12','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '115' :  { 'object_path' : 'temperature/dimm13','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '116' :  { 'object_path' : 'temperature/dimm14','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '117' :  { 'object_path' : 'temperature/dimm15','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '94' :  { 'object_path' : 'temperature/membuf0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '95' :  { 'object_path' : 'temperature/membuf1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '96' :  { 'object_path' : 'temperature/membuf2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '97' :  { 'object_path' : 'temperature/membuf3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        }
+    },
+    '5-0050' : {
+        'labels' :  {
+        '188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '118' :  { 'object_path' : 'temperature/dimm16','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '119' :  { 'object_path' : 'temperature/dimm17','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '120' :  { 'object_path' : 'temperature/dimm18','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '121' :  { 'object_path' : 'temperature/dimm19','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '122' :  { 'object_path' : 'temperature/dimm20','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '123' :  { 'object_path' : 'temperature/dimm21','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '124' :  { 'object_path' : 'temperature/dimm22','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '125' :  { 'object_path' : 'temperature/dimm23','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '126' :  { 'object_path' : 'temperature/dimm24','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '127' :  { 'object_path' : 'temperature/dimm25','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '128' :  { 'object_path' : 'temperature/dimm26','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '129' :  { 'object_path' : 'temperature/dimm27','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '130' :  { 'object_path' : 'temperature/dimm28','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '131' :  { 'object_path' : 'temperature/dimm29','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '132' :  { 'object_path' : 'temperature/dimm30','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '133' :  { 'object_path' : 'temperature/dimm31','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '98' :  { 'object_path' : 'temperature/membuf4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '99' :  { 'object_path' : 'temperature/membuf5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '100' :  { 'object_path' : 'temperature/membuf6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        }
+    },
+}
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
diff --git a/data/Garrison.py b/data/Garrison.py
new file mode 100755
index 0000000..e8f0927
--- /dev/null
+++ b/data/Garrison.py
@@ -0,0 +1,626 @@
+#! /usr/bin/python
+
+HOME_PATH = './'
+CACHE_PATH = '/var/cache/obmc/'
+FLASH_DOWNLOAD_PATH = "/tmp"
+GPIO_BASE = 320
+SYSTEM_NAME = "Garrison"
+
+
+## System states
+##   state can change to next state in 2 ways:
+##   - a process emits a GotoSystemState signal with state name to goto
+##   - objects specified in EXIT_STATE_DEPEND have started
+SYSTEM_STATES = [
+    'BASE_APPS',
+    'BMC_STARTING',
+    'BMC_READY',
+    'HOST_POWERING_ON',
+    'HOST_POWERED_ON',
+    'HOST_BOOTING',
+    'HOST_BOOTED',
+    'HOST_POWERED_OFF',
+]
+
+EXIT_STATE_DEPEND = {
+    'BASE_APPS' : {
+        '/org/openbmc/sensors': 0,
+    },
+    'BMC_STARTING' : {
+        '/org/openbmc/control/chassis0': 0,
+        '/org/openbmc/control/power0' : 0,
+        '/org/openbmc/control/host0' : 0,
+        '/org/openbmc/control/flash/bios' : 0,
+    },
+}
+
+## method will be called when state is entered
+ENTER_STATE_CALLBACK = {
+    'HOST_POWERED_ON' : {
+        'boot' : {
+            'bus_name'    : 'org.openbmc.control.Host',
+            'obj_name'    : '/org/openbmc/control/host0',
+            'interface_name' : 'org.openbmc.control.Host',
+        },
+    },
+    'HOST_POWERED_OFF' : {
+        'setOff' : {
+            'bus_name'   : 'org.openbmc.control.led',
+            'obj_name'   : '/org/openbmc/control/led/identify',
+            'interface_name' : 'org.openbmc.Led',
+        }
+    },
+    'BMC_READY' : {
+        'setOn' : {
+            'bus_name'   : 'org.openbmc.control.led',
+            'obj_name'   : '/org/openbmc/control/led/beep',
+            'interface_name' : 'org.openbmc.Led',
+        },
+        'init' : {
+            'bus_name'   : 'org.openbmc.control.Flash',
+            'obj_name'   : '/org/openbmc/control/flash/bios',
+            'interface_name' : 'org.openbmc.Flash',
+        }
+    }
+}
+
+APPS = {
+    'startup_hacks' : {
+        'system_state'    : 'BASE_APPS',
+        'start_process'   : True,
+        'monitor_process' : False,
+        'process_name'    : 'startup_hacks.sh',
+    },
+    'inventory' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'inventory_items.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'hwmon' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'hwmon.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'sensor_manager' : {
+        'system_state'    : 'BASE_APPS',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'sensor_manager2.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'host_watchdog' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'host_watchdog.exe',
+    },
+    'power_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name' : 'power_control.exe',
+        'args' : [ '3000', '10' ]
+    },
+    'power_button' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'button_power.exe',
+    },
+    'reset_button' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'button_reset.exe',
+    },
+    'led_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'led_controller.exe',
+    },
+    'flash_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'flash_bios.exe',
+    },
+    'bmc_flash_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'bmc_update.py',
+    },
+    'download_manager' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'download_manager.py',
+        'args'            : [ SYSTEM_NAME ]
+    },
+    'host_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'control_host.exe',
+    },
+    'chassis_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'chassis_control.py',
+    },
+    'restore' : {
+        'system_state'    : 'BMC_READY',
+        'start_process'   : True,
+        'monitor_process' : False,
+        'process_name'    : 'discover_system_state.py',
+    },
+    'bmc_control' : {
+        'system_state'    : 'BMC_STARTING',
+        'start_process'   : True,
+        'monitor_process' : True,
+        'process_name'    : 'control_bmc.exe',
+    },
+}
+
+CACHED_INTERFACES = {
+        "org.openbmc.InventoryItem" : True,
+        "org.openbmc.control.Chassis" : True,
+}
+
+INVENTORY_ROOT = '/org/openbmc/inventory'
+
+FRU_INSTANCES = {
+    '<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/bios' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+    '<inventory_root>/system/misc' : { 'fru_type' : 'SYSTEM','is_fru' : False, },
+
+    '<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, 'present' : "True" },
+
+    '<inventory_root>/system/chassis/motherboard' : { 'fru_type' : 'MAIN_PLANAR','is_fru' : True, },
+
+    '<inventory_root>/system/systemevent'                  : { 'fru_type' : 'SYSTEM_EVENT', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/refclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/pcieclock': { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/todclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/apss'     : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/fan0' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan1' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan2' : { 'fru_type' : 'FAN','is_fru' : True, },
+    '<inventory_root>/system/chassis/fan3' : { 'fru_type' : 'FAN','is_fru' : True, },
+
+    '<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 'manufacturer' : 'ASPEED' },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+    '<inventory_root>/system/chassis/motherboard/cpu1' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu0/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core10': { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu0/core11': { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/cpu1/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/cpu1/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf1' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf2' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf3' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf4' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf5' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf6' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+    '<inventory_root>/system/chassis/motherboard/membuf7' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+
+    '<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm2' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm3' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm4' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm5' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm6' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm7' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm8' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm9' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm10' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm11' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm12' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm13' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm14' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm15' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm16' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm17' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm18' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm19' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm20' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm21' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm22' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm23' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm24' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm25' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm26' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm27' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm28' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm29' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm30' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+    '<inventory_root>/system/chassis/motherboard/dimm31' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+}
+
+ID_LOOKUP = {
+    'FRU' : {
+        0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x02 : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x03 : '<inventory_root>/system/chassis/motherboard',
+        0x04 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0x05 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0x06 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0x07 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0x08 : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0x09 : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0x0c : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x0d : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x0e : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x0f : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x10 : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x11 : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x12 : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x13 : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x14 : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x15 : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x16 : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x17 : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x18 : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x19 : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x1a : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x1b : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x1c : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x1d : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm31',
+    },
+    'FRU_STR' : {
+        'PRODUCT_0'  : '<inventory_root>/system/bios',
+        'BOARD_1'    : '<inventory_root>/system/chassis/motherboard/cpu0',
+        'BOARD_2'    : '<inventory_root>/system/chassis/motherboard/cpu1',
+        'CHASSIS_3'  : '<inventory_root>/system/chassis/motherboard',
+        'BOARD_3'    : '<inventory_root>/system/misc',
+        'BOARD_4'    : '<inventory_root>/system/chassis/motherboard/membuf0',
+        'BOARD_5'    : '<inventory_root>/system/chassis/motherboard/membuf1',
+        'BOARD_6'    : '<inventory_root>/system/chassis/motherboard/membuf2',
+        'BOARD_7'    : '<inventory_root>/system/chassis/motherboard/membuf3',
+        'BOARD_8'    : '<inventory_root>/system/chassis/motherboard/membuf4',
+        'BOARD_9'    : '<inventory_root>/system/chassis/motherboard/membuf5',
+        'BOARD_10'   : '<inventory_root>/system/chassis/motherboard/membuf6',
+        'BOARD_11'   : '<inventory_root>/system/chassis/motherboard/membuf7',
+        'PRODUCT_12'   : '<inventory_root>/system/chassis/motherboard/dimm0',
+        'PRODUCT_13'   : '<inventory_root>/system/chassis/motherboard/dimm1',
+        'PRODUCT_14'   : '<inventory_root>/system/chassis/motherboard/dimm2',
+        'PRODUCT_15'   : '<inventory_root>/system/chassis/motherboard/dimm3',
+        'PRODUCT_16'   : '<inventory_root>/system/chassis/motherboard/dimm4',
+        'PRODUCT_17'   : '<inventory_root>/system/chassis/motherboard/dimm5',
+        'PRODUCT_18'   : '<inventory_root>/system/chassis/motherboard/dimm6',
+        'PRODUCT_19'   : '<inventory_root>/system/chassis/motherboard/dimm7',
+        'PRODUCT_20'   : '<inventory_root>/system/chassis/motherboard/dimm8',
+        'PRODUCT_21'   : '<inventory_root>/system/chassis/motherboard/dimm9',
+        'PRODUCT_22'   : '<inventory_root>/system/chassis/motherboard/dimm10',
+        'PRODUCT_23'   : '<inventory_root>/system/chassis/motherboard/dimm11',
+        'PRODUCT_24'   : '<inventory_root>/system/chassis/motherboard/dimm12',
+        'PRODUCT_25'   : '<inventory_root>/system/chassis/motherboard/dimm13',
+        'PRODUCT_26'   : '<inventory_root>/system/chassis/motherboard/dimm14',
+        'PRODUCT_27'   : '<inventory_root>/system/chassis/motherboard/dimm15',
+        'PRODUCT_28'   : '<inventory_root>/system/chassis/motherboard/dimm16',
+        'PRODUCT_29'   : '<inventory_root>/system/chassis/motherboard/dimm17',
+        'PRODUCT_30'   : '<inventory_root>/system/chassis/motherboard/dimm18',
+        'PRODUCT_31'   : '<inventory_root>/system/chassis/motherboard/dimm19',
+        'PRODUCT_32'   : '<inventory_root>/system/chassis/motherboard/dimm20',
+        'PRODUCT_33'   : '<inventory_root>/system/chassis/motherboard/dimm21',
+        'PRODUCT_34'   : '<inventory_root>/system/chassis/motherboard/dimm22',
+        'PRODUCT_35'   : '<inventory_root>/system/chassis/motherboard/dimm23',
+        'PRODUCT_36'   : '<inventory_root>/system/chassis/motherboard/dimm24',
+        'PRODUCT_37'   : '<inventory_root>/system/chassis/motherboard/dimm25',
+        'PRODUCT_38'   : '<inventory_root>/system/chassis/motherboard/dimm26',
+        'PRODUCT_39'   : '<inventory_root>/system/chassis/motherboard/dimm27',
+        'PRODUCT_40'   : '<inventory_root>/system/chassis/motherboard/dimm28',
+        'PRODUCT_41'   : '<inventory_root>/system/chassis/motherboard/dimm29',
+        'PRODUCT_42'   : '<inventory_root>/system/chassis/motherboard/dimm30',
+        'PRODUCT_43'   : '<inventory_root>/system/chassis/motherboard/dimm31',
+        'PRODUCT_47'   : '<inventory_root>/system/misc',
+    },
+    'SENSOR' : {
+        0x04 : '/org/openbmc/sensors/host/HostStatus',
+        0x05 : '/org/openbmc/sensors/host/BootProgress',
+        0x08 : '/org/openbmc/sensors/host/cpu0/OccStatus',
+        0x09 : '/org/openbmc/sensors/host/cpu1/OccStatus',
+        0x0c : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x0e : '<inventory_root>/system/chassis/motherboard/cpu1',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x22 : '<inventory_root>/system/chassis/motherboard/dimm7',
+        0x23 : '<inventory_root>/system/chassis/motherboard/dimm6',
+        0x24 : '<inventory_root>/system/chassis/motherboard/dimm5',
+        0x25 : '<inventory_root>/system/chassis/motherboard/dimm4',
+        0x26 : '<inventory_root>/system/chassis/motherboard/dimm11',
+        0x27 : '<inventory_root>/system/chassis/motherboard/dimm10',
+        0x28 : '<inventory_root>/system/chassis/motherboard/dimm9',
+        0x29 : '<inventory_root>/system/chassis/motherboard/dimm8',
+        0x2a : '<inventory_root>/system/chassis/motherboard/dimm15',
+        0x2b : '<inventory_root>/system/chassis/motherboard/dimm14',
+        0x2c : '<inventory_root>/system/chassis/motherboard/dimm13',
+        0x2d : '<inventory_root>/system/chassis/motherboard/dimm12',
+        0x2e : '<inventory_root>/system/chassis/motherboard/dimm19',
+        0x2f : '<inventory_root>/system/chassis/motherboard/dimm18',
+        0x30 : '<inventory_root>/system/chassis/motherboard/dimm17',
+        0x31 : '<inventory_root>/system/chassis/motherboard/dimm16',
+        0x32 : '<inventory_root>/system/chassis/motherboard/dimm23',
+        0x33 : '<inventory_root>/system/chassis/motherboard/dimm22',
+        0x34 : '<inventory_root>/system/chassis/motherboard/dimm21',
+        0x35 : '<inventory_root>/system/chassis/motherboard/dimm20',
+        0x36 : '<inventory_root>/system/chassis/motherboard/dimm27',
+        0x37 : '<inventory_root>/system/chassis/motherboard/dimm26',
+        0x38 : '<inventory_root>/system/chassis/motherboard/dimm25',
+        0x39 : '<inventory_root>/system/chassis/motherboard/dimm24',
+        0x3a : '<inventory_root>/system/chassis/motherboard/dimm31',
+        0x3b : '<inventory_root>/system/chassis/motherboard/dimm30',
+        0x3c : '<inventory_root>/system/chassis/motherboard/dimm29',
+        0x3d : '<inventory_root>/system/chassis/motherboard/dimm28',
+        0x3e : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+        0x3f : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+        0x40 : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+        0x41 : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+        0x42 : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+        0x43 : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+        0x44 : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+        0x45 : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+        0x46 : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+        0x47 : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+        0x48 : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+        0x49 : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+        0x4a : '<inventory_root>/system/chassis/motherboard/cpu1/core0',
+        0x4b : '<inventory_root>/system/chassis/motherboard/cpu1/core1',
+        0x4c : '<inventory_root>/system/chassis/motherboard/cpu1/core2',
+        0x4d : '<inventory_root>/system/chassis/motherboard/cpu1/core3',
+        0x4e : '<inventory_root>/system/chassis/motherboard/cpu1/core4',
+        0x4f : '<inventory_root>/system/chassis/motherboard/cpu1/core5',
+        0x50 : '<inventory_root>/system/chassis/motherboard/cpu1/core6',
+        0x51 : '<inventory_root>/system/chassis/motherboard/cpu1/core7',
+        0x52 : '<inventory_root>/system/chassis/motherboard/cpu1/core8',
+        0x53 : '<inventory_root>/system/chassis/motherboard/cpu1/core9',
+        0x54 : '<inventory_root>/system/chassis/motherboard/cpu1/core10',
+        0x55 : '<inventory_root>/system/chassis/motherboard/cpu1/core11',
+        0x56 : '<inventory_root>/system/chassis/motherboard/membuf0',
+        0x57 : '<inventory_root>/system/chassis/motherboard/membuf1',
+        0x58 : '<inventory_root>/system/chassis/motherboard/membuf2',
+        0x59 : '<inventory_root>/system/chassis/motherboard/membuf3',
+        0x5a : '<inventory_root>/system/chassis/motherboard/membuf4',
+        0x5b : '<inventory_root>/system/chassis/motherboard/membuf5',
+        0x5c : '<inventory_root>/system/chassis/motherboard/membuf6',
+        0x5d : '<inventory_root>/system/chassis/motherboard/membuf7',
+        0x5f : '/org/openbmc/sensors/host/BootCount',
+        0x60 : '<inventory_root>/system/chassis/motherboard',
+        0x61 : '<inventory_root>/system/systemevent',
+        0x62 : '<inventory_root>/system/powerlimit',
+        0x63 : '<inventory_root>/system/chassis/motherboard/refclock',
+        0x64 : '<inventory_root>/system/chassis/motherboard/pcieclock',
+        0xb1 : '<inventory_root>/system/chassis/motherboard/todclock',
+        0xb2 : '<inventory_root>/system/chassis/motherboard/apss',
+        0xb3 : '/org/openbmc/sensors/host/powercap',
+        0xb5 : '/org/openbmc/sensors/host/OperatingSystemStatus',
+        0xb6 : '<inventory_root>/system/chassis/motherboard/pcielink',
+    },
+    'GPIO_PRESENT' : {}
+}
+
+GPIO_CONFIG = {}
+GPIO_CONFIG['BMC_POWER_UP'] = \
+        {'gpio_pin': 'D1', 'direction': 'out'}
+GPIO_CONFIG['SYS_PWROK_BUFF'] = \
+        {'gpio_pin': 'D2', 'direction': 'in'}
+GPIO_CONFIG['BMC_WD_CLEAR_PULSE_N'] = \
+        {'gpio_pin': 'N4', 'direction': 'out'}
+GPIO_CONFIG['CM1_OE_R_N'] = \
+        {'gpio_pin': 'Q6', 'direction': 'out'}
+GPIO_CONFIG['BMC_CP0_RESET_N'] = \
+        {'gpio_pin': 'O2', 'direction': 'out'}
+GPIO_CONFIG['BMC_CFAM_RESET_N_R'] = \
+        {'gpio_pin': 'J2', 'direction': 'out'}
+GPIO_CONFIG['PEX8718_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'B6', 'direction': 'out'}
+GPIO_CONFIG['CP0_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N3', 'direction': 'out'}
+GPIO_CONFIG['CP1_DEVICES_RESET_N'] = \
+        {'gpio_pin': 'N5', 'direction': 'out'}
+
+GPIO_CONFIG['FSI_DATA'] = \
+        {'gpio_pin': 'A5', 'direction': 'out'}
+GPIO_CONFIG['FSI_CLK'] = \
+        {'gpio_pin': 'A4', 'direction': 'out'}
+GPIO_CONFIG['FSI_ENABLE'] = \
+        {'gpio_pin': 'D0', 'direction': 'out'}
+GPIO_CONFIG['CRONUS_SEL'] = \
+        {'gpio_pin': 'A6', 'direction': 'out'}
+GPIO_CONFIG['BMC_THROTTLE'] = \
+        {'gpio_pin': 'J3', 'direction': 'out'}
+
+GPIO_CONFIG['IDBTN']       = \
+    { 'gpio_pin': 'Q7', 'direction': 'out' }
+GPIO_CONFIG['POWER_BUTTON'] = \
+        {'gpio_pin': 'E0', 'direction': 'both'}
+GPIO_CONFIG['RESET_BUTTON'] = \
+        {'gpio_pin': 'E4', 'direction': 'both'}
+
+GPIO_CONFIG['PS0_PRES_N'] = \
+        {'gpio_pin': 'P7', 'direction': 'in'}
+GPIO_CONFIG['PS1_PRES_N'] = \
+        {'gpio_pin': 'N0', 'direction': 'in'}
+GPIO_CONFIG['CARD_PRES_N'] = \
+        {'gpio_pin': 'J0', 'direction': 'in'}
+
+
+
+
+def convertGpio(name):
+    name = name.upper()
+    c = name[0:1]
+    offset = int(name[1:])
+    a = ord(c)-65
+    base = a*8+GPIO_BASE
+    return base+offset
+
+
+HWMON_CONFIG = {
+    '4-0050' : {
+        'names' : {
+            'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+            'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+        },
+        'labels' : {
+        '176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '102' :  { 'object_path' : 'temperature/dimm0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '103' :  { 'object_path' : 'temperature/dimm1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '104' :  { 'object_path' : 'temperature/dimm2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '105' :  { 'object_path' : 'temperature/dimm3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '106' :  { 'object_path' : 'temperature/dimm4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '107' :  { 'object_path' : 'temperature/dimm5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '108' :  { 'object_path' : 'temperature/dimm6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '109' :  { 'object_path' : 'temperature/dimm7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '110' :  { 'object_path' : 'temperature/dimm8','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '111' :  { 'object_path' : 'temperature/dimm9','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '112' :  { 'object_path' : 'temperature/dimm10','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '113' :  { 'object_path' : 'temperature/dimm11','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '114' :  { 'object_path' : 'temperature/dimm12','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '115' :  { 'object_path' : 'temperature/dimm13','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '116' :  { 'object_path' : 'temperature/dimm14','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '117' :  { 'object_path' : 'temperature/dimm15','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '94' :  { 'object_path' : 'temperature/membuf0','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '95' :  { 'object_path' : 'temperature/membuf1','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '96' :  { 'object_path' : 'temperature/membuf2','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '97' :  { 'object_path' : 'temperature/membuf3','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        }
+    },
+    '5-0050' : {
+        'labels' :  {
+        '188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
+            'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
+        '118' :  { 'object_path' : 'temperature/dimm16','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '119' :  { 'object_path' : 'temperature/dimm17','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '120' :  { 'object_path' : 'temperature/dimm18','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '121' :  { 'object_path' : 'temperature/dimm19','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '122' :  { 'object_path' : 'temperature/dimm20','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '123' :  { 'object_path' : 'temperature/dimm21','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '124' :  { 'object_path' : 'temperature/dimm22','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '125' :  { 'object_path' : 'temperature/dimm23','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '126' :  { 'object_path' : 'temperature/dimm24','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '127' :  { 'object_path' : 'temperature/dimm25','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '128' :  { 'object_path' : 'temperature/dimm26','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '129' :  { 'object_path' : 'temperature/dimm27','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '130' :  { 'object_path' : 'temperature/dimm28','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '131' :  { 'object_path' : 'temperature/dimm29','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '132' :  { 'object_path' : 'temperature/dimm30','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '133' :  { 'object_path' : 'temperature/dimm31','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '98' :  { 'object_path' : 'temperature/membuf4','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '99' :  { 'object_path' : 'temperature/membuf5','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '100' :  { 'object_path' : 'temperature/membuf6','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        '101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+        }
+    },
+}
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
diff --git a/data/Palmetto.py b/data/Palmetto.py
new file mode 100755
index 0000000..bb4d6f2
--- /dev/null
+++ b/data/Palmetto.py
@@ -0,0 +1,327 @@
+#! /usr/bin/python
+
+HOME_PATH = './'
+CACHE_PATH = '/var/cache/obmc/'
+FLASH_DOWNLOAD_PATH = "/tmp"
+GPIO_BASE = 320
+SYSTEM_NAME = "Palmetto"
+
+
+## System states
+##   state can change to next state in 2 ways:
+##   - a process emits a GotoSystemState signal with state name to goto
+##   - objects specified in EXIT_STATE_DEPEND have started
+SYSTEM_STATES = [
+	'BASE_APPS',
+	'BMC_STARTING',
+	'BMC_READY',
+	'HOST_POWERING_ON',
+	'HOST_POWERED_ON',
+	'HOST_BOOTING',
+	'HOST_BOOTED',
+	'HOST_POWERED_OFF',
+]
+
+EXIT_STATE_DEPEND = {
+	'BASE_APPS' : {
+		'/org/openbmc/sensors': 0,
+	},
+	'BMC_STARTING' : {
+		'/org/openbmc/control/chassis0': 0,
+		'/org/openbmc/control/power0' : 0,
+		'/org/openbmc/control/led/identify' : 0,
+		'/org/openbmc/control/host0' : 0,
+		'/org/openbmc/control/flash/bios' : 0,
+	}
+}
+
+## method will be called when state is entered
+ENTER_STATE_CALLBACK = {
+	'HOST_POWERED_ON' : {
+		'boot' : { 
+			'bus_name'    : 'org.openbmc.control.Host',
+			'obj_name'    : '/org/openbmc/control/host0',
+			'interface_name' : 'org.openbmc.control.Host',
+		}
+	},
+	'BMC_READY' : {
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/identify',
+			'interface_name' : 'org.openbmc.Led',
+		},
+		'init' : {
+			'bus_name'   : 'org.openbmc.control.Flash',
+			'obj_name'   : '/org/openbmc/control/flash/bios',
+			'interface_name' : 'org.openbmc.Flash',
+		},
+	}
+}
+
+APPS = {
+	'startup_hacks' : {
+		'system_state'    : 'BASE_APPS',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'startup_hacks.sh',
+	},
+	'inventory' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'inventory_items.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'pcie_present' : {
+		'system_state'    : 'HOST_POWERED_ON',
+		'start_process'   : False,
+		'monitor_process' : False,
+		'process_name'    : 'pcie_slot_present.exe',
+	},
+	'virtual_sensors' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'hwmon.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'sensor_manager' : {
+		'system_state'    : 'BASE_APPS',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'sensor_manager2.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'host_watchdog' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'host_watchdog.exe',
+	},
+	'power_control' : {	
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name' : 'power_control.exe',
+		'args' : [ '3000', '10' ]
+	},
+	'power_button' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : False,
+		'monitor_process' : False,
+		'process_name'    : 'button_power.exe',
+	},
+	'led_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'led_controller.exe',
+	},
+	'flash_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'flash_bios.exe',
+	},
+	'bmc_flash_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'bmc_update.py',
+	},
+	'download_manager' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'download_manager.py',
+		'args'            : [ SYSTEM_NAME ]
+	},
+	'host_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'control_host.exe',
+	},
+	'chassis_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'chassis_control.py',
+	},
+	'bmc_control' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'control_bmc.exe',
+	}
+}
+
+CACHED_INTERFACES = {
+		"org.openbmc.InventoryItem" : True,
+		"org.openbmc.control.Chassis" : True,
+	}
+INVENTORY_ROOT = '/org/openbmc/inventory'
+
+FRU_INSTANCES = {
+	'<inventory_root>/system' : { 'fru_type' : 'SYSTEM','is_fru' : True, },
+	'<inventory_root>/system/chassis' : { 'fru_type' : 'SYSTEM','is_fru' : True, },
+	'<inventory_root>/system/chassis/motherboard' : { 'fru_type' : 'MAIN_PLANAR','is_fru' : True, },
+
+	'<inventory_root>/system/chassis/fan0' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan1' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan2' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan3' : { 'fru_type' : 'FAN','is_fru' : True, },
+	'<inventory_root>/system/chassis/fan4' : { 'fru_type' : 'FAN','is_fru' : True, },
+
+	'<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 
+			'manufacturer' : 'ASPEED' },
+	'<inventory_root>/system/chassis/motherboard/cpu0' : { 'fru_type' : 'CPU', 'is_fru' : True, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core0' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core1' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core2' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core3' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core4' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core5' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core6' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core7' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core8' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core9' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core10' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/cpu0/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
+
+	
+	'<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+
+	'<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm2' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/motherboard/dimm3' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
+
+	'<inventory_root>/system/chassis/io_board/pcie_slot0' : { 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+	'<inventory_root>/system/chassis/io_board/pcie_slot1' : { 'fru_type' : 'PCIE_CARD', 'is_fru' : True,},
+
+	'<inventory_root>/system/systemevent'                  : { 'fru_type' : 'SYSTEM_EVENT', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/refclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/pcieclock': { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/todclock' : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/apss'     : { 'fru_type' : 'MAIN_PLANAR', 'is_fru' : False, },
+}
+
+ID_LOOKUP = {
+	'FRU' : {
+		0x0d : '<inventory_root>/system/chassis',
+		0x34 : '<inventory_root>/system/chassis/motherboard',
+		0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
+		0x02 : '<inventory_root>/system/chassis/motherboard/membuf0',
+		0x03 : '<inventory_root>/system/chassis/motherboard/dimm0',
+		0x04 : '<inventory_root>/system/chassis/motherboard/dimm1',
+		0x05 : '<inventory_root>/system/chassis/motherboard/dimm2',
+		0x06 : '<inventory_root>/system/chassis/motherboard/dimm3',
+		0x35 : '<inventory_root>/system',
+	},
+	'FRU_STR' : {
+		'PRODUCT_15' : '<inventory_root>/system',
+		'CHASSIS_2' : '<inventory_root>/system/chassis',
+		'BOARD_1'   : '<inventory_root>/system/chassis/motherboard/cpu0',
+		'BOARD_2'   : '<inventory_root>/system/chassis/motherboard/membuf0',
+		'BOARD_14'   : '<inventory_root>/system/chassis/motherboard',
+		'PRODUCT_3'   : '<inventory_root>/system/chassis/motherboard/dimm0',
+		'PRODUCT_4'   : '<inventory_root>/system/chassis/motherboard/dimm1',
+		'PRODUCT_5'   : '<inventory_root>/system/chassis/motherboard/dimm2',
+		'PRODUCT_6'   : '<inventory_root>/system/chassis/motherboard/dimm3',
+	},
+	'SENSOR' : {
+		0x34 : '<inventory_root>/system/chassis/motherboard',
+		0x35 : '<inventory_root>/system/systemevent',
+		0x37 : '<inventory_root>/system/chassis/motherboard/refclock',
+		0x38 : '<inventory_root>/system/chassis/motherboard/pcieclock',
+		0x39 : '<inventory_root>/system/chassis/motherboard/todclock',
+		0x3A : '<inventory_root>/system/chassis/motherboard/apss',
+		0x2f : '<inventory_root>/system/chassis/motherboard/cpu0',
+		0x22 : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+		0x23 : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+		0x24 : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+		0x25 : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+		0x26 : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+		0x27 : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+		0x28 : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+		0x29 : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+		0x2a : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+		0x2b : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+		0x2c : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+		0x2d : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+		0x2e : '<inventory_root>/system/chassis/motherboard/membuf0',
+		0x1e : '<inventory_root>/system/chassis/motherboard/dimm0',
+		0x1f : '<inventory_root>/system/chassis/motherboard/dimm1',
+		0x20 : '<inventory_root>/system/chassis/motherboard/dimm2',
+		0x21 : '<inventory_root>/system/chassis/motherboard/dimm3',
+		0x09 : '/org/openbmc/sensors/host/BootCount',
+		0x05 : '/org/openbmc/sensors/host/BootProgress',
+		0x08 : '/org/openbmc/sensors/host/cpu0/OccStatus',
+		0x32 : '/org/openbmc/sensors/host/OperatingSystemStatus',
+		0x33 : '/org/openbmc/sensors/host/PowerCap',
+	},
+	'GPIO_PRESENT' : {
+		'SLOT0_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot0',
+		'SLOT1_PRESENT' : '<inventory_root>/system/chassis/io_board/pcie_slot1',
+	}
+}
+
+GPIO_CONFIG = {}
+GPIO_CONFIG['FSI_CLK']    =   { 'gpio_pin': 'A4', 'direction': 'out' }
+GPIO_CONFIG['FSI_DATA']   =   { 'gpio_pin': 'A5', 'direction': 'out' }
+GPIO_CONFIG['FSI_ENABLE'] =   { 'gpio_pin': 'D0', 'direction': 'out' }
+GPIO_CONFIG['POWER_PIN']  =   { 'gpio_pin': 'E1', 'direction': 'out'  }
+GPIO_CONFIG['CRONUS_SEL'] =   { 'gpio_pin': 'A6', 'direction': 'out'  }
+GPIO_CONFIG['PGOOD']      =   { 'gpio_pin': 'C7', 'direction': 'in'  }
+GPIO_CONFIG['BMC_THROTTLE'] = { 'gpio_pin': 'J3', 'direction': 'out' }
+GPIO_CONFIG['IDBTN']       = { 'gpio_pin': 'Q7', 'direction': 'out' }
+GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
+GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
+GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
+GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
+GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
+GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
+GPIO_CONFIG['SLOT0_PRESENT'] =         { 'gpio_pin': 'N3', 'direction': 'in' }
+GPIO_CONFIG['SLOT1_PRESENT'] =         { 'gpio_pin': 'N4', 'direction': 'in' }
+GPIO_CONFIG['SLOT2_PRESENT'] =         { 'gpio_pin': 'N5', 'direction': 'in' }
+GPIO_CONFIG['MEZZ0_PRESENT'] =         { 'gpio_pin': 'O0', 'direction': 'in' }
+GPIO_CONFIG['MEZZ1_PRESENT'] =         { 'gpio_pin': 'O1', 'direction': 'in' }
+
+def convertGpio(name):
+	name = name.upper()
+	c = name[0:1]
+	offset = int(name[1:])
+	a = ord(c)-65
+	base = a*8+GPIO_BASE
+	return base+offset
+
+HWMON_CONFIG = {
+	'2-004c' :  {
+		'names' : {
+			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
+		}
+	},
+	'3-0050' : {
+		'names' : {
+			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+		}
+	}
+}
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
diff --git a/data/model.py b/data/model.py
new file mode 100755
index 0000000..13021fd
--- /dev/null
+++ b/data/model.py
@@ -0,0 +1,59 @@
+#!/usr/bin/python -u
+import sys
+from robot.libraries.BuiltIn import BuiltIn
+import imp
+import string
+
+
+
+def get_sensor(module_name, value):
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.ID_LOOKUP['SENSOR']:
+
+		if m.ID_LOOKUP['SENSOR'][i] == value:
+			return i
+
+	return 0xFF
+	
+def get_inventory_sensor (module_name, value):
+	m = imp.load_source('module.name', module_name)
+
+	value = string.replace(value, m.INVENTORY_ROOT, '<inventory_root>')
+
+	for i in m.ID_LOOKUP['SENSOR']:
+
+		if m.ID_LOOKUP['SENSOR'][i] == value:
+			return i
+
+	return 0xFF
+
+
+def get_inventory_list(module_name):
+
+	l = []
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.ID_LOOKUP['FRU']:
+		s = m.ID_LOOKUP['FRU'][i]
+		s = s.replace('<inventory_root>',m.INVENTORY_ROOT)
+		l.append(s)
+
+	return l
+
+def get_inventory_fru_type_list(module_name, fru_type):
+
+	l = []
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.FRU_INSTANCES.keys():
+		if m.FRU_INSTANCES[i]['fru_type'] == fru_type:
+			print 'found one'
+
+			s = i.replace('<inventory_root>',m.INVENTORY_ROOT)
+			l.append(s)
+
+	return l
+
+def call_keyword(keyword):
+    return BuiltIn().run_keyword(keyword)
\ No newline at end of file
diff --git a/data/variables.py b/data/variables.py
new file mode 100644
index 0000000..99705c2
--- /dev/null
+++ b/data/variables.py
@@ -0,0 +1,148 @@
+
+# Here contains a list of valid Properties bases on fru_type after a boot.
+INVENTORY_ITEMS={
+    "CPU": [
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "FRU File ID",
+        "Manufacturer",
+        "Name",
+        "Part Number",
+        "Serial Number",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+
+    "DIMM": [
+        "Asset Tag",
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "FRU File ID",
+        "Manufacturer",
+        "Model Number",
+        "Name",
+        "Serial Number",
+        "Version",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "MEMORY_BUFFER": [
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "FRU File ID",
+        "Manufacturer",
+        "Name",
+        "Part Number",
+        "Serial Number",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "FAN": [
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "DAUGHTER_CARD": [
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "FRU File ID",
+        "Manufacturer",
+        "Name",
+        "Part Number",
+        "Serial Number",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "BMC": [
+        "fault",
+        "fru_type",
+        "is_fru",
+        "manufacturer",
+        "present",
+        "version",
+        ],
+    "MAIN_PLANAR": [
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "Part Number",
+        "Serial Number",
+        "Type",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "SYSTEM": [
+        "Custom Field 1",
+        "Custom Field 2",
+        "Custom Field 3",
+        "Custom Field 4",
+        "Custom Field 5",
+        "Custom Field 6",
+        "Custom Field 7",
+        "Custom Field 8",
+        "FRU File ID",
+        "Manufacturer",
+        "Model Number",
+        "Name",
+        "Serial Number",
+        "Version",
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+    "CORE": [
+        "fault",
+        "fru_type",
+        "is_fru",
+        "present",
+        "version",
+        ],
+}
diff --git a/lib/disable_warning_urllib.py b/lib/disable_warning_urllib.py
new file mode 100644
index 0000000..1082f24
--- /dev/null
+++ b/lib/disable_warning_urllib.py
@@ -0,0 +1,16 @@
+#!/usr/bin/python
+import logging
+import warnings
+import httplib
+
+warnings.filterwarnings("ignore")
+
+# Hijack the HTTP lib logger message and Log only once
+requests_log = logging.getLogger("requests.packages.urllib3")
+requests_log.setLevel(logging.CRITICAL)
+requests_log.propagate = False
+
+class disable_warning_urllib():
+    def do_nothing():
+        return
+
diff --git a/lib/ipmi_client.robot b/lib/ipmi_client.robot
new file mode 100755
index 0000000..e7d96b4
--- /dev/null
+++ b/lib/ipmi_client.robot
@@ -0,0 +1,36 @@
+*** Settings ***
+Documentation           This module is for IPMI client for copying ipmitool to
+...                     openbmc box and execute ipmitool commands.
+
+Resource        ../lib/resource.txt
+
+Library                SSHLibrary
+Library                OperatingSystem
+
+*** Keywords ***
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
+    Copy ipmitool
+
+Run IPMI Command
+    [arguments]    ${args}
+    ${output}   ${stderr}=  Execute Command    /tmp/ipmitool -I dbus raw ${args}  return_stderr=True
+    Should Be Empty 	${stderr}
+    set test variable    ${OUTPUT}     "${output}"
+
+Run IPMI Standard Command
+    [arguments]    ${args}
+    ${stdout}    ${stderr}    ${output}=  Execute Command    /tmp/ipmitool -I dbus ${args}    return_stdout=True    return_stderr= True    return_rc=True
+    Should Be Equal    ${output}    ${0}    msg=${stderr}
+    [return]    ${stdout}
+
+Copy ipmitool
+    OperatingSystem.File Should Exist   tools/ipmitool      msg=The ipmitool program could not be found in the tools directory. It is not part of the automation code by default. You must manually copy or link the correct openbmc version of the tool in to the tools directory in order to run this test suite.
+
+    Import Library      SCPLibrary      WITH NAME       scp
+    scp.Open connection     ${OPENBMC_HOST}     username=${OPENBMC_USERNAME}      password=${OPENBMC_PASSWORD}
+    scp.Put File    tools/ipmitool   /tmp
+    SSHLibrary.Open Connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
+    Execute Command     chmod +x /tmp/ipmitool
diff --git a/lib/pdu/pdu.robot b/lib/pdu/pdu.robot
new file mode 100644
index 0000000..111952e
--- /dev/null
+++ b/lib/pdu/pdu.robot
@@ -0,0 +1,15 @@
+*** Settings ***
+Documentation           Generic PDU library
+
+Resource        ../../lib/resource.txt
+
+*** Keywords ***
+Validate Prereq
+    ${PDU_VAR_LIST} =    Create List    PDU_TYPE    PDU_IP  PDU_USERNAME    PDU_PASSWORD    PDU_SLOT_NO
+    : FOR    ${PDU_VAR}    IN    @{PDU_VAR_LIST}
+    \    Should Not Be Empty    ${${PDU_VAR}}   msg=Unable to find variable ${PDU_VAR}
+
+PDU Power Cycle
+    Validate Prereq
+    Import Resource  ${CURDIR}/../../lib/pdu/${PDU_TYPE}.robot
+    Power Cycle
diff --git a/lib/pdu/synaccess.robot b/lib/pdu/synaccess.robot
new file mode 100644
index 0000000..0810ec3
--- /dev/null
+++ b/lib/pdu/synaccess.robot
@@ -0,0 +1,16 @@
+*** Settings ***
+Documentation           synaccess PDU library
+
+Resource        ../../lib/pdu/pdu.robot
+Library         RequestsLibrary.RequestsKeywords
+
+*** Keywords ***
+Connect and Login
+    Validate Prereq
+    Open Connection     ${PDU_IP}
+    ${auth}=    Create List     ${PDU_USERNAME}    ${PDU_PASSWORD}
+    Create Session    pdu    http://${PDU_IP}   auth=${auth}
+
+Power Cycle
+    Connect and Login
+    ${ret}=    Get Request    pdu    /cmd.cgi?$A4 ${PDU_SLOT_NO}
diff --git a/lib/pythonutil.py b/lib/pythonutil.py
new file mode 100644
index 0000000..29efb78
--- /dev/null
+++ b/lib/pythonutil.py
@@ -0,0 +1,11 @@
+from socket import inet_ntoa
+from struct import pack
+
+
+def calcDottedNetmask(mask):
+    bits = 0
+    for i in xrange(32-mask,32):
+        bits |= (1 << i)
+    packed_value = pack('!I', bits)
+    addr = inet_ntoa(packed_value)
+    return addr
diff --git a/lib/resource.txt b/lib/resource.txt
new file mode 100755
index 0000000..2800581
--- /dev/null
+++ b/lib/resource.txt
@@ -0,0 +1,37 @@
+*** Settings ***
+Library           Collections
+Library           String
+Library           RequestsLibrary.RequestsKeywords
+Library           OperatingSystem
+Variables         ../data/variables.py
+
+*** Variables ***
+${OPENBMC_HOST}    9.3.164.161
+${DBUS_PREFIX}    ${EMPTY}
+${PORT}           ${EMPTY}
+${AUTH_URI}       https://${OPENBMC_HOST}
+${OPENBMC_USERNAME}    root
+${OPENBMC_PASSWORD}    0penBmc
+${MACHINE_TYPE}    palmetto
+${DBUS_POLL_INTERVAL}      15s
+${OPENBMC_REBOOT_TIMEOUT}   ${10}
+
+# PDU related parameters
+${PDU_TYPE}         ${EMPTY}
+${PDU_IP}           ${EMPTY}
+${PDU_USERNAME}     ${EMPTY}
+${PDU_PASSWORD}     ${EMPTY}
+${PDU_SLOT_NO}      ${EMPTY}
+
+*** Keywords ***
+Get Inventory Schema
+    [Arguments]    ${machine}
+    [Return]    &{INVENTORY}[${machine}]
+
+Get Inventory Items Schema
+    [Arguments]    ${machine}
+    [Return]    &{INVENTORY_ITEMS}[${machine}]
+
+Get Sensor Schema
+    [Arguments]    ${machine}
+    [Return]    &{SENSORS}[${machine}]
diff --git a/lib/rest_client.robot b/lib/rest_client.robot
new file mode 100644
index 0000000..bd2db37
--- /dev/null
+++ b/lib/rest_client.robot
@@ -0,0 +1,149 @@
+*** Settings ***
+Library           Collections
+Library           String
+Library           RequestsLibrary.RequestsKeywords
+Library           OperatingSystem
+Resource          ../lib/resource.txt
+Library           ../lib/disable_warning_urllib.py
+
+*** Variables ***
+# Response codes
+${HTTP_CONTINUE}    100
+${HTTP_SWITCHING_PROTOCOLS}    101
+${HTTP_PROCESSING}    102
+${HTTP_OK}        200
+${HTTP_CREATED}    201
+${HTTP_ACCEPTED}    202
+${HTTP_NON_AUTHORITATIVE_INFORMATION}    203
+${HTTP_NO_CONTENT}    204
+${HTTP_RESET_CONTENT}    205
+${HTTP_PARTIAL_CONTENT}    206
+${HTTP_MULTI_STATUS}    207
+${HTTP_IM_USED}    226
+${HTTP_MULTIPLE_CHOICES}    300
+${HTTP_MOVED_PERMANENTLY}    301
+${HTTP_FOUND}     302
+${HTTP_SEE_OTHER}    303
+${HTTP_NOT_MODIFIED}    304
+${HTTP_USE_PROXY}    305
+${HTTP_TEMPORARY_REDIRECT}    307
+${HTTP_BAD_REQUEST}    400
+${HTTP_UNAUTHORIZED}    401
+${HTTP_PAYMENT_REQUIRED}    402
+${HTTP_FORBIDDEN}    403
+${HTTP_NOT_FOUND}    404
+${HTTP_METHOD_NOT_ALLOWED}    405
+${HTTP_NOT_ACCEPTABLE}    406
+${HTTP_PROXY_AUTHENTICATION_REQUIRED}    407
+${HTTP_REQUEST_TIMEOUT}    408
+${HTTP_CONFLICT}    409
+${HTTP_GONE}      410
+${HTTP_LENGTH_REQUIRED}    411
+${HTTP_PRECONDITION_FAILED}    412
+${HTTP_REQUEST_ENTITY_TOO_LARGE}    413
+${HTTP_REQUEST_URI_TOO_LONG}    414
+${HTTP_UNSUPPORTED_MEDIA_TYPE}    415
+${HTTP_REQUESTED_RANGE_NOT_SATISFIABLE}    416
+${HTTP_EXPECTATION_FAILED}    417
+${HTTP_UNPROCESSABLE_ENTITY}    422
+${HTTP_LOCKED}    423
+${HTTP_FAILED_DEPENDENCY}    424
+${HTTP_UPGRADE_REQUIRED}    426
+${HTTP_INTERNAL_SERVER_ERROR}    500
+${HTTP_NOT_IMPLEMENTED}    501
+${HTTP_BAD_GATEWAY}    502
+${HTTP_SERVICE_UNAVAILABLE}    503
+${HTTP_GATEWAY_TIMEOUT}    504
+${HTTP_HTTP_VERSION_NOT_SUPPORTED}    505
+${HTTP_INSUFFICIENT_STORAGE}    507
+${HTTP_NOT_EXTENDED}    510
+
+*** Keywords ***
+OpenBMC Get Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Get    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Get Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+OpenBMC Post Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    ${headers}=     Create Dictionary   Content-Type=application/json
+    set to dictionary   ${kwargs}       headers     ${headers}
+    Log Request    method=Post    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Post Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+OpenBMC Put Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    ${headers}=     Create Dictionary   Content-Type=application/json
+    set to dictionary   ${kwargs}       headers     ${headers}
+    Log Request    method=Put    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Put Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+OpenBMC Delete Request
+    [Arguments]    ${uri}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    Log Request    method=Delete    base_uri=${base_uri}    args=&{kwargs}
+    Initialize OpenBMC
+    ${ret}=    Put Request    openbmc    ${base_uri}    &{kwargs}
+    Log Response    ${ret}
+    [Return]    ${ret}
+
+Initialize OpenBMC
+    Create Session    openbmc    ${AUTH_URI}  timeout=5   max_retries=1
+    ${headers}=     Create Dictionary   Content-Type=application/json
+    @{credentials} =   Create List     ${OPENBMC_USERNAME}      ${OPENBMC_PASSWORD}
+    ${data} =   create dictionary   data=@{credentials}
+    ${resp} =   Post Request    openbmc    /login    data=${data}   headers=${headers}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+Log Request
+    [Arguments]    &{kwargs}
+    ${msg}=    Catenate    SEPARATOR=    URI:    ${AUTH_URI}    ${kwargs["base_uri"]}    , method:
+    ...    ${kwargs["method"]}    , args:    ${kwargs["args"]}
+    Logging    ${msg}    console=True
+
+Log Response
+    [Arguments]    ${resp}
+    ${msg}=    Catenate    SEPARATOR=    Response code:    ${resp.status_code}    , Content:    ${resp.content}
+    Logging    ${msg}    console=True
+
+Logging
+    [Arguments]    ${msg}    ${console}=default False
+    Log    ${msg}    console=True
+
+Read Attribute
+    [arguments]    ${uri}    ${attr}
+    ${resp} =   OpenBMC Get Request    ${uri}/attr/${attr}
+    ${content}=     To Json    ${resp.content}
+    [return]    ${content["data"]}
+
+Write Attribute
+    [Arguments]    ${uri}      ${attr}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    ${resp} =       openbmc put request    ${base_uri}/attr/${attr}     &{kwargs}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}  
+    ${json} =   to json         ${resp.content}
+
+Read Properties
+    [arguments]    ${uri}
+    ${resp} =   OpenBMC Get Request    ${uri}   timeout=10
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${content}=     To Json    ${resp.content}
+    [return]    ${content["data"]}
+
+Call Method
+    [arguments]    ${uri}    ${method}    &{kwargs}
+    ${base_uri}=    Catenate    SEPARATOR=    ${DBUS_PREFIX}    ${uri}
+    ${resp} =       openbmc post request    ${base_uri}/action/${method}     &{kwargs}
+    [return]     ${resp}
diff --git a/lib/utilities.py b/lib/utilities.py
new file mode 100755
index 0000000..95201dc
--- /dev/null
+++ b/lib/utilities.py
@@ -0,0 +1,105 @@
+#!/usr/bin/python -u
+import sys
+from robot.libraries.BuiltIn import BuiltIn
+import imp
+import string
+
+
+def get_sensor(module_name, value):
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.ID_LOOKUP['SENSOR']:
+
+		if m.ID_LOOKUP['SENSOR'][i] == value:
+			return i
+
+	return 0xFF
+	
+
+def get_inventory_sensor (module_name, value):
+	m = imp.load_source('module.name', module_name)
+
+	value = string.replace(value, m.INVENTORY_ROOT, '<inventory_root>')
+
+	for i in m.ID_LOOKUP['SENSOR']:
+
+		if m.ID_LOOKUP['SENSOR'][i] == value:
+			return i
+
+	return 0xFF
+
+
+################################################################
+#  This will return the URI's of the FRU type 
+#
+#  i.e.  get_inventory_list('../data/Palmetto.py')
+#
+#  [/org/openbmc/inventory//system/chassis/motherboard/cpu0/core0,
+#   /org/openbmc/inventory/system/chassis/motherboard/dimm0]
+################################################################
+def get_inventory_list(module_name):
+
+	l = []
+	m = imp.load_source('module.name', module_name)
+
+	
+	for i in m.ID_LOOKUP['FRU']:
+		s = m.ID_LOOKUP['FRU'][i]
+		s = s.replace('<inventory_root>',m.INVENTORY_ROOT)
+		l.append(s)
+	
+	return l
+
+
+################################################################
+#  This will return the URI's of the FRU type 
+#
+#  i.e.  get_inventory_fru_type_list('../data/Barreleye.py', 'CPU')
+#
+#  [/org/openbmc/inventory//system/chassis/motherboard/cpu0,
+#   /org/openbmc/inventory//system/chassis/motherboard/cpu1]
+################################################################
+def  get_inventory_fru_type_list(module_name, fru):
+	l = []
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.FRU_INSTANCES.keys():
+		if m.FRU_INSTANCES[i]['fru_type'] == fru:
+			s = i.replace('<inventory_root>',m.INVENTORY_ROOT)
+			l.append(s)
+	
+	return l
+
+
+################################################################
+#  This will return the URI's of the FRU type that contain VPD
+#
+#  i.e.  get_vpd_inventory_list('../data/Palmetto.py', 'DIMM')
+#
+#  [/org/openbmc/inventory/system/chassis/motherboard/dimm0,
+#   /org/openbmc/inventory/system/chassis/motherboard/dimm1]
+################################################################
+def  get_vpd_inventory_list(module_name, fru):
+	l = []
+	m = imp.load_source('module.name', module_name)
+
+	for i in m.ID_LOOKUP['FRU_STR']:
+		x = m.ID_LOOKUP['FRU_STR'][i]
+
+		if m.FRU_INSTANCES[x]['fru_type'] == fru:
+			s = x.replace('<inventory_root>',m.INVENTORY_ROOT)
+			l.append(s)
+	
+	return l
+
+
+def call_keyword(keyword):
+    return BuiltIn().run_keyword(keyword)
+
+
+def main():
+	print get_vpd_inventory_list('../data/Palmetto.py', 'DIMM')
+
+
+if __name__ == "__main__":
+   main()
\ No newline at end of file
diff --git a/lib/utils.robot b/lib/utils.robot
new file mode 100644
index 0000000..2d45f49
--- /dev/null
+++ b/lib/utils.robot
@@ -0,0 +1,54 @@
+*** Settings ***
+Resource                ../lib/resource.txt
+Resource                ../lib/rest_client.robot
+
+Library                 OperatingSystem
+
+*** Variables ***
+${SYSTEM_SHUTDOWN_TIME}       ${5}
+
+*** Keywords ***
+
+Wait For Host To Ping
+    [Arguments]     ${host}
+    Wait Until Keyword Succeeds     ${OPENBMC_REBOOT_TIMEOUT}min    5 sec   Ping Host   ${host}
+
+Ping Host
+    [Arguments]     ${host}
+    ${RC}   ${output} =     Run and return RC and Output    ping -c 4 ${host}
+    Log     RC: ${RC}\nOutput:\n${output}
+    Should be equal     ${RC}   ${0}
+
+Get Boot Progress
+    ${state} =     Read Attribute    /org/openbmc/sensors/host/BootProgress    value
+    [return]  ${state}
+
+Is Power On
+    ${state} =    Get Boot Progress
+    Should be equal   ${state}     FW Progress, Starting OS
+
+Is Power Off
+    ${state} =    Get Boot Progress
+    Should be equal   ${state}     Off
+
+Power On Host
+    @{arglist}=   Create List
+    ${args}=     Create Dictionary    data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/control/chassis0/    powerOn    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    Wait Until Keyword Succeeds	  3 min    	10 sec    Is Power On
+
+Power Off Host
+    @{arglist}=   Create List
+    ${args}=     Create Dictionary    data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/control/chassis0/    powerOff   data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    Wait Until Keyword Succeeds	  1 min    	10 sec    Is Power Off
+
+Trigger Warm Reset
+    log to console    "Triggering warm reset"
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    /org/openbmc/control/bmc0/action/warmReset     data=${data}
+    Should Be Equal As Strings      ${resp.status_code}     ${HTTP_OK}
+    Sleep   ${SYSTEM_SHUTDOWN_TIME}min
+    Wait For Host To Ping   ${OPENBMC_HOST}
diff --git a/requirements.txt b/requirements.txt
new file mode 100644
index 0000000..b439d0b
--- /dev/null
+++ b/requirements.txt
@@ -0,0 +1,5 @@
+robotframework
+requests
+robotframework-requests>=0.3.9
+robotframework-sshlibrary
+robotframework-scplibrary
\ No newline at end of file
diff --git a/tests/data.json b/tests/data.json
new file mode 100755
index 0000000..7bfd886
--- /dev/null
+++ b/tests/data.json
@@ -0,0 +1 @@
+{"two": 2, "one": 1}
diff --git a/tests/security/test_ssl.robot b/tests/security/test_ssl.robot
new file mode 100644
index 0000000..7bcab5e
--- /dev/null
+++ b/tests/security/test_ssl.robot
@@ -0,0 +1,38 @@
+*** Settings ***
+Documentation     This testsuite is for testing SSL connection to OpenBMC
+Suite Teardown    Delete All Sessions
+
+Resource          ../../lib/rest_client.robot
+Resource          ../../lib/resource.txt
+
+Library           RequestsLibrary.RequestsKeywords
+
+*** Test Cases ***
+Test SSL Connection
+    [Documentation]     This testcase is for testing the SSL connection to the
+    ...     OpenBMC machine.
+    Create Session    openbmc    https://${OPENBMC_HOST}/
+    ${headers}=     Create Dictionary   Content-Type=application/json
+    @{credentials} =   Create List     ${OPENBMC_USERNAME}      ${OPENBMC_PASSWORD}
+    ${data} =   create dictionary   data=@{credentials}
+    ${resp} =   Post Request    openbmc    /login    data=${data}   headers=${headers}
+    ${resp}=    Get Request    openbmc   /list
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata}=    To Json    ${resp.content}
+    Should Not Be Empty     ${jsondata}
+
+Test non-SSL Connection to port 80
+    [Documentation]     This testcase is for test to check OpenBMC machine
+    ...     will not accepts the non-secure connection that is with http to
+    ...     port 80 and expect a connection error
+    Create Session    openbmc    http://${OPENBMC_HOST}/    timeout=3
+    Run Keyword And Expect Error    ConnectTimeout*   Get Request    openbmc   /list
+
+Test non-SSL Connection to port 443
+    [Documentation]     This testcase is for test to check OpenBMC machine
+    ...     will not accepts the non-secure connection that is with http to
+    ...     port 443 and expect 400 in response
+    Create Session    openbmc    http://${OPENBMC_HOST}:443/
+    ${resp}=    Get Request    openbmc   /list
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_BAD_REQUEST}
+    Should Be Equal     ${resp.content}     Bad Request
diff --git a/tests/test_ac_cycles.robot b/tests/test_ac_cycles.robot
new file mode 100644
index 0000000..927a354
--- /dev/null
+++ b/tests/test_ac_cycles.robot
@@ -0,0 +1,25 @@
+*** Settings ***
+
+Documentation   This testsuite is for testing file corruption on hard power cycle
+
+Resource        ../lib/pdu/pdu.robot
+Resource        ../lib/utils.robot
+
+Library         SSHLibrary
+
+*** Test Cases ***
+Test openbmc buster
+    [Tags]      reboot_tests
+    Open Connection And Log In
+    ${output}=  Execute Command    find /var/lib -type f |xargs -n 1 touch
+    PDU Power Cycle
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    Sleep   1min
+    Open Connection And Log In
+    ${stdout}   ${stderr}   ${rc}=  Execute Command     echo "hello world"    return_stderr=True  return_rc=True
+    Should Be Equal As Integers    ${rc}    ${0}
+
+*** Keywords ***
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}   ${OPENBMC_PASSWORD}
diff --git a/tests/test_association.robot b/tests/test_association.robot
new file mode 100755
index 0000000..b4422d5
--- /dev/null
+++ b/tests/test_association.robot
@@ -0,0 +1,219 @@
+*** Settings ***
+Documentation          This suite is used for testing eventlog association.
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/utils.robot
+
+Library         BuiltIn
+Library         Collections
+Library         SSHLibrary
+
+*** Variables ***
+
+${SYSTEM_SHUTDOWN_TIME}           1min
+
+${WAIT_FOR_SERVICES_UP}           3min
+
+${CREATE_ERROR_SINGLE_FRU}        busctl call org.openbmc.records.events /org/openbmc/records/events org.openbmc.recordlog acceptHostMessage sssay "Error" "Testing failure" "/org/openbmc/inventory/system/chassis/motherboard/dimm1" 1 1
+
+${CREATE_ERROR_INVALID_FRU}       busctl call org.openbmc.records.events /org/openbmc/records/events org.openbmc.recordlog acceptHostMessage sssay "Error" "Testing with invalid FRU" "abc" 1 1
+
+${CREATE_ERROR_NO_FRU}            busctl call org.openbmc.records.events /org/openbmc/records/events org.openbmc.recordlog acceptHostMessage sssay "Error" "Testing with no fru" "" 1 1
+
+${CREATE_ERROR_VIRTUAL_SENSOR}    busctl call org.openbmc.records.events /org/openbmc/records/events org.openbmc.recordlog acceptHostMessage sssay "Error" "Testing with a virtual sensor" "/org/openbmc/inventory/system/systemevent " 1 1
+
+${DIMM1_URI}                      /org/openbmc/inventory/system/chassis/motherboard/dimm1
+
+${DIMM2_URI}                      /org/openbmc/inventory/system/chassis/motherboard/dimm2
+
+${DIMM3_URI}                      /org/openbmc/inventory/system/chassis/motherboard/dimm3
+
+&{NIL}                            data=@{EMPTY}
+
+*** Test Cases ***
+
+Create error log on single FRU
+    [Documentation]     ***GOOD PATH***
+    ...                 Create an error log on single FRU and verify
+    ...                 its association.\n
+
+    Clear all logs
+
+    Open Connection And Log In
+    ${output}=      Execute Command    ${CREATE_ERROR_SINGLE_FRU}
+
+    ${log_list} =     Get EventList
+    ${association_uri} =    catenate    SEPARATOR=   ${log_list[0]}   /fru
+
+    ${association_content} =     Read Attribute    ${association_uri}    endpoints
+    Should Contain     ${association_content}    ${DIMM1_URI}
+
+    ${dimm1_event} =     Read Attribute     ${DIMM1_URI}/event   endpoints
+    Should Contain     ${dimm1_event}    ${log_list[0]}
+
+
+Create error log on two FRU
+    [Documentation]     ***GOOD PATH***
+    ...                 Create an error log on two FRUs and verify
+    ...                 its association.\n
+
+    ${log_uri} =      Create a test log
+    ${association_uri} =    catenate    SEPARATOR=   ${log_uri}   /fru
+
+    ${association_content} =     Read Attribute    ${association_uri}    endpoints
+    Should Contain     ${association_content}    ${DIMM3_URI}
+    Should Contain     ${association_content}    ${DIMM2_URI}
+
+    ${dimm3_event} =     Read Attribute     ${DIMM3_URI}/event   endpoints
+    Should Contain     ${dimm3_event}    ${log_uri}
+
+    ${dimm2_event} =     Read Attribute     ${DIMM2_URI}/event   endpoints
+    Should Contain     ${dimm2_event}    ${log_uri}
+
+
+Create multiple error logs
+    [Documentation]     ***GOOD PATH***
+    ...                 Create multiple error logs and verify 
+    ...                 their association.\n
+
+    : FOR    ${INDEX}    IN RANGE    1    4
+        \    Log    ${INDEX}
+        \    ${log_uri} =      Create a test log
+        \    ${association_uri} =    catenate    SEPARATOR=   ${log_uri}   /fru
+
+        \    ${association_content} =     Read Attribute    ${association_uri}    endpoints
+        \    Should Contain     ${association_content}    ${DIMM3_URI}
+        \    Should Contain     ${association_content}    ${DIMM2_URI}
+
+        \    ${dimm3_event} =     Read Attribute     ${DIMM3_URI}/event   endpoints
+        \    Should Contain     ${dimm3_event}    ${log_uri}
+
+        \    ${dimm2_event} =     Read Attribute     ${DIMM2_URI}/event   endpoints
+        \    Should Contain     ${dimm2_event}    ${log_uri}
+
+
+Delete error log
+    [Documentation]     ***BAD PATH***
+    ...                 Delete an error log and verify that its 
+    ...                 association is also removed.\n
+
+    ${log_uri1} =      Create a test log
+    ${association_uri1} =    catenate    SEPARATOR=   ${log_uri1}   /fru
+
+    ${log_uri2} =      Create a test log
+
+    ${del_uri} =  catenate    SEPARATOR=   ${log_uri1}   /action/delete
+    ${resp} =    openbmc post request     ${del_uri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+    ${resp} =     openbmc get request     ${association_uri1}
+    ${jsondata} =    to json    ${resp.content}
+    Should Contain     ${jsondata['message']}    404 Not Found
+
+    ${dimm3_event} =     Read Attribute      ${DIMM3_URI}/event   endpoints
+    Should Not Contain     ${dimm3_event}    ${log_uri1}
+
+    ${dimm2_event} =     Read Attribute      ${DIMM2_URI}/event   endpoints
+    Should Not Contain     ${dimm2_event}    ${log_uri1}
+
+
+Association with invalid FRU
+    [Documentation]     ***BAD PATH***
+    ...                 Create an error log on invalid FRU and verify 
+    ...                 that its does not have any association.\n
+
+    Clear all logs
+
+    Open Connection And Log In
+    ${output}=      Execute Command    ${CREATE_ERROR_INVALID_FRU}
+    ${log_list} =     Get EventList
+    ${association_uri} =    catenate    SEPARATOR=   ${log_list[0]}   /fru
+
+    ${resp} =     openbmc get request     ${association_uri}
+    ${jsondata} =    to json    ${resp.content}
+    Should Contain     ${jsondata['message']}    404 Not Found
+
+
+Assocition with no FRU error event
+    [Documentation]     ***BAD PATH***
+    ...                 Create an error log on no FRU and verify
+    ...                 that its does not have any association.\n
+
+    Clear all logs
+
+    Open Connection And Log In
+    ${output}=      Execute Command    ${CREATE_ERROR_NO_FRU}
+    ${log_list} =     Get EventList
+    ${association_uri} =    catenate    SEPARATOR=   ${log_list[0]}   /fru
+
+    ${resp} =     openbmc get request     ${association_uri}
+    ${jsondata} =    to json    ${resp.content}
+    Should Contain     ${jsondata['message']}    404 Not Found
+
+
+Association with virtual sensor
+    [Documentation]     ***GOOD PATH***
+    ...                 Create an error log on virtual sensor and
+    ...                 verify its association.\n
+
+    Clear all logs
+
+    Open Connection And Log In
+    ${output}=      Execute Command    ${CREATE_ERROR_VIRTUAL_SENSOR}
+    ${log_list} =     Get EventList
+    ${association_uri} =    catenate    SEPARATOR=   ${log_list[0]}   /fru
+
+    ${association_content} =     Read Attribute    ${association_uri}    endpoints
+    Should Contain     ${association_content}    /org/openbmc/inventory/system/systemevent
+
+Association unchanged after reboot
+    [Documentation]     ***GOOD PATH***
+    ...                 This test case is to verify that error log association
+    ...                 does not change after open bmc reboot.\n
+
+    ${pre_reboot_log_uri} =      Create a test log
+    ${association_uri} =    catenate    SEPARATOR=   ${pre_reboot_log_uri}   /fru
+    ${pre_reboot_association_content} =     Read Attribute    ${association_uri}    endpoints
+
+    Open Connection And Log In
+    ${output}=      Execute Command    /sbin/reboot
+    Sleep   ${SYSTEM_SHUTDOWN_TIME}
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    Sleep   ${WAIT_FOR_SERVICES_UP}
+
+    ${post_reboot_association_content} =     Read Attribute    ${association_uri}    endpoints
+    Should Be Equal        ${pre_reboot_association_content}    ${pre_reboot_association_content}
+
+    ${post_reboot_dimm3_event} =     Read Attribute      ${DIMM3_URI}/event   endpoints
+    Should Contain     ${post_reboot_dimm3_event}    ${pre_reboot_log_uri}
+    ${post_reboot_dimm2_event} =     Read Attribute      ${DIMM2_URI}/event   endpoints
+    Should Contain     ${post_reboot_dimm2_event}    ${pre_reboot_log_uri}
+
+*** Keywords ***
+
+Get EventList
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    should be equal as strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['data']}
+
+Create a test log
+    [arguments]
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/acceptTestMessage    data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    ${LOGID} =    convert to integer    ${json['data']}
+    ${uri}=     catenate    SEPARATOR=   /org/openbmc/records/events/   ${LOGID}
+    [return]  ${uri}
+
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
+
+Clear all logs
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/clear    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    ${json} =   to json         ${resp.content}
+    Should Be Empty     ${json['data']}
diff --git a/tests/test_boot.robot b/tests/test_boot.robot
new file mode 100644
index 0000000..d5dd469
--- /dev/null
+++ b/tests/test_boot.robot
@@ -0,0 +1,161 @@
+*** Settings ***
+
+Documentation   This testsuite is for testing the Boot Device Functions
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/ipmi_client.robot
+
+Suite Setup     Open Connection And Log In
+Suite Teardown  Close All Connections
+
+*** Test Cases ***
+
+Set the Boot Device as Default using REST API
+   [Documentation]   This testcase is to set the boot device as Default using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   Default
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   Default
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   No override
+    
+Set the Boot Device as Default using ipmitool
+   [Documentation]   This testcase is to set the boot device as Default using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x00 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   Default
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   No override
+    
+Set the Boot Device as Network using REST API
+   [Documentation]   This testcase is to set the boot device as Network using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   Network
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   Network
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force PXE
+    
+Set the Boot Device as Network using ipmitool
+   [Documentation]   This testcase is to set the boot device as Network using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x04 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   Network
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force PXE
+    
+Set the Boot Device as Disk using REST API
+   [Documentation]   This testcase is to set the boot device as Disk using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   Disk
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   Disk
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from default Hard-Drive
+    
+Set the Boot Device as Disk using ipmitool
+   [Documentation]   This testcase is to set the boot device as Disk using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x08 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   Disk
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from default Hard-Drive
+    
+Set the Boot Device as Safe using REST API
+   [Documentation]   This testcase is to set the boot device as Safe using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   Safe
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   Safe
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from default Hard-Drive, request Safe-Mode
+    
+Set the Boot Device as Safe using ipmitool
+   [Documentation]   This testcase is to set the boot device as Safe using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x0C 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   Safe
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from default Hard-Drive, request Safe-Mode
+
+Set the Boot Device as CDROM using REST API
+   [Documentation]   This testcase is to set the boot device as CDROM using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   CDROM
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   CDROM
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from CD/DVD
+    
+Set the Boot Device as CDROM using ipmitool
+   [Documentation]   This testcase is to set the boot device as CDROM using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x14 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   CDROM
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot from CD/DVD
+    
+Set the Boot Device as Setup using REST API
+   [Documentation]   This testcase is to set the boot device as Setup using REST
+   ...               URI. The Boot device is read using REST API and ipmitool.
+   
+    ${bootDevice} =   Set Variable   Setup
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
+    Read the Attribute  /org/openbmc/settings/host0    boot_flags
+    Response Should Be Equal   Setup
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot into BIOS Setup
+    
+Set the Boot Device as Setup using ipmitool
+   [Documentation]   This testcase is to set the boot device as Setup using
+   ...               ipmitool. The Boot device is read using REST API and
+   ...               ipmitool.
+   
+    Run IPMI command   0x0 0x8 0x05 0x80 0x18 0x00 0x00 0x00
+    Read the Attribute   /org/openbmc/settings/host0   boot_flags
+    Response Should Be Equal   Setup
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Force Boot into BIOS Setup
+
+*** Keywords ***
+
+Response Should Be Equal
+    [arguments]    ${args}
+    Should Be Equal    ${OUTPUT}    ${args}
+
+Read the Attribute     
+    [arguments]    ${uri}    ${parm}
+    ${output} =     Read Attribute      ${uri}    ${parm}
+    set test variable    ${OUTPUT}     ${output}
+
diff --git a/tests/test_bootpolicy.robot b/tests/test_bootpolicy.robot
new file mode 100644
index 0000000..b6528c7
--- /dev/null
+++ b/tests/test_bootpolicy.robot
@@ -0,0 +1,136 @@
+*** Settings ***
+
+Documentation   This testsuite is for testing boot policy function.
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/ipmi_client.robot
+Resource        ../lib/utils.robot
+
+Suite Setup     Open Connection And Log In
+Suite Teardown  Close All Connections
+
+
+*** Variables ***
+${SYSTEM_SHUTDOWN_TIME}       ${5}
+${WAIT_FOR_POWER_OPERATION}   30sec
+
+*** Test Cases ***
+
+Set Onetime boot policy using REST
+    [Documentation]   This testcase is to set onetime boot policy using REST
+    ...               URI and then verify using REST API and ipmitool.\n
+ 
+    Set Boot Policy   ONETIME
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    ONETIME
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Options apply to only next boot
+
+Set Permanent boot policy using REST
+    [Documentation]   This testcase is to set permanent boot policy using REST
+    ...               URI and then verify using REST API and ipmitool.\n
+
+    Set Boot Policy   PERMANENT
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    PERMANENT
+    ${output} =    Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Options apply to all future boots
+
+Set Onetime boot policy using IPMITOOL
+    [Documentation]   This testcase is to set boot policy to onetime boot using ipmitool
+    ...               and then verify using REST URI and ipmitool.\n
+
+    Run IPMI command   0x0 0x8 0x05 0x80 0x00 0x00 0x00 0x00
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    ONETIME
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Options apply to only next boot
+ 
+Set Permanent boot policy using IPMITOOL
+    [Documentation]   This testcase is to set boot policy to permanent using ipmitool
+    ...               and then verify using REST URI and ipmitool.
+
+    Run IPMI command   0x0 0x8 0x05 0xC0 0x00 0x00 0x00 0x00
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    PERMANENT
+    ${output} =   Run IPMI Standard command   chassis bootparam get 5
+    Should Contain   ${output}   Options apply to all future boots
+
+Boot order with permanent boot policy
+    [Documentation]   This testcase is to verify that boot order does not change
+    ...               after first boot when boot policy set to permanent
+
+    Power Off Host
+
+    Set Boot Policy   PERMANENT
+
+    Set Boot Device   CDROM
+
+    Power On Host
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    PERMANENT
+
+    ${flag} =   Read Attribute  /org/openbmc/settings/host0    boot_flags
+    Should Be Equal    ${flag}    CDROM
+
+Onetime boot order after warm reset
+    [Documentation]   This testcase is to verify that boot policy and order does not change
+    ...               after warm reset on a system with onetime boot policy.
+
+    Power On Host
+
+    Set Boot Policy   ONETIME
+
+    Set Boot Device   Network
+
+    Trigger Warm Reset
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    ONETIME
+
+    ${flag} =   Read Attribute  /org/openbmc/settings/host0    boot_flags
+    Should Be Equal    ${flag}    Network
+
+Permanent boot order after warm reset
+    [Documentation]   This testcase is to verify that boot policy and order does not change  
+    ...               after warm reset on a system with permanent boot policy.
+
+    Power On Host
+
+    Set Boot Policy   PERMANENT
+
+    Set Boot Device   CDROM
+
+    Trigger Warm Reset
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Equal    ${boot}    PERMANENT
+
+    ${flag} =   Read Attribute  /org/openbmc/settings/host0    boot_flags
+    Should Be Equal    ${flag}    CDROM
+ 
+Set boot policy to invalid value
+    [Documentation]   This testcase is to verify that proper error message is prompted  
+    ...               when invalid value to provided to boot policy.
+   
+    Set Boot Policy   abc
+
+    ${boot} =   Read Attribute  /org/openbmc/settings/host0    boot_policy
+    Should Be Not Equal    ${boot}    abc
+    
+*** Keywords ***
+
+Set Boot Policy
+    [Arguments]    ${args}
+    ${bootpolicy} =   Set Variable   ${args}
+    ${valueDict} =   create dictionary   data=${bootpolicy}
+    Write Attribute    /org/openbmc/settings/host0   boot_policy   data=${valueDict}
+
+Set Boot Device
+    [Arguments]    ${args}
+    ${bootDevice} =   Set Variable   ${args}
+    ${valueDict} =   create dictionary   data=${bootDevice}
+    Write Attribute    /org/openbmc/settings/host0   boot_flags   data=${valueDict}
diff --git a/tests/test_esel.robot b/tests/test_esel.robot
new file mode 100644
index 0000000..50c9267
--- /dev/null
+++ b/tests/test_esel.robot
@@ -0,0 +1,61 @@
+*** Settings ***
+
+Documentation   This suite is for testing esel's mechanism of checking Reservation_ID.
+
+Resource        ../lib/ipmi_client.robot
+
+Suite Setup            Open Connection And Log In
+Suite Teardown         Close All Connections
+
+*** Test Cases ***
+
+Test Wrong Reservation_ID
+   [Documentation]   This testcase is to test BMC can handle multi-requestor's
+   ...               oem partial add command with incorrect reservation id.
+   ...               It simulates sending partial add command with fake content
+   ...                and wrong Reservation ID. This command will be rejected.
+   
+    ${rev_id_1} =    Run IPMI Command Returned   0x0a 0x42
+    ${rev_id_ls} =   Get Substring   ${rev_id_1}   1   3
+    ${rev_id_ms} =   Get Substring   ${rev_id_1}   -2
+    Run IPMI command   0x0a 0x42
+    ${output} =      Check IPMI Oempartialadd Reject   0x32 0xf0 0x${rev_id_ls} 0x${rev_id_ms} 0 0 0 0 0 1 2 3 4 5 6 7 8 9 0xa 0xb 0xc 0xd 0xe 0xf
+    Should Contain   ${output}   Reservation cancelled
+
+Test Correct Reservation_ID
+   [Documentation]   This testcase is to test BMC can handle multi-requestor's
+   ...               oem partial add command with correct reservation id. It
+   ...                simulates sending partial add command with fake content
+   ...               and correct Reservation ID. This command will be accepted.
+   
+    Run IPMI command   0x0a 0x42
+    ${rev_id_2} =    Run IPMI Command Returned   0x0a 0x42
+    ${rev_id_ls} =   Get Substring   ${rev_id_2}   1   3
+    ${rev_id_ms} =   Get Substring   ${rev_id_2}   -2
+    ${output} =      Check IPMI Oempartialadd Accept   0x32 0xf0 0x${rev_id_ls} 0x${rev_id_ms} 0 0 0 0 0 1 2 3 4 5 6 7 8 9 0xa 0xb 0xc 0xd 0xe 0xf
+    Should Be Empty    ${output}
+
+Clear Test File
+   [Documentation]   Clear /tmp/esel
+   
+   Execute Command   rm /tmp/esel
+   Execute Command   sync
+
+*** Keywords ***
+
+Run IPMI Command Returned
+    [arguments]    ${args}
+    ${output_1} =    Execute Command    /tmp/ipmitool -I dbus raw ${args}
+    [return]    ${output_1}
+
+Check IPMI Oempartialadd Reject
+    [arguments]    ${args}
+    ${stdout}    ${stderr}    ${output_2}=  Execute Command    /tmp/ipmitool -I dbus raw ${args}    return_stdout=True    return_stderr= True    return_rc=True
+    [return]    ${stderr}
+
+Check IPMI Oempartialadd Accept
+    [arguments]    ${args}
+    ${stdout}    ${stderr}    ${output_3} =    Execute Command    /tmp/ipmitool -I dbus raw ${args}    return_stdout=True    return_stderr= True    return_rc=True
+    Should Be Equal    ${output_3}    ${0}    msg=${stderr}
+    [return]    ${stderr}
+
diff --git a/tests/test_eventlog.robot b/tests/test_eventlog.robot
new file mode 100644
index 0000000..660d449
--- /dev/null
+++ b/tests/test_eventlog.robot
@@ -0,0 +1,196 @@
+*** Settings ***
+Documentation          This suite is used for testing the error logging
+...                    capability from the host
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/utils.robot
+
+
+Library         BuiltIn
+Library         Collections
+Library         SSHLibrary
+
+*** Variables ***
+&{NIL}  data=@{EMPTY}
+${SYSTEM_SHUTDOWN_TIME}     1min
+${WAIT_FOR_SERVICES_UP}     3min
+
+*** Test Cases ***
+
+valid path to logs
+    [Documentation]     Test list all events
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+clear any logs
+    [Documentation]     Test delete all events
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/clear    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    ${json} =   to json         ${resp.content}
+    Should Be Empty     ${json['data']}
+
+write a log
+    [Documentation]     Test create event
+    create a test log
+
+Message attribute should match
+    [Documentation]     Check message attribute for created event
+    ${uri} =      create a test log
+    ${content} =     Read Attribute      ${uri}   message
+    Should Be Equal     ${content}      A Test event log just happened
+
+Severity attribute should match
+    [Documentation]     Check severity attribute for created event
+    ${uri} =      create a test log
+    ${content}=     Read Attribute      ${uri}   severity
+    Should Be Equal     ${content}      Info
+
+data_bytes attribute should match
+    [Documentation]     Check data_bytes attribute for created event
+    @{data_list} =   Create List     ${48}  ${0}  ${19}  ${127}  ${136}  ${255}
+    ${uri} =      create a test log
+    ${content} =   Read Attribute      ${uri}   debug_data
+    Lists Should Be Equal     ${content}      ${data_list}
+
+delete the log
+    [Documentation]     Test the delete event
+    ${uri} =     create a test log
+    ${deluri} =  catenate    SEPARATOR=   ${uri}   /action/delete
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${resp} =    openbmc get request     ${deluri}
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+
+2nd delete should fail
+    [Documentation]     Negative scnenario to delete already deleted event
+    ${uri} =     create a test log
+    ${deluri} =  catenate    SEPARATOR=   ${uri}   /action/delete
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+
+Intermixed delete
+    [Documentation]     This testcase is for excersicing caching impleted,
+    ...                 Steps:
+    ...                     write three logs
+    ...                     delete middle log
+    ...                     middle log should not exist
+    ...                     time stamp should not match between logs(1st and 3rd)
+    ${event1}=      create a test log
+    ${event2}=      create a test log
+    ${event3}=      create a test log
+    ${deluri} =  catenate    SEPARATOR=   ${event2}   /action/delete
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${time_event1}=     Read Attribute      ${event1}   time
+    ${time_event3}=     Read Attribute      ${event3}   time
+    should not be equal     ${time_event1}      ${time_event3}
+
+restarting event process retains logs
+    [Documentation]     This is to test events are in place even after the
+    ...                 event service is restarted.
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    ${json} =   to json         ${resp.content}
+    ${logs_pre_restart}=    set variable    ${json['data']}
+
+    Open Connection And Log In
+    ${uptime}=  Execute Command    systemctl restart obmc-phosphor-event.service
+    Sleep   ${10}
+
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    ${json} =   to json         ${resp.content}
+    ${logs_post_restart}=   set variable    ${json['data']}
+    List Should Contain Sub List    ${logs_post_restart}    ${logs_pre_restart}     msg=Failed to find all the eventlogs which are present before restart of event service
+
+deleting log after obmc-phosphor-event.service restart
+    [Documentation]     This is to test event can be deleted created prior to
+    ...                 event service is restarted.
+    ${uri}=         create a test log
+
+    Open Connection And Log In
+    ${uptime}=  Execute Command    systemctl restart obmc-phosphor-event.service
+    Sleep   ${10}
+
+    ${deluri} =  catenate    SEPARATOR=   ${uri}   /action/delete
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+makeing new log after obmc-phosphor-event.service restart
+    [Documentation]     This is for testing event creation after the
+    ...                 event service is restarted.
+    Open Connection And Log In
+    ${uptime}=  Execute Command    systemctl restart obmc-phosphor-event.service
+    Sleep   ${10}
+
+    create a test log
+
+deleting new log after obmc-phosphor-event.service restart
+    [Documentation]     This testcase is for testing deleted newly created event
+    ...                 after event service is restarted.
+    Open Connection And Log In
+    ${uptime}=  Execute Command    systemctl restart obmc-phosphor-event.service
+    Sleep   ${10}
+
+    ${uri}=     create a test log
+    ${deluri} =  catenate    SEPARATOR=   ${uri}   /action/delete
+    ${resp} =    openbmc post request     ${deluri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+Test events after openbmc reboot
+    [Documentation]     This is to test event can be deleted created prior to
+    ...                 openbmc reboot
+    ...                 Steps:
+    ...                     Create event,
+    ...                     Reboot openbmc,
+    ...                     Events should exist post reboot,
+    ...                     Create two more events,
+    ...                     Delete old and new event
+    [Tags]      reboot_tests
+    ${pre_reboot_event}=         create a test log
+
+    Open Connection And Log In
+    ${output}=      Execute Command    /sbin/reboot
+    Sleep   ${SYSTEM_SHUTDOWN_TIME}
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    Sleep   ${WAIT_FOR_SERVICES_UP}
+
+    ${resp} =    openbmc get request     ${pre_reboot_event}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${post_reboot_event1}=         create a test log
+    ${post_reboot_event2}=         create a test log
+
+    ${del_prereboot_uri} =  catenate    SEPARATOR=   ${pre_reboot_event}   /action/delete
+    ${resp} =    openbmc post request     ${del_prereboot_uri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${del_postreboot_uri} =  catenate    SEPARATOR=   ${post_reboot_event1}   /action/delete
+    ${resp} =    openbmc post request     ${del_postreboot_uri}    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+clearing logs results in no logs
+    [Documentation]     This testcase is for clearning the events when no logs present
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/clear    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${resp} =   openbmc get request     /org/openbmc/records/events/
+    ${json} =   to json         ${resp.content}
+    Should Be Empty     ${json['data']}
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/clear    data=${NIL}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+
+
+*** Keywords ***
+
+create a test log
+    [arguments]
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request     /org/openbmc/records/events/action/acceptTestMessage    data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    ${LOGID} =    convert to integer    ${json['data']}
+    ${uri}=     catenate    SEPARATOR=   /org/openbmc/records/events/   ${LOGID}
+    [return]  ${uri}
+
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
diff --git a/tests/test_fan.robot b/tests/test_fan.robot
new file mode 100644
index 0000000..2f593b5
--- /dev/null
+++ b/tests/test_fan.robot
@@ -0,0 +1,6 @@
+*** Settings ***
+Documentation     This testsuite is for testing fan interface for openbmc
+Suite Teardown    Delete All Sessions
+Resource          ../lib/rest_client.robot
+
+*** Test Cases ***
diff --git a/tests/test_fw_version.robot b/tests/test_fw_version.robot
new file mode 100644
index 0000000..90721b7
--- /dev/null
+++ b/tests/test_fw_version.robot
@@ -0,0 +1,22 @@
+*** Settings ***
+Documentation       This suite will the firmware version exposed part of
+...                 system inventory
+
+Resource            ../lib/rest_client.robot
+
+
+*** Variables ***
+
+
+*** Test Cases ***
+Test Firmware Version
+    [Documentation]     This testcase is for testing the fw version.\n
+    ...     Expected in following format:
+    ...     $ git describe --dirty
+    ...     v0.1-34-g95f7347
+    ...     $
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/system/chassis/motherboard/bmc
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata}=    To Json    ${resp.content}
+    Should not be empty     ${jsondata["data"]["version"]}
+    Should Match Regexp     ${jsondata["data"]["version"]}      ^v\\d+\.\\d+
\ No newline at end of file
diff --git a/tests/test_generic_conf.robot b/tests/test_generic_conf.robot
new file mode 100755
index 0000000..94a9fa1
--- /dev/null
+++ b/tests/test_generic_conf.robot
@@ -0,0 +1,93 @@
+*** Settings ***
+Documentation		This suite will verifiy the Generic Configuration Rest Interfaces
+...					Details of valid interfaces can be found here...
+...					https://github.com/openbmc/docs/blob/master/rest-api.md
+
+Resource		../lib/rest_client.robot
+
+
+*** Variables ***
+${MIN_POWER_VALUE}    0
+${MAX_POWER_VALUE}    1000
+
+*** Test Cases ***
+
+
+Get the boot_flags
+
+    [Documentation]   ***GOOD PATH***
+    ...               This test case tries to get the boot flags
+    ...              
+
+    ${resp}=   Read Attribute   /org/openbmc/settings/host0/   boot_flags
+    should not be empty   ${resp}
+
+Get the power
+ 
+    [Documentation]   ***GOOD PATH***
+    ...               This test case tries to get the power value and it should be 
+    ...               between ${MIN_POWER_VALUE} and ${MAX_POWER_VALUE}
+
+    ${powerValue}=   Read Attribute   /org/openbmc/settings/host0/   power_cap
+    should be true   ${powerValue} >= ${MIN_POWER_VALUE} and ${powerValue} <= ${MAX_POWER_VALUE}
+
+Set the power with string of characters
+
+    [Documentation]   ***BAD PATH***
+    ...               This test case set the power values with string of characters
+    ...               Expectation is to return error.
+
+    ${valueToBeSet}=   Set Variable   abcdefg
+    ${valueDict}=   create dictionary   data=${valueToBeSet}
+    Write Attribute   /org/openbmc/settings/host0   power_cap   data=${valueDict}
+    ${value}=   Read Attribute    /org/openbmc/settings/host0   power_cap    
+    should not be true    '${value}'=='${valueToBeSet}'
+
+Set the power with greater then MAX_POWER_VALUE
+
+    [Documentation]   ***BAD PATH***
+    ...               This test case sets the power value which is greater 
+    ...               then MAX_ALLOWED_VALUE,Expectation is to return error
+
+    ${valueToBeSet}=   Set Variable     ${1010}
+    ${valueDict}=   create dictionary   data=${valueToBeSet}
+    Write Attribute   /org/openbmc/settings/host0   power_cap   data=${valueDict}
+    ${value}=      Read Attribute    /org/openbmc/settings/host0   power_cap
+    should not be equal   ${value}   ${valueToBeSet} 
+
+Set the power with MIN_POWER_VALUE
+
+    [Documentation]   ***BAD PATH***
+    ...               This test case sets the power value less then 
+    ...               MIN_ALLOWED_VALUE,Expectation is it should get error.
+
+    ${valueToBeSet}=   Set Variable     ${MIN_POWER_VALUE}
+    ${valueDict}=   create dictionary   data=${valueToBeSet}
+    Write Attribute   /org/openbmc/settings/host0    power_cap      data=${valueDict}
+    ${value}=      Read Attribute    /org/openbmc/settings/host0    power_cap
+    Should Be Equal     ${value}      ${valueToBeSet}
+
+Set the power with MAX_POWER_VALUE
+
+    [Documentation]   ***GOOD PATH***
+    ...               This test case sets the power value with MAX_POWER_VALUE
+    ...               and it should be set.
+ 
+    ${valueToBeSet}=   Set Variable     ${MAX_POWER_VALUE}
+    ${valueDict}=   create dictionary   data=${valueToBeSet}
+    Write Attribute   /org/openbmc/settings/host0    power_cap      data=${valueDict}
+    ${value}=      Read Attribute    /org/openbmc/settings/host0    power_cap
+    Should Be Equal     ${value}      ${valueToBeSet}
+
+Set the boot flags with string
+
+    [Documentation]   ***BAD PATH***
+    ...               This test case sets the boot flag with some invalid string 
+    ...               Expectation is it should not be set.
+
+    ${valueToBeSet}=   Set Variable     3ab56f
+    ${valueDict} =   create dictionary   data=${valueToBeSet}
+    Write Attribute  /org/openbmc/settings/host0    boot_flags      data=${valueDict}
+    ${value}=      Read Attribute    /org/openbmc/settings/host0    boot_flags
+    Should not Be Equal     ${value}      ${valueToBeSet}
+
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
new file mode 100644
index 0000000..d2feda9
--- /dev/null
+++ b/tests/test_inventory.robot
@@ -0,0 +1,97 @@
+*** Settings ***
+Documentation     This testsuite is for testing inventory
+Suite Teardown    Delete All Sessions
+Resource          ../lib/rest_client.robot
+Resource          ../lib/utils.robot
+Library           ../lib/utilities.py
+Library           String
+Library           Collections
+
+Variables         ../data/variables.py
+
+
+Suite setup		setup the suite
+
+
+*** Test Cases ***
+
+minimal cpu inventory
+	${count} = 	Get Total Present 	CPU
+	Should Be True 	${count}>${0}
+
+minimal dimm inventory
+	${count} = 	Get Total Present 	DIMM
+	Should Be True 	${count}>=${2}
+
+minimal core inventory
+	${count} = 	Get Total Present 	CORE
+	Should Be True 	${count}>${0}
+
+minimal memory buffer inventory
+	${count} = 	Get Total Present 	MEMORY_BUFFER
+	Should Be True 	${count}>${0}
+
+minimal fan inventory
+	${count} = 	Get Total Present 	FAN
+	Should Be True 	${count}>${2}
+
+minimal main planar inventory
+	${count} = 	Get Total Present 	MAIN_PLANAR
+	Should Be True 	${count}>${0}
+
+minimal system inventory
+	${count} = 	Get Total Present 	SYSTEM
+	Should Be True 	${count}>${0}
+
+Verify CPU VPD Properties
+	Verify Properties 	CPU
+
+Verify DIMM VPD Properties
+	Verify Properties 	DIMM
+
+Verify Memory Buffer VPD Properties
+	Verify Properties 	MEMORY_BUFFER
+
+Verify Fan VPD Properties
+	Verify Properties 	FAN
+
+Verify System VPD Properties
+	Verify Properties 	SYSTEM
+
+
+*** Keywords ***
+
+Setup The Suite
+	Power On Host
+
+	@{ret} = 	Get Inventory List 	${OPENBMC_MODEL}
+	Set Suite Variable 	@{sys_inv} 	@{ret}
+	${resp} = 	Read Properties 	/org/openbmc/inventory/enumerate
+	Set Suite Variable 	${SYSTEM_INFO}  	${resp}
+	log Dictionary  	${resp}
+
+Get Total Present
+	[arguments] 	${type}
+
+	${l} =    	Create List  	[]
+	${list} = 	Get Inventory Fru Type List 	${OPENBMC_MODEL} 	${type}
+	: FOR 	${element} 	IN  	@{list}
+	\ 	Append To List 	 ${l}  	${SYSTEM_INFO['${element}']['present']}
+
+	${sum} = 	Get Count 	${l} 	True
+	[return] 	${sum}
+
+Verify Properties
+	[arguments] 	${type}
+
+	${list} = 	Get VPD Inventory List 	${OPENBMC_MODEL} 	${type}
+	: FOR 	${element} 	IN  	@{list}
+	\ 	${d} = 	Get From Dictionary 	${SYSTEM_INFO} 	${element}
+	\ 	Run Keyword If 	${d['present']} == True		Verify Present Properties 	${d} 	${type}
+
+Verify Present Properties
+	[arguments]	 ${d} 	${type}
+	${keys} = 	Get Dictionary Keys 	${d}
+	Log List 	${keys}
+	Log List 	${INVENTORY_ITEMS['${type}']}
+	Lists Should Be Equal  ${INVENTORY_ITEMS['${type}']} 	${keys}
diff --git a/tests/test_led.robot b/tests/test_led.robot
new file mode 100644
index 0000000..a512339
--- /dev/null
+++ b/tests/test_led.robot
@@ -0,0 +1,195 @@
+*** Settings ***
+
+Documentation     This testsuite is for testing the functions of Heartbeat, 
+...               Identify and Power LED's
+
+Resource          ../lib/rest_client.robot
+Resource          ../lib/resource.txt
+
+*** Variables ***
+
+${MIN_TOGGLE_VALUE}    0
+${SAMPLING_FREQUENCY}  6
+
+*** Test Cases ***
+
+Turn ON the Heartbeat LED
+   [Documentation]   This testcase is to test the setOn functionality of the
+   ...               Heartbeat LED. The LED state is read again to check if
+   ...               the LED is in ON state.
+   Set On   heartbeat
+   ${ledstate} =   Get LED State   heartbeat
+   should be equal as strings   ${ledstate}   On
+
+Turn OFF the Heartbeat LED
+   [Documentation]   This testcase is to test the setOff functionality of the
+   ...               Heartbeat LED. The LED state is read again to check if
+   ...               the LED is in OFF state.
+   Set Off   heartbeat
+   ${ledstate} =   Get LED State   heartbeat
+   should be equal as strings   ${ledstate}   Off
+
+Blink Fast the Heartbeat LED
+   [Documentation]   This testcase is to test the setBlinkFast functionality of the
+   ...               Heartbeat LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   Set Blink Fast   heartbeat
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   heartbeat
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+
+Blink Slow the Heartbeat LED
+   [Documentation]   This testcase is to test the setBlinkSlow functionality of the
+   ...               Heartbeat LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   Set Blink Slow   heartbeat
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   heartbeat
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+
+Turn ON the Identify LED
+   [Documentation]   This testcase is to test the setOn functionality of the
+   ...               Identify LED. The LED state is read again to check if
+   ...               the LED is in ON state.
+   Set On   identify
+   ${ledstate} =   Get LED State   identify
+   should be equal as strings   ${ledstate}   On
+
+Turn OFF the Identify LED
+   [Documentation]   This testcase is to test the setOff functionality of the
+   ...               Identify LED. The LED state is read again to check if
+   ...               the LED is in OFF state.
+   Set Off   identify
+   ${ledstate} =   Get LED State   identify
+   should be equal as strings   ${ledstate}   Off
+
+Blink Fast the Identify LED
+   [Documentation]   This testcase is to test the setBlinkFast functionality of the
+   ...               Identify LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   Set Blink Fast   identify
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   identify
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+
+Blink Slow the Identify LED
+   [Documentation]   This testcase is to test the setBlinkSlow functionality of the
+   ...               Identify LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   Set Blink Slow   identify
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   identify
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+
+Turn ON the Beep LED
+   [Documentation]   This testcase is to test the setOn functionality of the
+   ...               Beep LED. The LED state is read again to check if
+   ...               the LED is in ON state.
+   Set On   beep
+   ${ledstate} =   Get LED State   beep
+   should be equal as strings   ${ledstate}   On
+
+Turn OFF the Beep LED
+   [Documentation]   This testcase is to test the setOff functionality of the
+   ...               Beep LED. The LED state is read again to check if
+   ...               the LED is in OFF state.
+   Set Off   beep
+   ${ledstate} =   Get LED State   beep
+   should be equal as strings   ${ledstate}   Off
+
+Blink Fast the Beep LED
+   [Documentation]   This testcase is to test the setBlinkFast functionality of the
+   ...               Beep LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   ${data} =   create dictionary   data=@{EMPTY}
+   Set Blink Fast   beep
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   beep
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+
+Blink Slow the Beep LED
+   [Documentation]   This testcase is to test the setBlinkSlow functionality of the
+   ...               Beep LED. The LED state is sampled to figure out
+   ...               whether the LED is blinking. There is no distinguishing
+   ...               between whether the LED is blinking fast or slow for
+   ...               this testcase to pass.
+   ${OFF_VALUE}=   Set Variable   ${0}
+   ${ON_VALUE}=   Set Variable   ${0}
+   Set Blink Slow   beep
+   : FOR   ${INDEX}   IN RANGE   1   ${SAMPLING_FREQUENCY}
+   \   ${ledstate} =   Get LED State   beep
+   \   ${ON_VALUE} =   Set Variable If   '${ledstate}'=='On'   ${ON_VALUE + 1}   ${ON_VALUE}
+   \   ${OFF_VALUE} =   Set Variable If   '${ledstate}'=='Off'   ${OFF_VALUE + 1}   ${OFF_VALUE}
+   should be true   ${ON_VALUE} > ${MIN_TOGGLE_VALUE} and ${OFF_VALUE} > ${MIN_TOGGLE_VALUE}
+   
+*** Keywords ***
+
+Get LED State
+   [arguments]    ${args}
+   ${data} =   create dictionary   data=@{EMPTY}
+   ${resp} =   OpenBMC Post Request   /org/openbmc/control/led/${args}/action/GetLedState   data=${data}
+   should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+   ${json} =   to json   ${resp.content}
+   [return]    ${json['data'][1]}
+   
+Set On
+   [arguments]    ${args}
+   ${data} =   create dictionary   data=@{EMPTY}
+   ${resp} =   OpenBMC Post Request   /org/openbmc/control/led/${args}/action/setOn   data=${data}
+   should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+   ${json} =   to json   ${resp.content}
+   should be equal as integers   ${json['data']}   0
+   
+Set Off
+   [arguments]    ${args}
+   ${data} =   create dictionary   data=@{EMPTY}
+   ${resp} =   OpenBMC Post Request   /org/openbmc/control/led/${args}/action/setOff   data=${data}
+   should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+   ${json} =   to json   ${resp.content}
+   should be equal as integers   ${json['data']}   0
+   
+Set Blink Fast
+   [arguments]    ${args}
+   ${data} =   create dictionary   data=@{EMPTY}
+   ${resp} =   OpenBMC Post Request   /org/openbmc/control/led/${args}/action/setBlinkFast   data=${data}
+   should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+   ${json} =   to json   ${resp.content}
+   should be equal as integers   ${json['data']}   0
+   
+Set Blink Slow
+   [arguments]    ${args}
+   ${data} =   create dictionary   data=@{EMPTY}
+   ${resp} =   OpenBMC Post Request   /org/openbmc/control/led/${args}/action/setBlinkSlow   data=${data}
+   should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+   ${json} =   to json   ${resp.content}
+   should be equal as integers   ${json['data']}   0
diff --git a/tests/test_networkd.robot b/tests/test_networkd.robot
new file mode 100755
index 0000000..74b2cd3
--- /dev/null
+++ b/tests/test_networkd.robot
@@ -0,0 +1,314 @@
+*** Settings ***
+Documentation		This suite will verifiy the Network Configuration Rest Interfaces
+...					Details of valid interfaces can be found here...
+...					https://github.com/openbmc/docs/blob/master/rest-api.md
+
+Resource		../lib/rest_client.robot
+Resource                ../lib/ipmi_client.robot
+Resource                ../lib/utils.robot
+Library                 ../lib/pythonutil.py
+
+
+
+*** Test Cases ***                                
+
+Get the Mac address
+
+    [Documentation]   This test case is to get the mac address
+    [Tags]   network_test
+    @{arglist}=   Create List   eth0
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/NetworkManager/Interface/    GetHwAddress    data=${args}
+    should not be empty    ${resp.content}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}      ok
+    set suite variable   ${OLD_MAC_ADDRESS}  ${json['data']}   
+
+
+Get IP Address with invalid interface
+
+    [Documentation]   This test case tries to get the ip addrees with the invalid
+    ...               interface,Expectation is it should get error.
+    [Tags]   network_test
+
+    @{arglist}=   Create List   lo01
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=    Call Method    /org/openbmc/NetworkManager/Interface/   GetAddress4    data=${args}
+    should not be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+Get IP Address with valid interface
+
+    [Documentation]   This test case tries to get the ip addrees with the invalid
+    ...               interface,Expectation is it should get error.
+    [Tags]   network_test
+
+    @{arglist}=   Create List   eth0
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=    Call Method    /org/openbmc/NetworkManager/Interface/   GetAddress4    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}      ok
+
+
+Set the IP address on invalid Interface            lo01     1.1.1.1        255.255.255.0     1.1.1.1     error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]    This test case tries to set the ip addrees with the invalid
+    ...               interface,Expectation is it should get error
+
+Set invalid IP address on the valid interface      eth0     ab.cd.ef.gh    255.255.255.0     1.1.1.1     error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]    This test case tries to set the invalid ip addrees on  the interface
+    ...               Expectation is it should get error.
+
+
+Set IP address with invalid subnet mask            eth0       2.2.2.2        av.ih.jk.lm       1.1.1.1     error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]   This test case tries to set the ip addrees on  the interface
+   ...               with invalid subnet mask,Expectation is it should get error.
+
+Set empty IP address                              eth0     ${EMPTY}       255.255.255.0     1.1.1.1     error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]   This test case tries to set the NULL ip addrees on  the interface
+   ...               Expectation is it should get error.
+
+Set empty subnet mask                             eth0       2.2.2.2        ${EMPTY}          1.1.1.1     error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]   This test case tries to set the ip addrees on  the interface
+   ...               with empty subnet mask,Expectation is it should get error.
+
+Set empty gateway                                 eth0       2.2.2.2        255.255.255.0     ${EMPTY}    error
+
+   [Tags]   network_test
+   [Template]    AddNetworkInfo
+   [Documentation]   This test case tries to set the ip addrees on  the interface
+   ...               with empty gateway,Expectation is it should get error.
+
+
+Set IP address on valid Interface
+    [Tags]   network_test
+    [Documentation]   This test case sets the ip  on the interface and validates
+    ...               that ip address has been set or not.
+    ...               Expectation is the ip address should get added.
+
+    validateEnvVariables
+
+
+    ${networkInfo}=    Get networkInfo from the interface    eth0
+    ${result}=  convert to integer     ${networkInfo['data'][1]}
+
+    ${MASK}=    calcDottedNetmask     ${result}
+    set suite variable   ${OLD_MASK}   ${MASK}
+    log to console  ${OLD_MASK}
+    set suite variable   ${OLD_IP}          ${networkInfo['data'][2]}
+    set suite variable   ${OLD_GATEWAY}     ${networkInfo['data'][3]}
+
+    log to console    ${OLD_IP}
+    log to console    ${OLD_GATEWAY}
+
+
+    ${NEW_IP}=        Get Environment Variable    NEW_BMC_IP
+    ${NEW_MASK}=   Get Environment Variable    NEW_SUBNET_MASK
+    ${NEW_GATEWAY}=       Get Environment Variable    NEW_GATEWAY
+
+    ${arglist}=    Create List    eth0    ${NEW_IP}   ${NEW_MASK}   ${NEW_GATEWAY}
+    ${args}=     Create Dictionary   data=@{arglist}
+    run keyword and ignore error    Call Method    /org/openbmc/NetworkManager/Interface/   SetAddress4    data=${args}
+  
+    Wait For Host To Ping       ${NEW_IP}
+    Set Suite Variable      ${AUTH_URI}       https://${NEW_IP}
+    log to console    ${AUTH_URI}
+
+    ${networkInfo}=    Get networkInfo from the interface    eth0
+    ${ipaddress}=      set variable    ${networkInfo['data'][2]}
+    ${gateway}=        set variable    ${networkInfo['data'][3]}
+
+    ${isgatewayfound} =    Set Variable If   '${gateway}'=='${NEW_GATEWAY}'  true    false
+    log to console   ${isgatewayfound}
+    ${isIPfound}=    Set Variable if    '${ipaddress}' == '${NEW_IP}'    true   false
+    should be true   '${isIPfound}' == 'true' and '${isgatewayfound}' == 'true'
+
+
+Revert the last ip address change
+    [Tags]   network_test
+    [Documentation]   This test case sets the ip  on the interface and validates
+    ...               that ip address has been set or not.
+    ...               Expectation is the ip address should get added.
+
+
+    ${arglist}=    Create List    eth0       ${OLD_IP}    ${OLD_MASK}   ${OLD_GATEWAY}
+    ${args}=     Create Dictionary   data=@{arglist}
+    run keyword and ignore error    Call Method    /org/openbmc/NetworkManager/Interface/   SetAddress4    data=${args}
+
+    Wait For Host To Ping       ${OLD_IP}
+    Set Suite Variable      ${AUTH_URI}    https://${OLD_IP}
+    log to console    ${AUTH_URI}
+
+
+    ${networkInfo}=    Get networkInfo from the interface    eth0
+    ${ipaddress}=      set variable    ${networkInfo['data'][2]}
+    ${gateway}=        set variable    ${networkInfo['data'][3]}
+
+    ${isgatewayfound} =    Set Variable If   '${gateway}'=='${OLD_GATEWAY}'  true    false
+    log to console   ${isgatewayfound}
+    ${isIPfound}=    Set Variable if    '${ipaddress}' == '${OLD_IP}'    true   false
+    should be true   '${isIPfound}' == 'true' and '${isgatewayfound}' == 'true'
+
+
+Get IP Address type
+    [Tags]   GOOD-PATH
+    [Documentation]   This test case tries to set existing ipaddress address and 
+    ...               later tries to verify that ip address type is set to static 
+    ...               due to the operation.
+
+    ${networkInfo}=    Get networkInfo from the interface    eth0
+    ${result}=  convert to integer     ${networkInfo['data'][1]}
+
+    ${CURRENT_MASK}=    calcDottedNetmask     ${result}
+    ${CURRENT_IP}=      set variable    ${networkInfo['data'][2]}
+    ${CURRENT_GATEWAY}=   set variable    ${networkInfo['data'][3]}
+
+    ${arglist}=    Create List    eth0    ${CURRENT_IP}   ${CURRENT_MASK}   ${CURRENT_GATEWAY}
+    ${args}=     Create Dictionary   data=@{arglist}
+    run keyword and ignore error    Call Method    /org/openbmc/NetworkManager/Interface/   SetAddress4    data=${args}
+
+    Wait For Host To Ping       ${CURRENT_IP}
+    
+    @{arglist}=   Create List   eth0
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=    Call Method    /org/openbmc/NetworkManager/Interface/   GetAddressType    data=${args}
+    ${json} =   to json         ${resp.content}
+    Should Be Equal    ${json['data']}    STATIC
+    should be equal as strings      ${json['status']}      ok
+
+
+Persistency check for ip address
+    [Tags]   reboot_test
+    [Documentation]   we reboot the service processor and after reboot
+    ...               will request for the ip address to check the persistency
+    ...               of the ip address.
+    ...               Expectation is the ip address should persist.
+  
+    Open Connection And Log In
+    Execute Command    reboot
+#    sleep  100sec
+    log to console    "System is getting rebooted wait for few seconds"
+    ${networkInfo}=    Get networkInfo from the interface    eth0
+    ${ipaddress}=      set variable    ${networkInfo['data'][2]}
+    ${gateway}=        set variable    ${networkInfo['data'][3]}
+
+    ${isgatewayfound} =    Set Variable If   '${gateway}'=='${OLD_GATEWAY}'  true    false
+    log to console   ${isgatewayfound}
+    ${isIPfound}=    Set Variable if    '${ipaddress}' == '${OLD_IP}'    true   false
+    should be true   '${isIPfound}' == 'true' and '${isgatewayfound}' == 'true'
+
+
+
+
+
+Set invalid Mac address     eth0     gg:hh:jj:kk:ll:mm    error
+    [Tags]   network_test
+    [Template]  SetMacAddress_bad
+    [Documentation]   This test case tries to set the invalid mac address 
+    ...               on the eth0 interface.
+    ...               Expectation is that it should throw error.
+
+
+Set valid Mac address     eth0     00:21:cc:73:91:dd   ok
+    [Tags]   network_test
+    [Template]  SetMacAddress_good
+    [Documentation]   ***GOOD PATH***
+    ...               This test case add the ip addresson the  interface and validates
+    ...               that ip address has been added or not.
+    ...               Expectation is the ip address should get added.
+     
+Revert old Mac address     eth0     ${OLD_MAC_ADDRESS}   ok
+    [Tags]   network_test
+    [Template]  SetMacAddress_good
+    [Documentation]   ***GOOD PATH***
+    ...               This test case add the ip addresson the  interface and validates
+    ...               that ip address has been added or not.
+    ...               Expectation is the ip address should get added.
+
+
+***keywords***
+
+Get networkInfo from the interface
+
+    [Documentation]   This keyword is used to match the given ip with the configured one.
+    ...               returns true if match successfull else false
+    ...               eg:- Outout of getAddress4
+    ...               NewFormat:-{"data": [ 2,25,"9.3.164.147","9.3.164.129"],"message": "200 OK","status": "ok"}
+    ...               OldFormat:-
+    ...               {"data": [[[2,25,0,128,"9.3.164.177"],[2,8,254,128,"127.0.0.1"]],"9.3.164.129"],
+    ...                "message": "200 OK", "status": "ok"}
+
+    [arguments]    ${intf}
+    @{arglist}=    Create List   ${intf}
+    ${args}=       Create Dictionary   data=@{arglist}
+    ${resp}=       Call Method    /org/openbmc/NetworkManager/Interface/   GetAddress4    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    log to console   ${json['data'][2]}
+    log to console   ${json['data'][3]}
+    [return]    ${json}
+
+AddNetworkInfo
+    [Arguments]    ${intf}      ${address}    ${mask}   ${gateway}  ${result}
+
+    ${arglist}=    Create List    ${intf}    ${address}  ${mask}   ${gateway}
+    ${args}=       Create Dictionary   data=@{arglist}
+    ${resp}=       Call Method    /org/openbmc/NetworkManager/Interface/   SetAddress4    data=${args}
+    should not be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ${result}
+
+
+SetMacAddress_bad
+    [Arguments]    ${intf}      ${address}    ${result}
+    ${arglist}=    Create List    ${intf}    ${address}
+    ${args}=       Create Dictionary   data=@{arglist}
+    ${resp}=       Call Method    /org/openbmc/NetworkManager/Interface/   SetHwAddress    data=${args}
+    should not be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ${result}
+
+
+SetMacAddress_good
+    [Arguments]    ${intf}      ${address}   ${result}
+    ${arglist}=    Create List    ${intf}    ${address}  
+    ${args}=       Create Dictionary   data=@{arglist}
+    ${resp}=       Call Method    /org/openbmc/NetworkManager/Interface/   SetHwAddress    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ${result}
+    Wait For Host To Ping      ${OPENBMC_HOST}
+
+    @{arglist}=   Create List   ${intf}
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/NetworkManager/Interface/    GetHwAddress    data=${args}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings   ${json['data']}    ${address}
+    
+
+validateEnvVariables
+
+    ${NEW_BMC_IP}=        Get Environment Variable    NEW_BMC_IP
+    ${NEW_SUBNET_MASK}=   Get Environment Variable    NEW_SUBNET_MASK
+    ${NEW_GATEWAY}=       Get Environment Variable    NEW_GATEWAY
+
+    
+    should not be empty  ${NEW_BMC_IP}    
+    should not be empty  ${NEW_GATEWAY} 
+    should not be empty  ${NEW_SUBNET_MASK} 
diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
new file mode 100644
index 0000000..a3121e2
--- /dev/null
+++ b/tests/test_obmcrest.robot
@@ -0,0 +1,333 @@
+*** Settings ***
+Documentation		This suite will verifiy all OpenBMC rest interfaces
+...					Details of valid interfaces can be found here...
+...					https://github.com/openbmc/docs/blob/master/rest-api.md
+
+Resource		../lib/rest_client.robot
+
+
+*** Variables ***
+
+
+*** Test Cases ***
+Good connection for testing
+    ${content}=    Read Properties     /
+    ${c}=          get from List       ${content}      0
+    Should Be Equal    ${c}     /org
+
+Get an object with no properties 
+    ${content}=    Read Properties     /org/openbmc/inventory
+    Should Be Empty     ${content}
+
+Get a Property
+    ${resp}=   Read Attribute      /org/openbmc/inventory/system/chassis/motherboard/cpu0      is_fru
+    Should Be Equal    ${resp}     ${1}
+
+Get a null Property
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/attr/is_fru
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_NOT_FOUND}
+    ${jsondata}=    To Json    ${resp.content}
+    Should Be Equal     ${jsondata['data']['description']}      The specified property cannot be found: ''is_fru''
+
+get directory listing /
+    ${resp} =   openbmc get request     /
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json     ${resp.content}
+    list should contain value           ${json['data']}         /org
+    should be equal as strings          ${json['status']}       ok
+
+get directory listing /org/
+    ${resp} =   openbmc get request     /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value           ${json['data']}     /org/openbmc
+    should be equal as strings          ${json['status']}       ok
+
+get invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put directory listing /
+    ${resp} =   openbmc put request     /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put directory listing /org/
+    ${resp} =   openbmc put request     /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+put invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post directory listing /
+    ${resp} =   openbmc post request    /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post directory listing /org/
+    ${resp} =   openbmc post request    /org/
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+post invalid directory listing /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete directory listing /
+    ${resp} =   openbmc delete request  /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete directory listing /org/
+    ${resp} =   openbmc delete request  /
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+delete invalid directory listing /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings          ${json['status']}   error
+
+get list names /
+    ${resp} =   openbmc get request     /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get list names /org/
+    ${resp} =   openbmc get request     /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get invalid list names /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put list names /
+    ${resp} =   openbmc put request     /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put list names /org/
+    ${resp} =   openbmc put request     /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid list names /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post list names /
+    ${resp} =   openbmc post request    /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post list names /org/
+    ${resp} =   openbmc post request    /org/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post invalid list names /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete list names /
+    ${resp} =   openbmc delete request  /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete list names /org/
+    ${resp} =   openbmc delete request  /list
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid list names /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/list
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get names /
+    ${resp} =   openbmc get request     /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get names /org/
+    ${resp} =   openbmc get request     /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    list should contain value       ${json['data']}         /org/openbmc/inventory
+    should be equal as strings      ${json['status']}       ok
+
+get invalid names /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put names /
+    ${resp} =   openbmc put request     /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put names /org/
+    ${resp} =   openbmc put request     /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid names /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post names /
+    ${resp} =   openbmc post request    /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post names /org/
+    ${resp} =   openbmc post request    /org/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post invalid names /i/dont/exist/
+    ${resp} =   openbmc post request    /i/dont/exist/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete names /
+    ${resp} =   openbmc delete request  /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete names /org/
+    ${resp} =   openbmc delete request  /enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid names /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/enumerate
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get method org/openbmc/records/events/action/acceptTestMessage
+    ${resp} =   openbmc get request     org/openbmc/records/events/action/acceptTestMessage
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+get invalid method /i/dont/exist/
+    ${resp} =   openbmc get request     /i/dont/exist/action/foo
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put method org/openbmc/records/events/action/acceptTestMessage
+    ${resp} =   openbmc put request     org/openbmc/records/events/action/acceptTestMessage
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+put invalid method /i/dont/exist/
+    ${resp} =   openbmc put request     /i/dont/exist/action/foo
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post method power/getPowerState no args
+    ${fan_uri}=     Get Power Control Interface
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    ${fan_uri}/action/getPowerState      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ok
+
+post method org/openbmc/records/events/action/acceptTestMessage invalid args
+    ${data} =   create dictionary   foo=bar
+    ${resp} =   openbmc post request    org/openbmc/records/events/action/acceptTestMessage      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_BAD_REQUEST}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+post method org/openbmc/sensors/host/BootCount with args
+    ${uri} =     Set Variable   /org/openbmc/sensors/host/BootCount
+    ${COUNT}=   Set Variable    ${3}
+    @{count_list} =   Create List     ${COUNT}
+    ${data} =   create dictionary   data=@{count_list}
+    ${resp} =   openbmc post request    ${uri}/action/setValue      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ok
+    ${content}=     Read Attribute      ${uri}   value
+    Should Be Equal     ${content}      ${COUNT}
+
+delete method org/openbmc/records/events/action/acceptTestMessage
+    ${resp} =   openbmc delete request  org/openbmc/records/events/action/acceptTestMessage
+    should be equal as strings      ${resp.status_code}     ${HTTP_METHOD_NOT_ALLOWED} 
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+
+delete invalid method /org/nothere/
+    ${resp} =   openbmc delete request  /org/nothere/action/foomethod
+    should be equal as strings      ${resp.status_code}     ${HTTP_NOT_FOUND}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       error
+    
+post method org/openbmc/records/events/action/acceptTestMessage no args 
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    org/openbmc/records/events/action/acceptTestMessage      data=${data}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}       ok
+
+***keywords***
+Get Power Control Interface
+    ${resp}=    OpenBMC Get Request     /org/openbmc/control/
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}     msg=Unable to get any controls - /org/openbmc/control/
+    ${jsondata}=   To Json    ${resp.content}
+    log     ${jsondata}
+    : FOR    ${ELEMENT}    IN    @{jsondata["data"]}
+    \   log     ${ELEMENT}
+    \   ${found}=   Get Lines Matching Pattern      ${ELEMENT}      *control/power*
+    \   Return From Keyword If     '${found}' != ''     ${found}
\ No newline at end of file
diff --git a/tests/test_occ_powercap.robot b/tests/test_occ_powercap.robot
new file mode 100644
index 0000000..1c600dd
--- /dev/null
+++ b/tests/test_occ_powercap.robot
@@ -0,0 +1,130 @@
+*** Settings ***
+Documentation           This suite is for testing OCC: Power capping setting
+
+Resource                ../lib/rest_client.robot
+Resource                ../lib/resource.txt
+Resource                ../lib/utils.robot
+
+Suite Setup            Power On Host
+
+*** Test Cases ***
+
+Get OCC status
+    [Documentation]     This testcase is to test the OCCstatus for the system
+    ...                 is Enabled or not
+    ${status}=  Get OCC status
+    Should Be Equal     ${status}   Enabled
+
+Set and Get PowerCap
+    [Documentation]     This testcase is to test get/set powercap feature.
+    ...                 In the testcase we are reading min, max value and then
+    ...                 try set the random in that range.
+    ${min}=     Get Minimum PowerCap
+    log     ${min}
+    ${max}=     Get Maximum PowerCap
+    log     ${max}
+    ${rand_power_cap}=      Evaluate    random.randint(${min}, ${max})   modules=random
+    log     ${rand_power_cap}
+    ${resp}=    Set PowerCap    ${rand_power_cap}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    Sleep   ${DBUS_POLL_INTERVAL}
+    ${power_cap}=       Get PowerCap
+    Should Be Equal     ${power_cap}    ${rand_power_cap}
+    ${user_power_cap}=  Get User PowerCap
+    Should Be Equal     ${user_power_cap}    ${rand_power_cap}
+
+Set Less Than Minimum PowerCAP
+    [Documentation]     Test set powercap with less than min powercap value
+    ${org_power_cap}=       Get PowerCap
+    ${min}=     Get Minimum PowerCap
+    ${sample_invalid_pcap}=     Evaluate    ${min}-${100}
+    ${resp}=  Set PowerCap    ${sample_invalid_pcap}
+    Sleep   ${DBUS_POLL_INTERVAL}
+    Should Not Be Equal As Strings      ${resp.status_code}     ${HTTP_OK}
+    ${power_cap}=       Get PowerCap
+    Should Be Equal     ${org_power_cap}    ${power_cap}
+
+Set More Than Maximum PowerCAP
+    [Documentation]     Test set powercap with more than max powercap value
+    ${org_power_cap}=       Get PowerCap
+    ${min}=     Get Maximum PowerCap
+    ${sample_invalid_pcap}=     Evaluate    ${min}+${100}
+    ${resp}=  Set PowerCap    ${sample_invalid_pcap}
+    Sleep   ${DBUS_POLL_INTERVAL}
+    Should Not Be Equal As Strings      ${resp.status_code}     ${HTTP_OK}
+    ${power_cap}=       Get PowerCap
+    Should Be Equal     ${org_power_cap}    ${power_cap}
+
+Disable PowerCap
+    [Documentation]     Test set powercap with 0 and make sure powercap is
+    ...                 disabled by checking whether the value is set to 0
+    ${resp}=  Set PowerCap    ${0}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    Sleep   ${DBUS_POLL_INTERVAL}
+    ${power_cap}=       Get PowerCap
+    Should Be Equal     ${power_cap}    ${0}
+    ${user_power_cap}=  Get User PowerCap
+    Should Be Equal     ${user_power_cap}    ${0}
+
+Get System Power Consumption
+    [Documentation]   Get the current system power consumption and check if the 
+    ...               value is greater than zero
+    
+    ${resp} =   OpenBMC Get Request   /org/openbmc/sensors/powercap/system_power
+    should be equal as strings   ${resp.status_code}   ${HTTP_OK}
+    ${jsondata}=   To Json    ${resp.content}
+    Should Be True   ${jsondata["data"]["value"]} > 0
+
+*** Keywords ***
+
+Get Minimum PowerCap
+    ${resp} =   OpenBMC Get Request    /org/openbmc/sensors/powercap/min_cap
+    ${jsondata}=   To Json    ${resp.content}
+    [return]    ${jsondata["data"]["value"]}
+
+Get Maximum PowerCap
+    ${resp} =   OpenBMC Get Request    /org/openbmc/sensors/powercap/max_cap
+    ${jsondata}=   To Json    ${resp.content}
+    [return]    ${jsondata["data"]["value"]}
+
+Get User PowerCap
+    ${resp} =   OpenBMC Get Request    /org/openbmc/sensors/powercap/user_cap
+    ${jsondata}=   To Json    ${resp.content}
+    [return]    ${jsondata["data"]["value"]}
+
+Set PowerCap
+    [Arguments]    ${powercap_value}
+    @{pcap_list} =   Create List     ${powercap_value}
+    ${data} =   create dictionary   data=@{pcap_list}
+    ${resp} =   openbmc post request    /org/openbmc/sensors/host/PowerCap/action/setValue      data=${data}
+    [return]    ${resp}
+
+Get PowerCap
+    ${resp} =   OpenBMC Get Request    /org/openbmc/sensors/host/PowerCap
+    ${jsondata}=   To Json    ${resp.content}
+    [return]    ${jsondata["data"]["value"]}
+
+Get OCC status link
+    ${resp}=    OpenBMC Get Request     /org/openbmc/sensors/host/list
+    ${jsondata}=   To Json    ${resp.content}
+    log     ${jsondata}
+    : FOR    ${ELEMENT}    IN    @{jsondata["data"]}
+    \   log     ${ELEMENT}
+    \   ${found}=   Get Lines Matching Pattern      ${ELEMENT}      *host/cpu*/OccStatus
+    \   Return From Keyword If     '${found}' != ''     ${found}
+
+Get OCC status
+    ${occstatus_link}=  Get OCC status link
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    ${occstatus_link}/action/getValue      data=${data}
+    ${jsondata}=   To Json    ${resp.content}
+    [return]    ${jsondata["data"]}
+
+Get Chassis URI
+    ${resp}=    OpenBMC Get Request     /org/openbmc/control/
+    ${jsondata}=   To Json    ${resp.content}
+    log     ${jsondata}
+    : FOR    ${ELEMENT}    IN    @{jsondata["data"]}
+    \   log     ${ELEMENT}
+    \   ${found}=   Get Lines Matching Pattern      ${ELEMENT}      *control/chassis*
+    \   Return From Keyword If     '${found}' != ''     ${found}
diff --git a/tests/test_openbmc_service_restart_policy.robot b/tests/test_openbmc_service_restart_policy.robot
new file mode 100644
index 0000000..93b9c44
--- /dev/null
+++ b/tests/test_openbmc_service_restart_policy.robot
@@ -0,0 +1,60 @@
+*** Settings ***
+Documentation           This testsuites tests the autorestart policy for
+...                     OpenBMC project
+
+Resource        ../lib/resource.txt
+
+Library                SSHLibrary
+Suite Setup            Open Connection And Log In
+Suite Teardown         Close All Connections
+
+*** Test Cases ***
+Test OpenBMC Services Autorestart Policy
+    [Documentation]     This testcases is for checking all the openbmc services
+    ...                 restart policy is set to active
+    @{services}=    Create List     obmc-mapper.service
+    ...                             obmc-rest.service
+    ...                             btbridged.service
+    ...                             host-ipmi-bt.service
+    ...                             host-ipmi-hw-example.service
+    ...                             host-ipmid.service
+    ...                             obmc-phosphor-chassisd.service
+    ...                             obmc-phosphor-event.service
+    ...                             obmc-phosphor-example-pydbus.service
+    ...                             obmc-phosphor-example-sdbus.service
+    ...                             obmc-phosphor-fand.service
+    ...                             obmc-phosphor-flashd.service
+    ...                             obmc-phosphor-policyd.service
+    ...                             obmc-phosphor-sensord.service
+    ...                             obmc-phosphor-sysd.service
+    ...                             rest-dbus.service
+    ...                             skeleton.service
+    : FOR    ${SERVICE}    IN    @{services}
+    \    Check Service Autorestart    ${SERVICE}
+
+Test Restart Policy for openbmc service
+    [Documentation]     This testcase will kill the service and make sure it
+    ...                 does restart after that
+    ${MainPID}   ${stderr}   ${rc}=  Execute new Command    systemctl -p MainPID show skeleton.service| cut -d = -f2
+    Should Not Be Equal     0   ${MainPID}
+    ${stdout}   ${stderr}   ${rc}=  Execute new Command     kill -9 ${MainPID}
+    Sleep   30s     Wait for service to restart properly
+    ${ActiveState}   ${stderr}   ${rc}=  Execute new Command    systemctl -p ActiveState show skeleton.service| cut -d = -f2
+    Should Be Equal     active   ${ActiveState}
+    ${MainPID}   ${stderr}   ${rc}=  Execute new Command    systemctl -p MainPID show skeleton.service| cut -d = -f2
+    Should Not Be Equal     0   ${MainPID}
+
+*** Keywords ***
+Check Service Autorestart
+    [arguments]    ${servicename}
+    ${restart_policy}   ${stderr}   ${rc}=  Execute new command     systemctl -p Restart show ${servicename} | cut -d = -f2
+    Should Be Equal     always   ${restart_policy}   restart policy is npt always for ${servicename}
+
+Execute new Command
+    [arguments]    ${command}
+    ${stdout}   ${stderr}   ${rc}=  Execute Command    ${command}    return_stderr=True     return_rc=True
+    [Return]    ${stdout}   ${stderr}   ${rc}
+
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
diff --git a/tests/test_power_restore.robot b/tests/test_power_restore.robot
new file mode 100644
index 0000000..d0e27d5
--- /dev/null
+++ b/tests/test_power_restore.robot
@@ -0,0 +1,82 @@
+*** Settings ***
+Documentation                This suite will verifiy the power restore policy rest Interfaces
+...                          Details of valid interfaces can be found here...
+...                          https://github.com/openbmc/docs/blob/master/rest-api.md
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/pdu/pdu.robot
+Resource        ../lib/utils.robot
+
+
+Library         SSHLibrary
+
+[Documentation]       Data Driven Tests
+
+
+***test cases***
+
+Set the power restore policy       Policy                 ExpectedSystemState       NextSystemState
+                  
+                                   LEAVE_OFF              HOST_POWERED_OFF          HOST_POWERED_OFF
+                                   LEAVE_OFF              HOST_POWERED_ON           HOST_POWERED_OFF
+                                   ALWAYS_POWER_ON        HOST_POWERED_OFF          HOST_POWERED_ON
+                                   ALWAYS_POWER_ON        HOST_POWERED_ON           HOST_POWERED_ON
+                                   RESTORE_LAST_STATE     HOST_POWERED_ON           HOST_POWERED_ON
+                                   RESTORE_LAST_STATE     HOST_POWERED_OFF          HOST_POWERED_OFF 
+                                     
+    [Documentation]   This test case sets the pilicy as given under the policy attribute.
+    ...               ExpectedSystemState:-is the state where system should be before running the test case
+    ...               NextSystemState:-is After Power cycle system should reach to this state 
+    ...               if the system is not at the Expected System State,This test case brings the system 
+    ...               in the Expected state then do the power cycle.
+
+    [Template]    setRestorePolicy
+    [Tags]        reboot_tests
+
+***keywords***
+setRestorePolicy
+    [arguments]        ${policy}     ${expectedSystemState}   ${nextSystemState}
+    ${valueDict} =   create dictionary   data=${policy}
+    Write Attribute  /org/openbmc/settings/host0    power_policy      data=${valueDict}
+    ${currentPolicy}=      Read Attribute    /org/openbmc/settings/host0    power_policy
+    Should Be Equal     ${currentPolicy}      ${policy}
+    ${currentSystemState}=      Read Attribute    /org/openbmc/settings/host0    system_state
+    log Many   "CurrentSystemState="   ${currentSystemState}   
+    log Many   "ExpectedSystemState="  ${expectedSystemState}   
+    log Many   "NextSystemState="      ${nextSystemState}
+    Run Keyword If   '${currentSystemState}' != '${expectedSystemState}' and '${expectedSystemState}' == 'HOST_POWERED_ON'      powerOnHost
+    Run Keyword If   '${currentSystemState}' != '${expectedSystemState}' and '${expectedSystemState}' == 'HOST_POWERED_OFF'     powerOffHost
+    log to console   "Doing power cycle"
+    PDU Power Cycle
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    log to console   "Host is pingable now"
+    Sleep   100sec
+    ${afterPduSystemState}=      Read Attribute    /org/openbmc/settings/host0    system_state
+    Should be equal   ${afterPduSystemState}    ${nextSystemState}
+
+powerOffHost
+    log to console    "Powering off the host"
+    @{arglist}=   Create List    
+    ${args}=     Create Dictionary   data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/control/chassis0/    powerOff    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}      ok
+    sleep  30sec
+    ${currentSystemState}=      Read Attribute    /org/openbmc/settings/host0    system_state
+    Should be equal   ${currentSystemState}     HOST_POWERED_OFF
+
+powerOnHost
+    log to console    "Powering on the host"
+    @{arglist}=   Create List   
+    ${args}=     Create Dictionary    data=@{arglist}
+    ${resp}=   Call Method    /org/openbmc/control/chassis0/    powerOn    data=${args}
+    should be equal as strings      ${resp.status_code}     ${HTTP_OK}
+    ${json} =   to json         ${resp.content}
+    should be equal as strings      ${json['status']}      ok
+    sleep   30sec
+    ${currentSystemState}=      Read Attribute    /org/openbmc/settings/host0    system_state
+    Should be equal   ${currentSystemState}     HOST_POWERED_ON
+
+
+
diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
new file mode 100644
index 0000000..d301cd9
--- /dev/null
+++ b/tests/test_sensors.robot
@@ -0,0 +1,281 @@
+*** Settings ***
+Documentation          This example demonstrates executing commands on a remote machine
+...                    and getting their output and the return code.
+...
+...                    Notice how connections are handled as part of the suite setup and
+...                    teardown. This saves some time when executing several test cases.
+
+Resource        ../lib/rest_client.robot
+Resource        ../lib/ipmi_client.robot
+Library         ../data/model.py
+
+Suite Setup            Open Connection And Log In
+Suite Teardown         Close All Connections
+
+
+*** Variables ***
+${model} =    ${OPENBMC_MODEL}
+
+*** Test Cases ***
+Verify connection
+    Execute new Command    echo "hello"
+    Response Should Be Equal    "hello"
+
+Execute ipmi BT capabilities command
+    Run IPMI command            0x06 0x36
+    response Should Be Equal    " 01 40 40 0a 01"
+
+Execute Set Sensor boot count
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/BootCount
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command   0x04 0x30 ${x} 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
+    Read the Attribute      ${uri}   value
+    ${val} =     convert to integer    53
+    Response Should Be Equal   ${val}
+
+Set Sensor Boot progress
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/BootProgress
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x14 0x00
+    Read the Attribute  ${uri}    value
+    Response Should Be Equal    FW Progress, Baseboard Init
+
+Set Sensor Boot progress Longest string
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/BootProgress
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x0e 0x00
+    Read The Attribute  ${uri}    value
+    Response Should Be Equal    FW Progress, Docking station attachment
+
+BootProgress sensor FW Hang unspecified Error
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/BootProgress
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00
+    Read The Attribute  ${uri}    value
+    Response Should Be Equal    FW Hang, Unspecified
+
+BootProgress fw hang state
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/BootProgress
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  ${uri}    value
+    Response Should Be Equal    POST Error, unknown
+
+OperatingSystemStatus Sensor boot completed progress
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/OperatingSystemStatus
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  ${uri}     value
+    Response Should Be Equal    Boot completed (00)
+
+OperatingSystemStatus Sensor progress
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/OperatingSystemStatus
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x04 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  ${uri}     value
+    Response Should Be Equal    PXE boot completed
+
+OCC Active sensor on enabled
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/cpu0/OccStatus
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  ${uri}     value
+    Response Should Be Equal    Enabled
+
+OCC Active sensor on disabled
+    ${uri} =    Set Variable    /org/openbmc/sensors/host/cpu0/OccStatus
+    ${x} =      Get Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  ${uri}     value
+    Response Should Be Equal    Disabled
+
+CPU Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    present
+    Response Should Be Equal    True
+
+CPU not Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    present
+    Response Should Be Equal    False
+
+CPU fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    True
+
+CPU no fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    False
+
+core Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}   present
+    Response Should Be Equal    True
+
+core not Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}   present
+    Response Should Be Equal    False
+
+core fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    True
+
+core no fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    False
+
+DIMM3 Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/dimm3
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}     present
+    Response Should Be Equal    True
+
+DIMM3 not Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/dimm3
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0xff 0x00 0x00 0x40 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}     present
+    Response Should Be Equal    False
+
+DIMM0 fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/dimm0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}     fault
+    Response Should Be Equal    True
+
+DIMM0 no fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/dimm0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}     fault
+    Response Should Be Equal    False
+
+Centaur0 Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/membuf0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    present
+    Response Should Be Equal    True
+
+Centaur0 not Present
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/membuf0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x00 0x00 0x40 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    present
+    Response Should Be Equal    False
+
+Centaur0 fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/membuf0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    True
+
+Centaur0 no fault
+    ${uri} =    Set Variable    /org/openbmc/inventory/system/chassis/motherboard/membuf0
+    ${x} =      Get Inventory Sensor Number   ${uri}
+
+    Run IPMI command  0x04 0x30 ${x} 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
+    Read The Attribute   ${uri}    fault
+    Response Should Be Equal    False
+
+System Present
+    Read The Attribute   /org/openbmc/inventory/system    present
+    Response Should Be Equal    True
+    
+System Fault
+    Read The Attribute   /org/openbmc/inventory/system    fault
+    Response Should Be Equal    False
+    
+Chassis Present
+    Read The Attribute   /org/openbmc/inventory/system/chassis    present
+    Response Should Be Equal    True
+    
+Chassis Fault
+    Read The Attribute   /org/openbmc/inventory/system/chassis    fault
+    Response Should Be Equal    False
+    
+io_board Present
+    Read The Attribute   /org/openbmc/inventory/system/chassis/io_board    present
+    Response Should Be Equal    True
+    
+io_board Fault
+    Read The Attribute   /org/openbmc/inventory/system/chassis/io_board    fault
+    Response Should Be Equal    False
+    
+
+
+*** Keywords ***
+Execute new Command
+    [arguments]    ${args}
+    ${output}=  Execute Command    ${args}
+    set test variable    ${OUTPUT}     "${output}"
+
+response Should Be Equal
+    [arguments]    ${args}
+    Should Be Equal    ${OUTPUT}    ${args}
+
+Response Should Be Empty
+    Should Be Empty    ${OUTPUT}
+
+Read the Attribute     
+    [arguments]    ${uri}    ${parm}
+    ${output} =     Read Attribute      ${uri}    ${parm}
+    set test variable    ${OUTPUT}     ${output}
+
+Get Sensor Number
+    [arguments]  ${name}
+    ${x} =       get sensor   ${OPENBMC_MODEL}   ${name}
+    [return]     ${x}
+
+Get Inventory Sensor Number
+    [arguments]  ${name}
+    ${x} =       get inventory sensor   ${OPENBMC_MODEL}   ${name}
+    [return]     ${x}
diff --git a/tests/test_syslog.robot b/tests/test_syslog.robot
new file mode 100755
index 0000000..92a5260
--- /dev/null
+++ b/tests/test_syslog.robot
@@ -0,0 +1,145 @@
+*** Settings ***
+
+Documentation       This suite is for testing syslog function of Open BMC.
+
+Resource            ../lib/rest_client.robot
+Resource            ../lib/utils.robot
+Resource            ../lib/ipmi_client.robot
+
+Library             OperatingSystem
+Library             SSHLibrary
+
+*** Variables ***
+${INVALID_SYSLOG_IP_ADDRESS}      a.ab.c.d
+${INVALID_SYSLOG_PORT}            abc
+${SYSTEM_SHUTDOWN_TIME}           1min
+${WAIT_FOR_SERVICES_UP}           3min
+
+*** Test Cases ***
+
+Get all Syslog settings
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to get all syslog settings from
+    ...                 open bmc system.\n
+
+    ${ip_address} =    Read Attribute    /org/openbmc/LogManager/rsyslog   ipaddr
+    Should Not Be Empty     ${ip_address}
+
+    ${port} =    Read Attribute    /org/openbmc/LogManager/rsyslog   port
+    Should Not Be Empty     ${port}
+
+    ${status} =    Read Attribute    /org/openbmc/LogManager/rsyslog   status
+    Should Not Be Empty     ${status}
+
+Enable syslog with port number and IP address
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to enable syslog with both ip address
+    ...                 and port number of remote system.\n
+
+    ${resp} =    Enable Syslog Setting    ${SYSLOG_IP_ADDRESS}    ${SYSLOG_PORT}
+    Should Be Equal    ${resp}    ok
+    ${ip}=   Read Attribute   /org/openbmc/LogManager/rsyslog   ipaddr
+    Should Be Equal    ${ip}    ${SYSLOG_IP_ADDRESS}
+    ${port}=   Read Attribute   /org/openbmc/LogManager/rsyslog   port
+    Should Be Equal    ${port}    ${SYSLOG_PORT}
+
+Enable syslog without IP address and port number
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to enable syslog without changing ip address
+    ...                 and port number.\n
+
+    ${resp} =    Enable Syslog Setting    ${EMPTY}    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+    ${status}=   Read Attribute   /org/openbmc/LogManager/rsyslog   status
+    Should Be Equal    ${status}    Enabled
+
+Enable syslog with only IP address
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to enable syslog with only ip address.\n
+
+    ${resp} =    Enable Syslog Setting    ${SYSLOG_IP_ADDRESS}    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+    ${ip}=   Read Attribute   /org/openbmc/LogManager/rsyslog   ipaddr
+    Should Be Equal    ${ip}    ${SYSLOG_IP_ADDRESS}
+    ${status}=   Read Attribute   /org/openbmc/LogManager/rsyslog   status
+    Should Be Equal    ${status}    Enabled
+
+Enable Syslog with only port number
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to enable syslog with only port number.\n
+
+    ${status}=   Read Attribute   /org/openbmc/LogManager/rsyslog   status
+    Should Be Equal    ${status}    Enabled
+    ${resp} =    Enable Syslog Setting    ${EMPTY}    ${SYSLOG_PORT}
+    Should Be Equal    ${resp}    ok
+    ${port}=   Read Attribute   /org/openbmc/LogManager/rsyslog   port
+    Should Be Equal    ${port}    ${SYSLOG_PORT}
+    ${status}=   Read Attribute   /org/openbmc/LogManager/rsyslog   status
+    Should Be Equal    ${status}    Enabled
+
+Disable Syslog
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to verify disabling syslog.\n
+
+    ${resp} =    Disable Syslog Setting    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+    ${status}=   Read Attribute   /org/openbmc/LogManager/rsyslog   status
+    Should Be Equal    Disable    ${status}
+
+Enable invalid ip for Syslog remote server
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is to verify error while enabling syslog with
+    ...                 invalid ip address.\n
+
+    ${resp} =    Enable Syslog Setting    ${INVALID_SYSLOG_IP_ADDRESS}    ${SYSLOG_PORT}
+    Should Be Equal    ${resp}    error
+
+Enable invalid port for Syslog remote server
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is to verify error while enabling syslog with
+    ...                 invalid port number.\n
+
+    ${resp} =    Enable Syslog Setting    ${SYSLOG_IP_ADDRESS}    ${INVALID_SYSLOG_PORT}
+    Should Be Equal    ${resp}    error
+
+
+Persistency check for syslog setting
+    [Documentation]   This test case is to verify that syslog setting does not change
+    ...               after service processor reboot.
+
+    ${old_ip}=   Read Attribute   /org/openbmc/LogManager/rsyslog   ipaddr
+    ${old_port}=   Read Attribute   /org/openbmc/LogManager/rsyslog   port
+    ${old_status} =    Read Attribute    /org/openbmc/LogManager/rsyslog   status
+    
+    Open Connection And Log In
+    ${output}=      Execute Command    /sbin/reboot
+    Sleep   ${SYSTEM_SHUTDOWN_TIME}
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    Sleep   ${WAIT_FOR_SERVICES_UP}
+
+    ${ip_address} =    Read Attribute    /org/openbmc/LogManager/rsyslog   ipaddr
+    ${port} =    Read Attribute    /org/openbmc/LogManager/rsyslog   port
+    ${status} =    Read Attribute    /org/openbmc/LogManager/rsyslog   status
+
+    Should Be Equal    ${old_ip}    ${ip_address}
+    Should Be Equal    ${old_port}    ${port}
+    Should Be Equal    ${old_status}    ${status}
+
+*** Keywords ***
+
+Enable Syslog Setting
+    [Arguments]    ${ipaddr}    ${port}
+    ${MYDICT}=  create Dictionary   ipaddr=${ipaddr}  port=${port}
+    @{rsyslog} =   Create List     ${MYDICT}
+    ${data} =   create dictionary   data=@{rsyslog}
+    ${resp} =   openbmc post request    /org/openbmc/LogManager/rsyslog/action/Enable     data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Disable Syslog Setting
+    [Arguments]    ${args}
+    @{setting_list} =   Create List     ${args}
+    ${data} =   create dictionary   data=@{setting_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/LogManager/rsyslog/action/Disable      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
diff --git a/tests/test_time.robot b/tests/test_time.robot
new file mode 100755
index 0000000..f3a061b
--- /dev/null
+++ b/tests/test_time.robot
@@ -0,0 +1,67 @@
+*** Settings ***
+Documentation          This suite is for testing System time in Open BMC.
+
+Resource        ../lib/ipmi_client.robot
+
+Library                 OperatingSystem
+Library                 SSHLibrary
+Library                 DateTime
+
+Suite Setup             Open Connection And Log In
+Suite Teardown          Close All Connections
+
+*** Variables ***
+${SYSTEM_TIME_INVALID}     01/01/1969 00:00:00
+${SYSTEM_TIME_VALID}       02/29/2016 09:10:00
+${ALLOWED_TIME_DIFF}       2
+
+*** Test Cases ***
+
+Get System Time
+    [Documentation]   ***GOOD PATH***
+    ...               This test case tries to get system time using IPMI and
+    ...               then tries to cross check with BMC date time.
+    ...               Expectation is that BMC time and ipmi sel time should match.
+
+    ${resp}=    Run IPMI Standard Command    sel time get
+    ${ipmidate}=    Convert Date    ${resp}    date_format=%m/%d/%Y %H:%M:%S    exclude_millis=yes
+    ${bmcdate}=    Get BMC Time And Date
+    ${diff}=    Subtract Date From Date    ${bmcdate}    ${ipmidate}
+    Should Be True      ${diff} < ${ALLOWED_TIME_DIFF}    Open BMC time does not match with IPMI sel time
+
+Set Valid System Time
+    [Documentation]   ***GOOD PATH***
+    ...               This test case tries to set system time using IPMI and
+    ...               then tries to cross check if it is correctly set in BMC.
+    ...               Expectation is that BMC time should match with new time.
+
+    ${resp}=    Run IPMI Standard Command    sel time set "${SYSTEM_TIME_VALID}"
+    ${setdate}=    Convert Date    ${SYSTEM_TIME_VALID}    date_format=%m/%d/%Y %H:%M:%S    exclude_millis=yes
+    ${bmcdate}=    Get BMC Time And Date
+    ${diff}=    Subtract Date From Date    ${bmcdate}    ${setdate}
+    Should Be True      ${diff} < ${ALLOWED_TIME_DIFF}     Open BMC time does not match with set time
+
+Set Invalid System Time
+    [Documentation]   ***BAD PATH***
+    ...               This test case tries to set system time with invalid time using IPMI.
+    ...               Expectation is that it should return error.
+
+    ${msg}=    Run Keyword And Expect Error    *    Run IPMI Standard Command    sel time set "${SYSTEM_TIME_INVALID}"
+    Should Start With    ${msg}    Specified time could not be parsed
+
+Set System Time with no time
+    [Documentation]   ***BAD PATH*** 
+    ...               This test case tries to set system time with no time using IPMI.
+    ...               Expectation is that it should return error.
+
+    ${msg}=    Run Keyword And Expect Error    *    Run IPMI Standard Command    sel time set ""
+    Should Start With    ${msg}    Specified time could not be parsed
+
+*** Keywords ***
+
+Get BMC Time And Date
+    ${stdout}    ${stderr}    ${output}=  Execute Command    date "+%m/%d/%Y %H:%M:%S"    return_stdout=True    return_stderr= True    return_rc=True
+    Should Be Equal    ${output}    ${0}    msg=${stderr}
+    ${resp}=    Convert Date    ${stdout}     date_format=%m/%d/%Y %H:%M:%S      exclude_millis=yes
+    Should Not Be Empty    ${resp}
+    [return]    ${resp}
diff --git a/tests/test_user.robot b/tests/test_user.robot
new file mode 100755
index 0000000..14de2df
--- /dev/null
+++ b/tests/test_user.robot
@@ -0,0 +1,301 @@
+*** Settings ***
+
+Documentation       This suite is for testing Open BMC user account management.
+
+Resource            ../lib/rest_client.robot
+Resource            ../lib/utils.robot
+
+Library             OperatingSystem
+Library             SSHLibrary
+Library             String
+
+*** Variables ***
+${RANDOM_STRING_LENGTH}    ${8}
+${VALID_PASSWORD}          abc123
+${NON_EXISTING_USER}       aaaaa
+*** Test Cases ***
+
+Create and delete user group
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is for testing user group creation
+    ...                 and deletion in open bmc.\n
+
+    ${groupname} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${resp} =    Create UserGroup    ${groupname}
+    Should Be Equal    ${resp}    ok
+    ${usergroup_list} =    Get GroupListUsr
+    Should Contain     ${usergroup_list}    ${groupname}
+    ${resp} =    Delete Group    ${groupname}
+    Should Be Equal    ${resp}    ok
+
+Create and delete user without groupname
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is for testing user creation with
+    ...                 without groupname in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${password}
+    Should Be Equal    ${resp}    ok
+    ${user_list} =    Get UserList
+    Should Contain     ${user_list}    ${username}
+
+    Login BMC    ${username}    ${password}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Delete User    ${username}
+    Should Be Equal    ${resp}    ok
+
+Create and delete user with user group name
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is for testing user creation with
+    ...                 user name, password, comment and group name(user group)
+    ...                 in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${groupname} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create UserGroup    ${groupname}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Create User    ${comment}    ${username}    ${groupname}    ${password}
+    Should Be Equal    ${resp}    ok
+    ${user_list} =    Get UserList
+    Should Contain     ${user_list}    ${username}
+
+    Login BMC    ${username}    ${password}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Delete User    ${username}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Delete Group    ${groupname}
+    Should Be Equal    ${resp}    ok
+
+Create multiple users
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to verify that multiple users creation
+    ...                 in open bmc.\n
+
+    : FOR    ${INDEX}    IN RANGE    1    10
+        \    Log    ${INDEX}
+        \    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+        \    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+        \    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+        \    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${password}
+        \    Should Be Equal    ${resp}    ok
+        \    ${user_list} =    Get UserList
+        \    Should Contain     ${user_list}    ${username}
+        \    Login BMC    ${username}    ${password}
+        \    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+        \    Should Be Equal    ${rc}    ${0}
+
+Create and delete user without password
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to create and delete a user without password
+    ...                 in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${groupname} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create UserGroup    ${groupname}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Create User    ${comment}    ${username}    ${groupname}    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+    ${user_list} =    Get UserList
+    Should Contain     ${user_list}    ${username}
+
+    Login BMC    ${username}    ${EMPTY}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Delete User    ${username}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Delete Group    ${groupname}
+    Should Be Equal    ${resp}    ok
+
+Set password for existing user
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is for testing password set for user
+    ...                 in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${password}
+    Should Be Equal    ${resp}    ok
+    ${user_list} =    Get UserList
+    Should Contain     ${user_list}    ${username}
+
+    Login BMC    ${username}    ${password}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Change Password    ${username}    ${VALID_PASSWORD}
+    Should Be Equal    ${resp}    ok
+
+    Login BMC    ${username}    ${VALID_PASSWORD}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Delete User    ${username}
+    Should Be Equal    ${resp}    ok
+
+Set password with empty password for existing
+    [Documentation]     ***GOOD PATH***
+    ...                 This testcase is to verify that empty password can be set 
+    ...                 for a existing user.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${password}
+    Should Be Equal    ${resp}    ok
+    ${user_list} =    Get UserList
+    Should Contain     ${user_list}    ${username}
+
+    Login BMC    ${username}    ${password}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+    ${resp} =    Change Password    ${username}    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+
+    Login BMC    ${username}    ${EMPTY}
+    ${rc}=    Execute Command    echo Login    return_stdout=False    return_rc=True
+    Should Be Equal    ${rc}    ${0}
+
+Set password for non existing user
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is for testing password set for non-existing user
+    ...                 in open bmc.\n
+
+    ${resp} =    Change Password    ${NON_EXISTING_USER}    ${VALID_PASSWORD}
+    Should Be Equal    ${resp}    error
+
+Create existing user
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is for checking that user creation is not allowed
+    ...                 for existing user in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${EMPTY}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Create User    ${comment}    ${username}    ${EMPTY}    ${EMPTY}
+    Should Be Equal    ${resp}    error
+
+    ${resp} =    Delete User    ${username}
+    Should Be Equal    ${resp}    ok
+
+Create user with no name
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is for checking that user creation is not allowed
+    ...                 with empty username in open bmc.\n
+
+    ${username} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${password} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${comment} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+    ${groupname} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create User    ${comment}    ${EMPTY}    ${groupname}    ${password}
+    Should Be Equal    ${resp}    error
+    ${user_list} =    Get UserList
+    Should Not Contain     ${user_list}    ${EMPTY}
+
+Create existing user group
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is for checking that user group creation is not allowed
+    ...                 for existing user group in open bmc.\n
+
+    ${groupname} =    Generate Random String    ${RANDOM_STRING_LENGTH}
+
+    ${resp} =    Create UserGroup    ${groupname}
+    Should Be Equal    ${resp}    ok
+    ${resp} =    Create UserGroup    ${groupname}
+    Should Be Equal    ${resp}    error
+
+    ${resp} =    Delete Group    ${groupname}
+    Should Be Equal    ${resp}    ok
+
+Create user group with no name
+    [Documentation]     ***BAD PATH***
+    ...                 This testcase is for checking that user group creation is not allowed
+    ...                 with empty groupname in open bmc.\n
+
+    ${resp} =    Create UserGroup    ${EMPTY}
+    Should Be Equal    ${resp}    error
+    ${usergroup_list} =    Get GroupListUsr
+    Should Not Contain    ${usergroup_list}    ${EMPTY}
+
+*** Keywords ***
+
+Get UserList
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   OpenBMC Post Request   /org/openbmc/UserManager/Users/action/UserList   data=${data}
+    should be equal as strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['data']}
+
+Get GroupListUsr
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   OpenBMC Post Request   /org/openbmc/UserManager/Groups/action/GroupListUsr   data=${data}
+    should be equal as strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['data']}
+
+Create User
+    [Arguments]    ${comment}    ${username}    ${groupname}    ${password}
+    @{user_list} =   Create List     ${comment}    ${username}    ${groupname}    ${password}
+    ${data} =   create dictionary   data=@{user_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/UserManager/Users/action/UserAdd      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Change Password
+    [Arguments]    ${username}    ${password}
+    @{user_list} =   Create List     ${username}    ${password}
+    ${data} =   create dictionary   data=@{user_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/UserManager/User/action/Passwd      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Create UserGroup
+    [Arguments]    ${args}
+    @{group_list} =   Create List     ${args}
+    ${data} =   create dictionary   data=@{group_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/UserManager/Groups/action/GroupAddUsr      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Delete Group
+    [Arguments]    ${args}
+    @{group_list} =   Create List     ${args}
+    ${data} =   create dictionary   data=@{group_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/UserManager/Group/action/GroupDel      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Delete User
+    [Arguments]    ${args}
+    @{user_list} =   Create List     ${args}
+    ${data} =   create dictionary   data=@{user_list}
+    ${resp} =   OpenBMC Post Request    /org/openbmc/UserManager/User/action/Userdel      data=${data}
+    ${jsondata} =    to json    ${resp.content}
+    [return]    ${jsondata['status']}
+
+Login BMC
+    [Arguments]    ${username}    ${password}
+    Open connection     ${OPENBMC_HOST}
+    ${resp} =   Login   ${username}    ${password}
+    [return]    ${resp}
diff --git a/tests/test_warmreset.robot b/tests/test_warmreset.robot
new file mode 100644
index 0000000..6706410
--- /dev/null
+++ b/tests/test_warmreset.robot
@@ -0,0 +1,52 @@
+*** Settings ***
+Documentation           This suite is for testing OCC: Power capping setting
+
+Resource                ../lib/rest_client.robot
+Resource                ../lib/utils.robot
+
+
+Library                 OperatingSystem
+Library                 SSHLibrary
+
+*** Variables ***
+${SYSTEM_SHUTDOWN_TIME}    ${5}
+
+*** Test Cases ***
+
+Test WarmReset via REST
+    [Tags]      reboot_tests
+    ${warm_test_file}=  Set Variable    /tmp/before_warmreset
+    Open Connection And Log In
+    ${stdout}   ${stderr}   ${rc}=  Execute Command     touch ${warm_test_file}     return_stderr=True  return_rc=True
+    Should Be Equal     ${rc}   ${0}    Unable to create file - ${warm_test_file}
+
+    ${bmc_uri}=     Get BMC Link
+    ${data} =   create dictionary   data=@{EMPTY}
+    ${resp} =   openbmc post request    ${bmc_uri}/action/warmReset     data=${data}
+    Should Be Equal As Strings      ${resp.status_code}     ${HTTP_OK}
+    Sleep   ${SYSTEM_SHUTDOWN_TIME}min
+    Wait For Host To Ping   ${OPENBMC_HOST}
+    ${max_wait_time}=   Evaluate    ${SYSTEM_SHUTDOWN_TIME}+${OPENBMC_REBOOT_TIMEOUT}
+
+    Open Connection And Log In
+    ${uptime}=  Execute Command    cut -d " " -f 1 /proc/uptime| cut -d "." -f 1
+    ${uptime}=  Convert To Integer  ${uptime}
+    ${uptime}=  Evaluate   ${uptime}/60
+    Should Be True  ${uptime}<${max_wait_time}
+    Open Connection And Log In
+    ${stdout}   ${stderr}   ${rc}=  Execute Command     ls ${warm_test_file}    return_stderr=True  return_rc=True
+    Should Be Equal     ${rc}   ${1}    File ${warm_test_file} does exist even after reboot of BMC, error:${stderr}, stdput: ${stdout}
+
+*** Keywords ***
+Get BMC Link
+    ${resp}=    OpenBMC Get Request     /org/openbmc/control/
+    ${jsondata}=   To Json    ${resp.content}
+    log     ${jsondata}
+    : FOR    ${ELEMENT}    IN    @{jsondata["data"]}
+    \   log     ${ELEMENT}
+    \   ${found}=   Get Lines Matching Pattern      ${ELEMENT}      *control/bmc*
+    \   Return From Keyword If     '${found}' != ''     ${found}
+
+Open Connection And Log In
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
diff --git a/tools/generate_argumentfile.sh b/tools/generate_argumentfile.sh
new file mode 100755
index 0000000..ab808de
--- /dev/null
+++ b/tools/generate_argumentfile.sh
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+echo "--variable OPENBMC_HOST:$OPENBMC_HOST" > $ARG_FILE
+echo "--variable OPENBMC_MODEL:$OPENBMC_MODEL" >> $ARG_FILE
+echo "--variable OPENBMC_USERNAME:$OPENBMC_USERNAME" >> $ARG_FILE
+echo "--variable OPENBMC_PASSWORD:$OPENBMC_PASSWORD" >> $ARG_FILE
+echo "--variable PDU_TYPE:$PDU_TYPE" >> $ARG_FILE
+echo "--variable PDU_IP:$PDU_IP" >> $ARG_FILE
+echo "--variable PDU_USERNAME:$PDU_USERNAME" >> $ARG_FILE
+echo "--variable PDU_PASSWORD:$PDU_PASSWORD" >> $ARG_FILE
+echo "--variable PDU_SLOT_NO:$PDU_SLOT_NO" >> $ARG_FILE
+echo "--variable SYSLOG_IP_ADDRESS:$SYSLOG_IP_ADDRESS" >> $ARG_FILE
+echo "--variable SYSLOG_PORT:$SYSLOG_PORT" >> $ARG_FILE
diff --git a/tox.ini b/tox.ini
new file mode 100755
index 0000000..8a4d4ec
--- /dev/null
+++ b/tox.ini
@@ -0,0 +1,71 @@
+[tox]
+skipsdist = True
+
+[testenv]
+passenv = *
+setenv =
+    ARG_FILE={env:ARG_FILE:/tmp/argument_file.txt}
+    PYTHONWARNINGS="ignore:Unverified HTTPS request"
+    OPENBMC_PASSWORD=0penBmc
+    OPENBMC_USERNAME=root
+    SYSLOG_IP_ADDRESS=127.0.0.1
+    SYSLOG_PORT=514
+whitelist_externals = *
+install_command = pip install -U {opts} {packages}
+deps = -r{toxinidir}/requirements.txt
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
+
+[testenv:full]
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} .
+
+[testenv:tests]
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} tests
+
+[testenv:custom]
+deps = {[testenv]deps}
+setenv = {[testenv]setenv}
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
+
+[testenv:barreleye]
+deps     = {[testenv]deps}
+setenv   = {[testenv]setenv}
+    OPENBMC_MODEL=./data/Barreleye.py
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
+
+[testenv:palmetto]
+deps     = {[testenv]deps}
+setenv   = {[testenv]setenv}
+    OPENBMC_MODEL=./data/Palmetto.py
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
+
+[testenv:firestone]
+deps     = {[testenv]deps}
+setenv   = {[testenv]setenv}
+    OPENBMC_MODEL=./data/Firestone.py
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
+
+[testenv:Garrison]
+deps     = {[testenv]deps}
+setenv   = {[testenv]setenv}
+    OPENBMC_MODEL=./data/Garrison.py
+commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
+    python -m robot.run --exclude reboot_tests --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
-- 
2.8.4
