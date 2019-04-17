Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.173; helo=1.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1197 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Apr 2019 00:17:58 AEST
Received: from 1.mo69.mail-out.ovh.net (1.mo69.mail-out.ovh.net
 [178.33.251.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kkpt2rxBzDqMn
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 00:17:55 +1000 (AEST)
Received: from player795.ha.ovh.net (unknown [10.108.42.73])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id B9C394EDE2
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:39:58 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 4B2B44CFDE82;
 Wed, 17 Apr 2019 13:39:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH dev-5.0 1/4] mtd: spi-nor: aspeed: introduce a
 aspeed_smc_default_read() helper
Date: Wed, 17 Apr 2019 15:39:38 +0200
Message-Id: <20190417133941.22962-2-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417133941.22962-1-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3219510785184074498
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
X-List-Received-Date: Wed, 17 Apr 2019 14:17:59 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ddf7ae78aa0a..ee3059b27c07 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -882,6 +882,17 @@ static const uint32_t aspeed_smc_hclk_divs[] = {
 };
 #define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
 
+static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
+{
+	return (chip->ctl_val[smc_read] & 0x2000) |
+		(0x00 << 28) | /* Single bit */
+		(0x00 << 24) | /* CE# max */
+		(0x03 << 16) | /* use normal reads */
+		(0x00 <<  8) | /* HCLK/16 */
+		(0x00 <<  6) | /* no dummy cycle */
+		(0x00);        /* normal mode */
+}
+
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 				     u32 max_freq)
 {
@@ -898,13 +909,7 @@ static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
 	/* We start with the dumbest setting (keep 4Byte bit) and read
 	 * some data
 	 */
-	chip->ctl_val[smc_read] = (chip->ctl_val[smc_read] & 0x2000) |
-		(0x00 << 28) | /* Single bit */
-		(0x00 << 24) | /* CE# max */
-		(0x03 << 16) | /* use normal reads */
-		(0x00 <<  8) | /* HCLK/16 */
-		(0x00 <<  6) | /* no dummy cycle */
-		(0x00);        /* normal read */
+	chip->ctl_val[smc_read] = aspeed_smc_default_read(chip);
 
 	writel(chip->ctl_val[smc_read], chip->ctl);
 
-- 
2.20.1
