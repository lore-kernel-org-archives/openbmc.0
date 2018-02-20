Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jO+Yyh6c"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MBwJjSs8"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnT25L1qzDrb2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A68DE20D7B;
 Mon, 19 Feb 2018 23:19:48 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Qfnx2pllMK1penOUN
 cl/PM3RKhOmkCKn++6GMoDNv64=; b=jO+Yyh6ck9YYD0q4gX3LL6U07uUC2rQD4
 7V7e0TQzpl4yUqm7es3Gko4FINPRmC/qcZRB6uS9ef8LCDuktGMX6PfBQR++OYN+
 2Iq0AiCKDr1igf+L4XfyhYdZZqINEbPKdDv4xElaaGft4eBK67+k2Lc65BFZClB1
 g159v6qhGfiY6TfH/NYWOON8XLSKchbYVTK6uLTUv984J6w/004/fPGgF6CTFgT5
 Z62KwYHlfljYCNHDkmu4c4i6SezjzpPEfGNIU1C29uzSy26V4sJw7dkNKZVzD8W4
 ie9zeqLILU0otOu8DKXRXu+SbbKXpH45O/ZeP0szAAz863h+UxH9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Qfnx2pllMK1penOUNcl/PM3RKhOmkCKn++6GMoDNv64=; b=MBwJjSs8
 dx3E3pVoCf8FzepuTyhvmCTGxheu5Z7H29bAc5P7xItbLOonZPDQENskmb1cNx8q
 iHb7tosOHx/bMdFVeTqU1AyTlo79HfMmEzSwrxpY/6NiWZ/KAtt+WhewZXDuFbZ2
 3M56duF5MHYVzZspfZM+aK2SLDlvDaO2EjC0tX5y7MsA1bZbV1H+qY+FYCPuxMec
 GgTQdern++2ipm5gLiY9DB1LyeW+n5RWSgpV0y23WsnJXPoi1gVVZG/XDABwXbZD
 EjiZNFIVvxGk9Cpyy98Y/uy6VYqlDvl53OBnjD7u7q8ZYyUsmrKcimPilW07Wv4Q
 1ztsx4ZX1sMalQ==
X-ME-Sender: <xms:5KGLWnyuaQr-VzgMwv6sYkSaqj6tPn0qypiHroW5qxkxhZJ5w4BndQ>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 039417E0DA;
 Mon, 19 Feb 2018 23:19:45 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 10/16] hwmon (p9_sbe): Convert client_lock from
 a spinlock to a mutex
Date: Tue, 20 Feb 2018 14:48:38 +1030
Message-Id: <20180220041844.13228-11-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:51 -0000
X-List-Received-Date: Tue, 20 Feb 2018 04:19:51 -0000

The hwmon occ implementation allocates GFP_KERNEL memory in occ_open_common(),
therefore we cannot call it under a spinlock as it may sleep. Compiling with
lock debugging enabled gives us the following warning:

