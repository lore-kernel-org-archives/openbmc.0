Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8805B1A03E6
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 09:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455747027267710.6293804527523;
 Wed, 17 Feb 2016 14:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 2/3] initfs: use S instead of WORKDIR when
 installing
Date: Wed, 17 Feb 2016 16:10:23 -0600
Message-Id: <1455747024-5936-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455747024-5936-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455747024-5936-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 17 Feb 2016 22:10:33 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

We define S, lets use it.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
index 68ee00d..cb18dc8 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
@@ -12,10 +12,10 @@ SRC_URI += "file://obmc-update.sh"
 SRC_URI += "file://whitelist"
 
 do_install() {
-        install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
-        install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
-        install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
-        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist
+        install -m 0755 ${S}/obmc-init.sh ${D}/init
+        install -m 0755 ${S}/obmc-shutdown.sh ${D}/shutdown
+        install -m 0755 ${S}/obmc-update.sh ${D}/update
+        install -m 0644 ${S}/whitelist ${D}/whitelist
         install -d ${D}/dev
         mknod -m 622 ${D}/dev/console c 5 1
 }
-- 
2.7.1
