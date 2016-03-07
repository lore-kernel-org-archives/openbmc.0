Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7BC6F1A03DF
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:41:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386251045760.485137981036;
 Mon, 7 Mar 2016 13:30:51 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 32/34] initfs: Install option and download files if
 they exist
Date: Mon,  7 Mar 2016 15:30:21 -0600
Message-Id: <1457386223-5725-33-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 07 Mar 2016 21:41:15 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Install the init-option and init-download-url if they exist in
the build directory.

This change to the bitbake recipe allows an override layer to
simply add these files to the SRC_URI variable and then have them
appear in the initramfs.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
index 68ee00d..3fa88c9 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
@@ -12,6 +12,13 @@ SRC_URI += "file://obmc-update.sh"
 SRC_URI += "file://whitelist"
 
 do_install() {
+	for f in init-download-url init-options
+	do
+		if test -e $f
+		then
+			install -m 0755 ${WORKDIR}/$f ${D}/$f
+		fi
+	done
         install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
         install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
         install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
@@ -21,3 +28,4 @@ do_install() {
 }
 
 FILES_${PN} += " /init /shutdown /update /whitelist /dev "
+FILES_${PN} += " /init-options /init-download-url "
-- 
2.7.1
