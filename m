Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AFB1F1A00E9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 17:40:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145214882204538.00084106545569;
 Wed, 6 Jan 2016 22:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc] commit for testing jenkins pr build
Date: Thu,  7 Jan 2016 00:40:20 -0600
Message-Id: <1452148820-25854-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452148820-25854-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452148820-25854-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Jan 2016 06:40:27 -0000

From: Chris Smart <distroguy@gmail.com>

---
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 49d4f94..7af5d27 100644
--- a/README.md
+++ b/README.md
@@ -10,7 +10,8 @@ somewhere to hold the build.  This directory will get big.
 
 To start a build:
 
+```
     cd <builddir>
     . <repodir>/openbmc-env
     bitbake obmc-phosphor-image
-
+```
-- 
2.6.4
