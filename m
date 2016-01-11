Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DD2E61A0D13
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:11 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14525310656728.850131873125292;
 Mon, 11 Jan 2016 08:51:05 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 39/60] Added Inventory list testcase
Date: Mon, 11 Jan 2016 10:50:05 -0600
Message-Id: <1452531026-13715-40-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:12 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 data/variables.py          | 31 +++++++++++++++++++++++++++++++
 lib/resource.txt           | 18 +++++++++++++-----
 lib/rest_client.robot      |  7 +------
 tests/test_inventory.robot | 16 ++++++++++++++++
 4 files changed, 61 insertions(+), 11 deletions(-)
 create mode 100644 data/variables.py
 create mode 100644 tests/test_inventory.robot

diff --git a/data/variables.py b/data/variables.py
new file mode 100644
index 0000000..099a21e
--- /dev/null
+++ b/data/variables.py
@@ -0,0 +1,31 @@
+INVENTORY={
+    "palmetto": ["/org/openbmc/inventory/system/chassis/io_board/pcie_slot0", 
+                 "/org/openbmc/inventory/system/chassis/io_board/pcie_slot1", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core9", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core8", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core7", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core6", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core5", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core4", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core3", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core2", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core1", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core0", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/dimm3", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/dimm2", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/dimm1", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/dimm0", 
+                 "/org/openbmc/inventory/system/chassis/fan4", 
+                 "/org/openbmc/inventory/system/chassis/fan2", 
+                 "/org/openbmc/inventory/system", 
+                 "/org/openbmc/inventory/system/chassis/fan0", 
+                 "/org/openbmc/inventory/system/chassis/fan1", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0", 
+                 "/org/openbmc/inventory/system/chassis", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core11", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core10", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/centaur0", 
+                 "/org/openbmc/inventory/system/chassis/motherboard", 
+                 "/org/openbmc/inventory/system/chassis/motherboard/bmc", 
+                 "/org/openbmc/inventory/system/chassis/fan3"]
+}
\ No newline at end of file
diff --git a/lib/resource.txt b/lib/resource.txt
index c34e026..fd10050 100644
--- a/lib/resource.txt
+++ b/lib/resource.txt
@@ -3,10 +3,18 @@ Library           Collections
 Library           String
 Library           RequestsLibrary.RequestsKeywords
 Library           OperatingSystem
+Variables         ../data/variables.py
 
 *** Variables ***
-${OPENBMC_HOST}           192.168.122.100    # openbmc ip address
-${PORT}           3000
-${AUTH_URI}       http://${HOST}:${PORT}
-${OPENBMC_USERNAME}       root
-${OPENBMC_PASSWORD}       abc123
+${OPENBMC_HOST}    192.168.122.100    # openbmc ip address
+${DBUS_PREFIX}    ${EMPTY}
+${PORT}           ${EMPTY}
+${AUTH_URI}       http://${OPENBMC_HOST}:${PORT}
+${OPENBMC_USERNAME}    root
+${OPENBMC_PASSWORD}    0penBmc
+${MACHINE_TYPE}    palmetto
+
+*** Keywords ***
+Get Inventory Schema
+    [Arguments]    ${machine}
+    [Return]    &{INVENTORY}[${machine}]
diff --git a/lib/rest_client.robot b/lib/rest_client.robot
index 45c4226..b972195 100644
--- a/lib/rest_client.robot
+++ b/lib/rest_client.robot
@@ -3,14 +3,9 @@ Library           Collections
 Library           String
 Library           RequestsLibrary.RequestsKeywords
 Library           OperatingSystem
+Resource          ../lib/resource.txt
 
 *** Variables ***
-${OPENBMC_HOST}           192.168.122.100    # openbmc ip address
-${DBUS_PREFIX}    /bus/session
-${PORT}           3000
-${AUTH_URI}       http://${OPENBMC_HOST}:${PORT}
-${OPENBMC_USERNAME}       root
-${OPENBMC_PASSWORD}       abc123
 # Response codes
 ${HTTP_CONTINUE}    100
 ${HTTP_SWITCHING_PROTOCOLS}    101
diff --git a/tests/test_inventory.robot b/tests/test_inventory.robot
new file mode 100644
index 0000000..2e5bfaa
--- /dev/null
+++ b/tests/test_inventory.robot
@@ -0,0 +1,16 @@
+*** Settings ***
+Documentation     This testsuite is for testing inventory
+Suite Teardown    Delete All Sessions
+Resource          ../lib/rest_client.robot
+Resource          ../lib/resource.txt
+
+*** Test Cases ***
+List Inventory
+    [Documentation]     This testcase will get the inventory for the openbmc
+    ...                 machine and validates with the expected inventory
+    ${resp} =    OpenBMC Get Request    org/openbmc/inventory/list
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata}=    To Json    ${resp.content}
+    ${ret}=    Get Inventory Schema    ${MACHINE_TYPE}
+    : FOR    ${ELEMENT}    IN    @{ret}
+    \    Should Contain    ${jsondata}    ${ELEMENT}
-- 
2.6.4
