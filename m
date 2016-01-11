Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5EC781A0B57
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531042381474.10618831438626;
 Mon, 11 Jan 2016 08:50:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 15/60] Add initial rest test cases
 Support to test Null properties
Date: Mon, 11 Jan 2016 10:49:41 -0600
Message-Id: <1452531026-13715-16-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:49 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 tests/test_obmcrest.robot | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tests/test_obmcrest.robot

diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
new file mode 100644
index 0000000..0c3d5ea
--- /dev/null
+++ b/tests/test_obmcrest.robot
@@ -0,0 +1,65 @@
+*** Settings ***
+Documentation		This suite will verifiy all OpenBMC rest interfaces
+...					Details of valid interfaces can be found here...
+...					https://github.com/openbmc/docs/blob/master/rest-api.md
+
+Resource		../lib/rest_client.robot
+
+
+*** Variables ***
+
+
+*** Test Cases ***
+Good connection for testing
+	${resp} =	Read Properties	/
+	${jdata}=	To Json 	${resp.content}
+	${c}= 		get from List 	${jdata} 	0
+	Should Contain		"/org"	${c}	
+
+
+Get an object with no properties 
+	${resp} =	Read Properties	/org/openbmc/inventory
+	Should Be Empty	${resp.content}
+
+
+Get a Property
+	${resp} =	Read attribute	/org/openbmc/inventory/system/chassis/motherboard/cpu0	is_fru
+	Should Contain		1	${resp}	
+
+
+Get a null Property
+	${resp} =	Read attribute	/org/openbmc/inventory	is_fru
+	Should Contain		1	${resp}	
+
+
+Enumeration object
+
+
+List object
+
+
+Invoke a method without properties
+
+
+Invoke a method with properties
+
+
+Issue a POST
+
+
+Issue a PUT
+
+
+
+
+
+*** Keywords ***
+Read Properties
+	[arguments]	${uri}
+	${resp} =	OpenBMC Get Request	${uri}
+	[return]	${resp}
+
+Read attribute
+	[arguments]	${uri}	${attr}
+	${resp} =	OpenBMC Get Request	${uri}/attr/${attr}
+	[return]	${resp.content}
\ No newline at end of file
-- 
2.6.4
