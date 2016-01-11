Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 532821A0C04
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531081197198.18762934999427;
 Mon, 11 Jan 2016 08:51:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 55/60] update readme file with tox
 version
Date: Mon, 11 Jan 2016 10:50:21 -0600
Message-Id: <1452531026-13715-56-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:28 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index cb8bd02..56048d7 100644
--- a/README.md
+++ b/README.md
@@ -8,7 +8,8 @@ packages which will help to invoke tests through tox.
 
 Install the python dependencies for tox
 ```shell
-    $easy_install tox pip
+    $ easy_install tox==2.1.1
+    $ easy_install pip
 ```
 
 Initilize the following environment variable which will used while testing
-- 
2.6.4
