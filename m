Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8CDAE1A026C
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:50:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449420621414326.8053514691576;
 Sun, 6 Dec 2015 08:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 3/8] Bump mapper and rest server revisions
Date: Sun,  6 Dec 2015 11:50:13 -0500
Message-Id: <1449420618-3202-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 06 Dec 2015 16:50:27 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Fixes for freedesktop ObjectManager signal handling.
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 37c9c3f..323a179 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -20,6 +20,6 @@ SRC_URI += " \
         git://github.com/openbmc/phosphor-objmgr \
         "
 
-SRCREV = "6aed08d480aa1e022df14d48b7a54f5b1790e7d9"
+SRCREV = "3f7aa329568d8f191baeeefa4a63dbb19cf26338"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 19da738..05f2383 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -21,6 +21,6 @@ SRC_URI += " \
         git://github.com/openbmc/phosphor-rest-server \
         "
 
-SRCREV = "f481dfc6b059677d06c158a5e23cfffab56edc3f"
+SRCREV = "34cae732597fb3d4b18a23b6494efdbfeca2033b"
 
 S = "${WORKDIR}/git"
-- 
2.6.3
