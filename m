Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDJsn11c0zDvc6
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:16:13 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5F5CC173B7
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:16:08 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 30A8F2600AF;
 Wed,  9 Nov 2016 09:16:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 5/7] mtd: spi-nor: aspeed: use smc_read mode
 when doing DMAs
Date: Wed,  9 Nov 2016 09:15:41 +0100
Message-Id: <1478679343-25354-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15800879293063400194
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
X-List-Received-Date: Wed, 09 Nov 2016 08:16:14 -0000

smc_base is to send commands. smc_read is for flash content accesses.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 4839a26b387f..bbe505d5d8a3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -405,7 +405,7 @@ static int aspeed_smc_dma_start(struct aspeed_smc_chip *chip,
 	int ret;
 
 	aspeed_smc_chip_configure(chip, is_write ? chip->ctl_val[smc_write] :
-		chip->ctl_val[smc_base]);
+		chip->ctl_val[smc_read]);
 
 	dev_dbg(chip->nor.dev, "DMA %s to=0x%08x len=0x%08x\n",
 		is_write ? "write" : "read", offset, length);
@@ -446,7 +446,7 @@ static int aspeed_smc_dma_start(struct aspeed_smc_chip *chip,
 			 controller->dma_addr, controller->dma_length,
 			 (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
 out:
-	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_base]);
+	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_read]);
 	return ret;
 }
 
-- 
2.7.4
