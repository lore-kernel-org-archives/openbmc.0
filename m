Return-Path: <clg@kaod.org>
X-Greylist: delayed 585 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Mar 2017 19:52:47 AEDT
Received: from 8.mo177.mail-out.ovh.net (8.mo177.mail-out.ovh.net
 [46.105.61.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpgL75zL6zDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 19:52:47 +1100 (AEDT)
Received: from player688.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 382B140A04
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 09:42:56 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 1D5F4200B0;
 Thu, 23 Mar 2017 09:42:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 2/3] mtd: spi-nor: aspeed: fix physical base
 address of chip
Date: Thu, 23 Mar 2017 09:42:36 +0100
Message-Id: <1490258557-16803-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490258557-16803-1-git-send-email-clg@kaod.org>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9984480376188537602
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjedvgddugedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 23 Mar 2017 08:52:48 -0000

The phys_base address is used to trigger DMAs on a chip and to address
the correct CS, it should take into account the offset of the chip in
the AHB bus window.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index d5d8b2d6e06b..b3c8cfe29765 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -693,7 +693,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 		return -EINVAL;
 	}
 
-	chip->phys_base = res->start;
+	chip->phys_base = res->start + (chip->ahb_base - controller->ahb_base);
 
 	/*
 	 * Get value of the inherited control register. U-Boot usually
-- 
2.7.4
