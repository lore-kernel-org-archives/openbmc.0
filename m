Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 844C91A0272
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 11:00:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447113626125727.1787034070783;
 Mon, 9 Nov 2015 16:00:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc v4 3/4] test: jenkins
Date: Mon,  9 Nov 2015 19:00:21 -0500
Message-Id: <1447113622-1997-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447113622-1997-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447113622-1997-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 Nov 2015 00:00:29 -0000

From: Chris Smart <distroguy@gmail.com>

---
 README.md | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README.md b/README.md
index 0233343..7557b22 100644
--- a/README.md
+++ b/README.md
@@ -10,4 +10,3 @@ To start a build:
     source <repodir>/openbmc-env
     bitbake obmc-phosphor-image
 
-## Jenkins Test ##
-- 
2.6.3
