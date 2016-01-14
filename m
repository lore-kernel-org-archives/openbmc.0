Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 566551A0FEC
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 16:50:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452750608945136.31369245521194;
 Wed, 13 Jan 2016 21:50:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge 1/3] Initialise variable to avoid using it
 uninitialised
Date: Wed, 13 Jan 2016 23:50:05 -0600
Message-Id: <1452750607-27095-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 05:50:15 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

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
2.6.4
