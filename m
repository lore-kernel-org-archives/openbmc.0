Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 102571A0CFD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531079385418.49889686629365;
 Mon, 11 Jan 2016 08:51:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 53/60] Modified the doc
Date: Mon, 11 Jan 2016 10:50:19 -0600
Message-Id: <1452531026-13715-54-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:31 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/security/test_ssl.robot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/security/test_ssl.robot b/tests/security/test_ssl.robot
index 0504567..3c098b0 100644
--- a/tests/security/test_ssl.robot
+++ b/tests/security/test_ssl.robot
@@ -20,6 +20,6 @@ Test SSL Connection
 Test non-SSL Connection - Negative
     [Documentation]     This testcase is for test to check OpenBMC machine
     ...     will not accepts the non-secure connection that is with http.
-    ...     Expected Response code is - 400
+    ...     Expected a connection error when we try making a call
     Create Session    openbmc    http://${OPENBMC_HOST}/
     Run Keyword And Expect Error    ConnectionError*   Get Request    openbmc   /list
-- 
2.6.4
