Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVRv26Tj2zDqmJ
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 12:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466043640902868.8588510129122;
 Wed, 15 Jun 2016 19:20:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add build time dependencies to python for skeleton
Date: Wed, 15 Jun 2016 21:20:39 -0500
Message-Id: <20160616022039.22930-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616022039.22930-1-openbmc-patches@stwcx.xyz>
References: <20160616022039.22930-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 02:20:47 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Skeleton now invokes python setuptools to install its python
applications in a top level makefile, so a build time dependency
on native-python is required.

It should be noted that skeleton invoking python from make is
an interim thing until its python applications get their own
repository.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/config-in-skeleton.bbclass           | 2 ++
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/config-in-skeleton.bbclass b/meta-phosphor/classes/config-in-skeleton.bbclass
index 33266be..72249ff 100644
--- a/meta-phosphor/classes/config-in-skeleton.bbclass
+++ b/meta-phosphor/classes/config-in-skeleton.bbclass
@@ -3,7 +3,9 @@
 
 inherit allarch
 inherit setuptools
+inherit pythonnative
 
+DEPENDS += "python"
 SRC_URI += "git://github.com/openbmc/skeleton;subpath=configs"
 S = "${WORKDIR}/configs"
 
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 9762792..4dc9dff 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ inherit python-dir
 
 VIRTUAL-RUNTIME_skeleton_workbook ?= ""
 
-DEPENDS += "glib-2.0 systemd"
+DEPENDS += "glib-2.0 systemd python"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd ${VIRTUAL-RUNTIME_skeleton_workbook}"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-- 
2.8.4
