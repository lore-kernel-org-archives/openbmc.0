Return-Path: <clg@kaod.org>
Received: from 14.mo7.mail-out.ovh.net (14.mo7.mail-out.ovh.net
 [178.33.251.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mG6DXfzDw00
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:10 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5C0E120795
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:04 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 2D091480075;
 Fri, 18 Nov 2016 15:25:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 04/38] aspeed: extend the board configuration with flash
 models
Date: Fri, 18 Nov 2016 15:21:44 +0100
Message-Id: <1479478938-13267-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1098878310280235778
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:11 -0000

Future machine will use different flash models for the FMC and the SPI
controllers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fda6d85..159d562e8912 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -34,6 +34,8 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    const char *fmc_model;
+    const char *spi_model;
 } AspeedBoardConfig;
 
 enum {
@@ -65,8 +67,18 @@ enum {
         ~SCU_HW_STRAP_2ND_BOOT_WDT)
 
 static const AspeedBoardConfig aspeed_boards[] = {
-    [PALMETTO_BMC] = { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
-    [AST2500_EVB]  = { "ast2500-a1", AST2500_EVB_HW_STRAP1 },
+    [PALMETTO_BMC] = {
+        .soc_name  = "ast2400-a0",
+        .hw_strap1 = PALMETTO_BMC_HW_STRAP1,
+        .fmc_model = "n25q256a",
+        .spi_model = "mx25l25635e",
+    },
+    [AST2500_EVB]  = {
+        .soc_name  = "ast2500-a1",
+        .hw_strap1 = AST2500_EVB_HW_STRAP1,
+        .fmc_model = "n25q256a",
+        .spi_model = "mx25l25635e",
+    },
 };
 
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
@@ -128,8 +140,8 @@ static void aspeed_board_init(MachineState *machine,
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
                                    &error_abort);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, "n25q256a", &error_abort);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], "mx25l25635e", &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_abort);
 
     aspeed_board_binfo.kernel_filename = machine->kernel_filename;
     aspeed_board_binfo.initrd_filename = machine->initrd_filename;
-- 
2.7.4
