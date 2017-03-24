Return-Path: <clg@kaod.org>
Received: from 12.mo7.mail-out.ovh.net (12.mo7.mail-out.ovh.net
 [178.33.107.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqR6H6P2XzDqZY
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 01:45:11 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E82ED46904
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:45:08 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id CAA0E180078;
 Fri, 24 Mar 2017 15:45:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 4/6] mtd: spi-nor: aspeed: use command mode for
 reads
Date: Fri, 24 Mar 2017 15:44:41 +0100
Message-Id: <1490366683-23401-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490366683-23401-1-git-send-email-clg@kaod.org>
References: <1490366683-23401-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3527444409230592770
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 24 Mar 2017 14:45:12 -0000

When reading flash contents, try to use the "command mode" if the AHB
window configured for the flash module is big enough. Else, just fall
back to the "user mode" to perform the read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 memcpy_fromio() works perfectly fine. I wonder if they were some
 changes in the kernel that fixed the issues reported in the very
 early version of this driver. See the comment before
 aspeed_smc_read_from_ahb()

 drivers/mtd/spi-nor/aspeed-smc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 336a1ddd100b..3c004dfaf873 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -516,16 +516,8 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 	struct aspeed_smc_chip *chip = nor->priv;
 	int i;
 	u8 dummy = 0xFF;
-	int ret;
 	u32 ctl;
 
-	if (aspeed_smc_dma_check(chip, from, len)) {
-		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
-		if (!ret)
-			goto out;
-		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
-	}
-
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	for (i = 0; i < chip->nor.read_dummy / 8; i++)
@@ -540,6 +532,38 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
+	return 0;
+}
+
+static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
+			       u_char *read_buf)
+{
+	struct aspeed_smc_chip *chip = nor->priv;
+	int ret;
+
+	/* The segment window configured for the chip is too small for
+	 * the read offset. Use the "User mode" of the controller to
+	 * perform the read.
+	 */
+	if (from >= chip->ahb_window_size) {
+		aspeed_smc_read_user(nor, from, len, read_buf);
+		goto out;
+	}
+
+	/* Then, try DMA if the driver allows them. */
+	if (aspeed_smc_dma_check(chip, from, len)) {
+		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
+		if (!ret)
+			goto out;
+		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
+	}
+
+	/* Last, and this should be the default, use the "Command
+	 * mode" of the controller which does the read from the
+	 * segment window configured for the chip on the AHB bus.
+	 */
+	memcpy_fromio(read_buf, chip->ahb_base + from, len);
+
 out:
 	return len;
 }
@@ -948,7 +972,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		nor->dev = dev;
 		nor->priv = chip;
 		spi_nor_set_flash_node(nor, child);
-		nor->read = aspeed_smc_read_user;
+		nor->read = aspeed_smc_read;
 		nor->write = aspeed_smc_write_user;
 		nor->read_reg = aspeed_smc_read_reg;
 		nor->write_reg = aspeed_smc_write_reg;
-- 
2.7.4
