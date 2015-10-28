Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6590F1A0B2F
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 01:31:11 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446040102447516.5307991147895;
 Wed, 28 Oct 2015 06:48:22 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/3] Don't set source dir to git
Date: Wed, 28 Oct 2015 08:48:13 -0500
Message-Id: <1446040095-14799-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
References: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 14:31:11 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

So that patches can apply.
---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index d0cf359..0c8687c 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -19,16 +19,18 @@ SRC_URI += "git://github.com/openbmc/skeleton"
 
 SRCREV = "47750bc1c06aebda189f2e8d7862c9d9b9ffe35b"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}"
 
 do_compile() {
-        oe_runmake all
+        oe_runmake -C git all
 }
 
 do_install() {
+        source=${S}/git
+
         install -d ${D}/${sbindir} ${D}${libdir}
-        for i in ${S}/bin/*.py ${S}/bin/*.exe; do
+        for i in ${source}/bin/*.py ${source}/bin/*.exe; do
                 install $i ${D}/${sbindir}
         done
-        install ${S}/bin/libopenbmc_intf.so ${D}/${libdir}
+        install ${source}/bin/libopenbmc_intf.so ${D}/${libdir}
 }
-- 
2.6.0
