Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RF1/1pHP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MXIzBqFZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnT03fl6zDrdq
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 934D820DCC;
 Mon, 19 Feb 2018 23:19:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EjfNKcv5v+Gl+kkrw
 wscU1ChecV4D7OBHQIWnwWiN9I=; b=RF1/1pHPTjRBSblY6ey1K4101wiv4cS4t
 3C9u5oMWJ7jAUf8SK2u1XLW3MkllCQRq7IX/EYQHO3W85XvF2fUxDI724YRbNvyg
 TOcTTMTbJ0jYJ31t5UCNwvTCFDqMZgNJ1uEiql4ezJTES7i4fqCHGVO9VgdK7TMr
 rBxPlghHR92Rcqn984TAIV3IQnwZkzXO7ai567mCKqCmTukBb16DeDRWrecpgQTE
 qXk9DO1qk1EzE/JzaakicQjLkWLDSUwIOKlgIyQ9OftvqlywrsOqxRxeszAFV/1V
 skWQfoFL/c//nLJiXTea3zLyTebv3br0nKyvq41wtsTh/ZsSkMNXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EjfNKcv5v+Gl+kkrwwscU1ChecV4D7OBHQIWnwWiN9I=; b=MXIzBqFZ
 SDfAink0U+ASUwlQe/7K3bpRz95+CFoH02DZL1hBILSvJ8WOBgMYudyPQ74jHrFf
 U9CQ1QwzvtozKYTFNjg3Y2X7vQu1BFmWJ/gSc3SisIYDDanl4D9Kx2VrPJSqyaEx
 CN+IU+NRmts32tPSwqonNF4WlXc5kVLGTXI2nSJmtPxO2jW4v61ZPW7iy9NrF4Wm
 BTJwDTOXkYDyQYmx9EA5P0auYL8MyM4twSQvdXFLiCLyR2h5yxXBs90GVjeLQG98
 74dnZj6LG2k9pHWubuXDQdYDcD3FZMfx78vaqyiIYh/fF4NYMEjSyxbS/PgkxadX
 faTCvWDwpOlqIA==
X-ME-Sender: <xms:4aGLWoxESOGDuR9QjUJFgr5Rg2V7iKtjNu_fosjmiYOmOPng2i5u3Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4E327E140;
 Mon, 19 Feb 2018 23:19:42 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 09/16] hwmon (p9_sbe): Rename lock member of
 struct p9_sbe_occ
Date: Tue, 20 Feb 2018 14:48:37 +1030
Message-Id: <20180220041844.13228-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180220041844.13228-1-andrew@aj.id.au>
References: <20180220041844.13228-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 04:19:49 -0000

Improve code clarity (and searchability) by renaming the lock to client_lock.
The end result is it is easier to search for uses in the source file.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 9b8f2f650895..51bdfa89f1a6 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -34,7 +34,7 @@ struct p9_sbe_occ {
 	 * open, close and NULL assignment. This prevents simultaneous opening
 	 * and closing of the client, or closing multiple times.
 	 */
-	spinlock_t lock;
+	spinlock_t client_lock;
 };
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
@@ -44,11 +44,11 @@ static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
 	unsigned long flags;
 	struct occ_client *tmp_client;
 
-	spin_lock_irqsave(&ctx->lock, flags);
+	spin_lock_irqsave(&ctx->client_lock, flags);
 	tmp_client = ctx->client;
 	ctx->client = NULL;
 	occ_drv_release(tmp_client);
-	spin_unlock_irqrestore(&ctx->lock, flags);
+	spin_unlock_irqrestore(&ctx->client_lock, flags);
 }
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
@@ -58,10 +58,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	spin_lock_irqsave(&ctx->lock, flags);
+	spin_lock_irqsave(&ctx->client_lock, flags);
 	if (ctx->sbe)
 		ctx->client = occ_drv_open(ctx->sbe, 0);
-	spin_unlock_irqrestore(&ctx->lock, flags);
+	spin_unlock_irqrestore(&ctx->client_lock, flags);
 
 	if (!ctx->client)
 		return -ENODEV;
-- 
2.14.1
