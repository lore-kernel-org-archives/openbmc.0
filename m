Return-Path: <clg@kaod.org>
Received: from 15.mo7.mail-out.ovh.net (15.mo7.mail-out.ovh.net [87.98.180.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mH35xPzDvns
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:11 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7FFDF205ED
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:46 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 3B9A4480079;
 Fri, 18 Nov 2016 15:25:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 17/38] aspeed/smc: unfold the AspeedSMCController array
Date: Fri, 18 Nov 2016 15:21:57 +0100
Message-Id: <1479478938-13267-18-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1110700258969029378
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

This is getting difficult to read. Also add a 'has_dma' field for each
controller type.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 91 ++++++++++++++++++++++++++++++++++++---------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index eec087199a22..8e7e3bd9e335 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -184,24 +184,79 @@ static const AspeedSegments aspeed_segments_ast2500_spi2[] = {
 };
 
 static const AspeedSMCController controllers[] = {
-    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_legacy,
-      ASPEED_SOC_SMC_FLASH_BASE, 0x6000000 },
-    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_fmc,
-      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi,
-      ASPEED_SOC_SPI_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.ast2500-fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 3, aspeed_segments_ast2500_fmc,
-      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.ast2500-spi1", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi1,
-      ASPEED_SOC_SPI_FLASH_BASE, 0x8000000 },
-    { "aspeed.smc.ast2500-spi2", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi2,
-      ASPEED_SOC_SPI2_FLASH_BASE, 0x8000000 },
+    {
+        .name              = "aspeed.smc.smc",
+        .r_conf            = R_CONF,
+        .r_ce_ctrl         = R_CE_CTRL,
+        .r_ctrl0           = R_CTRL0,
+        .r_timings         = R_TIMINGS,
+        .conf_enable_w0    = CONF_ENABLE_W0,
+        .max_slaves        = 5,
+        .segments          = aspeed_segments_legacy,
+        .flash_window_base = ASPEED_SOC_SMC_FLASH_BASE,
+        .flash_window_size = 0x6000000,
+        .has_dma           = false,
+    }, {
+        .name              = "aspeed.smc.fmc",
+        .r_conf            = R_CONF,
+        .r_ce_ctrl         = R_CE_CTRL,
+        .r_ctrl0           = R_CTRL0,
+        .r_timings         = R_TIMINGS,
+        .conf_enable_w0    = CONF_ENABLE_W0,
+        .max_slaves        = 5,
+        .segments          = aspeed_segments_fmc,
+        .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
+        .flash_window_size = 0x10000000,
+        .has_dma           = true,
+    }, {
+        .name              = "aspeed.smc.spi",
+        .r_conf            = R_SPI_CONF,
+        .r_ce_ctrl         = 0xff,
+        .r_ctrl0           = R_SPI_CTRL0,
+        .r_timings         = R_SPI_TIMINGS,
+        .conf_enable_w0    = SPI_CONF_ENABLE_W0,
+        .max_slaves        = 1,
+        .segments          = aspeed_segments_spi,
+        .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
+        .flash_window_size = 0x10000000,
+        .has_dma           = false,
+    }, {
+        .name              = "aspeed.smc.ast2500-fmc",
+        .r_conf            = R_CONF,
+        .r_ce_ctrl         = R_CE_CTRL,
+        .r_ctrl0           = R_CTRL0,
+        .r_timings         = R_TIMINGS,
+        .conf_enable_w0    = CONF_ENABLE_W0,
+        .max_slaves        = 3,
+        .segments          = aspeed_segments_ast2500_fmc,
+        .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
+        .flash_window_size = 0x10000000,
+        .has_dma           = true,
+    }, {
+        .name              = "aspeed.smc.ast2500-spi1",
+        .r_conf            = R_CONF,
+        .r_ce_ctrl         = R_CE_CTRL,
+        .r_ctrl0           = R_CTRL0,
+        .r_timings         = R_TIMINGS,
+        .conf_enable_w0    = CONF_ENABLE_W0,
+        .max_slaves        = 2,
+        .segments          = aspeed_segments_ast2500_spi1,
+        .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
+        .flash_window_size = 0x8000000,
+        .has_dma           = false,
+    }, {
+        .name              = "aspeed.smc.ast2500-spi2",
+        .r_conf            = R_CONF,
+        .r_ce_ctrl         = R_CE_CTRL,
+        .r_ctrl0           = R_CTRL0,
+        .r_timings         = R_TIMINGS,
+        .conf_enable_w0    = CONF_ENABLE_W0,
+        .max_slaves        = 2,
+        .segments          = aspeed_segments_ast2500_spi2,
+        .flash_window_base = ASPEED_SOC_SPI2_FLASH_BASE,
+        .flash_window_size = 0x8000000,
+        .has_dma           = false,
+    },
 };
 
 /*
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index c64954f6103f..39ee601940e8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -44,6 +44,7 @@ typedef struct AspeedSMCController {
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
+    bool has_dma;
 } AspeedSMCController;
 
 typedef struct AspeedSMCFlash {
-- 
2.7.4
