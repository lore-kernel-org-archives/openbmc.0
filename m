Return-Path: <clg@kaod.org>
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDK4x1d2RzDt1x
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:25:52 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2BD1716D3C
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:16:05 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id F307A2600A1;
 Wed,  9 Nov 2016 09:16:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 4/7] mtd: spi-nor: aspeed: add some logging
Date: Wed,  9 Nov 2016 09:15:40 +0100
Message-Id: <1478679343-25354-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15800034868765100802
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 09 Nov 2016 08:25:53 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 195166def945..4839a26b387f 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -759,8 +759,6 @@ static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
 	u32 reg;
 
 	reg = readl(controller->regs + CONFIG_REG);
-	dev_dbg(controller->dev, "config reg @%p: 0x%08x\n",
-		controller->regs + CONFIG_REG, reg);
 
 	reg |= aspeed_smc_chip_write_bit(chip);
 	writel(reg, controller->regs + CONFIG_REG);
@@ -772,8 +770,6 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
 	u32 reg;
 
 	reg = readl(controller->regs + CONFIG_REG);
-	dev_dbg(controller->dev, "config reg @%p: 0x%08x\n",
-		controller->regs + CONFIG_REG, reg);
 
 	chip->type = type;
 
@@ -868,6 +864,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 		chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
 			CONTROL_SPI_COMMAND_MODE_NORMAL;
 
+	dev_dbg(controller->dev, "default control register: %08x\n",
+		 chip->ctl_val[smc_read]);
 	return 0;
 }
 
@@ -883,6 +881,9 @@ static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 		spi_control_fill_opcode(chip->nor.program_opcode) |
 		CONTROL_SPI_COMMAND_MODE_WRITE;
 
+	dev_dbg(controller->dev, "write control register: %08x\n",
+		 chip->ctl_val[smc_write]);
+
 	/*
 	 * XXX TODO
 	 * Enable fast read mode as required here.
-- 
2.7.4
