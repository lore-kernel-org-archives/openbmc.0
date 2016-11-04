Return-Path: <clg@kaod.org>
Received: from 16.mo1.mail-out.ovh.net (16.mo1.mail-out.ovh.net
 [178.33.104.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SmC2YFYzDvb2
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:31 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5655916EB9
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:26 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 1A5AA3C0072;
 Fri,  4 Nov 2016 18:01:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 5/8] mtd: spi-nor: aspeed: use smc_read mode
 when doing DMAs
Date: Fri,  4 Nov 2016 18:00:44 +0100
Message-Id: <1478278847-9164-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13755682113830488834
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:32 -0000

smc_base is to send commands. smc_read is for flash content accesses.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ca213f67c486..73adf409ac34 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -394,7 +394,7 @@ static int aspeed_smc_dma_start(struct aspeed_smc_chip *chip,
 	int ret;
 
 	aspeed_smc_chip_configure(chip, is_write ? chip->ctl_val[smc_write] :
-		chip->ctl_val[smc_base]);
+		chip->ctl_val[smc_read]);
 
 	dev_dbg(chip->nor.dev, "DMA %s to=0x%08x len=0x%08x\n",
 		is_write ? "write" : "read", offset, length);
@@ -435,7 +435,7 @@ static int aspeed_smc_dma_start(struct aspeed_smc_chip *chip,
 			 controller->dma_addr, controller->dma_length,
 			 (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
 out:
-	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_base]);
+	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_read]);
 	return ret;
 }
 
-- 
2.7.4
