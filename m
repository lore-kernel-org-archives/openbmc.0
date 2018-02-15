Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GFRpQyRY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C/4Bnm63"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwkq6dyxzF124
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:36:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8780320DE9;
 Thu, 15 Feb 2018 07:36:49 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ei9k4celwf6HhqKCD
 3I1T+L3H4Oh4MPtyJUK2/BhWsg=; b=GFRpQyRYwnIEd+fni6dChZ/w2wA25RcdG
 V9zwZIiieiX+YlaTctJ/agK4XoT6emAafZ7B97+KWtyk4k2qejylOrexOKv+/ueY
 Ym4f7lygWUeqzJIItYXUg2B5WRwslAP6/U8VdRrhvE/2kdXdDnoe97lNBxmRykyE
 y4OlSNzs4f41nDdZGQ6PwkwdXcCF1nzdxYrXZ9PWPfcgqQpS4xei4W5O7WJJVPAz
 /ULy2p47lt/0XFCgrgZqqsC12fhxY+pnsdv7wk7NJxpQwOsTWu0hHPCVfDJqvVkN
 OM79BhpsgI787kCcJBWQWy5OkW09NM3hOPM7S0L/5USQeqPllKkXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ei9k4celwf6HhqKCD3I1T+L3H4Oh4MPtyJUK2/BhWsg=; b=C/4Bnm63
 3ZhpfdJqD1npJoIaQoeAn7j36pFGQeVSEjyaaS7ZvxtoEekapgisbZoV0/HLQCCk
 61Jz6Y0RMzzlfB4iOAf38nXD1aIHAwtB38hV9z2V5bH6KjKKJJKXIm95ubQ7s+Mc
 tRL80d5RxDp4J/Z1FM24BUWx+ISCmX0T1eLKWuOxQi0a4Uk2t6gPv3ZRZ3L4sqel
 s1tdJ8nqN1wOO1LWxc8S6YskYBazlls1EuIMIwY3lsjcO3Nt3FLt+F2IHLJqTMhm
 qCtWHyZDzpD9wXIWZ+qLqqZ3GNijCey+WSRC2npl5tO4U8SMi3A0O9VCA0BTiFqt
 piJkzbec4Ua+yw==
X-ME-Sender: <xms:4X6FWpxJ83FLGXbXUf0AAHrv2RKoQSjW5c34rfYKMTcrWMej6kfeYw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id A86A77E542;
 Thu, 15 Feb 2018 07:36:46 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 06/16] hwmon (p9_sbe): Rename context variable
Date: Thu, 15 Feb 2018 23:05:56 +1030
Message-Id: <20180215123606.25777-7-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:36:52 -0000

Using 'occ' as the context variable caused naming conflicts in some instances.
Instead use 'ctx' which should make it clear it's the associated drvdata and
make way for calling other object pointers 'occ'.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 54 +++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index a583c4b3b280..52473d020b24 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -40,42 +40,42 @@ struct p9_sbe_occ {
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
-static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
+static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
 {
 	struct occ_client *tmp_client;
 
-	spin_lock_irq(&occ->lock);
-	tmp_client = occ->client;
-	occ->client = NULL;
+	spin_lock_irq(&ctx->lock);
+	tmp_client = ctx->client;
+	ctx->client = NULL;
 	occ_drv_release(tmp_client);
-	spin_unlock_irq(&occ->lock);
+	spin_unlock_irq(&ctx->lock);
 }
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
 	int rc, error;
 	struct occ_response *resp = &occ->resp;
-	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	spin_lock_irq(&p9_sbe_occ->lock);
-	if (p9_sbe_occ->sbe)
-		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
-	spin_unlock_irq(&p9_sbe_occ->lock);
+	spin_lock_irq(&ctx->lock);
+	if (ctx->sbe)
+		ctx->client = occ_drv_open(ctx->sbe, 0);
+	spin_unlock_irq(&ctx->lock);
 
-	if (!p9_sbe_occ->client) {
+	if (!ctx->client) {
 		rc = -ENODEV;
 		goto assign;
 	}
 
-	rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
+	rc = occ_drv_write(ctx->client, (const char *)&cmd[1], 7);
 	if (rc < 0)
 		goto err;
 
-	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
+	rc = occ_drv_read(ctx->client, (char *)resp, sizeof(*resp));
 	if (rc < 0)
 		goto err;
 
-	p9_sbe_occ_close_client(p9_sbe_occ);
+	p9_sbe_occ_close_client(ctx);
 
 	switch (resp->return_status) {
 	case RESP_RETURN_CMD_IN_PRG:
@@ -103,7 +103,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	goto done;
 
 err:
-	p9_sbe_occ_close_client(p9_sbe_occ);
+	p9_sbe_occ_close_client(ctx);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
 assign:
 	error = rc;
@@ -112,10 +112,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	return rc;
 }
 
-static int p9_sbe_occ_setup(struct p9_sbe_occ *p9_sbe_occ)
+static int p9_sbe_occ_setup(struct p9_sbe_occ *ctx)
 {
 	int rc;
-	struct occ *occ = &p9_sbe_occ->occ;
+	struct occ *occ = &ctx->occ;
 
 	/* no need to lock */
 	rc = occ_poll(occ);
@@ -154,16 +154,16 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	int rc;
 	struct occ *occ;
-	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
-						     sizeof(*p9_sbe_occ),
+	struct p9_sbe_occ *ctx = devm_kzalloc(&pdev->dev,
+						     sizeof(*ctx),
 						     GFP_KERNEL);
-	if (!p9_sbe_occ)
+	if (!ctx)
 		return -ENOMEM;
 
-	p9_sbe_occ->sbe = pdev->dev.parent;
+	ctx->sbe = pdev->dev.parent;
 
-	occ = &p9_sbe_occ->occ;
-	spin_lock_init(&p9_sbe_occ->lock);
+	occ = &ctx->occ;
+	spin_lock_init(&ctx->lock);
 	occ->bus_dev = &pdev->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
@@ -172,7 +172,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, occ);
 
-	rc = p9_sbe_occ_setup(p9_sbe_occ);
+	rc = p9_sbe_occ_setup(ctx);
 	if (rc)
 		return rc;
 
@@ -182,10 +182,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
-	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	p9_sbe_occ->sbe = NULL;
-	p9_sbe_occ_close_client(p9_sbe_occ);
+	ctx->sbe = NULL;
+	p9_sbe_occ_close_client(ctx);
 	occ_remove_status_attrs(occ);
 
 	return 0;
-- 
2.14.1
