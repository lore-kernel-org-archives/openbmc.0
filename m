Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3DD4E1A0D05
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531082137741.9282691245297;
 Mon, 11 Jan 2016 08:51:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 56/60] Fix errors
Date: Mon, 11 Jan 2016 10:50:22 -0600
Message-Id: <1452531026-13715-57-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:34 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 lib/rest_client.robot      |  5 +--
 tests/test_fan.robot       |  3 --
 tests/test_inventory.robot |  4 +--
 tests/test_sensors.robot   | 84 ++++++++++++++++------------------------------
 4 files changed, 33 insertions(+), 63 deletions(-)

diff --git a/lib/rest_client.robot b/lib/rest_client.robot
index f0c1ba3..5cd71b2 100644
--- a/lib/rest_client.robot
+++ b/lib/rest_client.robot
@@ -106,7 +106,8 @@ Logging
 Read Attribute
     [arguments]    ${uri}    ${attr}
     ${resp} =   OpenBMC Get Request    ${uri}/attr/${attr}
-    [return]    ${resp.content}
+    ${content}=     To Json    ${resp.content}
+    [return]    ${content["data"]}
 
 
 Read Properties
@@ -114,4 +115,4 @@ Read Properties
     ${resp} =   OpenBMC Get Request    ${uri}
     Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
     ${content}=     To Json    ${resp.content}
-    [return]    ${content}
\ No newline at end of file
+    [return]    ${content["data"]}
\ No newline at end of file
diff --git a/tests/test_fan.robot b/tests/test_fan.robot
index 61255e6..2f593b5 100644
--- a/tests/test_fan.robot
+++ b/tests/test_fan.robot
@@ -4,6 +4,3 @@ Suite Teardown    Delete All Sessions
 Resource          ../lib/rest_client.robot
 
 *** Test Cases ***
-List all the fans
-    ${resp} =    OpenBMC Get Request    /org.openbmc.control.Fan/
-    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
index afe4613..3bb8f9c 100644
--- a/tests/test_inventory.robot
+++ b/tests/test_inventory.robot
@@ -13,14 +13,14 @@ List Inventory
     ${jsondata}=    To Json    ${resp.content}
     ${ret}=    Get Inventory Schema    ${MACHINE_TYPE}
     : FOR    ${ELEMENT}    IN    @{ret}
-    \    Should Contain    ${jsondata}    ${ELEMENT}
+    \    Should Contain    ${jsondata["data"]}    ${ELEMENT}
 
 
 Verify dimm vpd
 	: FOR 	${INDEX} 	IN RANGE 	0 	4
 	\	log 	${INDEX}
 	\	${value} =	Read Attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm${INDEX}	fru_type
-	\	Should Be Equal	${value}	"DIMM"
+	\	Should Be Equal	${value}	DIMM
 
 
 Verify dimm vpd properties
diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
index 3e84e44..945fb47 100644
--- a/tests/test_sensors.robot
+++ b/tests/test_sensors.robot
@@ -21,158 +21,134 @@ Verify connection
     Execute new Command    echo "hello"
     Response Should Be Equal    "hello"
 
-
 Execute ipmi BT capabilities command
     Run IPMI command            0x06 0x36
     response Should Be Equal    " 01 3f 3f 0a 01"
 
-
 Execute Set Sensor boot count
     Run IPMI command    0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
     Read the Attribute      /org/openbmc/sensor/virtual/BootCount   value
-    Response Should Be Equal    "53"
-
+    Response Should Be Equal    53
 
 Set Sensor Boot progress
     Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x14 0x00
     Read the Attribute  /org/openbmc/sensor/virtual/BootProgress    value
-    Response Should Be Equal    "FW Progress, Baseboard Init"
-
-
+    Response Should Be Equal    FW Progress, Baseboard Init
 
 Set Sensor Boot progress Longest string
     Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x0e 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
-    Response Should Be Equal    "FW Progress, Docking station attachment"
-
+    Response Should Be Equal    FW Progress, Docking station attachment
 
 BootProgress sensor FW Hang unspecified Error
     Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
-    Response Should Be Equal    "FW Hang, Unspecified"
-
+    Response Should Be Equal    FW Hang, Unspecified
 
 BootProgress fw hang state
     Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
-    Response Should Be Equal    "POST Error, unknown"
-
+    Response Should Be Equal    POST Error, unknown
 
 OperatingSystemStatus Sensor boot completed progress
     Run IPMI command  0x04 0x30 0x32 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/OperatingSystemStatus     value
