Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNtKS3hlpzDqJV
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 10:50:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465260645865939.0255451569707;
 Mon, 6 Jun 2016 17:50:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 8/9] obmc-phosphor-initfs : fix recipe, remove class
Date: Mon,  6 Jun 2016 19:50:31 -0500
Message-Id: <20160607005032.29458-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160607005032.29458-1-openbmc-patches@stwcx.xyz>
References: <20160607005032.29458-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 07 Jun 2016 00:50:53 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Because the recipe was named with trailing part init vs initfs, the package
didn't match the package name requiring PROVIDES, RPROVIDES and other
bitbake workarounds.  Fix the recipe name to match the package removing
the overly verbose packaging.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |  4 ---
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb     | 31 ----------------------
 .../obmc-phosphor-initfs/obmc-phosphor-initfs.bb   | 30 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 35 deletions(-)
 delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb

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
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
deleted file mode 100644
index 3fa88c9..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Phosphor OpenBMC pre-init scripts"
-DESCRIPTION = "Phosphor OpenBMC filesytem mount reference implementation."
-PR = "r1"
-
-inherit obmc-phosphor-license
-inherit obmc-phosphor-initfs
-
-S = "${WORKDIR}"
-SRC_URI += "file://obmc-init.sh"
-SRC_URI += "file://obmc-shutdown.sh"
-SRC_URI += "file://obmc-update.sh"
-SRC_URI += "file://whitelist"
-
-do_install() {
-	for f in init-download-url init-options
-	do
-		if test -e $f
-		then
-			install -m 0755 ${WORKDIR}/$f ${D}/$f
-		fi
-	done
-        install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
-        install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
-        install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
-        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist
-        install -d ${D}/dev
-        mknod -m 622 ${D}/dev/console c 5 1
-}
-
-FILES_${PN} += " /init /shutdown /update /whitelist /dev "
-FILES_${PN} += " /init-options /init-download-url "
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
new file mode 100644
index 0000000..f81e21d
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Phosphor OpenBMC pre-init scripts"
+DESCRIPTION = "Phosphor OpenBMC filesytem mount reference implementation."
+PR = "r1"
+
+inherit obmc-phosphor-license
+
+S = "${WORKDIR}"
+SRC_URI += "file://obmc-init.sh"
+SRC_URI += "file://obmc-shutdown.sh"
+SRC_URI += "file://obmc-update.sh"
+SRC_URI += "file://whitelist"
+
+do_install() {
+	for f in init-download-url init-options
+	do
+		if test -e $f
+		then
+			install -m 0755 ${WORKDIR}/$f ${D}/$f
+		fi
+	done
+        install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
+        install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
+        install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
+        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
+}
+
+FILES_${PN} += " /init /shutdown /update /whitelist /dev "
+FILES_${PN} += " /init-options /init-download-url "
-- 
2.8.3
