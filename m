Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D1C6B1A0CEF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:33 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208947086919.0428630665521;
 Fri, 30 Oct 2015 05:42:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 6/8] Don't exit on short reads just ignore
Date: Fri, 30 Oct 2015 07:42:12 -0500
Message-Id: <1446208934-25969-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
References: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:34 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index c829c46..d490c59 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -482,8 +482,8 @@ static int dispatch_bt(struct btbridged_context *context)
 			goto out1;
 		}
 		if (r < data[0] + 1) {
-			MSG_ERR("Short read from bt (%d)\n", r);
-			r = -EINVAL;
+			MSG_ERR("Short read from bt (%d vs %d)\n", r, data[0] + 1);
+			r = 0;
 			goto out1;
 		}
 
-- 
2.6.0
