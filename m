Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxWv92NrjzDq9s
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 10:40:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461976833864996.3235529544347;
 Fri, 29 Apr 2016 17:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 5/5] Bump rest, mapper and rest-dbus versions
Date: Fri, 29 Apr 2016 19:40:28 -0500
Message-Id: <1461976828-9800-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461976828-9800-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461976828-9800-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Apr 2016 00:40:37 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Picking up support for pyphosphor and associations.
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb    | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb      | 3 ++-
 meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index ab6dc98..5b59290 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "956dd44fe5c8377ec90cef393f65033d59e082b0"
+SRCREV = "a2c0d00e47ec082b8bb8c96629a0a677616e49fe"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 944199f..af69578 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -17,9 +17,10 @@ RDEPENDS_${PN} += " \
         python-rocket \
         python-bottle \
         python-spwd \
+        pyphosphor \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-rest-server"
 
-SRCREV = "fe90e0c579edbc19699e5aa7abbe4dd29b4dd112"
+SRCREV = "b41507f3b9c9a79ccd0ef6f48ac839b306a604b7"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
index 1dfe027..bf25cae 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
@@ -21,6 +21,6 @@ SRC_URI += " \
         file://rest-dbus.service \
         "
 
-SRCREV = "b10a57e2f34e94b13697328cc22f876f738feb0e"
+SRCREV = "c693ba1126dcb493058d4ebeb4604b71e3bb3f08"
 
 S = "${WORKDIR}/git"
-- 
2.8.1
