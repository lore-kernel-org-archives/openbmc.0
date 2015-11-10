Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 774731A0225
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 15:50:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447131021187962.77585348856;
 Mon, 9 Nov 2015 20:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] boot sensor was not reporting
Date: Mon,  9 Nov 2015 23:50:19 -0500
Message-Id: <1447131019-11284-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447131019-11284-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447131019-11284-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 Nov 2015 04:50:26 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index d94ac80..2a2959a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "e8ea3befc0f6120cbe9de2cf4d9dec1c95daf2b5"
+SRCREV = "8f71a6190d17d59f8de49182b0a8f3f063be3146"
 
 
 S = "${WORKDIR}/git"
-- 
2.6.3
