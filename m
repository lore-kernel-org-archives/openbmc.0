Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D7B711A1148
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:40:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14497224079601008.5667774443704;
 Wed, 9 Dec 2015 20:40:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 1/4] Update usage message
Date: Wed,  9 Dec 2015 22:40:03 -0600
Message-Id: <1449722406-13608-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449722406-13608-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449722406-13608-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 10 Dec 2015 04:40:15 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/btbridged.c b/btbridged.c
index 115ae63..ab4880c 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -584,7 +584,8 @@ out:
 
 static void usage(const char *name)
 {
-	fprintf(stderr, "Usage %s\n", name);
+	fprintf(stderr, "Usage %s [ --debug | --verbose ]\n", name);
+	fprintf(stderr, "\t--debug\t Implies --verbose\n\t Dumps entire message contents to console\n");
 	fprintf(stderr, "\t--verbose\t Be verbose\n\n");
 }
 
-- 
2.6.3
