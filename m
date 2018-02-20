Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pHlU0w6m"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LdaxCgB2"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zln6c5WbBzDqJ0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:03:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 58C2D20DCB;
 Mon, 19 Feb 2018 23:03:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Ka29lnD8dFUf+pMvORwcuQRWLP9PFYBoiGIjsIoWX
 vU=; b=pHlU0w6mg4jme9ZUrH39EQQUhSc9ooM7I7B6tQdat2qwIagyrmdaqEzsd
 D7t3A+Hm0F8Mv6wMlnY8cro7a7l5v+X3WEqsh3/RLe03w8J/f1+l6jafwwOx5bK7
 YMP0T4rUp4piUa88C2ZxqpfS7gMVxfoaOIDLRqHoHS6MZoYIwwsa6SXb5wTwf218
 htXsj2xr8oiuebPYweBpXfKhwuhvEjzu5fbxBAlOADRqMTSvZwNhN3yl3yzdLOmN
 2263Ttf+om0YnIsqZcpjOtnbfX092Ra6MTAJXAXcPptOUG2iZMbn0mN08BC/8hzl
 ebiwwsZ022RFR8xygHpyoZynJPCrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ka29lnD8dFUf+pMvO
 RwcuQRWLP9PFYBoiGIjsIoWXvU=; b=LdaxCgB25Mc+QoMrz0LQez0UZHgqW9R4Q
 owQTCKsxzfS6n5uAeDCYWaEHnbvtMxOSx99DJ1f3raAU0q9z8PmCczKsqxDs5PD7
 pXHqRsDrpZllNuo1gibmkayvYUNFyeJp94DHU6eRKKzaCoej7uI+ghCiwahi6Oa+
 7HLPPGN7MX7hcGmQ12f6psMVKvhtghdvp9zjGqLvI5ogzyW9FhfVoyxiZcz230vt
 9Vpm2Bc3sCWwgyqEb6CUB+igkkghvZlnBok68FPV3wXuK8Df1N28pXK0b8mMBmg4
 1w9mA2RjskaY2k+/DwloxnD89VTtQPG6sMczTwPa2brzvDrTcZldg==
X-ME-Sender: <xms:JZ6LWsfG8fBFe0hwPX1Z4bW7k6JzuLpoPLZm4pHpPFJV5FiJxDFZJg>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99E5A244BD;
 Mon, 19 Feb 2018 23:03:47 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] clk: aspeed: Update to upstream to avoid
 schedule()ing from atomic context
Date: Tue, 20 Feb 2018 14:33:39 +1030
Message-Id: <20180220040339.11632-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Tue, 20 Feb 2018 04:03:54 -0000

The patch is generated against v4.16-rc2. Critically, it fixes a bug where
we schedule() from an atomic context:

