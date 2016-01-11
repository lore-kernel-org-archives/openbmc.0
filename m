Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FCC51A0D0B
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531038466819.2040769651504;
 Mon, 11 Jan 2016 08:50:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 11/60] base add for sensor tests
Date: Mon, 11 Jan 2016 10:49:37 -0600
Message-Id: <1452531026-13715-12-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:44 -0000
X-List-Received-Date: Mon, 11 Jan 2016 16:50:44 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 data/variables.py        | 28 ++++++++++++++++++++++++
 lib/resource.txt         |  8 +++++--
 tests/test_sensors.robot | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tests/test_sensors.robot

diff --git a/data/variables.py b/data/variables.py
index a70367c..820a251 100644
--- a/data/variables.py
+++ b/data/variables.py
@@ -49,3 +49,31 @@ INVENTORY={
                 "is_fru",
                 "present"],
 }
+
+SENSORS={
+    "palmetto" : {
+        0x2f : '<inventory_root>/system/chassis/motherboard/cpu0',
+        0x22 : '<inventory_root>/system/chassis/motherboard/cpu0/core0',
+        0x23 : '<inventory_root>/system/chassis/motherboard/cpu0/core1',
+        0x24 : '<inventory_root>/system/chassis/motherboard/cpu0/core2',
+        0x25 : '<inventory_root>/system/chassis/motherboard/cpu0/core3',
+        0x26 : '<inventory_root>/system/chassis/motherboard/cpu0/core4',
+        0x27 : '<inventory_root>/system/chassis/motherboard/cpu0/core5',
+        0x28 : '<inventory_root>/system/chassis/motherboard/cpu0/core6',
+        0x29 : '<inventory_root>/system/chassis/motherboard/cpu0/core7',
+        0x2a : '<inventory_root>/system/chassis/motherboard/cpu0/core8',
+        0x2b : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
+        0x2c : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
+        0x2d : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
+        0x2e : '<inventory_root>/system/chassis/motherboard/centaur0',
+        0x1e : '<inventory_root>/system/chassis/motherboard/dimm0',
+        0x1f : '<inventory_root>/system/chassis/motherboard/dimm1',
+        0x20 : '<inventory_root>/system/chassis/motherboard/dimm2',
+        0x21 : '<inventory_root>/system/chassis/motherboard/dimm3',
+        0x09 : '/org/openbmc/sensor/virtual/BootCount',
+        0x05 : '/org/openbmc/sensor/virtual/BootProgress',
+        0x04 : '/org/openbmc/sensor/virtual/HostStatus',
+        0x08 : '/org/openbmc/sensor/virtual/OccStatus',
+        0x32 : '/org/openbmc/sensor/virtual/OperatingSystemStatus',
+    }
+}
diff --git a/lib/resource.txt b/lib/resource.txt
index fd10050..85bf2fd 100644
--- a/lib/resource.txt
+++ b/lib/resource.txt
@@ -6,10 +6,10 @@ Library           OperatingSystem
 Variables         ../data/variables.py
 
 *** Variables ***
-${OPENBMC_HOST}    192.168.122.100    # openbmc ip address
+${OPENBMC_HOST}    9.3.164.161
 ${DBUS_PREFIX}    ${EMPTY}
 ${PORT}           ${EMPTY}
-${AUTH_URI}       http://${OPENBMC_HOST}:${PORT}
+${AUTH_URI}       http://${OPENBMC_HOST}
 ${OPENBMC_USERNAME}    root
 ${OPENBMC_PASSWORD}    0penBmc
 ${MACHINE_TYPE}    palmetto
@@ -18,3 +18,7 @@ ${MACHINE_TYPE}    palmetto
 Get Inventory Schema
     [Arguments]    ${machine}
     [Return]    &{INVENTORY}[${machine}]
+
+Get Sensor Schema
+    [Arguments]    ${machine}
+    [Return]    &{SENSORS}[${machine}]
\ No newline at end of file
diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
new file mode 100644
index 0000000..b36b059
--- /dev/null
+++ b/tests/test_sensors.robot
@@ -0,0 +1,56 @@
+*** Settings ***
+Documentation          This example demonstrates executing commands on a remote machine
+...                    and getting their output and the return code.
+...
+...                    Notice how connections are handled as part of the suite setup and
+...                    teardown. This saves some time when executing several test cases.
+
+Resource          ../lib/rest_client.robot
+
+
+Library                SSHLibrary
+Suite Setup            Open Connection And Log In
+Suite Teardown         Close All Connections
+
+*** Variables ***
+${HOST}                9.3.164.147
+${USERNAME}            root
+${PASSWORD}            0penBmc
+
+*** Test Cases ***
+Execute Command And Verify Output
+	[Documentation]    Execute Command on the remote machine.
+	${output}=    Execute Command    echo Hello
+	Should Be Equal    ${output}    Hello
+
+Execute Sending a file
+	put file    ./tfile /home/root
+
+Execute ipmi BT capabilities command
+	${output}=    Execute Command    /home/root/ipmitool -I dbus raw 0x06 0x36
+	Should Be Equal    "${output}"    " 01 3f 3f 0a 01"
+
+Execute Boot Sensoripmi BT capabilities command
+	${output}=    Execute Command    /home/root/ipmitool -I dbus raw 0x06 0x36
+	Should Be Equal    "${output}"    " 01 3f 3f 0a 01"
+
+Execute Set Sensor boot count
+	Run IPMI command  0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
+	${value} =  Read attribute	/org/openbmc/sensor/virtual/BootCount	value
+	Should Be Equal ${value}    "53"
+
+
+
+*** Keywords ***
+Open Connection And Log In
+   Open Connection    ${HOST}
+   Login    ${USERNAME}    ${PASSWORD}
+
+Run IPMI Command
+	[arguments]     ${args}
+	${output}=      Execute Command    /home/root/ipmitool -I dbus raw ${args}
+
+Read attribute
+	[arguments]	${uri}	${attr}
+	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
+	[return]	${resp.content}
\ No newline at end of file
-- 
2.6.4