-    Response Should Be Equal    "Boot completed (00)"
-
+    Response Should Be Equal    Boot completed (00)
 
 OperatingSystemStatus Sensor progress
     Run IPMI command  0x04 0x30 0x32 0x00 0x00 0x04 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/OperatingSystemStatus     value
-    Response Should Be Equal    "PXE boot completed"
-
+    Response Should Be Equal    PXE boot completed
 
 OCC Active sensor on enabled
     Run IPMI command  0x04 0x30 0x08 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/OccStatus     value
-    Response Should Be Equal    "Enabled"
-
+    Response Should Be Equal    Enabled
 
 OCC Active sensor on disabled
     Run IPMI command  0x04 0x30 0x08 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute  /org/openbmc/sensor/virtual/OccStatus     value
-    Response Should Be Equal    "Disabled"
-
+    Response Should Be Equal    Disabled
 
 CPU Present
     Run IPMI command  0x04 0x30 0x2f 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    present
-    Response Should Be Equal    "True"
+    Response Should Be Equal    True
 
 CPU not Present
     Run IPMI command  0x04 0x30 0x2f 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    present
-    Response Should Be Equal    "False"
-
+    Response Should Be Equal    False
 
 CPU fault
     Run IPMI command  0x04 0x30 0x2f 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    fault
-    Response Should Be Equal    "True"
-
+    Response Should Be Equal    True
 
 CPU no fault
     Run IPMI command  0x04 0x30 0x2f 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    fault
-    Response Should Be Equal    ""
-
+    Response Should Be Empty
 
 core Present
     Run IPMI command  0x04 0x30 0x2d 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11   present
-    Response Should Be Equal    "True"
+    Response Should Be Equal    True
 
 core not Present
     Run IPMI command  0x04 0x30 0x2d 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11   present
-    Response Should Be Equal    "False"
-
+    Response Should Be Equal    False
 
 core fault
     Run IPMI command  0x04 0x30 0x2d 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11    fault
-    Response Should Be Equal    "True"
-
+    Response Should Be Equal    True
 
 core no fault
     Run IPMI command  0x04 0x30 0x2d 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11    fault
-    Response Should Be Equal    ""
-
+    Response Should Be Empty
 
 DIMM3 Present
     Run IPMI command  0x04 0x30 0x21 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm3     present
-    Response Should Be Equal    "True"
+    Response Should Be Equal    True
 
 DIMM3 not Present
     Run IPMI command  0x04 0x30 0x21 0xa9 0xff 0x00 0x00 0x40 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm3     present
-    Response Should Be Equal    "False"
-
+    Response Should Be Equal    False
 
 DIMM0 fault
     Run IPMI command  0x04 0x30 0x1e 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm0     fault
-    Response Should Be Equal    "True"
-
+    Response Should Be Equal    True
 
 DIMM0 no fault
     Run IPMI command  0x04 0x30 0x1e 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm0     fault
-    Response Should Be Equal    ""
-
-
+    Response Should Be Empty
 
 Centaur0 Present
     Run IPMI command  0x04 0x30 0x2e 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    present
-    Response Should Be Equal    "True"
+    Response Should Be Equal    True
 
 Centaur0 not Present
     Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x00 0x00 0x40 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    present
-    Response Should Be Equal    "False"
-
+    Response Should Be Equal    False
 
 Centaur0 fault
     Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    fault
-    Response Should Be Equal    "True"
+    Response Should Be Equal    True
 
 Centaur0 no fault
     Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
     Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    fault
-    Response Should Be Equal    ""
-
+    Response Should Be Empty
 
 
 *** Keywords ***
@@ -185,15 +161,13 @@ response Should Be Equal
     [arguments]    ${args}
     Should Be Equal    ${OUTPUT}    ${args}
 
+Response Should Be Empty
+    Should Be Empty    ${OUTPUT}
 
 Read the Attribute     
     [arguments]    ${uri}    ${parm}
     ${output} =     Read Attribute      ${uri}    ${parm}
-    ${json} =       to json             ${output}
-    ${data} =       get from dictionary      ${json}     data
-    set test variable    ${OUTPUT}     "${data}"
-    
-
+    set test variable    ${OUTPUT}     ${output}
 
 Open Connection And Log In
     Open connection     ${OPENBMC_HOST}
@@ -203,5 +177,3 @@ Run IPMI Command
     [arguments]    ${args}
     ${output}=  Execute Command    /usr/sbin/ipmitool -I dbus raw ${args}
     set test variable    ${OUTPUT}     "${output}"
-
-
-- 
2.6.4
