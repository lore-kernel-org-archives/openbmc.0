Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3D0B61A0D02
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531037456664.3998044054332;
 Mon, 11 Jan 2016 08:50:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 10/60] Added DIMM specific inventory
 tests
Date: Mon, 11 Jan 2016 10:49:36 -0600
Message-Id: <1452531026-13715-11-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:42 -0000
X-List-Received-Date: Mon, 11 Jan 2016 16:50:42 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 data/variables.py          | 28 ++++++++++++++++++++++++----
 tests/test_inventory.robot | 43 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/data/variables.py b/data/variables.py
index 099a21e..a70367c 100644
--- a/data/variables.py
+++ b/data/variables.py
@@ -15,8 +15,8 @@ INVENTORY={
                  "/org/openbmc/inventory/system/chassis/motherboard/dimm2", 
                  "/org/openbmc/inventory/system/chassis/motherboard/dimm1", 
                  "/org/openbmc/inventory/system/chassis/motherboard/dimm0", 
-                 "/org/openbmc/inventory/system/chassis/fan4", 
-                 "/org/openbmc/inventory/system/chassis/fan2", 
+                 "/org/openbmc/inventory/system/chassis/fan4",
+                 "/org/openbmc/inventory/system/chassis/fan2",
                  "/org/openbmc/inventory/system", 
                  "/org/openbmc/inventory/system/chassis/fan0", 
                  "/org/openbmc/inventory/system/chassis/fan1", 
@@ -27,5 +27,25 @@ INVENTORY={
                  "/org/openbmc/inventory/system/chassis/motherboard/centaur0", 
                  "/org/openbmc/inventory/system/chassis/motherboard", 
                  "/org/openbmc/inventory/system/chassis/motherboard/bmc", 
-                 "/org/openbmc/inventory/system/chassis/fan3"]
-}
\ No newline at end of file
+                 "/org/openbmc/inventory/system/chassis/fan3"],
+
+    "DIMM" : [  "Asset Tag",
+                "Custom Field 1",
+                "Custom Field 2",
+                "Custom Field 3",
+                "Custom Field 4",
+                "Custom Field 5",
+                "Custom Field 6",
+                "Custom Field 7",
+                "Custom Field 8",
+                "FRU File ID",
+                "Manufacturer",
+                "Model Number",
+                "Name",
+                "Serial Number",
+                "Version",
+                "fault",
+                "fru_type",
+                "is_fru",
+                "present"],
+}
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
index 2e5bfaa..f326a72 100644
--- a/tests/test_inventory.robot
+++ b/tests/test_inventory.robot
@@ -6,11 +6,48 @@ Resource          ../lib/resource.txt
 
 *** Test Cases ***
 List Inventory
-    [Documentation]     This testcase will get the inventory for the openbmc
-    ...                 machine and validates with the expected inventory
-    ${resp} =    OpenBMC Get Request    org/openbmc/inventory/list
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/list
     Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
     ${jsondata}=    To Json    ${resp.content}
     ${ret}=    Get Inventory Schema    ${MACHINE_TYPE}
     : FOR    ${ELEMENT}    IN    @{ret}
     \    Should Contain    ${jsondata}    ${ELEMENT}
+
+
+Verify dimm0 vpd
+	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm0	fru_type
+	Should Be Equal	${value}	"DIMM"
+
+
+Verify dimm1 vpd
+	${value} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/dimm1	fru_type
+	Should Be Equal	${value}	"DIMM"
+
+Verify dimm0 properties
+	${props} =	Read Properties	/org/openbmc/inventory/system/chassis/motherboard/dimm0
+	Should Be Valid Dimm Properties	${props}
+
+Verify dimm1 properties
+	${props} =	Read Properties	/org/openbmc/inventory/system/chassis/motherboard/dimm1
+	Should Be Valid Dimm Properties	${props}
+
+
+
+*** Keywords ***
+Should Be Valid Dimm Properties
+	[arguments]	${props}
+	${ret}=    Get Inventory Schema	DIMM
+	: FOR    ${ELEMENT}    IN    @{ret}
+	\    Should Contain    ${props}    ${ELEMENT}
+
+
+Read attribute
+	[arguments]	${uri}	${attr}
+	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
+	[return]	${resp.content}
+
+
+Read Properties
+	[arguments]	${uri}
+	${resp} =	OpenBMC Get Request	${uri}
+	[return]	${resp.content}
-- 
2.6.4
