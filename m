Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D29281A0BC8
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 04:20:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449076823256750.3879977724964;
 Wed, 2 Dec 2015 09:20:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Add python-spwd depenency to rest server
Date: Wed,  2 Dec 2015 12:20:21 -0500
Message-Id: <1449076821-7860-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449076821-7860-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449076821-7860-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 17:20:30 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Needed for pending rest server authentication support.
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 05f2383..cb68953 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -16,6 +16,7 @@ RDEPENDS_${PN} += " \
 	obmc-mapper \
 	python-rocket \
 	python-bottle \
+	python-spwd \
         "
 SRC_URI += " \
         git://github.com/openbmc/phosphor-rest-server \
-- 
2.6.3
