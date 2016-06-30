Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsg1vhjzDrFx
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467309038779636.673791419645;
 Thu, 30 Jun 2016 10:50:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/6] Add mapper dependency to skeleton
Date: Thu, 30 Jun 2016 12:50:29 -0500
Message-Id: <20160630175033.5212-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
References: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:48 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This isn't required at the moment but it will be eventually
to avoid deadlocks between the mapper and system_manager
during startup.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/skeleton/skeleton/skeleton.service          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
index c39cc40..3a8e52e 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
@@ -1,5 +1,7 @@
 [Unit]
 Description=Temp placeholder for skeleton function
+Requires=obmc-mapper.service
+After=obmc-mapper.service
 
 [Service]
 Restart=always
-- 
2.9.0
