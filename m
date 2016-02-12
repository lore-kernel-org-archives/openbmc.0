Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46E5D1A0070
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 08:30:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455312625181376.71846998441254;
 Fri, 12 Feb 2016 13:30:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update skeleton recipe to pick up persistent UUID
 support
Date: Fri, 12 Feb 2016 15:30:23 -0600
Message-Id: <1455312623-23109-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455312623-23109-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455312623-23109-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 12 Feb 2016 21:30:30 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Update skeleton recipe to pick up persistent UUID support
by using the system uuid.
---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index a80756e..a48f5b5 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "be6212efab572d11fdb507146a4527a41e3d0875"
+SRCREV = "ad8c3d3b7be6cc5cda80a2f215b40eae16381b09"
 
 S = "${WORKDIR}"
 
-- 
2.7.1
