Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s5YVJ0H1lzDqTy
 for <openbmc@lists.ozlabs.org>; Sat,  6 Aug 2016 03:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1470417636073611.7672368521718;
 Fri, 5 Aug 2016 10:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Jay Azurin <jay.azurin@gmail.com>
Subject: [PATCH openbmc-test-automation] remove tox version dependency
Date: Fri,  5 Aug 2016 12:20:33 -0500
Message-Id: <20160805172033.2471-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160805172033.2471-1-openbmc-patches@stwcx.xyz>
References: <20160805172033.2471-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2016 17:20:40 -0000

From: Jay Azurin <jay.azurin@gmail.com>

Install the latest tox version that supports the latest tox syntax.
Addresses https://github.com/openbmc/openbmc-test-automation/issues/73
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 0032eec..e71167d 100755
--- a/README.md
+++ b/README.md
@@ -8,7 +8,7 @@ packages which will help to invoke tests through tox.
 
 Install the python dependencies for tox
 ```shell
-    $ easy_install tox==2.1.1
+    $ easy_install tox
     $ easy_install pip
 ```
 
-- 
2.9.0
