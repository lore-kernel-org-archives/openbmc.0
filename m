Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVmKZ6wHJzDqjp
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 00:41:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466088074000933.7337313894991;
 Thu, 16 Jun 2016 07:41:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 5/6] Add gpio checkstop handling to Makefile
Date: Thu, 16 Jun 2016 09:40:55 -0500
Message-Id: <20160616144056.17931-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
References: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 14:41:24 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add gpio checkstop target to Makefil to build it.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 87acb71..539c7d8 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,7 @@ GDBUS_APPS = bmcctl \
 	     boardvpd \
 	     fanctl \
 	     flashbios \
+	     hostcheckstop \
 	     hostwatchdog \
 	     hwmon \
 	     hwmon-barreleye \
-- 
2.8.4
