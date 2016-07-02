Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rhDT52n3nzDqhC
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 10:20:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467418836178608.6049842069976;
 Fri, 1 Jul 2016 17:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump skeleton version for v1.0-stable
Date: Fri,  1 Jul 2016 19:20:33 -0500
Message-Id: <20160702002033.7356-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160702002033.7356-1-openbmc-patches@stwcx.xyz>
References: <20160702002033.7356-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 02 Jul 2016 00:20:41 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Pick up fixes and the ability to update at runtime and get the
bmc code update progress.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
index 8f0d16c..9258d2a 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
@@ -3,6 +3,6 @@ DESCRIPTION = "Board wiring information for the Barreleye system."
 HOMEPAGE = "http://github.com/openbmc/skeleton"
 PR = "r1"
 
-SRCREV = "cbe32133dadf0945357e2bec67aa7a86ae9f0295"
+SRCREV = "1bbc820f2b595b7a674e52bee1775c877b35b61e"
 inherit config-in-skeleton
 inherit obmc-phosphor-license
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 77a2980..b043d53 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -26,7 +26,7 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/*"
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
 PACKAGECONFIG[openpower-pflash] = ",,,pflash"
 
-SRCREV = "fa8f6166a05410472e8a3ef6a2f2e3b9b5f8d8e4"
+SRCREV = "1bbc820f2b595b7a674e52bee1775c877b35b61e"
 
 S = "${WORKDIR}"
 
-- 
2.9.0
