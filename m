Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0E4441A020A
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 10:30:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447111821588661.1169821199337;
 Mon, 9 Nov 2015 15:30:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc v3 1/3] test: modify readme
Date: Mon,  9 Nov 2015 18:30:18 -0500
Message-Id: <1447111820-1083-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447111820-1083-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447111820-1083-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 23:30:25 -0000

From: Chris Smart <distroguy@gmail.com>

---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c4306b0..7557b22 100644
--- a/README.md
+++ b/README.md
@@ -7,6 +7,6 @@ somewhere to hold the build.  This directory will get big.
 To start a build:
 
     cd <builddir>
-    . <repodir>/openbmc-env
+    source <repodir>/openbmc-env
     bitbake obmc-phosphor-image
 
-- 
2.6.3
