Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 392E41A0D00
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531045275916.9237936211422;
 Mon, 11 Jan 2016 08:50:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 18/60] Added full sensor suite
Date: Mon, 11 Jan 2016 10:49:44 -0600
Message-Id: <1452531026-13715-19-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:51 -0000

From: Chris Austen <austenc@us.ibm.com>

corrected cpu sensor#
---
 tests/test_sensors.robot | 188 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 177 insertions(+), 11 deletions(-)

diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
index 3d17360..a50805a 100644
--- a/tests/test_sensors.robot
+++ b/tests/test_sensors.robot
@@ -5,34 +5,200 @@ Documentation          This example demonstrates executing commands on a remote
 ...                    Notice how connections are handled as part of the suite setup and
 ...                    teardown. This saves some time when executing several test cases.
 
-Resource		../lib/rest_client.robot
+Resource        ../lib/rest_client.robot
 
 
 Library                SSHLibrary
 Suite Setup            Open Connection And Log In
 Suite Teardown         Close All Connections
 
+
 *** Variables ***
 
 
 *** Test Cases ***
+Verify connection
+    Execute new Command    echo "hello"
+    Response Should Be Equal    "hello"
+
+
 Execute ipmi BT capabilities command
-	${output}=    Run IPMI command 		0x06 0x36
-	Should Be Equal		"${output}"		" 01 3f 3f 0a 01"
+    Run IPMI command            0x06 0x36
+    response Should Be Equal    " 01 3f 3f 0a 01"
+
 
 Execute Set Sensor boot count
-	Run IPMI command  0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
-	${value} =  Read Attribute	/org/openbmc/sensor/virtual/BootCount	value
-	Should Be Equal		${value}	"53"
+    Run IPMI command    0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
+    Read the Attribute      /org/openbmc/sensor/virtual/BootCount   value
+    Response Should Be Equal    "53"
+
+
+Set Sensor Boot progress
+    Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x14 0x00
+    Read the Attribute  /org/openbmc/sensor/virtual/BootProgress    value
+    Response Should Be Equal    "FW Progress, Baseboard Init"
+
+
+
+Set Sensor Boot progress Longest string
+    Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x04 0x00 0x00 0x00 0x00 0x0e 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
+    Response Should Be Equal    "FW Progress, Docking station attachment"
+
+
+BootProgress sensor FW Hang unspecified Error
+    Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
+    Response Should Be Equal    "FW Hang, Unspecified"
+
+
+BootProgress fw hang state
+    Run IPMI command  0x04 0x30 0x05 0xa9 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/BootProgress    value
+    Response Should Be Equal    "POST Error, unknown"
+
+
+OperatingSystemStatus Sensor boot completed progress
+    Run IPMI command  0x04 0x30 0x32 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/OperatingSystemStatus     value
+    Response Should Be Equal    "Boot completed (00)"
+
+
+OperatingSystemStatus Sensor progress
+    Run IPMI command  0x04 0x30 0x32 0x00 0x00 0x04 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/OperatingSystemStatus     value
+    Response Should Be Equal    "PXE boot completed"
+
+
+OCC Active sensor on enabled
+    Run IPMI command  0x04 0x30 0x08 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/OccStatus     value
+    Response Should Be Equal    "Enabled"
+
+
+OCC Active sensor on disabled
+    Run IPMI command  0x04 0x30 0x08 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute  /org/openbmc/sensor/virtual/OccStatus     value
+    Response Should Be Equal    "Disabled"
+
+
+CPU Present
+    Run IPMI command  0x04 0x30 0x2f 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    present
+    Response Should Be Equal    "True"
+
+CPU not Present
+    Run IPMI command  0x04 0x30 0x2f 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    present
+    Response Should Be Equal    "False"
+
+
+CPU fault
+    Run IPMI command  0x04 0x30 0x2f 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    fault
+    Response Should Be Equal    "True"
+
+
+CPU no fault
+    Run IPMI command  0x04 0x30 0x2f 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0    fault
+    Response Should Be Equal    ""
+
+
+core Present
+    Run IPMI command  0x04 0x30 0x2d 0xa9 0x00 0x80 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11   present
+    Response Should Be Equal    "True"
+
+core not Present
+    Run IPMI command  0x04 0x30 0x2d 0xa9 0x00 0x00 0x00 0x80 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11   present
+    Response Should Be Equal    "False"
+
+
+core fault
+    Run IPMI command  0x04 0x30 0x2d 0xa9 0xff 0x00 0x01 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11    fault
+    Response Should Be Equal    "True"
+
+
+core no fault
+    Run IPMI command  0x04 0x30 0x2d 0x00 0x00 0x00 0x00 0x00 0x01 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/cpu0/core11    fault
+    Response Should Be Equal    ""
+
+
+DIMM3 Present
+    Run IPMI command  0x04 0x30 0x21 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm3     present
+    Response Should Be Equal    "True"
+
+DIMM3 not Present
+    Run IPMI command  0x04 0x30 0x21 0xa9 0xff 0x00 0x00 0x40 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm3     present
+    Response Should Be Equal    "False"
+
+
+DIMM0 fault
+    Run IPMI command  0x04 0x30 0x1e 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm0     fault
+    Response Should Be Equal    "True"
+
+
+DIMM0 no fault
+    Run IPMI command  0x04 0x30 0x1e 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/dimm0     fault
+    Response Should Be Equal    ""
+
+
+
+Centaur0 Present
+    Run IPMI command  0x04 0x30 0x2e 0xa9 0x00 0x40 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    present
+    Response Should Be Equal    "True"
+
+Centaur0 not Present
+    Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x00 0x00 0x40 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    present
+    Response Should Be Equal    "False"
+
+
+Centaur0 fault
+    Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x10 0x00 0x00 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    fault
+    Response Should Be Equal    "True"
+
+Centaur0 no fault
+    Run IPMI command  0x04 0x30 0x2e 0x00 0x00 0x00 0x00 0x10 0x00 0x00 0x20 0x00
+    Read The Attribute   /org/openbmc/inventory/system/chassis/motherboard/centaur0    fault
+    Response Should Be Equal    ""
 
 
 
 *** Keywords ***
+Execute new Command
+    [arguments]    ${args}
+    ${output}=  Execute Command    ${args}
+    set test variable    ${OUTPUT}     "${output}"
+
+response Should Be Equal
+    [arguments]    ${args}
+    Should Be Equal    ${OUTPUT}    ${args}
+
+
+Read the Attribute     
+    [arguments]    ${uri}    ${parm}
+    ${output} =  Read Attribute      ${uri}    ${parm}
+    set test variable    ${OUTPUT}     ${output}
+
+
 Open Connection And Log In
-	Open connection 	${OPENBMC_HOST}
-	Login	${OPENBMC_USERNAME}	${OPENBMC_PASSWORD}
+    Open connection     ${OPENBMC_HOST}
+    Login   ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
 
 Run IPMI Command
-	[arguments]	${args}
-	${output}=	Execute Command    /home/root/ipmitool -I dbus raw ${args}
-	[return]	${output}
+    [arguments]    ${args}
+    ${output}=  Execute Command    /usr/sbin/ipmitool -I dbus raw ${args}
+    set test variable    ${OUTPUT}     "${output}"
+
+
-- 
2.6.4
