Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9B41A0A8C
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:51 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 14452933687021002.8304008928488;
 Mon, 19 Oct 2015 15:22:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 4/5] Add recipe for
 https://github.com/msoulier/tftpy
Date: Mon, 19 Oct 2015 17:22:40 -0500
Message-Id: <1445293361-739-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445293361-739-1-git-send-email-patches@stwcx.xyz>
References: <1445293361-739-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:51 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

A pure python library for TFTP.
---
 .../common/recipes-devtools/python/python-tftpy.bb    | 19 +++++++++++++++++++
 meta-phosphor/common/recipes.txt                      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-tftpy.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/python-tftpy.bb b/meta-phosphor/common/recipes-devtools/python/python-tftpy.bb
new file mode 100644
index 0000000..32f788b
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-tftpy.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Python is a TFTP library for the Python programming language."
+DESCRIPTION = "Tftpy is a TFTP library for the Python programming language. It includes \
+client and server classes, with sample implementations. Hooks are included for \
+easy inclusion in a UI for populating progress indicators. It supports RFCs \
+1350, 2347, 2348 and the tsize option from RFC 2349."
+HOMEPAGE = "https://github.com/msoulier/tftpy"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=22770e72ae03c61f5bcc4e333b61368d"
+
+SRC_URI = "git://github.com/msoulier/tftpy.git"
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
+
+inherit allarch
+inherit setuptools
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index d38d789..f339a3c 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1,4 +1,5 @@
 recipes-connectivity - Libraries and applications related to communication with other devices 
+recipes-devtools     - Tools primarily used by the build system (but can also be used on targets)
 recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
                        core. May be needed for full tool functionality or LSB compliance.
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-- 
2.6.0
