Return-Path: <clg@kaod.org>
Received: from 8.mo7.mail-out.ovh.net (8.mo7.mail-out.ovh.net [46.105.77.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fL397BzDvvs
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:02 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 9C8F0207BE
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:59 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 538AF48009B;
 Fri, 18 Nov 2016 15:25:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 21/38] aspeed/smc: adjust the size of the register region
Date: Fri, 18 Nov 2016 15:22:01 +0100
Message-Id: <1479478938-13267-22-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1114359435053337346
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:03 -0000

The SPI controller of the AST2400 SoC does not support DMAs and
segment registers, hence it has less registers. So we can adjust the
size of the memory region holding the registers depending on the
controller type. We can also remove the guest_error logging which is
useless as the range of the region is strict enough.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 23 ++++++++---------------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index c0ae07ef8c96..7d7800d96271 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -135,6 +135,8 @@
 #define R_SPI_MISC_CTRL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
 
+#define R_SPI_MAX         (0x20 / 4)
+
 #define ASPEED_SOC_SMC_FLASH_BASE   0x10000000
 #define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
@@ -221,6 +223,7 @@ static const AspeedSMCController controllers[] = {
         .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
         .has_dma           = true,
+        .nregs             = ASPEED_SMC_R_MAX,
     }, {
         .name              = "aspeed.smc.spi",
         .r_conf            = R_SPI_CONF,
@@ -233,6 +236,7 @@ static const AspeedSMCController controllers[] = {
         .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size = 0x10000000,
         .has_dma           = false,
+        .nregs             = R_SPI_MAX,
     }, {
         .name              = "aspeed.smc.ast2500-fmc",
         .r_conf            = R_CONF,
@@ -245,6 +249,7 @@ static const AspeedSMCController controllers[] = {
         .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
         .has_dma           = true,
+        .nregs             = ASPEED_SMC_R_MAX,
     }, {
         .name              = "aspeed.smc.ast2500-spi1",
         .r_conf            = R_CONF,
@@ -257,6 +262,7 @@ static const AspeedSMCController controllers[] = {
         .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size = 0x8000000,
         .has_dma           = false,
+        .nregs             = ASPEED_SMC_R_MAX,
     }, {
         .name              = "aspeed.smc.ast2500-spi2",
         .r_conf            = R_CONF,
@@ -269,6 +275,7 @@ static const AspeedSMCController controllers[] = {
         .flash_window_base = ASPEED_SOC_SPI2_FLASH_BASE,
         .flash_window_size = 0x8000000,
         .has_dma           = false,
+        .nregs             = ASPEED_SMC_R_MAX,
     },
 };
 
@@ -712,13 +719,6 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
 
     addr >>= 2;
 
-    if (addr >= ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
-        return 0;
-    }
-
     if (addr == s->r_conf ||
         addr == s->r_timings ||
         addr == s->r_ce_ctrl ||
@@ -942,13 +942,6 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
 
     addr >>= 2;
 
-    if (addr >= ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
-        return;
-    }
-
     if (addr == s->r_conf ||
         addr == s->r_timings ||
         addr == s->r_ce_ctrl) {
@@ -1030,7 +1023,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
+                          s->ctrl->name, s->ctrl->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
     /*
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 3ae0a369073d..91bad82e9c65 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -45,6 +45,7 @@ typedef struct AspeedSMCController {
     hwaddr flash_window_base;
     uint32_t flash_window_size;
     bool has_dma;
+    uint32_t nregs;
 } AspeedSMCController;
 
 typedef struct AspeedSMCFlash {
-- 
2.7.4
