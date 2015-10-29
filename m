Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 68F9C1A0BCB
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140340051136.67307690295775;
 Thu, 29 Oct 2015 10:39:00 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update skeleton version to pick up new executables
Date: Thu, 29 Oct 2015 12:38:56 -0500
Message-Id: <1446140336-7218-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140336-7218-1-git-send-email-patches@stwcx.xyz>
References: <1446140336-7218-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:05 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Update skeleton commit version in the recipe
Get executables from bin and libraries from lib
---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 0c8687c..572030c 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -17,20 +17,22 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "47750bc1c06aebda189f2e8d7862c9d9b9ffe35b"
+SRCREV = "597d49e68e8bf0ddedb2e01cbd3fb500ee1c22e3"
 
 S = "${WORKDIR}"
 
 do_compile() {
-        oe_runmake -C git all
+        oe_runmake -C git
 }
 
 do_install() {
         source=${S}/git
 
         install -d ${D}/${sbindir} ${D}${libdir}
-        for i in ${source}/bin/*.py ${source}/bin/*.exe; do
+        for i in ${source}/bin/*; do
                 install $i ${D}/${sbindir}
         done
-        install ${source}/bin/libopenbmc_intf.so ${D}/${libdir}
+        for i in ${source}/lib/*; do
+                install $i ${D}/${libdir}
+        done
 }
-- 
2.6.0