[    4.420000] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:2879 lockdep_trace_alloc+0xf0/0x124
[    4.420000] DEBUG_LOCKS_WARN_ON(irqs_disabled_flags(flags))
[    4.420000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.17-00526-g1cbacc6bd3a1 #2334
[    4.420000] Hardware name: ASpeed SoC
[    4.420000] [<80010eec>] (unwind_backtrace) from [<8000e664>] (show_stack+0x20/0x24)
[    4.420000] [<8000e664>] (show_stack) from [<80249160>] (dump_stack+0x20/0x28)
[    4.420000] [<80249160>] (dump_stack) from [<8001d3a0>] (__warn+0xe0/0x108)
[    4.420000] [<8001d3a0>] (__warn) from [<8001d40c>] (warn_slowpath_fmt+0x44/0x4c)
[    4.420000] [<8001d40c>] (warn_slowpath_fmt) from [<8005d2cc>] (lockdep_trace_alloc+0xf0/0x124)
[    4.420000] [<8005d2cc>] (lockdep_trace_alloc) from [<8012bb1c>] (kmem_cache_alloc_trace+0x3c/0x284)
[    4.420000] [<8012bb1c>] (kmem_cache_alloc_trace) from [<8034fa2c>] (occ_open_common+0x30/0xac)
[    4.420000] [<8034fa2c>] (occ_open_common) from [<80350bac>] (occ_drv_open+0x24/0x28)
[    4.420000] [<80350bac>] (occ_drv_open) from [<803638fc>] (p9_sbe_occ_send_cmd+0x44/0x13c)
[    4.420000] [<803638fc>] (p9_sbe_occ_send_cmd) from [<803615b8>] (occ_poll+0x6c/0x1c0)
[    4.420000] [<803615b8>] (occ_poll) from [<80363a84>] (p9_sbe_occ_probe+0x90/0x178)
[    4.420000] [<80363a84>] (p9_sbe_occ_probe) from [<802b9850>] (platform_drv_probe+0x60/0xbc)
[    4.420000] [<802b9850>] (platform_drv_probe) from [<802b76b0>] (driver_probe_device+0x114/0x430)
[    4.420000] [<802b76b0>] (driver_probe_device) from [<802b7a98>] (__driver_attach+0xcc/0x10c)
[    4.420000] [<802b7a98>] (__driver_attach) from [<802b5770>] (bus_for_each_dev+0x5c/0xac)
[    4.420000] [<802b5770>] (bus_for_each_dev) from [<802b7c74>] (driver_attach+0x28/0x30)
[    4.420000] [<802b7c74>] (driver_attach) from [<802b6268>] (bus_add_driver+0x19c/0x25c)
[    4.420000] [<802b6268>] (bus_add_driver) from [<802b8abc>] (driver_register+0x88/0x104)
[    4.420000] [<802b8abc>] (driver_register) from [<802ba468>] (__platform_driver_register+0x3c/0x50)
[    4.420000] [<802ba468>] (__platform_driver_register) from [<8066d804>] (p9_sbe_occ_driver_init+0x18/0x20)
[    4.420000] [<8066d804>] (p9_sbe_occ_driver_init) from [<8064ae7c>] (do_one_initcall+0xa8/0x168)
[    4.420000] [<8064ae7c>] (do_one_initcall) from [<8064b04c>] (kernel_init_freeable+0x110/0x1c8)
[    4.420000] [<8064b04c>] (kernel_init_freeable) from [<804a9034>] (kernel_init+0x18/0x104)
[    4.420000] [<804a9034>] (kernel_init) from [<8000a888>] (ret_from_fork+0x14/0x2c)

Avoid the warning (or the need for GFP_ATOMIC) and allow for reduced system
latency by using a mutex instead. Mutual exclusion is the only requirement, we
do not need to block pre-emption.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 51bdfa89f1a6..38cf57ad1bb8 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -34,34 +34,32 @@ struct p9_sbe_occ {
 	 * open, close and NULL assignment. This prevents simultaneous opening
 	 * and closing of the client, or closing multiple times.
 	 */
-	spinlock_t client_lock;
+	struct mutex client_lock;
 };
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
 static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
 {
-	unsigned long flags;
 	struct occ_client *tmp_client;
 
-	spin_lock_irqsave(&ctx->client_lock, flags);
+	mutex_lock(&ctx->client_lock);
 	tmp_client = ctx->client;
 	ctx->client = NULL;
 	occ_drv_release(tmp_client);
-	spin_unlock_irqrestore(&ctx->client_lock, flags);
+	mutex_unlock(&ctx->client_lock);
 }
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
 	int rc;
-	unsigned long flags;
 	struct occ_response *resp = &occ->resp;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 
-	spin_lock_irqsave(&ctx->client_lock, flags);
+	mutex_lock(&ctx->client_lock);
 	if (ctx->sbe)
 		ctx->client = occ_drv_open(ctx->sbe, 0);
-	spin_unlock_irqrestore(&ctx->client_lock, flags);
+	mutex_unlock(&ctx->client_lock);
 
 	if (!ctx->client)
 		return -ENODEV;
@@ -115,7 +113,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	spin_lock_init(&ctx->lock);
+	mutex_init(&ctx->client_lock);
 	ctx->sbe = pdev->dev.parent;
 	occ = &ctx->occ;
 	occ->bus_dev = &pdev->dev;
-- 
2.14.1
