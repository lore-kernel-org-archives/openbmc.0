Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbsB6rqCzDqmt
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467330651592883.3738411151919;
 Thu, 30 Jun 2016 16:50:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 15/16] initfs: whitelist: Sanitize obmc events
 whitelist entry
Date: Thu, 30 Jun 2016 18:50:32 -0500
Message-Id: <20160630235033.17091-16-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
References: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:55 -0000

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
