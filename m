Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NNAe429s"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EKNxFLFl"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnT56TVRzF0g7
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D490C20DC0;
 Mon, 19 Feb 2018 23:19:51 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Z9JsxsXGOMr0FnFH5
 QPqA0ao2QP9fI8m6PziySwLo0k=; b=NNAe429siFuyhd5kl0wONfgTMtBQP4owJ
 p8gdlbW3vwM3+3ldlQYF1ZvZNieygpFdajvD0uFLDODsykBOFDBbaulBzaXvZXBs
 jzZsrymJd15NRyjb+6emr1lPuLDRNDw8P6hMuvVXEgp1YbEEdUb41DhEqOG9eLZn
 V6qtuuyz9uhhpEFwbdnMrOk+TNC5EMnHyr4Oij30aPnQxXZmXlTyUeV+fFuuTFWM
 fwvU8ss6fwcBx+hnvVXO8k4RfzQM7uIslvxGWqGH7dTllx6flN8fNju6H5AJc8Nc
 +AM+8xf60FGhgY79dDQPQW8U6iXPjOAM/FlWBlXJwjoku9/SyiiNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z9JsxsXGOMr0FnFH5QPqA0ao2QP9fI8m6PziySwLo0k=; b=EKNxFLFl
 ppMljAAwReddfF7pFVQQZTl48yfGOf+lwPFugFpgc37dd0345osFkZbx5+iDHK5I
 MXo8b8xCNXI4QiJsmC9xzmgoYS6BkV5oPv85jB1xMX7Cwr7Y2ehzevFpsNQPAxBt
 oZmeJ+l99OQizxHS1S1Wdd3pHdOyx5B0RVLMBB72HZb773oifvNkCT3UesF6nOgr
 niRy1ahsRB+qRIFLmsPuo4UJpInL3+Zg1W0F6pqw/Vv5l962QWoHbaZ0vu7UqARo
 k0EZP6PnOWUXNzN8rG4FHaMGEe7hFtLU25FXF70L6xOqmJgrn28D+6KVxVliSgq9
 tyNQl0LcFT1V3Q==
X-ME-Sender: <xms:56GLWt15yEglNlQrNbDPk1H9lUdIUQo8w5Bsw8FtPiCFiEKcPphyZQ>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14AA07E1D0;
 Mon, 19 Feb 2018 23:19:48 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 11/16] hwmon (p9_sbe): Add static key to
 satisfy lockdep
Date: Tue, 20 Feb 2018 14:48:39 +1030
Message-Id: <20180220041844.13228-12-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:54 -0000

Previously we received the following warning:

