Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.36.253; helo=6.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 397 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Oct 2017 00:48:53 AEDT
Received: from 6.mo4.mail-out.ovh.net (6.mo4.mail-out.ovh.net [188.165.36.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9hRT63pLzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 00:48:53 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0E26AD9C75
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 15:42:16 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id E3CD650006C;
 Mon,  9 Oct 2017 15:42:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [linux dev-4.13 3/6] mtd: spi-nor: aspeed: add support for SPI dual
 IO read mode
Date: Mon,  9 Oct 2017 15:41:05 +0200
Message-Id: <20171009134108.15860-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171009134108.15860-1-clg@kaod.org>
References: <20171009134108.15860-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8986933059491105538
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
X-List-Received-Date: Mon, 09 Oct 2017 13:48:54 -0000

Implements support for the dual IO read mode on aspeed SMC/FMC
controllers which uses both MISO and MOSI lines for data during a read
to double the read bandwidth.

Still to be done SNOR_PROTO_1_2_2

Based on work from Robert Lippert <roblip@gmail.com>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 54 ++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index b68cd7e65b71..ac27a5109f6d 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -373,18 +373,49 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 	}
 }
 
+static int aspeed_smc_get_io_mode(struct aspeed_smc_chip *chip)
+{
+	switch (chip->nor.read_proto) {
+	case SNOR_PROTO_1_1_1:
+		return 0;
+	case SNOR_PROTO_1_1_2:
+		return CONTROL_IO_DUAL_DATA;
+	case SNOR_PROTO_1_2_2:
+		return CONTROL_IO_DUAL_ADDR_DATA;
+	default:
+		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
+		return -EINVAL;
+	}
+}
+
+static void aspeed_smc_set_io_mode(struct aspeed_smc_chip *chip, u32 io_mode)
+{
+	u32 ctl;
+
+	if (io_mode > 0) {
+		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
+		ctl |= io_mode;
+		writel(ctl, chip->ctl);
+	}
+}
+
 static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
 				    size_t len, u_char *read_buf)
 {
 	struct aspeed_smc_chip *chip = nor->priv;
 	int i;
 	u8 dummy = 0xFF;
+	int io_mode = aspeed_smc_get_io_mode(chip);
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	for (i = 0; i < chip->nor.read_dummy / 8; i++)
 		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
 
+	/* Set IO mode only for data */
+	if (io_mode == CONTROL_IO_DUAL_DATA)
+		aspeed_smc_set_io_mode(chip, io_mode);
+
 	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
 	aspeed_smc_stop_user(nor);
 	return len;
@@ -735,6 +766,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	const struct aspeed_smc_info *info = controller->info;
+	int io_mode;
 	u32 cmd;
 
 	if (chip->nor.addr_width == 4 && info->set_4b)
@@ -757,21 +789,20 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 	 * TODO: Adjust clocks if fast read is supported and interpret
 	 * SPI-NOR flags to adjust controller settings.
 	 */
-	if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
-		if (chip->nor.read_dummy == 0)
-			cmd = CONTROL_COMMAND_MODE_NORMAL;
-		else
-			cmd = CONTROL_COMMAND_MODE_FREAD;
-	} else {
-		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
-		return -EINVAL;
-	}
+	io_mode = aspeed_smc_get_io_mode(chip);
+	if (io_mode < 0)
+		return io_mode;
+
+	if (chip->nor.read_dummy == 0)
+		cmd = CONTROL_COMMAND_MODE_NORMAL;
+	else
+		cmd = CONTROL_COMMAND_MODE_FREAD;
 
-	chip->ctl_val[smc_read] |= cmd |
+	chip->ctl_val[smc_read] |= cmd | io_mode |
 		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
 		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
 
-	dev_dbg(controller->dev, "base control register: %08x\n",
+	dev_info(controller->dev, "read control register: %08x\n",
 		chip->ctl_val[smc_read]);
 	return 0;
 }
@@ -782,6 +813,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
+			SNOR_HWCAPS_READ_1_1_2 |
 			SNOR_HWCAPS_PP,
 	};
 	const struct aspeed_smc_info *info = controller->info;
-- 
2.13.6
