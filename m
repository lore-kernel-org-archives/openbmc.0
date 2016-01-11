Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FF21A0202
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531078425989.9257158914774;
 Mon, 11 Jan 2016 08:51:18 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 52/60] Ran the tests and fixed errors
 in SSL tests
Date: Mon, 11 Jan 2016 10:50:18 -0600
Message-Id: <1452531026-13715-53-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:25 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/security/test_ssl.robot | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/security/test_ssl.robot b/tests/security/test_ssl.robot
index e4eac40..0504567 100644
--- a/tests/security/test_ssl.robot
+++ b/tests/security/test_ssl.robot
@@ -2,8 +2,8 @@
 Documentation     This testsuite is for testing SSL connection to OpenBMC
 Suite Teardown    Delete All Sessions
 
-Resource          ../lib/rest_client.robot
-Resource          ../lib/resource.txt
+Resource          ../../lib/rest_client.robot
+Resource          ../../lib/resource.txt
 
 Library           RequestsLibrary.RequestsKeywords
 
@@ -12,7 +12,7 @@ Test SSL Connection
     [Documentation]     This testcase is for testing the SSL connection to the
     ...     OpenBMC machine.
     Create Session    openbmc    https://${OPENBMC_HOST}/
-    ${resp}=    Get Request    openbmc   https://${OPENBMC_HOST}/org/openbmc/inventory/list
+    ${resp}=    Get Request    openbmc   /list
     Should Be Equal As Strings    ${resp.status_code}    ${HTTP_OK}
     ${jsondata}=    To Json    ${resp.content}
     Should Not Be Empty     ${jsondata}
@@ -22,7 +22,4 @@ Test non-SSL Connection - Negative
     ...     will not accepts the non-secure connection that is with http.
     ...     Expected Response code is - 400
     Create Session    openbmc    http://${OPENBMC_HOST}/
-    ${resp}=    Get Request    openbmc   http://${OPENBMC_HOST}/org/openbmc/inventory/list
-    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_BAD_REQUEST}
-    ${jsondata}=    To Json    ${resp.content}
-    Should Be Empty     ${jsondata}
\ No newline at end of file
+    Run Keyword And Expect Error    ConnectionError*   Get Request    openbmc   /list
-- 
2.6.4
