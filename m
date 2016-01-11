Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 90FBC1A0CFD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531041427140.62645418659645;
 Mon, 11 Jan 2016 08:50:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 14/60] created loops for tests
Date: Mon, 11 Jan 2016 10:49:40 -0600
Message-Id: <1452531026-13715-15-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:46 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 data/variables.py          |  4 ++++
 lib/resource.txt           |  4 ++++
 tests/test_inventory.robot | 26 +++++++++++++-------------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/data/variables.py b/data/variables.py
index 820a251..a342701 100644
--- a/data/variables.py
+++ b/data/variables.py
@@ -28,6 +28,10 @@ INVENTORY={
                  "/org/openbmc/inventory/system/chassis/motherboard", 
                  "/org/openbmc/inventory/system/chassis/motherboard/bmc", 
                  "/org/openbmc/inventory/system/chassis/fan3"],
+}
+
+
+INVENTORY_ITEMS={
 
     "DIMM" : [  "Asset Tag",
                 "Custom Field 1",
diff --git a/lib/resource.txt b/lib/resource.txt
index 85bf2fd..a8b8614 100644
--- a/lib/resource.txt
+++ b/lib/resource.txt
@@ -19,6 +19,10 @@ Get Inventory Schema
     [Arguments]    ${machine}
     [Return]    &{INVENTORY}[${machine}]
 
+Get Inventory Items Schema
+    [Arguments]    ${machine}
+    [Return]    &{INVENTORY_ITEMS}[${machine}]
+
 Get Sensor Schema
     [Arguments]    ${machine}
     [Return]    &{SENSORS}[${machine}]
\ No newline at end of file
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
index f326a72..fde52e1 100644
--- a/tests/test_inventory.robot
+++ b/tests/test_inventory.robot
@@ -4,6 +4,8 @@ Suite Teardown    Delete All Sessions
 Resource          ../lib/rest_client.robot
 Resource          ../lib/resource.txt
 
+Library           String
+
 *** Test Cases ***
 List Inventory
     ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/list
@@ -14,29 +16,27 @@ List Inventory
     \    Should Contain    ${jsondata}    ${ELEMENT}
 
 
-Verify dimm0 vpd
-	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm0	fru_type
-	Should Be Equal	${value}	"DIMM"
+Verify dimm vpd
+	: FOR 	${INDEX} 	IN RANGE 	0 	4
+	\	log 	${INDEX}
+	\	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm${INDEX}	fru_type
+	\	Should Be Equal	${value}	"DIMM"
 
 
-Verify dimm1 vpd
-	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm1	fru_type
-	Should Be Equal	${value}	"DIMM"
+Verify dimm vpd properties
+	: FOR 	${INDEX} 	IN RANGE 	0 	4
+	\	log 	${INDEX}
+	\	${props} =	Read Properties	/org/openbmc/inventory/system/chassis/motherboard/dimm${INDEX}
+	\	Should Be Valid Dimm Properties	${props}
 
-Verify dimm0 properties
-	${props} =	Read Properties	/org/openbmc/inventory/system/chassis/motherboard/dimm0
-	Should Be Valid Dimm Properties	${props}
 
-Verify dimm1 properties
-	${props} =	Read Properties	/org/openbmc/inventory/system/chassis/motherboard/dimm1
-	Should Be Valid Dimm Properties	${props}
 
 
 
 *** Keywords ***
 Should Be Valid Dimm Properties
 	[arguments]	${props}
-	${ret}=    Get Inventory Schema	DIMM
+	${ret}=    Get Inventory Items Schema	DIMM
 	: FOR    ${ELEMENT}    IN    @{ret}
 	\    Should Contain    ${props}    ${ELEMENT}
 
-- 
2.6.4
