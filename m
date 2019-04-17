Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.79.203; helo=10.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1787 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Apr 2019 00:16:31 AEST
Received: from 10.mo68.mail-out.ovh.net (10.mo68.mail-out.ovh.net
 [46.105.79.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kknC0HVszDqL5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 00:16:29 +1000 (AEST)
Received: from player795.ha.ovh.net (unknown [10.109.146.76])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id D32A4121DEC
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:40:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 48B4A4CFDEDD;
 Wed, 17 Apr 2019 13:40:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH dev-5.0 3/4] mtd: spi-nor: aspeed: use memcpy_fromio() to
 capture the optimization buffer
Date: Wed, 17 Apr 2019 15:39:40 +0200
Message-Id: <20190417133941.22962-4-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417133941.22962-1-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3222044058805963522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeefgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2019 14:16:31 -0000

aspeed_smc_read_from_ahb() only reads the first word which is not what
we want. We want to capture a CALIBRATE_BUF_SIZE size window of the
flash contents to optimize the read.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 1437732fdea1..7e289ecb1c99 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct aspeed_smc_chip *chip,
 	int i;
 
 	for (i = 0; i < 10; i++) {
-		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
-					 CALIBRATE_BUF_SIZE);
+		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) != 0)
 			return false;
 	}
@@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 
 	writel(chip->ctl_val[smc_read], chip->ctl);
 
-	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
-				 CALIBRATE_BUF_SIZE);
+	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
 
 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
 	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
-- 
2.20.1
