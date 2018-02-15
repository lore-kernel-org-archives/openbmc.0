Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ENQUrjf7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MFAP5uFR"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkv3nJpzF1GC
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED33D20E0E;
 Thu, 15 Feb 2018 07:36:52 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+1ayakOhNfFnKomEg
 JgmyyOxI+k6ijWd2w2U1baKQ8c=; b=ENQUrjf7yvMqNiycCvHSox9mTtJhLa5BN
 gqWFf9x5D+h07JDTAAhg5OL2pnclzDeqmolMkZp0Gw7ykSj+ZUz5NS8dnoWMnpty
 uhAMRuNaRIRkEPz8rfXCQUfUtFpm+v8ZPzrV3djoiLHUPj5ywUnALWFPXmcmEB84
 hsELi+TkB/UhhIUJFzuAht0ecbKi3uDa+Ej5R8VKDbtVVR4fWTHFgIwsJqfm8SEW
 mFbPxdEt9H6AFMwvl8Tl5fCimsCzVgewvB47gYLL83f1q92X8hX3Rc3+wyBKKihb
 1TVs7+pdMdTn8UNJ0KmzoMPNrJUM1MOEfLBfsW6yKaBS6RHWvkyfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+1ayakOhNfFnKomEgJgmyyOxI+k6ijWd2w2U1baKQ8c=; b=MFAP5uFR
 v325iFBhDd9XZ9zOEmVWbbXYRB65jLStKO4xuLTFZqaAtSOIInA4mJ0bAJ04cKOJ
 GFpBO/89tzEXFdeGN4WWXdwdrz5V3r7aEMIHuGwOWkRf04tchPdB6kyn/tVTjXzP
 gplQZ1aWiwLfQFtH6DV1qIIznU0jonoIA7KH+iNm+NS1h6Jr7DU27wQ03Qp187KA
 YYDEQHkB7jDN2J6heapdB2wLUCNQnLtrRpjnu2aym94M4aIrCxLyGlHWu8EM+0fW
 gT50jTLireiD8Xp63UNG1HQw2VPhOPqeGflM9r7TKuNFt4ciOwaD7l3nF8eqI4Gz
 htyPtDM0aUN71w==
X-ME-Sender: <xms:5H6FWl5O0jXsAnI_q0b3vHmEPC8Gg9KIoght_qsudhJ-TK61n4IfPg>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id E36967E542;
 Thu, 15 Feb 2018 07:36:49 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 07/16] hwmon (p9_sbe): Rename lock member of
 struct p9_sbe_occ
Date: Thu, 15 Feb 2018 23:05:57 +1030
Message-Id: <20180215123606.25777-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:56 -0000

Improve code clarity (and searchability) by renaming the lock to client_lock.
The end result is it is easier to search for uses in the source file.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 52473d020b24..7b1da81515e2 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -35,7 +35,7 @@ struct p9_sbe_occ {
 	 * open, close and NULL assignment. This prevents simultaneous opening
 	 * and closing of the client, or closing multiple times.
 	 */
-	spinlock_t lock;
+	spinlock_t client_lock;
 };
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
@@ -44,11 +44,11 @@ static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
 {
 	struct occ_client *tmp_client;
 
-	spin_lock_irq(&ctx->lock);
+	spin_lock_irq(&ctx->client_lock);
 	tmp_client = ctx->client;
 	ctx->client = NULL;
 	occ_drv_release(tmp_client);
-	spin_unlock_irq(&ctx->lock);
+	spin_unlock_irq(&ctx->client_lock);
 }
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
@@ -57,10 +57,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	spin_lock_irq(&ctx->lock);
+	spin_lock_irq(&ctx->client_lock);
 	if (ctx->sbe)
 		ctx->client = occ_drv_open(ctx->sbe, 0);
-	spin_unlock_irq(&ctx->lock);
+	spin_unlock_irq(&ctx->client_lock);
 
 	if (!ctx->client) {
 		rc = -ENODEV;
@@ -163,7 +163,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	ctx->sbe = pdev->dev.parent;
 
 	occ = &ctx->occ;
-	spin_lock_init(&ctx->lock);
+	spin_lock_init(&ctx->client_lock);
 	occ->bus_dev = &pdev->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
-- 
2.14.1
