Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tGJB2YJ9zF3T7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 01:20:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wABDHQsM031815;
 Sun, 11 Nov 2018 15:17:26 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id B341C630C7; Sun, 11 Nov 2018 15:47:24 +0200 (IST)
From: tali.perry1@gmail.com
To: brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 raltherr@google.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 1/1] clk: npcm7xx: get fixed clocks from DT
Date: Sun, 11 Nov 2018 15:47:12 +0200
Message-Id: <20181111134712.318321-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181111134712.318321-1-tali.perry1@gmail.com>
References: <20181111134712.318321-1-tali.perry1@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Nov 2018 14:20:27 -0000

From: Tali Perry <tali.perry1@gmail.com>

Nuvoton NPCM7XX Clock Controller
fix base address and of_clk_get_by_name error handling.
    Also update error messages to be more informative.
    
    In case clk_base allocation is erronoeous the return value is null.
    Also fix handling of of_clk_get_by_name returns an error. 
    Print a better error message pointing to the dt-binding documention.

This patch is re-submitted since it was already pushed to main 
(just the diff, without the full driver which is already in 
master branch.)


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

---
 drivers/clk/clk-npcm7xx.c | 99 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 740af90a9508..91a937720f4e 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -7,17 +7,26 @@
  * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
  */
 
-#include <linux/module.h>
-#include <linux/clk-provider.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
-#include <linux/err.h>
-#include <linux/bitfield.h>
-
-#include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+
+
+
+ #include <linux/module.h>
+ #include <linux/clk.h>
+ #include <linux/clk-provider.h>
+ #include <linux/device.h>
+ #include <linux/io.h>
+ #include <linux/kernel.h>
+ #include <linux/of.h>
+ #include <linux/of_device.h>
+ #include <linux/of_platform.h>
+ #include <linux/of_address.h>
+ #include <linux/platform_device.h>
+ #include <linux/slab.h>
+ #include <linux/err.h>
+ #include <linux/rational.h>
+ #include <linux/bitfield.h>
+ #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+
 
 struct npcm7xx_clk_pll {
 	struct clk_hw	hw;
@@ -27,6 +36,9 @@ struct npcm7xx_clk_pll {
 
 #define to_npcm7xx_clk_pll(_hw) container_of(_hw, struct npcm7xx_clk_pll, hw)
 
+static struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon,
+	const char *name, const char *parent_name, unsigned long flags);
+
 #define PLLCON_LOKI	BIT(31)
 #define PLLCON_LOKS	BIT(30)
 #define PLLCON_FBDV	GENMASK(27, 16)
@@ -44,7 +56,8 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
 	u64 ret;
 
 	if (parent_rate == 0) {
-		pr_err("%s: parent rate is zero", __func__);
+		pr_err("%s: parent rate is zero. reg=%x\n", __func__,
+			(u32)(pll->pllcon));
 		return 0;
 	}
 
@@ -61,13 +74,12 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
 	return ret;
 }
 
-static const struct clk_ops npcm7xx_clk_pll_ops = {
+const struct clk_ops npcm7xx_clk_pll_ops = {
 	.recalc_rate = npcm7xx_clk_pll_recalc_rate,
 };
 
-static struct clk_hw *
-npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,
-			 const char *parent_name, unsigned long flags)
+static struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon,
+		const char *name, const char *parent_name, unsigned long flags)
 {
 	struct npcm7xx_clk_pll *pll;
 	struct clk_init_data init;
@@ -78,7 +90,8 @@ npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
 
-	pr_debug("%s reg, name=%s, p=%s\n", __func__, name, parent_name);
+	pr_debug("%s reg, reg=0x%x, name=%s, p=%s\n",
+		__func__, (unsigned int)pllcon, name, parent_name);
 
 	init.name = name;
 	init.ops = &npcm7xx_clk_pll_ops;
@@ -544,9 +557,11 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	void __iomem *clk_base;
 	struct resource res;
 	struct clk_hw *hw;
+	struct clk *clk;
 	int ret;
 	int i;
 
+	clk_base = NULL;
 	ret = of_address_to_resource(clk_np, 0, &res);
 	if (ret) {
 		pr_err("%s: failed to get resource, ret %d\n", clk_np->name,
@@ -560,14 +575,44 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
 		NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);
-	if (!npcm7xx_clk_data)
+
+	npcm7xx_clk_data->num = 0;
+
+	if (!npcm7xx_clk_data->hws) {
+		pr_err("Can't alloc npcm7xx_clk_data\n");
 		goto npcm7xx_init_np_err;
+	}
 
 	npcm7xx_clk_data->num = NPCM7XX_NUM_CLOCKS;
 
 	for (i = 0; i < NPCM7XX_NUM_CLOCKS; i++)
 		npcm7xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
 
+	/* Read fixed clocks. These 3 clocks must be defined in DT */
+	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_REFCLK);
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external REFCLK on device tree, err=%ld\n",
+			PTR_ERR(clk));
+		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
+	}
+
+	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_SYSBYPCK);
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external SYSBYPCK on device tree, err=%ld\n",
+			PTR_ERR(clk));
+		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
+	}
+
+	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_MCBYPCK);
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external MCBYPCK on device tree, err=%ld\n",
+			PTR_ERR(clk));
+		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
+	}
+
 	/* Register plls */
 	for (i = 0; i < ARRAY_SIZE(npcm7xx_plls); i++) {
 		const struct npcm7xx_clk_pll_data *pll_data = &npcm7xx_plls[i];
@@ -584,16 +629,16 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	}
 
 	/* Register fixed dividers */
-	hw = clk_hw_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
+	clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
 			NPCM7XX_CLK_S_PLL1, 0, 1, 2);
-	if (IS_ERR(hw)) {
+	if (IS_ERR(clk)) {
 		pr_err("npcm7xx_clk: Can't register fixed div\n");
 		goto npcm7xx_init_fail;
 	}
 
-	hw = clk_hw_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
+	clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
 			NPCM7XX_CLK_S_PLL2, 0, 1, 2);
-	if (IS_ERR(hw)) {
+	if (IS_ERR(clk)) {
 		pr_err("npcm7xx_clk: Can't register div2\n");
 		goto npcm7xx_init_fail;
 	}
@@ -646,11 +691,17 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	return;
 
+npcm7xx_init_fail_no_clk_on_dt:
+	pr_err("see Documentation/devicetree/bindings/clock/");
+	pr_err("nuvoton,npcm750-clk.txt  for details\n");
 npcm7xx_init_fail:
-	kfree(npcm7xx_clk_data->hws);
+	if (npcm7xx_clk_data->num)
+		kfree(npcm7xx_clk_data->hws);
 npcm7xx_init_np_err:
-	iounmap(clk_base);
+	if (clk_base != NULL)
+		iounmap(clk_base);
 npcm7xx_init_error:
 	of_node_put(clk_np);
+	pr_err("clk setup fail\n");
 }
 CLK_OF_DECLARE(npcm7xx_clk_init, "nuvoton,npcm750-clk", npcm7xx_clk_init);
-- 
2.14.1
