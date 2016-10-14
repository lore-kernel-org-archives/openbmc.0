Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRxK2Q0gzDty5
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:39:17 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 231B7104DF
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:39:14 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 23CD52A0085;
 Fri, 14 Oct 2016 14:39:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 12/12] mtd: spi-nor: aspeed: use fast read when
 doing DMAs
Date: Fri, 14 Oct 2016 14:38:04 +0200
Message-Id: <1476448684-6149-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15127872625414212354
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
X-List-Received-Date: Fri, 14 Oct 2016 12:39:17 -0000

Try to improve the speed of transfers when doing DMAs

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ae2d9bc643c3..40e48372865a 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -211,6 +211,7 @@ enum smc_ctl_reg_value {
 	smc_base,		/* base value without mode for other commands */
 	smc_read,		/* command reg for (maybe fast) reads */
 	smc_write,		/* command reg for writes with timings */
+	smc_fread,		/* command reg for (maybe faster?) reads */
 	smc_num_ctl_reg_values	/* last value to get count of commands */
 };
 
@@ -347,9 +348,6 @@ static inline void aspeed_smc_chip_configure(struct aspeed_smc_per_chip *chip,
 	writel(ctl, chip->ctl);
 }
 
-/*
- * TODO: configure FREAD mode
- */
 static int aspeed_smc_dma_start(struct aspeed_smc_per_chip *chip,
 				u32 offset, void *buf, size_t length,
 				int is_write)
@@ -359,7 +357,7 @@ static int aspeed_smc_dma_start(struct aspeed_smc_per_chip *chip,
 	int ret;
 
 	aspeed_smc_chip_configure(chip, is_write ? chip->ctl_val[smc_write] :
-		chip->ctl_val[smc_base]);
+		chip->ctl_val[smc_fread]);
 
 	dev_dbg(chip->nor.dev, "DMA %s to=0x%08x len=0x%08x\n",
 		is_write ? "write" : "read", offset, length);
@@ -823,6 +821,11 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 		if (err)
 			continue;
 
+		chip->ctl_val[smc_fread] = chip->ctl_val[smc_base] |
+			/* Not sure this is that fast */
+			spi_control_fill_opcode(SPINOR_OP_READ_FAST) |
+			CONTROL_SPI_COMMAND_MODE_FREAD;
+
 		chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
 			spi_control_fill_opcode(chip->nor.program_opcode) |
 			CONTROL_SPI_COMMAND_MODE_WRITE;
-- 
2.7.4
