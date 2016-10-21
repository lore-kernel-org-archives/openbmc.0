Return-Path: <clg@kaod.org>
X-Greylist: delayed 371 seconds by postgrey-1.36 at bilbo;
 Fri, 21 Oct 2016 16:51:22 AEDT
Received: from 9.mo69.mail-out.ovh.net (9.mo69.mail-out.ovh.net [46.105.56.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZYQ2StTzDsxR
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:51:22 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4CF4C7EB1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:45:11 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 0A081540069;
 Fri, 21 Oct 2016 07:45:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev4.7 v2 3/9] mtd: spi-nor: Add Micronix mx66l1g45g spi
 flash
Date: Fri, 21 Oct 2016 07:44:44 +0200
Message-Id: <1477028690-27239-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477028690-27239-1-git-send-email-clg@kaod.org>
References: <1477028690-27239-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12350840504414604034
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrheelgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 21 Oct 2016 05:51:22 -0000

From: Milton Miller <miltonm@us.ibm.com>

These modules are used on the OpenPOWER Witherspoon systems to hold
the POWER9 host firmware image.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a6adb2785b14..a68073afe8a8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -858,6 +858,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
-- 
2.7.4
