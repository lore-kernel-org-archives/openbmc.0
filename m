Return-Path: <clg@kaod.org>
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SmF6XbfzDvb2
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:33 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E65F817E96
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:29 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 59A843C0084;
 Fri,  4 Nov 2016 18:01:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 6/8] mtd: spi-nor: aspeed: prepare for fast read
Date: Fri,  4 Nov 2016 18:00:45 +0100
Message-Id: <1478278847-9164-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13756526540795251458
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:34 -0000

Include dummy cycle in the control register value which will be
required for fast read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 41 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 73adf409ac34..444af3aff8b5 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -295,7 +295,7 @@ struct aspeed_smc_controller {
 #define CONTROL_SPI_COMMAND_SHIFT 16
 #define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
-#define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT (14 - 2)
+#define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT 14
 #define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* AST2400 SPI */
 #define CONTROL_SPI_CLK_DIV4 BIT(13) /* others */
 #define CONTROL_SPI_RW_MERGE BIT(12)
@@ -304,6 +304,10 @@ struct aspeed_smc_controller {
 				       CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI | \
 					  CONTROL_SPI_IO_DUMMY_CYCLES_LO)
+#define CONTROL_SPI_IO_DUMMY_CYCLES_SET(dummy)				\
+	(((((dummy) >> 2) & 0x1) << CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT) | \
+	(((dummy) & 0x3) << CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT))
+
 #define CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT 8
 #define CONTROL_SPI_CLOCK_FREQ_SEL_MASK GENMASK(11, \
 					CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT)
@@ -857,11 +861,17 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 	return 0;
 }
 
-static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
+static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
+	struct aspeed_smc_controller *controller = chip->controller;
+	u32 cmd;
+
 	if (chip->nor.mtd.size > SZ_16M)
 		aspeed_smc_chip_set_4b(chip);
 
+	/*
+	 * base mode has not been optimized yet. use it for writes.
+	 */
 	chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
 		spi_control_fill_opcode(chip->nor.program_opcode) |
 		CONTROL_SPI_COMMAND_MODE_WRITE;
@@ -871,12 +881,29 @@ static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 
 	/*
 	 * XXX TODO
-	 * Enable fast read mode as required here.
 	 * Adjust clocks if fast read and write are supported.
 	 * Interpret spi-nor flags to adjust controller settings.
 	 * Check if resource size big enough for detected chip and
 	 * add support assisted (normal or fast-) read and dma.
 	 */
+	switch (chip->nor.flash_read) {
+	case SPI_NOR_NORMAL:
+		cmd = CONTROL_SPI_COMMAND_MODE_NORMAL;
+		break;
+	case SPI_NOR_FAST:
+		cmd = CONTROL_SPI_COMMAND_MODE_FREAD;
+		break;
+	default:
+		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
+		return -EINVAL;
+	}
+
+	chip->ctl_val[smc_read] |= cmd |
+		CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
+
+	dev_dbg(controller->dev, "base control register: %08x\n",
+		 chip->ctl_val[smc_read]);
+	return 0;
 }
 
 static int aspeed_smc_probe(struct platform_device *pdev)
@@ -972,7 +999,9 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		chip->nor.read_reg = aspeed_smc_read_reg;
 		chip->nor.write_reg = aspeed_smc_write_reg;
 
-		aspeed_smc_chip_setup_init(chip, r);
+		err = aspeed_smc_chip_setup_init(chip, r);
+		if (err)
+			continue;
 
 		/*
 		 * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL attach
@@ -982,7 +1011,9 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		if (err)
 			continue;
 
-		aspeed_smc_chip_setup_finish(chip);
+		err = aspeed_smc_chip_setup_finish(chip);
+		if (err)
+			continue;
 
 		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
 		if (err)
-- 
2.7.4
