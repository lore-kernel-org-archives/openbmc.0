Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kHodtB04"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kTaG7aVv"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSw3WmHzF0ZV
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:44 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8489D20BF9;
 Mon, 19 Feb 2018 23:19:42 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P6wOBXHHLsVwZTI9g
 5DQ+Q+UxEwJ0yNCissvrpn4cF0=; b=kHodtB04wpesezAwXIOfTflTVWLWbXwNg
 U+DSdFTGyXLJUHjJ9vMvk+9k01ZeVTb+z1HoyByyiTPrtoLnep2pifh7MoB15tJi
 aDG+EpyTyINGtn/4CmuRtUvbtsAvrD07do0VNGB0tUbOFAVT/ChTS8vPkWujkMjw
 dZ0lcMsXOOygad8LixVL+gcCsq636cw/vRYqokSsZG2r+ylHxmqFoHIN5HRlp/00
 OOMkr61eMdqI01bmAlQMjK/PiuCZq3LHW2jWQ/UxT3EKKlczKwFr0tpAW+XspZ+7
 Us/cHQY9fwVMsQ08Xa+lq5Xig9FzrfioNwBa62I1dUD3LbPLmSM4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=P6wOBXHHLsVwZTI9g5DQ+Q+UxEwJ0yNCissvrpn4cF0=; b=kTaG7aVv
 URvXBLD5mycHwavaAVIKqZYefs4uMbPO7+oJMKW6RbAQxOxgpiSU+/50ohwPGLk5
 JG+hhf2H6LJtrwkjX4MoIv3SlaV6o67mF0nUbtiB4m5eHMPuIMq90WZjxBTJSE/m
 LQoY1/59a/GnhEZPMFLiBYJbgnlavUEppCVH3pSGM+dRHHw4/jJZ1Q7iIeexGqpS
 EqpEkeqEHm5APS+VB61y0mlzO7t/mc2i8cgT987gvr6eMeJR7X2BNO/cR5YjNX9X
 o1gd6PNRKuee1SJNmGcK1yBlXKqX2o61VXKBUruXxYIf2Lv34zMIpfZIexRlkdHX
 djNVtLZJSUmcrg==
X-ME-Sender: <xms:3qGLWhMS7x3d4z6bwAhtAEFirxTY5BJHu7m3BwK__12pgGfkHrgl-Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id A96437E140;
 Mon, 19 Feb 2018 23:19:39 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 08/16] hwmon (p9_sbe): Rename context variable
Date: Tue, 20 Feb 2018 14:48:36 +1030
Message-Id: <20180220041844.13228-9-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:45 -0000

Using 'occ' as the context variable caused naming conflicts in some instances.
Instead use 'ctx' which should make it clear it's the associated drvdata and
make way for calling other object pointers 'occ'.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 47 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index cda29f47f8ff..9b8f2f650895 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -39,16 +39,16 @@ struct p9_sbe_occ {
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
-static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
+static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
 {
 	unsigned long flags;
 	struct occ_client *tmp_client;
 
-	spin_lock_irqsave(&occ->lock, flags);
-	tmp_client = occ->client;
-	occ->client = NULL;
+	spin_lock_irqsave(&ctx->lock, flags);
+	tmp_client = ctx->client;
+	ctx->client = NULL;
 	occ_drv_release(tmp_client);
-	spin_unlock_irqrestore(&occ->lock, flags);
+	spin_unlock_irqrestore(&ctx->lock, flags);
 }
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
@@ -56,26 +56,25 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	int rc;
 	unsigned long flags;
 	struct occ_response *resp = &occ->resp;
-	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	spin_lock_irqsave(&p9_sbe_occ->lock, flags);
-	if (p9_sbe_occ->sbe)
-		p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
-	spin_unlock_irqrestore(&p9_sbe_occ->lock, flags);
+	spin_lock_irqsave(&ctx->lock, flags);
+	if (ctx->sbe)
+		ctx->client = occ_drv_open(ctx->sbe, 0);
+	spin_unlock_irqrestore(&ctx->lock, flags);
 
-	if (!p9_sbe_occ->client)
+	if (!ctx->client)
 		return -ENODEV;
 
 	/* skip first byte (sequence number), OCC driver handles it */
-	rc = occ_drv_write(p9_sbe_occ->client, (const char *)&cmd[1], 7);
+	rc = occ_drv_write(ctx->client, (const char *)&cmd[1], 7);
 	if (rc < 0)
 		goto err;
 
-	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp, sizeof(*resp));
+	rc = occ_drv_read(ctx->client, (char *)resp, sizeof(*resp));
 	if (rc < 0)
 		goto err;
 
-	/* check the OCC response */
 	switch (resp->return_status) {
 	case OCC_RESP_CMD_IN_PRG:
 		rc = -ETIMEDOUT;
@@ -103,22 +102,22 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	}
 
 err:
-	p9_sbe_occ_close_client(p9_sbe_occ);
+	p9_sbe_occ_close_client(ctx);
 	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	struct occ *occ;
-	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
-						     sizeof(*p9_sbe_occ),
+	struct p9_sbe_occ *ctx = devm_kzalloc(&pdev->dev,
+						     sizeof(*ctx),
 						     GFP_KERNEL);
-	if (!p9_sbe_occ)
+	if (!ctx)
 		return -ENOMEM;
 
-	spin_lock_init(&p9_sbe_occ->lock);
-	p9_sbe_occ->sbe = pdev->dev.parent;
-	occ = &p9_sbe_occ->occ;
+	spin_lock_init(&ctx->lock);
+	ctx->sbe = pdev->dev.parent;
+	occ = &ctx->occ;
 	occ->bus_dev = &pdev->dev;
 	platform_set_drvdata(pdev, occ);
 
@@ -131,10 +130,10 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
-	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	p9_sbe_occ->sbe = NULL;
-	p9_sbe_occ_close_client(p9_sbe_occ);
+	ctx->sbe = NULL;
+	p9_sbe_occ_close_client(ctx);
 
 	occ_shutdown(occ);
 
-- 
2.14.1
