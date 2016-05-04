Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0V6V66mXzDq5k
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 06:30:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462393836857480.3014433889423;
 Wed, 4 May 2016 13:30:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add version_id support in to openbmc
Date: Wed,  4 May 2016 15:30:34 -0500
Message-Id: <1462393834-27292-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462393834-27292-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462393834-27292-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 20:30:43 -0000

From: Chris Austen <austenc@us.ibm.com>

Adding https://github.com/openbmc/phosphor-host-ipmid/commit/176c96534484213dfb19d2ef5f70306b145a4fcf
to all the ipmi -I dbus mc info command to reflect what is seen via REST
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index e22c0d3..432007c 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "2bcf128699eaff43f4bd4084ab4096d49d782b6b"
+SRCREV = "eee949f14d921d84497f41df84ab7ae45a0d830d"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "ipmid"
-- 
2.8.1
