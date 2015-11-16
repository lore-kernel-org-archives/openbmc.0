Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E576A1A02BE
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2015 10:20:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447716020612923.3995107893895;
 Mon, 16 Nov 2015 15:20:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] update build to support rest features
Date: Mon, 16 Nov 2015 18:20:19 -0500
Message-Id: <1447716019-4142-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447716019-4142-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447716019-4142-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 Nov 2015 23:20:25 -0000

From: Chris Austen <austenc@us.ibm.com>

list, enumerate, https, etc
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 67219b0..37c9c3f 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -20,6 +20,6 @@ SRC_URI += " \
         git://github.com/openbmc/phosphor-objmgr \
         "
 
-SRCREV = "e290f5cdccf14e50e838366367c91e0464f792f6"
+SRCREV = "6aed08d480aa1e022df14d48b7a54f5b1790e7d9"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 941fa90..8b4459e 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -21,6 +21,6 @@ SRC_URI += " \
         git://github.com/openbmc/phosphor-rest-server \
         "
 
-SRCREV = "2f7aef50b005c16a51065984f090e787c04c0c14"
+SRCREV = "275ec270684cd3b946674d02462bc9ed1890360e"
 
 S = "${WORKDIR}/git"
-- 
2.6.3
