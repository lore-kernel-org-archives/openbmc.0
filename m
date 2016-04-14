Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qlrQZ0YySzDq5y
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 16:30:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460615439590440.15381460238586;
 Wed, 13 Apr 2016 23:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/3] Enable obmc-console project
Date: Thu, 14 Apr 2016 01:30:33 -0500
Message-Id: <1460615435-26806-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Apr 2016 06:30:46 -0000

From: Jeremy Kerr <jk@ozlabs.org>

The issue that prevented obmc-console from compiling was has been fixed
in f5858b5bf, so bump to a recent obmc-console version, and reenable.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass                  | 1 +
 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 164da33..ce54777 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -42,6 +42,7 @@ IMAGE_INSTALL += " \
         i2c-tools \
         screen \
         inarp \
+        obmc-console \
         "
 
 def build_overlay(d):
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
index 6fe3bde..75a1d84 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console.bb
@@ -11,7 +11,7 @@ TARGET_CFLAGS   += "-fpic -O2"
 
 SRC_URI += "git://github.com/openbmc/obmc-console"
 SRC_URI += "file://${PN}.conf"
-SRCREV = "54e9569d14b127806e45e1c17ec4a1f5f7271d3f"
+SRCREV = "2eacda524e98c7964e542e01aabf82360cf60344"
 
 do_install_append() {
         install -m 0755 -d ${D}${sysconfdir}
-- 
2.7.1
