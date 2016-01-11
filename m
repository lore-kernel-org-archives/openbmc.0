Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F210D1A0D0B
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:19 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531073676134.6155721097872;
 Mon, 11 Jan 2016 08:51:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 47/60] fix review comment
Date: Mon, 11 Jan 2016 10:50:13 -0600
Message-Id: <1452531026-13715-48-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:20 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 tests/test_obmcrest.robot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test_obmcrest.robot b/tests/test_obmcrest.robot
index 75eb6d9..caf9085 100644
--- a/tests/test_obmcrest.robot
+++ b/tests/test_obmcrest.robot
@@ -18,7 +18,7 @@ Good connection for testing
 
 Get an object with no properties 
 	${content} =	Read Properties	/org/openbmc/inventory
-	Should Not Be Empty	${content}
+	Should Be Empty	${content}
 
 
 Get a Property
-- 
2.6.4
