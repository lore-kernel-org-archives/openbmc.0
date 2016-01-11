Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B2AFA1A0D01
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:04 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531061654542.2442330634436;
 Mon, 11 Jan 2016 08:51:01 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: manjunath <manjunath@localhost.localdomain>
Subject: [PATCH openbmc-test-automation 35/60] added testcase for etc passwd
Date: Mon, 11 Jan 2016 10:50:01 -0600
Message-Id: <1452531026-13715-36-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:05 -0000

From: manjunath <manjunath@localhost.localdomain>

---
 tests/test_ssh.robot | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/test_ssh.robot b/tests/test_ssh.robot
index e9dcf9e..cabcea0 100644
--- a/tests/test_ssh.robot
+++ b/tests/test_ssh.robot
@@ -50,6 +50,14 @@ File Not Found
     Should Be Equal    ${rc}    ${2}
     Should Contain    ${stderr}    No such file or directory
 
+etc passwd entry
+    [Documentation]    This testcase is for testing /etc/passwd entry
+    ${output}    ${stderr}    ${rc}=    Execute Command    grep manjunath /etc/passwd    return_stderr=True    return_rc=True
+    ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
+    Log To Console    ${msg}
+    Should Be Equal    ${rc}    ${0}
+    Should Contain    ${output}    manjunath
+
 *** Keywords ***
 Open Connection And Log In
     Open Connection    ${HOST}
-- 
2.6.4
