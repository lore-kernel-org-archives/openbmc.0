Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.109.80; helo=2.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 26990 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Apr 2019 23:47:09 AEST
Received: from 2.mo177.mail-out.ovh.net (2.mo177.mail-out.ovh.net
 [178.33.109.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kk7K6Kf8zDq7h
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 23:47:07 +1000 (AEST)
Received: from player795.ha.ovh.net (unknown [10.109.146.143])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id A0F7CEF8D6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 15:40:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id BD4924CFDF19;
 Wed, 17 Apr 2019 13:40:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH dev-5.0 4/4] mtd: spi-nor: aspeed: add support for the 4B
 opcodes
Date: Wed, 17 Apr 2019 15:39:41 +0200
Message-Id: <20190417133941.22962-5-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417133941.22962-1-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3223451434494626562
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 17 Apr 2019 13:47:10 -0000

Switch the default controller value to use the read mode in order to
customize the command and use SPINOR_OP_READ_4B (0x13) when the chip
supports 4B opcodes.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 7e289ecb1c99..1200b23416e3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -890,14 +890,21 @@ static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
 	 */
 	u32 ctl_mask = chip->controller->info == &spi_2400_info ?
 		 CONTROL_IO_ADDRESS_4B : 0;
+	u8 cmd = chip->nor.flags & SNOR_F_4B_OPCODES ? SPINOR_OP_READ_4B :
+		SPINOR_OP_READ;
 
+	/*
+	 * Use the "read command" mode to customize the opcode. In
+	 * normal command mode, the value is necessarily READ (0x3) on
+	 * the AST2400/2500 SoCs.
+	 */
 	return (chip->ctl_val[smc_read] & ctl_mask) |
 		(0x00 << 28) | /* Single bit */
 		(0x00 << 24) | /* CE# max */
-		(0x03 << 16) | /* use normal reads */
+		(cmd  << 16) | /* use read mode to support 4B opcode */
 		(0x00 <<  8) | /* HCLK/16 */
 		(0x00 <<  6) | /* no dummy cycle */
-		(0x00);        /* normal mode */
+		(0x01);        /* read mode */
 }
 
 static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
-- 
2.20.1
