Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxS720wY8zDqBF
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 07:50:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461966631933282.3047810808978;
 Fri, 29 Apr 2016 14:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc v2 1/5] New recipe for pyphosphor library
Date: Fri, 29 Apr 2016 16:50:26 -0500
Message-Id: <1461966630-1878-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 21:50:38 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

We have openbmc python utilities scattered all over the place.  To
facilitate reuse, bring them together in a single python package.
---
 .../common/recipes-phosphor/skeleton/pyphosphor.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
new file mode 100644
index 0000000..a44f19a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Phosphor python library"
+DESCRIPTION = "Phosphor python library."
+HOMEPAGE = "http://github.com/openbmc/pyobmc"
+PR = "r1"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+inherit allarch
+inherit setuptools
+
+SRC_URI += "git://github.com/openbmc/pyphosphor"
+
+SRCREV = "1b3c05c1f44185f8176f46829a26ad6e50d0831f"
+
+S = "${WORKDIR}/git"
-- 
2.8.1
