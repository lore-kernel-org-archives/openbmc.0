Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 743341A0202
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531031286916.5714709803611;
 Mon, 11 Jan 2016 08:50:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: manjunath <manjunath@localhost.localdomain>
Subject: [PATCH openbmc-test-automation 04/60] added log statement
Date: Mon, 11 Jan 2016 10:49:30 -0600
Message-Id: <1452531026-13715-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:35 -0000

From: manjunath <manjunath@localhost.localdomain>

---
 tests/test_ssh.robot | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test_ssh.robot b/tests/test_ssh.robot
index 0801d8a..e9dcf9e 100644
--- a/tests/test_ssh.robot
+++ b/tests/test_ssh.robot
@@ -46,6 +46,7 @@ File Not Found
     [Documentation]    This testcase is for testing ls command with non existing file
     ${output}    ${stderr}    ${rc}=    Execute Command    ls file_doesnotexist.txt    return_stderr=True    return_rc=True
     ${msg}=    Catenate    output:${output}    stderr:${stderr}    rc:${rc}
+    Log To Console    ${msg}
     Should Be Equal    ${rc}    ${2}
     Should Contain    ${stderr}    No such file or directory
 
-- 
2.6.4
