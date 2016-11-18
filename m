Return-Path: <clg@kaod.org>
X-Greylist: delayed 111574 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:25:15 AEDT
Received: from 17.mo7.mail-out.ovh.net (17.mo7.mail-out.ovh.net
 [188.165.35.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dR4CbLzDvns
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:14 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C92B1205ED
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:10 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 9676F48009E;
 Fri, 18 Nov 2016 15:25:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 06/38] aspeed: add a memory region for SRAM
Date: Fri, 18 Nov 2016 15:21:46 +0100
Message-Id: <1479478938-13267-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1100567160743168770
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:15 -0000

The size of the SRAM depends on the SoC model, so use a per-soc
definition when creating the region.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 52 +++++++++++++++++++++++++++++++++++++--------
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index bbbbfd13862c..387b712d8fd5 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -29,6 +29,7 @@
 #define ASPEED_SOC_VIC_BASE         0x1E6C0000
 #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
+#define ASPEED_SOC_SRAM_BASE        0x1E720000
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
 #define ASPEED_SOC_I2C_BASE         0x1E78A000
 
@@ -47,15 +48,37 @@ static const char *aspeed_soc_ast2500_typenames[] = {
     "aspeed.smc.ast2500-spi1", "aspeed.smc.ast2500-spi2" };
 
 static const AspeedSoCInfo aspeed_socs[] = {
-    { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE,
-      1, aspeed_soc_ast2400_spi_bases,
-      "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
-    { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE,
-      1, aspeed_soc_ast2400_spi_bases,
-     "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
-    { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BASE,
-      2, aspeed_soc_ast2500_spi_bases,
-      "aspeed.smc.ast2500-fmc", aspeed_soc_ast2500_typenames },
+    {
+        .name         = "ast2400-a0",
+        .cpu_model    = "arm926",
+        .silicon_rev  = AST2400_A0_SILICON_REV,
+        .sdram_base   = AST2400_SDRAM_BASE,
+        .sram_size    = 0x8000,
+        .spis_num     = 1,
+        .spi_bases    = aspeed_soc_ast2400_spi_bases,
+        .fmc_typename = "aspeed.smc.fmc",
+        .spi_typename = aspeed_soc_ast2400_typenames,
+    }, {
+        .name         = "ast2400",
+        .cpu_model    = "arm926",
+        .silicon_rev  = AST2400_A0_SILICON_REV,
+        .sdram_base   = AST2400_SDRAM_BASE,
+        .sram_size    = 0x8000,
+        .spis_num     = 1,
+        .spi_bases    = aspeed_soc_ast2400_spi_bases,
+        .fmc_typename = "aspeed.smc.fmc",
+        .spi_typename = aspeed_soc_ast2400_typenames,
+    }, {
+        .name         = "ast2500-a1",
+        .cpu_model    = "arm1176",
+        .silicon_rev  = AST2500_A1_SILICON_REV,
+        .sdram_base   = AST2500_SDRAM_BASE,
+        .sram_size    = 0x9000,
+        .spis_num     = 2,
+        .spi_bases    = aspeed_soc_ast2500_spi_bases,
+        .fmc_typename = "aspeed.smc.ast2500-fmc",
+        .spi_typename = aspeed_soc_ast2500_typenames,
+    },
 };
 
 /*
@@ -157,6 +180,17 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* SRAM */
+    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
+                           sc->info->sram_size, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    vmstate_register_ram_global(&s->sram);
+    memory_region_add_subregion(get_system_memory(), ASPEED_SOC_SRAM_BASE,
+                                &s->sram);
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 6f1b679c97b1..1ab5deaa0813 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -29,6 +29,7 @@ typedef struct AspeedSoCState {
     /*< public >*/
     ARMCPU cpu;
     MemoryRegion iomem;
+    MemoryRegion sram;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
@@ -46,6 +47,7 @@ typedef struct AspeedSoCInfo {
     const char *cpu_model;
     uint32_t silicon_rev;
     hwaddr sdram_base;
+    uint64_t sram_size;
     int spis_num;
     const hwaddr *spi_bases;
     const char *fmc_typename;
-- 
2.7.4
