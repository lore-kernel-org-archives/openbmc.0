Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnrwp04c5zDqwh
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:00:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468209637273550.4641097014774;
 Sun, 10 Jul 2016 21:00:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add skeleton-rev class
Date: Sun, 10 Jul 2016 23:00:35 -0500
Message-Id: <20160711040035.4154-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711040035.4154-1-openbmc-patches@stwcx.xyz>
References: <20160711040035.4154-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:00:42 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reduce the number of files to be updated after a
skeleton update from two to one.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-firestone/recipes-phosphor/workbook/firestone-config.bb    | 3 ---
 .../meta-garrison/recipes-phosphor/workbook/garrison-config.bb      | 3 ---
 .../meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb      | 3 ---
 .../recipes-phosphor/workbook/witherspoon-config.bb                 | 3 ---
 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb    | 3 ---
 meta-phosphor/classes/config-in-skeleton.bbclass                    | 6 +++++-
 meta-phosphor/classes/skeleton-rev.bbclass                          | 2 ++
 meta-phosphor/classes/skeleton.bbclass                              | 4 ++--
 8 files changed, 9 insertions(+), 18 deletions(-)
 create mode 100644 meta-phosphor/classes/skeleton-rev.bbclass

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
index 0f4de06..979a44c 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
@@ -1,8 +1,5 @@
 SUMMARY = "Firestone board wiring"
 DESCRIPTION = "Board wiring information for the Firestone system."
-HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
 inherit config-in-skeleton
-inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
index 00bc2ec..51ec676 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
@@ -1,8 +1,5 @@
 SUMMARY = "Garrison board wiring"
 DESCRIPTION = "Board wiring information for the Garrison system."
-HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "5213a991a5a3bd107636f1b2cc3bbca560843462"
 inherit config-in-skeleton
-inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
index c0a4efa..f4a326e 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
@@ -1,8 +1,5 @@
 SUMMARY = "Palmetto board wiring"
 DESCRIPTION = "Board wiring information for the Palmetto system."
-HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
 inherit config-in-skeleton
-inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
index b36cc81..e08f89d 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
@@ -1,8 +1,5 @@
 SUMMARY = "Witherspoon board wiring"
 DESCRIPTION = "Board wiring information for the Witherspoon OpenPOWER system."
-HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "5774d44aa3dca936b6ddc118e2b3b0ea8e1c5f26"
 inherit config-in-skeleton
-inherit obmc-phosphor-license
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
index 9258d2a..a72f1e9 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
@@ -1,8 +1,5 @@
 SUMMARY = "Barreleye board wiring"
 DESCRIPTION = "Board wiring information for the Barreleye system."
-HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "1bbc820f2b595b7a674e52bee1775c877b35b61e"
 inherit config-in-skeleton
-inherit obmc-phosphor-license
diff --git a/meta-phosphor/classes/config-in-skeleton.bbclass b/meta-phosphor/classes/config-in-skeleton.bbclass
index 72249ff..907f226 100644
--- a/meta-phosphor/classes/config-in-skeleton.bbclass
+++ b/meta-phosphor/classes/config-in-skeleton.bbclass
@@ -4,9 +4,13 @@
 inherit allarch
 inherit setuptools
 inherit pythonnative
+inherit skeleton-rev
+inherit obmc-phosphor-license
+
+HOMEPAGE = "http://github.com/openbmc/skeleton"
 
 DEPENDS += "python"
-SRC_URI += "git://github.com/openbmc/skeleton;subpath=configs"
+SRC_URI += "${SKELETON_URI};subpath=configs"
 S = "${WORKDIR}/configs"
 
 python() {
diff --git a/meta-phosphor/classes/skeleton-rev.bbclass b/meta-phosphor/classes/skeleton-rev.bbclass
new file mode 100644
index 0000000..93544de
--- /dev/null
+++ b/meta-phosphor/classes/skeleton-rev.bbclass
@@ -0,0 +1,2 @@
+SRCREV ?= "b4140b888f586c98c5d03893166c5074a98cf951"
+SKELETON_URI ?= "git://github.com/openbmc/skeleton"
diff --git a/meta-phosphor/classes/skeleton.bbclass b/meta-phosphor/classes/skeleton.bbclass
index 3faaa15..1f67333 100644
--- a/meta-phosphor/classes/skeleton.bbclass
+++ b/meta-phosphor/classes/skeleton.bbclass
@@ -1,7 +1,7 @@
 inherit obmc-phosphor-license
+inherit skeleton-rev
 
 HOMEPAGE = "http://github.com/openbmc/skeleton"
 
-SRCREV ??= "1bbc820f2b595b7a674e52bee1775c877b35b61e"
-SRC_URI += "git://github.com/openbmc/skeleton"
+SRC_URI += "${SKELETON_URI}"
 S = "${WORKDIR}/git/${SKELETON_DIR}"
-- 
2.9.0
