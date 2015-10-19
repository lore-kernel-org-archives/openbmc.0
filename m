Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42BF81A0A3F
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:52 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293370194873.1384021776696;
 Mon, 19 Oct 2015 15:22:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 5/5] Remove tftpy from skeleton package
Date: Mon, 19 Oct 2015 17:22:41 -0500
Message-Id: <1445293361-739-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:52 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 23b43c3..f5375c4 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -7,7 +7,7 @@ inherit obmc-phosphor-license
 inherit obmc-phosphor-systemd
 
 DEPENDS += "glib-2.0"
-RDEPENDS_${PN} += "python-subprocess"
+RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 SRC_URI += "file://make.patch"
 
@@ -21,7 +21,7 @@ do_compile() {
 
 do_install() {
         install -d ${D}/${sbindir} ${D}${libdir}
-        for i in ${S}/bin/*.py ${S}/bin/*.exe ${S}/bin/tftpy/*.py; do
+        for i in ${S}/bin/*.py ${S}/bin/*.exe; do
                 install $i ${D}/${sbindir}
         done
         install ${S}/bin/libopenbmc_intf.so ${D}/${libdir}
-- 
2.6.0