[    1.570455] BUG: scheduling while atomic: swapper/1/0x00000003
[    1.576541] 4 locks held by swapper/1:
[    1.580326]  #0:  (&dev->mutex){......}, at: [<802b7ac0>] __driver_attach+0x64/0x10c
[    1.588177]  #1:  (&dev->mutex){......}, at: [<802b7ad0>] __driver_attach+0x74/0x10c
[    1.596002]  #2:  (enable_lock){......}, at: [<80286f68>] clk_enable_lock+0x28/0x130
[    1.603839]  #3:  (aspeed_clk_lock){......}, at: [<8028ff30>] aspeed_clk_enable+0x38/0xf4
[    1.612096] irq event stamp: 157268
[    1.615630] hardirqs last  enabled at (157267): [<804c10a0>] _raw_spin_unlock_irqrestore+0x40/0x6c
[    1.624621] hardirqs last disabled at (157268): [<80286f60>] clk_enable_lock+0x20/0x130
[    1.632670] softirqs last  enabled at (156064): [<80116160>] bdi_register_va+0xf4/0x240
[    1.640713] softirqs last disabled at (156062): [<80116144>] bdi_register_va+0xd8/0x240
[    1.648744] CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.16-00190-g78a200cb21ab #2393
[    1.656583] Hardware name: Generic DT based system
[    1.661438] [<8001141c>] (unwind_backtrace) from [<8000e87c>] (show_stack+0x20/0x24)
[    1.669235] [<8000e87c>] (show_stack) from [<804a65ec>] (dump_stack+0x20/0x28)
[    1.676527] [<804a65ec>] (dump_stack) from [<80047680>] (__schedule_bug+0x70/0xa4)
[    1.684150] [<80047680>] (__schedule_bug) from [<804bb8e0>] (__schedule+0x648/0x8a4)
[    1.691933] [<804bb8e0>] (__schedule) from [<804bbbec>] (schedule+0x5c/0xcc)
[    1.699025] [<804bbbec>] (schedule) from [<804bffec>] (schedule_timeout+0x220/0x498)
[    1.706819] [<804bffec>] (schedule_timeout) from [<80073af0>] (msleep+0x48/0x58)
[    1.714264] [<80073af0>] (msleep) from [<8028ffac>] (aspeed_clk_enable+0xb4/0xf4)
[    1.721796] [<8028ffac>] (aspeed_clk_enable) from [<80288654>] (clk_core_enable+0xac/0x248)
[    1.730189] [<80288654>] (clk_core_enable) from [<80288818>] (clk_core_enable_lock+0x28/0x3c)
[    1.738760] [<80288818>] (clk_core_enable_lock) from [<8028aab4>] (clk_enable+0x24/0x28)
[    1.746907] [<8028aab4>] (clk_enable) from [<802df144>] (aspeed_lpc_ctrl_probe+0x148/0x25c)
[    1.755315] [<802df144>] (aspeed_lpc_ctrl_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
[    1.764230] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
[    1.773135] [<802b78f0>] (driver_probe_device) from [<802b7b28>] (__driver_attach+0xcc/0x10c)
[    1.781699] [<802b7b28>] (__driver_attach) from [<802b58a4>] (bus_for_each_dev+0x5c/0xac)
[    1.789915] [<802b58a4>] (bus_for_each_dev) from [<802b7d04>] (driver_attach+0x28/0x30)
[    1.797958] [<802b7d04>] (driver_attach) from [<802b62dc>] (bus_add_driver+0x194/0x254)
[    1.806001] [<802b62dc>] (bus_add_driver) from [<802b8b54>] (driver_register+0x88/0x104)
[    1.814133] [<802b8b54>] (driver_register) from [<802ba42c>] (__platform_driver_register+0x3c/0x50)
[    1.823234] [<802ba42c>] (__platform_driver_register) from [<8068a814>] (aspeed_lpc_ctrl_driver_init+0x20/0x28)
[    1.833381] [<8068a814>] (aspeed_lpc_ctrl_driver_init) from [<80669f1c>] (do_one_initcall+0xb0/0x170)
[    1.842651] [<80669f1c>] (do_one_initcall) from [<8066a0f4>] (kernel_init_freeable+0x118/0x1d0)
[    1.851406] [<8066a0f4>] (kernel_init_freeable) from [<804b9b94>] (kernel_init+0x18/0x104)
[    1.859717] [<804b9b94>] (kernel_init) from [<8000a868>] (ret_from_fork+0x14/0x2c)

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/clk/clk-aspeed.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 4a0d2649d907..9f7f931d6b2f 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -1,13 +1,4 @@
-/*
- * Copyright 2017 IBM Corporation
- *
- * Joel Stanley <joel@jms.id.au>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
 
 #define pr_fmt(fmt) "clk-aspeed: " fmt
 
@@ -220,6 +211,7 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	unsigned long flags;
 	u32 clk = BIT(gate->clock_idx);
 	u32 rst = BIT(gate->reset_idx);
+	u32 enval;
 
 	spin_lock_irqsave(gate->lock, flags);
 
@@ -232,12 +224,12 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	}
 
 	/* Enable clock */
-	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
+	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
+	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
 	if (gate->reset_idx >= 0) {
-		/* Delay 10ms */
-		/* TODO: can we sleep here? */
-		msleep(10);
+		/* A delay of 10ms is specified by the ASPEED docs */
+		mdelay(10);
 
 		/* Take IP out of reset */
 		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
@@ -253,10 +245,12 @@ static void aspeed_clk_disable(struct clk_hw *hw)
 	struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
 	unsigned long flags;
 	u32 clk = BIT(gate->clock_idx);
+	u32 enval;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, clk);
+	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? clk : 0;
+	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
 	spin_unlock_irqrestore(gate->lock, flags);
 }
@@ -488,7 +482,12 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
 		const struct aspeed_gate_data *gd = &aspeed_gates[i];
+		u32 gate_flags;
 
+		/* Special case: the USB port 1 clock (bit 14) is always
+		 * working the opposite way from the other ones.
+		 */
+		gate_flags = (gd->clock_idx == 14) ? 0 : CLK_GATE_SET_TO_DISABLE;
 		hw = aspeed_clk_hw_register_gate(dev,
 				gd->name,
 				gd->parent_name,
@@ -496,7 +495,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 				map,
 				gd->clock_idx,
 				gd->reset_idx,
-				CLK_GATE_SET_TO_DISABLE,
+				gate_flags,
 				&aspeed_clk_lock);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
@@ -619,7 +618,7 @@ static void __init aspeed_cc_init(struct device_node *np)
 	int i;
 
 	scu_base = of_iomap(np, 0);
-	if (IS_ERR(scu_base))
+	if (!scu_base)
 		return;
 
 	aspeed_clk_data = kzalloc(sizeof(*aspeed_clk_data) +
-- 
2.14.1
