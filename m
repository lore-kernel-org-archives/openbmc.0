Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 94DC81A093B
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 23:10:59 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327232032188.37620520021972;
 Thu, 12 Nov 2015 03:20:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH openbmc v4 5/5] add occ hwmon into obmc build
Date: Thu, 12 Nov 2015 06:20:19 -0500
Message-Id: <1447327219-20318-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447327219-20318-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447327219-20318-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 12:11:00 -0000

From: adamliyi <adamliyi@msn.com>

---
 .../recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb

diff --git a/meta-phosphor/common/recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb b/meta-phosphor/common/recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb
new file mode 100644
index 0000000..3cb081d
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "build i2c occ hwmon kernel module"
+#LICENSE = "GPLv2"
+#LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+inherit module
+inherit obmc-phosphor-license
+
+# SRC_URI = "file://Makefile \
+#           file://occ.c \
+#           file://COPYING \
+#          "
+
+SRC_URI += "git://github.com/adamliyi/kernel-hwmon-occ"
+#SRC_URI += "git://github.com/openbmc/kernel-hwmon-occ"
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
-- 
2.6.3
