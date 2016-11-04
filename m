Return-Path: <clg@kaod.org>
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SmM4lphzDvZD
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:39 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5E23516375
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:36 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 33CF93C0070;
 Fri,  4 Nov 2016 18:01:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 8/8] mtd: spi-nor: aspeed: use command mode for
 reads
Date: Fri,  4 Nov 2016 18:00:47 +0100
Message-Id: <1478278847-9164-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13758496865460652802
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:40 -0000

When accessing flash contents, let use the "command mode" for read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 88cbfe7c4340..89085d84b4b5 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -522,8 +522,8 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 	}
 }
 
-static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
-				size_t *retlen, u_char *read_buf)
+static int aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
+			   size_t *retlen, u_char *read_buf)
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 	int ret;
@@ -542,10 +542,10 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
 	}
 
-	aspeed_smc_start_user(nor);
-	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
-	aspeed_smc_from_ahb(read_buf, chip->base, len);
-	aspeed_smc_stop_user(nor);
+	/*
+	 * we are in read or fread mode by default
+	 */
+	aspeed_smc_from_ahb(read_buf, chip->base + from, len);
 
 out:
 	mutex_unlock(&chip->controller->mutex);
@@ -861,6 +861,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	}
 
 	chip->ctl_val[smc_read] |= cmd |
+		spi_control_fill_opcode(chip->nor.read_opcode) |
 		CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
 
 	dev_dbg(controller->dev, "base control register: %08x\n",
@@ -956,7 +957,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		chip->nor.priv = chip;
 		spi_nor_set_flash_node(&chip->nor, child);
 		chip->nor.mtd.name = of_get_property(child, "label", NULL);
-		chip->nor.read = aspeed_smc_read_user;
+		chip->nor.read = aspeed_smc_read;
 		chip->nor.write = aspeed_smc_write_user;
 		chip->nor.read_reg = aspeed_smc_read_reg;
 		chip->nor.write_reg = aspeed_smc_write_reg;
-- 
2.7.4
