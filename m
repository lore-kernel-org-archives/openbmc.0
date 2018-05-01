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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZvMg2LTtzF2R0
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 18:14:38 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w417OWD0001072;
 Tue, 1 May 2018 10:24:32 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 20088)
 id 8BBA85AAB0; Tue,  1 May 2018 10:24:32 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: sboyd@kernel.org, brendanhiggins@google.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux@armlinux.org.uk, weiyongjunl@huawei.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v1 1/1] clk: npcm750: fix base address and of_clk_get_by_name
 error handling. Also update error messages to be more informative
Date: Tue,  1 May 2018 10:23:27 +0300
Message-Id: <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
References: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
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
X-List-Received-Date: Tue, 01 May 2018 08:14:40 -0000


Nuvoton NPCM7XX Clock Controller
fix base address and of_clk_get_by_name error handling.
    Also update error messages to be more informative.
    
    In case clk_base allocation is erronoeous the return value is null.
    Also fix handling of of_clk_get_by_name returns an error. 
    Print a better error message pointing to the dt-binding documention.


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Tali Perry (2):
 
---
 drivers/clk/clk-npcm7xx.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 7e4964b9e5c8..6ff97f79fcd7 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -583,7 +583,7 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 
 	clk_base = ioremap(res.start, resource_size(&res));
-	if (IS_ERR(clk_base))
+	if (!clk_base)
 		goto npcm7xx_init_error;
 
 
@@ -604,24 +604,27 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	/* Read fixed clocks. These 3 clocks must be defined in DT */
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_REFCLK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external REFCLK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external REFCLK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_SYSBYPCK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external SYSBYPCK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external SYSBYPCK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_MCBYPCK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external MCBYPCK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external MCBYPCK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	/* Register plls */
@@ -705,6 +708,9 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	return;
 
+npcm7xx_init_fail_no_clk_on_dt:
+	pr_err("see Documentation/devicetree/bindings/clock/"
+					"nuvoton,npcm750-clk.txt  for details\n");
 npcm7xx_init_fail:
 	if (npcm7xx_clk_data->num)
 		kfree(npcm7xx_clk_data->hws);
-- 
2.14.1
