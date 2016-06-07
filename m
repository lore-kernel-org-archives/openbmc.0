Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNtKX49lczDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 10:50:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465260646953133.05524321653934;
 Mon, 6 Jun 2016 17:50:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 9/9] init: Add an option to run from RAM
Date: Mon,  6 Jun 2016 19:50:32 -0500
Message-Id: <20160607005032.29458-10-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 07 Jun 2016 00:50:58 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Adding the obmc-phosphor-initfs-ram package will add the text
overlay-filesystem-in-ram to /init-options-base which will cause
init to not mount the rwfs.  This allows building an image
netboot from RAM, while allowing copy-files-to-ram to
the kernel comand line via bootargs will allow whitelisted files
read from the rwfs before startup and allows them to be saved back
to the rwfs via update.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init-options-ram                 | 1 +
 .../recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb    | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init-options-ram

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init-options-ram b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init-options-ram
new file mode 100644
index 0000000..5e6489d
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init-options-ram
@@ -0,0 +1 @@
+overlay-filesystem-in-ram
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
index f81e21d..525d9e9 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
@@ -3,14 +3,18 @@ DESCRIPTION = "Phosphor OpenBMC filesytem mount reference implementation."
 PR = "r1"
 
 inherit obmc-phosphor-license
+PACKAGES += " ${PN}-ram"
 
 S = "${WORKDIR}"
 SRC_URI += "file://obmc-init.sh"
 SRC_URI += "file://obmc-shutdown.sh"
 SRC_URI += "file://obmc-update.sh"
 SRC_URI += "file://whitelist"
+SRC_URI += "file://obmc-init-options-ram"
+
 
 do_install() {
+        install -m 0644 ${WORKDIR}/obmc-init-options-ram ${D}/init-options-base
 	for f in init-download-url init-options
 	do
 		if test -e $f
@@ -28,3 +32,4 @@ do_install() {
 
 FILES_${PN} += " /init /shutdown /update /whitelist /dev "
 FILES_${PN} += " /init-options /init-download-url "
+FILES_${PN}-ram += " /init-options-base "
-- 
2.8.3
