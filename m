Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQV0lfhzDqlk
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466902236087966.0537521103872;
 Sat, 25 Jun 2016 17:50:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 02/15] initfs: Fix recipe, remove unnecessary class
Date: Sat, 25 Jun 2016 19:50:20 -0500
Message-Id: <20160626005033.21336-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
References: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:50:43 -0000

From: Milton Miller <miltonm@us.ibm.com>

Because the recipe was named with trailing part init instead
of initfs, the package didn't match the package name requiring
PROVIDES, RPROVIDES and other bitbake workarounds.  Fix the recipe
name to match the package removing the overly verbose packaging.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass                    | 4 ----
 .../{obmc-phosphor-init.bb => obmc-phosphor-initfs.bb}                | 1 -
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/{obmc-phosphor-init.bb => obmc-phosphor-initfs.bb} (96%)

diff --git a/meta-phosphor/classes/obmc-phosphor-initfs.bbclass b/meta-phosphor/classes/obmc-phosphor-initfs.bbclass
deleted file mode 100644
index de7923e..0000000
--- a/meta-phosphor/classes/obmc-phosphor-initfs.bbclass
+++ /dev/null
@@ -1,4 +0,0 @@
-# Common code for recipes that implement Phosphor OpenBMC filesystem
-
-RPROVIDES_${PN} += "obmc-phosphor-initfs"
-PROVIDES += "obmc-phosphor-initfs"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
similarity index 96%
rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
index 3fa88c9..f81e21d 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Phosphor OpenBMC filesytem mount reference implementation."
 PR = "r1"
 
 inherit obmc-phosphor-license
-inherit obmc-phosphor-initfs
 
 S = "${WORKDIR}"
 SRC_URI += "file://obmc-init.sh"
-- 
2.9.0
