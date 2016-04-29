Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxRSS4G6qzDqBX
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 07:20:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146196483559979.5168069473857;
 Fri, 29 Apr 2016 14:20:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 3/5] Whitespace fixes for obmc-rest.bb
Date: Fri, 29 Apr 2016 16:20:29 -0500
Message-Id: <1461964831-393-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461964831-393-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461964831-393-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 21:20:41 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

OE style guidelines dictate no tabs.
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index f66dd26..944199f 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -13,10 +13,10 @@ RDEPENDS_${PN} += " \
         python-xml \
         python-dbus \
         python-pygobject \
-	obmc-mapper \
-	python-rocket \
-	python-bottle \
-	python-spwd \
+        obmc-mapper \
+        python-rocket \
+        python-bottle \
+        python-spwd \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-rest-server"
 
-- 
2.8.1
