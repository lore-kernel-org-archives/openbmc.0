Return-Path: <clg@kaod.org>
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDJsf0CchzDvbd
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:16:05 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id EFEA815839
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:16:01 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id BCD3F2600A8;
 Wed,  9 Nov 2016 09:15:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 3/7] mtd: spi-nor: aspeed: extend the bits
 definitions
Date: Wed,  9 Nov 2016 09:15:39 +0100
Message-Id: <1478679343-25354-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15798908971114466050
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
X-List-Received-Date: Wed, 09 Nov 2016 08:16:06 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ecc38752c2c3..195166def945 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -261,16 +261,36 @@ struct aspeed_smc_controller {
 };
 
 /*
- * FMC Type setting Register
- *   or
- * SPI Flash Configuration Register
+ * SPI Flash Configuration Register (AST2400 SPI)
  */
 #define CONFIG_REG			0x0
+#define    CONFIG_ENABLE_CE_INACTIVE	    BIT(1)
+#define    CONFIG_WRITE			    BIT(0)
 
 /*
- * CE Control Register
+ * SPI Flash Configuration Register (AST2500 SPI)
+ * Type setting Register (AST2500 FMC and AST2400 FMC)
+ */
+#define TYPE_SETTING_REG		0x0
+#define    CONFIG_DISABLE_LEGACY	    BIT(31) /* 1 on AST2500 FMC */
+
+#define    CONFIG_CE2_WRITE		    BIT(18)
+#define    CONFIG_CE1_WRITE		    BIT(17)
+#define    CONFIG_CE0_WRITE		    BIT(16)
+
+#define    CONFIG_CE2_TYPE		    BIT(4) /* FMC only */
+#define    CONFIG_CE1_TYPE		    BIT(2) /* FMC only */
+#define    CONFIG_CE0_TYPE		    BIT(0) /* FMC only */
+
+/*
+ * CE Control Register (AST2500 SPI,FMC and AST2400 FMC)
  */
 #define CE_CONTROL_REG			0x4
+#define    CE2_ENABLE_CE_INACTIVE           BIT(10)
+#define    CE1_ENABLE_CE_INACTIVE           BIT(9)
+#define    CE0_ENABLE_CE_INACTIVE           BIT(8)
+#define    CE2_CONTROL_EXTENDED		    BIT(2)
+#define    CE1_CONTROL_EXTENDED		    BIT(1)
 #define    CE0_CONTROL_EXTENDED		    BIT(0)
 
 /* CE0 Control Register (depends on the controller type) */
@@ -287,8 +307,8 @@ struct aspeed_smc_controller {
 #define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT (14 - 2)
-#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* 2400-smc */
-#define CONTROL_SPI_CLK_DIV4 BIT(13) /* FMC, 2500 */
+#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* AST2400 SPI */
+#define CONTROL_SPI_CLK_DIV4 BIT(13) /* others */
 #define CONTROL_SPI_RW_MERGE BIT(12)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT 6
 #define CONTROL_SPI_IO_DUMMY_CYCLES_LO GENMASK(7, \
-- 
2.7.4
