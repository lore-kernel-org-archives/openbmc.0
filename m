Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C12FD1A025F
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 06:20:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447269621322627.6073724448429;
 Wed, 11 Nov 2015 11:20:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Add git version information to os-release
Date: Wed, 11 Nov 2015 14:20:19 -0500
Message-Id: <1447269619-7651-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447269619-7651-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447269619-7651-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 Nov 2015 19:20:26 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

VERSION_ID = `git tag`
BUILD_ID = `git describe --dirty`
---
 meta-phosphor/common/recipes-core/os-release/os-release.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/os-release/os-release.bbappend

diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbappend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
new file mode 100644
index 0000000..1692af1
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
@@ -0,0 +1,8 @@
+def git_describe(d):
+        return bb.process.run("git describe --dirty")[0]
+def git_tag(d):
+        return bb.process.run("git tag")[0]
+
+VERSION_ID = "${@git_tag(d)}"
+BUILD_ID = "${@git_describe(d)}"
+OS_RELEASE_FIELDS_append = " BUILD_ID"
-- 
2.6.3
