Return-Path: <clg@kaod.org>
X-Greylist: delayed 114844 seconds by postgrey-1.36 at bilbo;
 Sat, 05 Nov 2016 04:01:17 AEDT
Received: from 18.mo1.mail-out.ovh.net (18.mo1.mail-out.ovh.net [46.105.35.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Slx4hVnzDvZC
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:17 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 69F0915B5E
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:13 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 3B3413C0073;
 Fri,  4 Nov 2016 18:01:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 1/8] mtd: spi-nor: aspeed: fix setting of the
 register control value for writes
Date: Fri,  4 Nov 2016 18:00:40 +0100
Message-Id: <1478278847-9164-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13752022938632096514
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:18 -0000

The setting of the register control value for writes depends on the
base value which was defined only if the mask applied to it changed
the register control value.

Fix that.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
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
