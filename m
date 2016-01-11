Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 19F621A0BF1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531043364310.1638578860583;
 Mon, 11 Jan 2016 08:50:43 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 16/60] Moved Read Attribute and Read
 Properties to rest_client
Date: Mon, 11 Jan 2016 10:49:42 -0600
Message-Id: <1452531026-13715-17-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:50 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 lib/rest_client.robot      | 13 +++++++++++++
 tests/test_inventory.robot | 14 +-------------
 tests/test_obmcrest.robot  | 24 +++++++-----------------
 tests/test_sensors.robot   |  7 +------
 4 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/lib/rest_client.robot b/lib/rest_client.robot
index b972195..f0c1ba3 100644
--- a/lib/rest_client.robot
+++ b/lib/rest_client.robot
@@ -102,3 +102,16 @@ Log Response
 Logging
     [Arguments]    ${msg}    ${console}=default False
     Log    ${msg}    console=True
+
+Read Attribute
+    [arguments]    ${uri}    ${attr}
+    ${resp} =   OpenBMC Get Request    ${uri}/attr/${attr}
+    [return]    ${resp.content}
+
+
+Read Properties
+    [arguments]    ${uri}
+    ${resp} =   OpenBMC Get Request    ${uri}
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${content}=     To Json    ${resp.content}
+    [return]    ${content}
\ No newline at end of file
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
index fde52e1..afe4613 100644
--- a/tests/test_inventory.robot
+++ b/tests/test_inventory.robot
@@ -19,7 +19,7 @@ List Inventory
 Verify dimm vpd
 	: FOR 	${INDEX} 	IN RANGE 	0 	4
 	\	log 	${INDEX}
-	\	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm${INDEX}	fru_type
+	\	${value} =	Read Attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm${INDEX}	fru_type
 	\	Should Be Equal	${value}	"DIMM"
 
 
@@ -39,15 +39,3 @@ Should Be Valid Dimm Properties
 	${ret}=    Get Inventory Items Schema	DIMM
 	: FOR    ${ELEMENT}    IN    @{ret}
 	\    Should Contain    ${props}    ${ELEMENT}
-
-
-Read attribute
-	[arguments]	${uri}	${attr}
-	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
-	[return]	${resp.content}
-
-
-Read Properties
-	[arguments]	${uri}
-	${resp} =	OpenBMC Get Request	${uri}
-	[return]	${resp.content}
diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
index 0c3d5ea..75eb6d9 100644
--- a/tests/test_obmcrest.robot
+++ b/tests/test_obmcrest.robot
@@ -11,24 +11,23 @@ Resource		../lib/rest_client.robot
 
 *** Test Cases ***
 Good connection for testing
-	${resp} =	Read Properties	/
-	${jdata}=	To Json 	${resp.content}
-	${c}= 		get from List 	${jdata} 	0
-	Should Contain		"/org"	${c}	
+	${content} =	Read Properties	/
+	${c}= 		get from List 	${content} 	0
+	Should Contain		"/org"	${c}
 
 
 Get an object with no properties 
-	${resp} =	Read Properties	/org/openbmc/inventory
-	Should Be Empty	${resp.content}
+	${content} =	Read Properties	/org/openbmc/inventory
+	Should Not Be Empty	${content}
 
 
 Get a Property
-	${resp} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/cpu0	is_fru
+	${resp} =	Read Attribute	/org/openbmc/inventory/system/chassis/motherboard/cpu0	is_fru
 	Should Contain		1	${resp}	
 
 
 Get a null Property
-	${resp} =	Read attribute	/org/openbmc/inventory	is_fru
+	${resp} =	Read Attribute	/org/openbmc/inventory	is_fru
 	Should Contain		1	${resp}	
 
 
@@ -54,12 +53,3 @@ Issue a PUT
 
 
 *** Keywords ***
-Read Properties
-	[arguments]	${uri}
-	${resp} =	OpenBMC Get Request	${uri}
-	[return]	${resp}
-
-Read attribute
-	[arguments]	${uri}	${attr}
-	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
-	[return]	${resp.content}
\ No newline at end of file
diff --git a/tests/test_sensors.robot b/tests/test_sensors.robot
index 79ba4d7..3d17360 100644
--- a/tests/test_sensors.robot
+++ b/tests/test_sensors.robot
@@ -22,7 +22,7 @@ Execute ipmi BT capabilities command
 
 Execute Set Sensor boot count
 	Run IPMI command  0x04 0x30 0x09 0x01 0x00 0x35 0x00 0x00 0x00 0x00 0x00 0x00
-	${value} =  Read attribute	/org/openbmc/sensor/virtual/BootCount	value
+	${value} =  Read Attribute	/org/openbmc/sensor/virtual/BootCount	value
 	Should Be Equal		${value}	"53"
 
 
@@ -36,8 +36,3 @@ Run IPMI Command
 	[arguments]	${args}
 	${output}=	Execute Command    /home/root/ipmitool -I dbus raw ${args}
 	[return]	${output}
-
-Read attribute
-	[arguments]	${uri}	${attr}
-	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
-	[return]	${resp.content}
\ No newline at end of file
-- 
2.6.4
