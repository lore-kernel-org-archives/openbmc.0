Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5122A1A0D0F
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:50:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531035510203.51942549018224;
 Mon, 11 Jan 2016 08:50:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 08/60] Update README for better html
 display
Date: Mon, 11 Jan 2016 10:49:34 -0600
Message-Id: <1452531026-13715-9-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:50:42 -0000
X-List-Received-Date: Mon, 11 Jan 2016 16:50:42 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 README.md | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 589d693..5d869a0 100644
--- a/README.md
+++ b/README.md
@@ -6,13 +6,19 @@ Quickstart
 To run openbmc-automation first you need to install the prerequisite python
 packages which will help to invoke tests through tox.
 
-1. Install the python dependencies for tox
-    $ easy_install tox pip
+Install the python dependencies for tox
+```shell
+    $easy_install tox pip
+```
 
-2. Initilize the following environment variable which will used while testing
+Initilize the following environment variable which will used while testing
+```shell
     $ export OPENBMC_HOST=<openbmc machine ip address>
     $ export OPENBMC_PASSWORD=<openbmc username>
     $ export OPENBMC_USERNAME=<openbmc password>
+```
 
-3. Run tests
+Run tests
+```shell
     $ tox -e tests
+```
-- 
2.6.4
