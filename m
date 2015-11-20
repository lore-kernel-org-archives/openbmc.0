Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DCEDB1A0018
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447992620993662.0608835170169;
 Thu, 19 Nov 2015 20:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] os-release bug fixes
Date: Thu, 19 Nov 2015 23:10:19 -0500
Message-Id: <1447992619-10590-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447992619-10590-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447992619-10590-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 04:10:25 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The existing version wasn't handling non-default build
directories or build from tarball (no git repository)
type setups.
---
 .../recipes-core/os-release/os-release.bbappend    | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
index 1692af1..ba6a772 100644
--- a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
+++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
@@ -1,8 +1,18 @@
-def git_describe(d):
-        return bb.process.run("git describe --dirty")[0]
-def git_tag(d):
-        return bb.process.run("git tag")[0]
+def run_git(d, cmd):
+        try:
+                oeroot = d.getVar('COREBASE', True)
+                return bb.process.run("git --git-dir %s/.git %s" %(oeroot, cmd))[0].strip('\n')
+        except:
+                pass
+
+python() {
+        version_id = run_git(d, 'tag')
+        if version_id:
+                d.setVar('VERSION_ID', version_id)
+
+        build_id = run_git(d, 'describe --dirty')
+        if build_id:
+                d.setVar('BUILD_ID', build_id)
+}
 
-VERSION_ID = "${@git_tag(d)}"
-BUILD_ID = "${@git_describe(d)}"
 OS_RELEASE_FIELDS_append = " BUILD_ID"
-- 
2.6.3