[    7.221161] INFO: trying to register non-static key.
[    7.226163] the code is fine but needs lockdep annotation.
[    7.231650] turning off the locking correctness validator.
[    7.237152] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.13.16-00190-g78a200cb21ab #2393
[    7.246194] Hardware name: Generic DT based system
[    7.251040] [<8001141c>] (unwind_backtrace) from [<8000e87c>] (show_stack+0x20/0x24)
[    7.258827] [<8000e87c>] (show_stack) from [<804a65ec>] (dump_stack+0x20/0x28)
[    7.266098] [<804a65ec>] (dump_stack) from [<80054b08>] (register_lock_class+0x270/0x614)
[    7.274308] [<80054b08>] (register_lock_class) from [<800589f0>] (__lock_acquire+0x7c/0x17f4)
[    7.282857] [<800589f0>] (__lock_acquire) from [<8005ac18>] (lock_acquire+0xd8/0x204)
[    7.290719] [<8005ac18>] (lock_acquire) from [<804c0dcc>] (_raw_spin_lock_irqsave+0x60/0x74)
[    7.299200] [<804c0dcc>] (_raw_spin_lock_irqsave) from [<8035ecc0>] (p9_sbe_occ_send_cmd+0x30/0x100)
[    7.308363] [<8035ecc0>] (p9_sbe_occ_send_cmd) from [<8035c9ac>] (occ_poll+0x60/0x210)
[    7.316309] [<8035c9ac>] (occ_poll) from [<8035d9c8>] (occ_setup+0x50/0x1260)
[    7.323475] [<8035d9c8>] (occ_setup) from [<8035edf0>] (p9_sbe_occ_probe+0x60/0x7c)
[    7.331167] [<8035edf0>] (p9_sbe_occ_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
[    7.339629] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
[    7.348516] [<802b78f0>] (driver_probe_device) from [<802b7c0c>] (__device_attach_driver+0xa4/0x10c)
[    7.357668] [<802b7c0c>] (__device_attach_driver) from [<802b5de0>] (bus_for_each_drv+0x54/0xa4)
[    7.366477] [<802b5de0>] (bus_for_each_drv) from [<802b7454>] (__device_attach+0xc0/0x148)
[    7.374758] [<802b7454>] (__device_attach) from [<802b7cd8>] (device_initial_probe+0x1c/0x20)
[    7.383301] [<802b7cd8>] (device_initial_probe) from [<802b5ff8>] (bus_probe_device+0x98/0xa0)
[    7.391943] [<802b5ff8>] (bus_probe_device) from [<802b426c>] (device_add+0x398/0x5c4)
[    7.399895] [<802b426c>] (device_add) from [<8037ab10>] (of_device_add+0x40/0x48)
[    7.407405] [<8037ab10>] (of_device_add) from [<8037b618>] (of_platform_device_create_pdata+0x88/0xc8)
[    7.416735] [<8037b618>] (of_platform_device_create_pdata) from [<8037b94c>] (of_platform_device_create+0x20/0x24)
[    7.427109] [<8037b94c>] (of_platform_device_create) from [<80394894>] (occ_probe+0x19c/0x238)
[    7.435746] [<80394894>] (occ_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
[    7.443604] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
[    7.452497] [<802b78f0>] (driver_probe_device) from [<802b7b28>] (__driver_attach+0xcc/0x10c)
[    7.461044] [<802b7b28>] (__driver_attach) from [<802b58a4>] (bus_for_each_dev+0x5c/0xac)
[    7.469240] [<802b58a4>] (bus_for_each_dev) from [<802b7d04>] (driver_attach+0x28/0x30)
[    7.477258] [<802b7d04>] (driver_attach) from [<802b62dc>] (bus_add_driver+0x194/0x254)
[    7.485284] [<802b62dc>] (bus_add_driver) from [<802b8b54>] (driver_register+0x88/0x104)
[    7.493398] [<802b8b54>] (driver_register) from [<802ba42c>] (__platform_driver_register+0x3c/0x50)
[    7.502469] [<802ba42c>] (__platform_driver_register) from [<803943f0>] (occ_init+0x58/0x80)
[    7.510945] [<803943f0>] (occ_init) from [<80669f1c>] (do_one_initcall+0xb0/0x170)
[    7.518545] [<80669f1c>] (do_one_initcall) from [<8066a0f4>] (kernel_init_freeable+0x118/0x1d0)
[    7.527280] [<8066a0f4>] (kernel_init_freeable) from [<804b9b94>] (kernel_init+0x18/0x104)
[    7.535579] [<804b9b94>] (kernel_init) from [<8000a868>] (ret_from_fork+0x14/0x2c)

Provide a static key to lockdep to help with this dynamically allocated mutex.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/p9_sbe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 38cf57ad1bb8..b84cb1733fdf 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -16,6 +16,9 @@
 
 #include "common.h"
 
+/* Satisfy lockdep's need for static keys */
+static struct lock_class_key p9_sbe_occ_client_lock_key;
+
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
@@ -114,6 +117,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mutex_init(&ctx->client_lock);
+	lockdep_set_class(&ctx->client_lock, &p9_sbe_occ_client_lock_key);
 	ctx->sbe = pdev->dev.parent;
 	occ = &ctx->occ;
 	occ->bus_dev = &pdev->dev;
-- 
2.14.1
