Return-Path: <clg@kaod.org>
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swS370B1XzDt3T
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:44:18 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2573214B9F
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:39:09 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id E0EE02A0068;
 Fri, 14 Oct 2016 14:39:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 11/12] mtd: spi-nor: aspeed: use property
 "aspeed, fmc-has-dma"
Date: Fri, 14 Oct 2016 14:38:03 +0200
Message-Id: <1476448684-6149-12-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15126746723783969538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeigdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2016 12:44:19 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 104d14422560..ae2d9bc643c3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -156,7 +156,6 @@ struct aspeed_smc_info {
 	u32 maxsize;		/* maximum size of 1 chip window */
 	u8 nce;			/* number of chip enables */
 	u8 maxwidth;		/* max width of spi bus */
-	bool hasdma;		/* has dma engine */
 	bool hastype;		/* flash type field exists in cfg reg */
 	u8 we0;			/* shift for write enable bit for ce 0 */
 	u8 ctl0;		/* offset in regs of ctl for ce 0 */
@@ -168,7 +167,6 @@ static struct aspeed_smc_info fmc_2400_info = {
 	.maxsize = 64 * 1024 * 1024,
 	.nce = 5,
 	.maxwidth = 4,
-	.hasdma = true,
 	.hastype = true,
 	.we0 = 16,
 	.ctl0 = 0x10,
@@ -180,7 +178,6 @@ static struct aspeed_smc_info smc_2400_info = {
 	.maxsize = 64 * 1024 * 1024,
 	.nce = 1,
 	.maxwidth = 2,
-	.hasdma = false,
 	.hastype = false,
 	.we0 = 0,
 	.ctl0 = 0x04,
@@ -192,7 +189,6 @@ static struct aspeed_smc_info fmc_2500_info = {
 	.maxsize = 256 * 1024 * 1024,
 	.nce = 3,
 	.maxwidth = 2,
-	.hasdma = true,
 	.hastype = true,
 	.we0 = 16,
 	.ctl0 = 0x10,
@@ -204,7 +200,6 @@ static struct aspeed_smc_info smc_2500_info = {
 	.maxsize = 128 * 1024 * 1024,
 	.nce = 2,
 	.maxwidth = 2,
-	.hasdma = false,
 	.hastype = false,
 	.we0 = 16,
 	.ctl0 = 0x10,
@@ -703,7 +698,8 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	init_completion(&controller->dma_done);
 
 	controller->has_dma = false;
-	if (info->hasdma)
+	if (of_get_property(controller->dev->of_node, "aspeed,fmc-has-dma",
+			    NULL))
 		controller->has_dma = !aspeed_smc_config_irq(controller, pdev);
 
 	if (controller->has_dma)
-- 
2.7.4
