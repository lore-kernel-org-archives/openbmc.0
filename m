Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A5D41A09C0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531080340710.7284142450911;
 Mon, 11 Jan 2016 08:51:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 54/60] Added firmware version
 validation test
Date: Mon, 11 Jan 2016 10:50:20 -0600
Message-Id: <1452531026-13715-55-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:27 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/test_fw_version.robot | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tests/test_fw_version.robot

diff --git a/tests/test_fw_version.robot b/tests/test_fw_version.robot
new file mode 100644
index 0000000..2c3337d
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
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/system
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
+    ${jsondata}=    To Json    ${resp.content}
+    Should not be empty     ${jsondata["data"]["Version"]}
+    Should Match Regexp     ${jsondata["data"]["Version"]}      ^v\\d+\.\\d+
\ No newline at end of file
-- 
2.6.4
