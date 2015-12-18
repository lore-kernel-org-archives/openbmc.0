Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BDA181A0343
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 07:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450471223784638.3924098789802;
 Fri, 18 Dec 2015 12:40:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] os-release VERSION always points at v0.1
Date: Fri, 18 Dec 2015 14:40:22 -0600
Message-Id: <1450471222-31621-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450471222-31621-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450471222-31621-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 20:40:29 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use git-describe rather than git-tag.
Make os-release do_compile run every time.
---
 meta-phosphor/common/recipes-core/os-release/os-release.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
index ba6a772..b112c50 100644
--- a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
+++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
@@ -6,7 +6,7 @@ def run_git(d, cmd):
                 pass
 
 python() {
-        version_id = run_git(d, 'tag')
+        version_id = run_git(d, 'describe --abbrev=0')
         if version_id:
                 d.setVar('VERSION_ID', version_id)
 
@@ -16,3 +16,4 @@ python() {
 }
 
 OS_RELEASE_FIELDS_append = " BUILD_ID"
+do_compile[nostamp] = "1"
-- 
2.6.3
