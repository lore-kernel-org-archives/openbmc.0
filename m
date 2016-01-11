Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 37E231A0D00
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531083926609.751548345597;
 Mon, 11 Jan 2016 08:51:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 58/60] Added one more testcase to test
 non-ssl connection to port 443
Date: Mon, 11 Jan 2016 10:50:24 -0600
Message-Id: <1452531026-13715-59-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:30 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/security/test_ssl.robot | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/security/test_ssl.robot b/tests/security/test_ssl.robot
index 3c098b0..b376a62 100644
--- a/tests/security/test_ssl.robot
+++ b/tests/security/test_ssl.robot
@@ -17,9 +17,18 @@ Test SSL Connection
     ${jsondata}=    To Json    ${resp.content}
     Should Not Be Empty     ${jsondata}
 
-Test non-SSL Connection - Negative
+Test non-SSL Connection to port 80
     [Documentation]     This testcase is for test to check OpenBMC machine
-    ...     will not accepts the non-secure connection that is with http.
-    ...     Expected a connection error when we try making a call
+    ...     will not accepts the non-secure connection that is with http to
+    ...     port 80 and expect a connection error
     Create Session    openbmc    http://${OPENBMC_HOST}/
     Run Keyword And Expect Error    ConnectionError*   Get Request    openbmc   /list
+
+Test non-SSL Connection to port 443
+    [Documentation]     This testcase is for test to check OpenBMC machine
+    ...     will not accepts the non-secure connection that is with http to
+    ...     port 443 and expect 400 in response
+    Create Session    openbmc    http://${OPENBMC_HOST}:443/
+    ${resp}=    Get Request    openbmc   /list
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_BAD_REQUEST}
+    Should Be Equal     ${resp.content}     Bad Request
-- 
2.6.4
