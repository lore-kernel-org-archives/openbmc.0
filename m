Return-Path: <clg@kaod.org>
Received: from 8.mo1.mail-out.ovh.net (8.mo1.mail-out.ovh.net [178.33.110.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDJsX3FM2zDvNT
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:16:00 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8FCDD15839
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:15:55 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 4EB6A260079;
 Wed,  9 Nov 2016 09:15:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 1/7] mtd: spi-nor: aspeed: fix setting of the
 register control value for writes
Date: Wed,  9 Nov 2016 09:15:37 +0100
Message-Id: <1478679343-25354-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15797220119112682242
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
X-List-Received-Date: Wed, 09 Nov 2016 08:16:01 -0000

The setting of the register control value for writes depends on the
base value which was defined only if the mask applied to it changed
the register control value.

Fix that.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 I kept the info level because nothing wrong is happening. we are just
 possibly changing an optimized value for a non optimized value

 drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index f65379bb2287..75ba73ef0660 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -756,7 +756,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	const struct aspeed_smc_info *info = controller->info;
-	u32 reg;
+	u32 reg, base_reg;
 
 	/*
 	 * Always turn on the write enable bit to allow opcodes to be
@@ -789,12 +789,13 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 	reg = readl(chip->ctl);
 	dev_dbg(controller->dev, "control register: %08x\n", reg);
 
-	if ((reg & CONTROL_SPI_KEEP_MASK) != reg) {
-		chip->ctl_val[smc_base] = reg & CONTROL_SPI_KEEP_MASK;
+	base_reg = reg & CONTROL_SPI_KEEP_MASK;
+	if (base_reg != reg) {
 		dev_info(controller->dev,
 			 "control register changed to: %08x\n",
-			 chip->ctl_val[smc_base]);
+			 base_reg);
 	}
+	chip->ctl_val[smc_base] = base_reg;
 
 	/*
 	 * Retain the prior value of the control register as the
-- 
2.7.4
