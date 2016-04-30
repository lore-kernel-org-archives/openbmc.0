Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qy44X1077zDqBh
 for <openbmc@lists.ozlabs.org>; Sun,  1 May 2016 07:50:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462053031356536.3282913163811;
 Sat, 30 Apr 2016 14:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] VERSION_ID is not granular
Date: Sat, 30 Apr 2016 16:50:29 -0500
Message-Id: <1462053029-1662-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462053029-1662-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462053029-1662-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Apr 2016 21:50:36 -0000

From: Chris Austen <austenc@us.ibm.com>

Currently VERSION_ID is v0.6
Even when I am 30 commits past the tag.  I am swapping the code's BUILD/VERSION populator
to ensure we adhere to the reason why VERSION_ID exists in the first place... to know what
level of code you have on the system

Definition of what the VERSION_ID is for...
https://www.freedesktop.org/software/systemd/man/os-release.html
---
 meta-phosphor/common/recipes-core/os-release/os-release.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
index b112c50..3dd203b 100644
--- a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
+++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
@@ -6,11 +6,11 @@ def run_git(d, cmd):
                 pass
 
 python() {
-        version_id = run_git(d, 'describe --abbrev=0')
+        version_id = run_git(d, 'describe --dirty')
         if version_id:
                 d.setVar('VERSION_ID', version_id)
 
-        build_id = run_git(d, 'describe --dirty')
+        build_id = run_git(d, 'describe --abbrev=0')
         if build_id:
                 d.setVar('BUILD_ID', build_id)
 }
-- 
2.8.1
