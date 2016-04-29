Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxRST2ZSWzDqBr
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 07:20:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461964836584547.6910942025145;
 Fri, 29 Apr 2016 14:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 4/5] Add pyphosphor requirement to rest-dbus
Date: Fri, 29 Apr 2016 16:20:30 -0500
Message-Id: <1461964831-393-5-git-send-email-openbmc-patches@stwcx.xyz>
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

Once this happens the duplicated code can be removed from rest-dbus.
---
 meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
index fa551f5..1dfe027 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} += " \
         python-json \
         python-dbus \
         python-xml \
-        obmc-mapper \
+        pyphosphor \
         "
 
 SRC_URI += " \
-- 
2.8.1
