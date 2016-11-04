Return-Path: <clg@kaod.org>
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Sm81vsBzDvZR
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:28 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id EC4C716E2A
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:23 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id E18CB3C0073;
 Fri,  4 Nov 2016 18:01:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 4/8] mtd: spi-nor: aspeed: add some logging
Date: Fri,  4 Nov 2016 18:00:43 +0100
Message-Id: <1478278847-9164-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13754837687851322114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:28 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index a26fed33c4b4..ca213f67c486 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -748,8 +748,6 @@ static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
 	u32 reg;
 
 	reg = readl(controller->regs + CONFIG_REG);
-	dev_dbg(controller->dev, "config reg @%p: 0x%08x\n",
-		controller->regs + CONFIG_REG, reg);
 
 	reg |= aspeed_smc_chip_write_bit(chip);
 	writel(reg, controller->regs + CONFIG_REG);
@@ -761,8 +759,6 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
 	u32 reg;
 
 	reg = readl(controller->regs + CONFIG_REG);
-	dev_dbg(controller->dev, "config reg @%p: 0x%08x\n",
-		controller->regs + CONFIG_REG, reg);
 
 	chip->type = type;
 
@@ -856,6 +852,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 		chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
 			CONTROL_SPI_COMMAND_MODE_NORMAL;
 
+	dev_dbg(controller->dev, "default control register: %08x\n",
+		 chip->ctl_val[smc_read]);
 	return 0;
 }
 
@@ -868,6 +866,9 @@ static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
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
