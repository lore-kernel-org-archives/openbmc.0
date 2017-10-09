Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.36.253; helo=6.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo4.mail-out.ovh.net (6.mo4.mail-out.ovh.net [188.165.36.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9j6K62pJzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 01:19:04 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4983AD9D94
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 15:42:22 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 2BFA050006C;
 Mon,  9 Oct 2017 15:42:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [linux dev-4.13 5/6] mtd: spi-nor: aspeed: link controller with the
 ahb clock
Date: Mon,  9 Oct 2017 15:41:07 +0200
Message-Id: <20171009134108.15860-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171009134108.15860-1-clg@kaod.org>
References: <20171009134108.15860-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8988621910180793090
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleelgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 14:19:06 -0000

We will need the AHB frequency to set the HCLK settings in the SMC
controller to optimize the reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ac27a5109f6d..ae429154992d 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -113,6 +114,8 @@ struct aspeed_smc_controller {
 	void __iomem *ahb_base;			/* per-chip windows resource */
 	u32 ahb_window_size;			/* full mapping window size */
 
+	unsigned long	clk_frequency;
+
 	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
 };
 
@@ -911,6 +914,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	struct aspeed_smc_controller *controller;
 	const struct of_device_id *match;
 	const struct aspeed_smc_info *info;
+	struct clk *clk;
 	struct resource *res;
 	int ret;
 
@@ -941,6 +945,12 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 
 	controller->ahb_window_size = resource_size(res);
 
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	controller->clk_frequency = clk_get_rate(clk);
+	devm_clk_put(&pdev->dev, clk);
+
 	ret = aspeed_smc_setup_flash(controller, np, res);
 	if (ret)
 		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
-- 
2.13.6
