Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj7G2CPzzDqlK
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:31:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146664186090041.44134732217549;
 Wed, 22 Jun 2016 17:31:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v6 18/18] initfs: whitelist: Sanitize obmc events
 whitelist entry
Date: Wed, 22 Jun 2016 19:30:38 -0500
Message-Id: <20160623003038.2361-19-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 23 Jun 2016 00:31:07 -0000

From: Milton Miller <miltonm@us.ibm.com>

Remove the trailing / so that the update script doesn't have to loop.

It was determined the trailing slash confused the code that makes
the save subdirectory.  The update script was fixed but this removes
the extra work needed.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
index 603cec7..c35a552 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
@@ -6,4 +6,4 @@
 /etc/group
 /etc/shadow
 /etc/gshadow
-/var/lib/obmc/events/
+/var/lib/obmc/events
-- 
2.9.0
