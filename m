Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qtyKQ6Z9SzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2016 06:20:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461615653569419.5339295058234;
 Mon, 25 Apr 2016 13:20:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Replace BUILD_ID with VERSION_ID in then inventory
Date: Mon, 25 Apr 2016 15:20:51 -0500
Message-Id: <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461615651-31359-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461615651-31359-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 25 Apr 2016 20:20:59 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add VERSION_ID to the inventory instead of BUILD_ID because
the version (git tag) is the value that gets updated during
a firmware update, the build id remains constant.
---
 bin/inventory_items.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/inventory_items.py b/bin/inventory_items.py
index 6320f90..0a90569 100755
--- a/bin/inventory_items.py
+++ b/bin/inventory_items.py
@@ -71,7 +71,7 @@ def getVersion():
 		for line in f:
 			p = line.rstrip('\n')
 			parts = line.rstrip('\n').split('=')
-			if (parts[0] == "BUILD_ID"):
+			if (parts[0] == "VERSION_ID"):
 				version = parts[1]
 	return version
 
-- 
2.8.1
