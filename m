Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.59.63; helo=4.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2168 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Apr 2019 00:16:21 AEST
Received: from 4.mo68.mail-out.ovh.net (4.mo68.mail-out.ovh.net [46.105.59.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kkn16hTszDqKV
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 00:16:17 +1000 (AEST)
Received: from player795.ha.ovh.net (unknown [10.109.160.244])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 821A3122694
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:40:03 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 9787B4CFDEB2;
 Wed, 17 Apr 2019 13:39:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH dev-5.0 2/4] mtd: spi-nor: aspeed: clarify 4BYTE address mode
 mask
Date: Wed, 17 Apr 2019 15:39:39 +0200
Message-Id: <20190417133941.22962-3-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417133941.22962-1-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3220918160803400450
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
X-List-Received-Date: Wed, 17 Apr 2019 14:16:22 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ee3059b27c07..1437732fdea1 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -884,7 +884,15 @@ static const uint32_t aspeed_smc_hclk_divs[] = {
 
 static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 {
-	return (chip->ctl_val[smc_read] & 0x2000) |
+	/*
+	 * Keep the 4Byte address mode on the AST2400 SPI controller.
+	 * Other controllers set the 4Byte mode in the CE Control
+	 * Register
+	 */
+	u32 ctl_mask = chip->controller->info == &spi_2400_info ?
+		 CONTROL_IO_ADDRESS_4B : 0;
+
+	return (chip->ctl_val[smc_read] & ctl_mask) |
 		(0x00 << 28) | /* Single bit */
 		(0x00 << 24) | /* CE# max */
 		(0x03 << 16) | /* use normal reads */
-- 
2.20.1
