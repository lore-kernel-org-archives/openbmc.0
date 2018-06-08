Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.79.203; helo=10.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 12938 seconds by postgrey-1.36 at bilbo;
 Sat, 09 Jun 2018 02:36:00 AEST
Received: from 10.mo68.mail-out.ovh.net (10.mo68.mail-out.ovh.net
 [46.105.79.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 412Shc2GtHzDqG0
 for <openbmc@lists.ozlabs.org>; Sat,  9 Jun 2018 02:35:58 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.109.122.1])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 56E65E743E
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 15:00:20 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 23B7C540098;
 Fri,  8 Jun 2018 15:00:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] mtd: spi-nor: aspeed: limit the maximum SPI frequency
Date: Fri,  8 Jun 2018 15:00:00 +0200
Message-Id: <20180608130000.22627-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180608130000.22627-1-clg@kaod.org>
References: <20180608130000.22627-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9071375552330828546
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrjeelgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 08 Jun 2018 16:36:01 -0000

The optimize read algo can choose a 100MHz SPI frequency which might
be a bit too high for dual output IO on some chips, for the W25Q256 on
palmetto for instance. The MX66L1G45G on witherspoon should be fine
though. Also, the second chip of the FMC controller does not get any
optimize settings for reads. Only the first is configured by U-Boot.

To fix these two issues, we introduce a "spi-max-frequency" property
in the device tree which will be used to cap the optimize read
algorithm and we run the algo on the FMC controller chips as well.

By default, the frequency setting is 50MHz.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index a301895d1f06..e4a0123b12b3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -83,6 +83,7 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.ctl0 = 0x10,
 	.timing = 0x94,
 	.set_4b = aspeed_smc_chip_set_4b,
+	.optimize_read = aspeed_smc_optimize_read,
 };
 
 static const struct aspeed_smc_info spi_2500_info = {
@@ -114,6 +115,7 @@ struct aspeed_smc_chip {
 	u32 ctl_val[smc_max];			/* control settings */
 	enum aspeed_smc_flash_type type;	/* what type of flash */
 	struct spi_nor nor;
+	u32 clk_rate;
 };
 
 struct aspeed_smc_controller {
@@ -130,6 +132,8 @@ struct aspeed_smc_controller {
 	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
 };
 
+#define ASPEED_SPI_DEFAULT_FREQ		50000000
+
 /*
  * SPI Flash Configuration Register (AST2500 SPI)
  *     or
@@ -993,11 +997,10 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	dev_info(controller->dev, "read control register: %08x\n",
 		chip->ctl_val[smc_read]);
 
-	/*
-	 * TODO: get max freq from chip
-	 */
+
 	if (optimize_read && info->optimize_read)
-		info->optimize_read(chip, 104000000);
+		info->optimize_read(chip, chip->clk_rate);
+
 	return 0;
 }
 
@@ -1051,6 +1054,13 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 			break;
 		}
 
+		if (of_property_read_u32(child, "spi-max-frequency",
+					 &chip->clk_rate)) {
+			chip->clk_rate = ASPEED_SPI_DEFAULT_FREQ;
+		}
+		dev_info(dev, "Using %d MHz SPI frequency\n",
+			 chip->clk_rate / 1000000);
+
 		chip->controller = controller;
 		chip->ctl = controller->regs + info->ctl0 + cs * 4;
 		chip->cs = cs;
-- 
2.13.6
