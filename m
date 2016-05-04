Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r00855rwJzDqB3
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:00:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462323616064496.74208437351035;
 Tue, 3 May 2016 18:00:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 1/5] Initialise variable to avoid using it
 uninitialised
Date: Tue,  3 May 2016 20:00:09 -0500
Message-Id: <1462323613-10640-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 May 2016 01:00:22 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 btbridged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/btbridged.c b/btbridged.c
index fe692bb..3e261a9 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -489,7 +489,7 @@ static int dispatch_sd_bus(struct btbridged_context *context)
 static int dispatch_bt(struct btbridged_context *context)
 {
 	int err = 0;
-	int r;
+	int r = 0;
 
 	assert(context);
 
-- 
2.8.1
