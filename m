Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swSGd1qRRzDt2l
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:54:16 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 01CD414AA3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:51 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id C12BA2A0075;
 Fri, 14 Oct 2016 14:38:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 07/12] mtd: spi-nor: aspeed: make locking more
 explicit
Date: Fri, 14 Oct 2016 14:37:59 +0200
Message-Id: <1476448684-6149-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15121680175221410562
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
X-List-Received-Date: Fri, 14 Oct 2016 12:54:17 -0000

The routine aspeed_smc_stop_user() and aspeed_smc_start_user() hide
the fact that they lock an unlock the controller. Change that to make
it obvious in the code.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index a47eecfdfda2..b22e07d3ef32 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -276,8 +276,6 @@ static void aspeed_smc_start_user(struct spi_nor *nor)
 	struct aspeed_smc_per_chip *chip = nor->priv;
 	u32 ctl = chip->ctl_val[smc_base];
 
-	mutex_lock(&chip->controller->mutex);
-
 	ctl |= CONTROL_SPI_COMMAND_MODE_USER |
 		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
 	writel(ctl, chip->ctl);
@@ -296,19 +294,21 @@ static void aspeed_smc_stop_user(struct spi_nor *nor)
 
 	writel(ctl2, chip->ctl);	/* stop user CE control */
 	writel(ctl, chip->ctl);		/* default to fread or read */
-
-	mutex_unlock(&chip->controller->mutex);
 }
 
 static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	struct aspeed_smc_per_chip *chip = nor->priv;
 
+	mutex_lock(&chip->controller->mutex);
+
 	aspeed_smc_start_user(nor);
 	aspeed_smc_to_fifo(chip->base, &opcode, 1);
 	aspeed_smc_from_fifo(buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
+	mutex_unlock(&chip->controller->mutex);
+
 	return 0;
 }
 
@@ -317,11 +317,15 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 {
 	struct aspeed_smc_per_chip *chip = nor->priv;
 
+	mutex_lock(&chip->controller->mutex);
+
 	aspeed_smc_start_user(nor);
 	aspeed_smc_to_fifo(chip->base, &opcode, 1);
 	aspeed_smc_to_fifo(chip->base, buf, len);
 	aspeed_smc_stop_user(nor);
 
+	mutex_unlock(&chip->controller->mutex);
+
 	return 0;
 }
 
-- 
2.7.4
