Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3A3351A1146
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218042669862.7898329269204;
 Tue, 15 Dec 2015 14:20:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: kenneth-wilke <kenneth.wilke@rackspace.com>
Subject: [PATCH openbmc] Added ubuntu dependencies to readme
Date: Tue, 15 Dec 2015 16:20:41 -0600
Message-Id: <1450218041-11964-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218041-11964-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218041-11964-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:46 -0000

From: kenneth-wilke <kenneth.wilke@rackspace.com>

---
 README.md | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 49d4f94..0df0ad4 100644
--- a/README.md
+++ b/README.md
@@ -8,9 +8,15 @@ OpenBMC uses Yocto/Open-Embedded for a build system, which supports an
 out-of-tree build.  It is recommended that you create an empty directory
 somewhere to hold the build.  This directory will get big.
 
+On Ubuntu 14.04 the following packages are required to build the default target
+```
+sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrpath diffstat
+```
+
 To start a build:
 
+```
     cd <builddir>
     . <repodir>/openbmc-env
     bitbake obmc-phosphor-image
-
+```
-- 
2.6.3
