Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 370CD1A0BC0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531056738772.4229826156143;
 Mon, 11 Jan 2016 08:50:56 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 30/60] updated the REST API for
 firmware version
Date: Mon, 11 Jan 2016 10:49:56 -0600
Message-Id: <1452531026-13715-31-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:03 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/test_fw_version.robot | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test_fw_version.robot b/tests/test_fw_version.robot
index 2c3337d..90721b7 100644
--- a/tests/test_fw_version.robot
+++ b/tests/test_fw_version.robot
@@ -15,8 +15,8 @@ Test Firmware Version
     ...     $ git describe --dirty
     ...     v0.1-34-g95f7347
     ...     $
-    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/system
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/system/chassis/motherboard/bmc
     Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
     ${jsondata}=    To Json    ${resp.content}
-    Should not be empty     ${jsondata["data"]["Version"]}
-    Should Match Regexp     ${jsondata["data"]["Version"]}      ^v\\d+\.\\d+
\ No newline at end of file
+    Should not be empty     ${jsondata["data"]["version"]}
+    Should Match Regexp     ${jsondata["data"]["version"]}      ^v\\d+\.\\d+
\ No newline at end of file
-- 
2.6.4
