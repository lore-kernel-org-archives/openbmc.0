Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 65AA71A0D02
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2015 14:58:34 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446867628103599.4051332346044;
 Fri, 6 Nov 2015 19:40:28 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Austen <causten@users.noreply.github.com>
Subject: [PATCH openbmc] Update README.md
Date: Fri,  6 Nov 2015 21:40:11 -0600
Message-Id: <1446867611-18041-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446867611-18041-1-git-send-email-patches@stwcx.xyz>
References: <1446867611-18041-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 07 Nov 2015 03:58:36 -0000

From: Chris Austen <causten@users.noreply.github.com>

---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c4306b0..cbb84d4 100644
--- a/README.md
+++ b/README.md
@@ -7,6 +7,6 @@ somewhere to hold the build.  This directory will get big.
 To start a build:
 
     cd <builddir>
-    . <repodir>/openbmc-env
+    . oe-init-build-env
     bitbake obmc-phosphor-image
 
-- 
2.6.0
