Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1EC721A0D10
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531069669262.961164551073;
 Mon, 11 Jan 2016 08:51:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 43/60] fixed review comments
Date: Mon, 11 Jan 2016 10:50:09 -0600
Message-Id: <1452531026-13715-44-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:15 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 tests/test_sensors.robot | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
index b36b059..79ba4d7 100644
--- a/tests/test_sensors.robot
+++ b/tests/test_sensors.robot
@@ -5,7 +5,7 @@ Documentation          This example demonstrates executing commands on a remote
 ...                    Notice how connections are handled as part of the suite setup and
 ...                    teardown. This saves some time when executing several test cases.
 
-Resource          ../lib/rest_client.robot
+Resource		../lib/rest_client.robot
 
 
 Library                SSHLibrary
@@ -13,42 +13,29 @@ Suite Setup            Open Connection And Log In
 Suite Teardown         Close All Connections
 
 *** Variables ***
-${HOST}                9.3.164.147
-${USERNAME}            root
-${PASSWORD}            0penBmc
 
-*** Test Cases ***
-Execute Command And Verify Output
-	[Documentation]    Execute Command on the remote machine.
-	${output}=    Execute Command    echo Hello
-	Should Be Equal    ${output}    Hello
-
-Execute Sending a file
-	put file    ./tfile /home/root
 
+*** Test Cases ***
 Execute ipmi BT capabilities command
-	${output}=    Execute Command    /home/root/ipmitool -I dbus raw 0x06 0x36
-	Should Be Equal    "${output}"    " 01 3f 3f 0a 01"
-
-Execute Boot Sensoripmi BT capabilities command
-	${output}=    Execute Command    /home/root/ipmitool -I dbus raw 0x06 0x36
-	Should Be Equal    "${output}"    " 01 3f 3f 0a 01"
+	${output}=    Run IPMI command 		0x06 0x36
+	Should Be Equal		"${output}"		" 01 3f 3f 0a 01"
 
 Execute Set Sensor boot count
 	Run IPMI command  0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
 	${value} =  Read attribute	/org/openbmc/sensor/virtual/BootCount	value
-	Should Be Equal ${value}    "53"
+	Should Be Equal		${value}	"53"
 
 
 
 *** Keywords ***
 Open Connection And Log In
-   Open Connection    ${HOST}
-   Login    ${USERNAME}    ${PASSWORD}
+	Open connection 	${OPENBMC_HOST}
+	Login	${OPENBMC_USERNAME}	${OPENBMC_PASSWORD}
 
 Run IPMI Command
-	[arguments]     ${args}
-	${output}=      Execute Command    /home/root/ipmitool -I dbus raw ${args}
+	[arguments]	${args}
+	${output}=	Execute Command    /home/root/ipmitool -I dbus raw ${args}
+	[return]	${output}
 
 Read attribute
 	[arguments]	${uri}	${attr}
-- 
2.6.4
