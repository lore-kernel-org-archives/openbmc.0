Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxS725YrtzDqBR
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 07:50:38 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461966633004611.2366314879945;
 Fri, 29 Apr 2016 14:50:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc v2 2/5] New recipe for openpower-inventory-upload
Date: Fri, 29 Apr 2016 16:50:27 -0500
Message-Id: <1461966630-1878-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461966630-1878-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461966630-1878-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 21:50:39 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This script uploads the BMC inventory to a partition in PNOR
on POWER systems for inclusion in the host device tree.
---
 .../images/obmc-phosphor-image.bbappend              |  3 +++
 .../inventory-upload/inventory-upload.bb             | 20 ++++++++++++++++++++
 meta-openbmc-machines/meta-openpower/conf/layer.conf |  4 +++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
new file mode 100644
index 0000000..7b8aa6f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
@@ -0,0 +1,3 @@
+IMAGE_INSTALL += " \
+        inventory-upload \
+"
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
new file mode 100644
index 0000000..8c0bd34
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/inventory-upload/inventory-upload.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Inventory upload"
+DESCRIPTION = "Inventory upload."
+HOMEPAGE = "http://github.com/openbmc/openpower-inventory-upload"
+PR = "r1"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+inherit allarch
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+        pyphosphor \
+        dtc \
+        "
+
+SRC_URI += "git://github.com/openbmc/openpower-inventory-upload"
+
+SRCREV = "5909e7859a1a56bdc902cf774093d9fae29612ea"
+
+S = "${WORKDIR}/git"
diff --git a/meta-openbmc-machines/meta-openpower/conf/layer.conf b/meta-openbmc-machines/meta-openpower/conf/layer.conf
index 46c5a5d..6824543 100644
--- a/meta-openbmc-machines/meta-openpower/conf/layer.conf
+++ b/meta-openbmc-machines/meta-openpower/conf/layer.conf
@@ -1,8 +1,10 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
+# We have recipes-* directories, add to BBFILES
 BBFILES += "${LAYERDIR}/common/recipes-*/*/*.bb \
             ${LAYERDIR}/common/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openpower"
-BBFILE_PATTERN_openpower = ""
+BBFILE_PATTERN_openpower = "^${LAYERDIR}/"
+LAYERVERSION_openpower = "1"
-- 
2.8.1
