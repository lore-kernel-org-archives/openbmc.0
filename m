Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CE8DE1A08BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531053876822.3503510743756;
 Mon, 11 Jan 2016 08:50:53 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 27/60] Fix Errors in
 test_obmcrest.robot and removed the empty testcases.
Date: Mon, 11 Jan 2016 10:49:53 -0600
Message-Id: <1452531026-13715-28-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:01 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/test_obmcrest.robot | 47 +++++++++++------------------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
index caf9085..382107f 100644
--- a/tests/test_obmcrest.robot
+++ b/tests/test_obmcrest.robot
@@ -11,45 +11,20 @@ Resource		../lib/rest_client.robot
 
 *** Test Cases ***
 Good connection for testing
-	${content} =	Read Properties	/
-	${c}= 		get from List 	${content} 	0
-	Should Contain		"/org"	${c}
-
+    ${content}=    Read Properties     /
+    ${c}=          get from List       ${content}      0
+    Should Be Equal    ${c}     /org
 
 Get an object with no properties 
-	${content} =	Read Properties	/org/openbmc/inventory
-	Should Be Empty	${content}
-
+    ${content}=    Read Properties     /org/openbmc/inventory
+    Should Be Empty     ${content}
 
 Get a Property
-	${resp} =	Read Attribute	/org/openbmc/inventory/system/chassis/motherboard/cpu0	is_fru
-	Should Contain		1	${resp}	
-
+    ${resp}=   Read Attribute      /org/openbmc/inventory/system/chassis/motherboard/cpu0      is_fru
+    Should Be Equal    ${resp}     ${1}
 
 Get a null Property
-	${resp} =	Read Attribute	/org/openbmc/inventory	is_fru
-	Should Contain		1	${resp}	
-
-
-Enumeration object
-
-
-List object
-
-
-Invoke a method without properties
-
-
-Invoke a method with properties
-
-
-Issue a POST
-
-
-Issue a PUT
-
-
-
-
-
-*** Keywords ***
+    ${resp} =    OpenBMC Get Request    /org/openbmc/inventory/attr/is_fru
+    Should Be Equal As Strings    ${resp.status_code}    ${HTTP_NOT_FOUND}
+    ${jsondata}=    To Json    ${resp.content}
+    Should Be Equal     ${jsondata['data']['description']}      The specified property cannot be found: ''is_fru''
-- 
2.6.4
