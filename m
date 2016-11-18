Return-Path: <clg@kaod.org>
X-Greylist: delayed 162583 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:25:56 AEDT
Received: from 20.mo7.mail-out.ovh.net (20.mo7.mail-out.ovh.net
 [46.105.49.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fD6wHtzDvnt
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:56 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1CF98207C6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:53 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id AAF72480080;
 Fri, 18 Nov 2016 15:25:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 19/38] aspeed/smc: add support for DMAs
Date: Fri, 18 Nov 2016 15:21:59 +0100
Message-Id: <1479478938-13267-20-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1112670584237624066
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:57 -0000

Some of SMC controllers on the Aspeed SoCs support DMA to access the
flash modules. It can operate in a normal mode, to copy to or from the
flash module mapping window, or in a checksum calculation mode, to
evaluate the best clock settings for reads.

When DMA is enabled, a DMA request is built and passed on to a bottom
half to handle the memory transaction. The CPU is notified of the
completion with an IRQ if it was enabled.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 234 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 227 insertions(+), 7 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 24c78aa57537..9596ea94a3bc 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -26,8 +26,10 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
+#include "qemu/coroutine.h"
 #include "include/qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "sysemu/dma.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
@@ -104,10 +106,10 @@
 #define   DMA_CTRL_DELAY_SHIFT  8
 #define   DMA_CTRL_FREQ_MASK    0xf
 #define   DMA_CTRL_FREQ_SHIFT   4
-#define   DMA_CTRL_MODE         (1 << 3)
+#define   DMA_CTRL_CALIB        (1 << 3)
 #define   DMA_CTRL_CKSUM        (1 << 2)
-#define   DMA_CTRL_DIR          (1 << 1)
-#define   DMA_CTRL_EN           (1 << 0)
+#define   DMA_CTRL_WRITE        (1 << 1)
+#define   DMA_CTRL_ENABLE       (1 << 0)
 
 /* DMA Flash Side Address */
 #define R_DMA_FLASH_ADDR  (0x84 / 4)
@@ -136,6 +138,14 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
 
+/*
+ * DMA address and size encoding
+ */
+#define DMA_LENGTH(x)           (((x) & ~0xFE000003))
+#define DMA_DRAM_ADDR(base, x)  (((x) & ~0xE0000003) | base)
+#define DMA_FLASH_ADDR(x)       (((x) & ~0xE0000003) | \
+                                 ASPEED_SOC_FMC_FLASH_BASE)
+
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
 #define SPI_OP_WRDI       0x04    /* Write disable */
@@ -629,9 +639,6 @@ static void aspeed_smc_reset(DeviceState *d)
 
     memset(s->regs, 0, sizeof s->regs);
 
-    /* Pretend DMA is done (u-boot initialization) */
-    s->regs[R_INTR_CTRL] = INTR_CTRL_DMA_STATUS;
-
     /* Unselect all slaves */
     for (i = 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
@@ -675,6 +682,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         addr == s->r_timings ||
         addr == s->r_ce_ctrl ||
         addr == R_INTR_CTRL ||
+        (s->ctrl->has_dma && addr == R_DMA_CTRL) ||
+        (s->ctrl->has_dma && addr == R_DMA_FLASH_ADDR) ||
+        (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) ||
+        (s->ctrl->has_dma && addr == R_DMA_LEN) ||
+        (s->ctrl->has_dma && addr == R_DMA_CHECKSUM) ||
         (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slaves) ||
         (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
         return s->regs[addr];
@@ -685,6 +697,202 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
     }
 }
 
+typedef struct AspeedDmaCo {
+    AspeedSMCState *s;
+    int len;
+    uint32_t flash_addr;
+    uint32_t dram_addr;
+    uint32_t checksum;
+    bool direction;
+} AspeedDmaCo;
+
+static void coroutine_fn aspeed_smc_dma_done(AspeedDmaCo *dmaco)
+{
+    AspeedSMCState *s = dmaco->s;
+
+    s->regs[R_INTR_CTRL] |= INTR_CTRL_DMA_STATUS;
+    if (s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_EN) {
+        qemu_irq_raise(s->irq);
+    }
+}
+
+static bool coroutine_fn aspeed_smc_dma_update(AspeedDmaCo *dmaco)
+{
+    AspeedSMCState *s = dmaco->s;
+    bool ret;
+
+    /* add locking on R_DMA_CTRL ? */
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_ENABLE) {
+        s->regs[R_DMA_FLASH_ADDR] = dmaco->flash_addr;
+        s->regs[R_DMA_DRAM_ADDR] = dmaco->dram_addr;
+        s->regs[R_DMA_LEN] = dmaco->len - 4;
+        s->regs[R_DMA_CHECKSUM] = dmaco->checksum;
+        ret = true;
+    } else {
+        ret = false;
+    }
+
+    return ret;
+}
+
+/*
+ * Accumulate the result of the reads in a register. It will be used
+ * later to do timing calibration.
+ */
+static void coroutine_fn aspeed_smc_dma_checksum(void* opaque)
+{
+    AspeedDmaCo *dmaco = opaque;
+    uint32_t data;
+
+    while (dmaco->len) {
+        /* check for disablement and update register values */
+        if (!aspeed_smc_dma_update(dmaco)) {
+            goto out;
+        }
+
+        cpu_physical_memory_read(dmaco->flash_addr, &data, 4);
+        dmaco->checksum += data;
+        dmaco->flash_addr += 4;
+        dmaco->len -= 4;
+    }
+
+    aspeed_smc_dma_done(dmaco);
+out:
+    g_free(dmaco);
+}
+
+static void coroutine_fn aspeed_smc_dma_rw(void* opaque)
+{
+    AspeedDmaCo *dmaco = opaque;
+    uint32_t data;
+
+    while (dmaco->len) {
+        /* check for disablement and update register values */
+        if (!aspeed_smc_dma_update(dmaco)) {
+            goto out;
+        }
+
+        if (dmaco->direction) {
+            dma_memory_read(&address_space_memory, dmaco->dram_addr, &data, 4);
+            cpu_physical_memory_write(dmaco->flash_addr, &data, 4);
+        } else {
+            cpu_physical_memory_read(dmaco->flash_addr, &data, 4);
+            dma_memory_write(&address_space_memory, dmaco->dram_addr,
+                             &data, 4);
+        }
+
+        dmaco->flash_addr += 4;
+        dmaco->dram_addr += 4;
+        dmaco->len -= 4;
+    }
+
+    aspeed_smc_dma_done(dmaco);
+out:
+    g_free(dmaco);
+}
+
+
+static void aspeed_smc_dma_stop(AspeedSMCState *s)
+{
+    /*
+     * When the DMA is disabled, INTR_CTRL_DMA_STATUS=0 means the
+     * engine is idle
+     */
+    s->regs[R_INTR_CTRL] &= ~INTR_CTRL_DMA_STATUS;
+    s->regs[R_DMA_CHECKSUM] = 0x0;
+    s->regs[R_DMA_FLASH_ADDR] = 0;
+    s->regs[R_DMA_DRAM_ADDR] = 0;
+    s->regs[R_DMA_LEN] = 0;
+
+    /*
+     * Lower DMA irq even in any case. The IRQ control register could
+     * have been cleared before disabling the DMA.
+     */
+    qemu_irq_lower(s->irq);
+}
+
+typedef struct AspeedDmaRequest {
+    Coroutine *co;
+    QEMUBH *bh;
+} AspeedDmaRequest;
+
+static void aspeed_smc_dma_run(void *opaque)
+{
+    AspeedDmaRequest *dmareq = opaque;
+
+    qemu_coroutine_enter(dmareq->co);
+    qemu_bh_delete(dmareq->bh);
+    g_free(dmareq);
+}
+
+static void aspeed_smc_dma_schedule(Coroutine *co)
+{
+    AspeedDmaRequest *dmareq;
+
+    dmareq = g_new0(AspeedDmaRequest, 1);
+
+    dmareq->co = co;
+    dmareq->bh = qemu_bh_new(aspeed_smc_dma_run, dmareq);
+    qemu_bh_schedule(dmareq->bh);
+}
+
+static void aspeed_smc_dma_start(void *opaque)
+{
+    AspeedSMCState *s = opaque;
+    AspeedDmaCo *dmaco;
+    Coroutine *co;
+
+    /* freed in the coroutine */
+    dmaco = g_new0(AspeedDmaCo, 1);
+
+    /* A DMA transaction has a minimum of 4 bytes */
+    dmaco->len        = s->regs[R_DMA_LEN] + 4;
+    dmaco->flash_addr = s->regs[R_DMA_FLASH_ADDR];
+    dmaco->dram_addr  = s->regs[R_DMA_DRAM_ADDR];
+    dmaco->direction  = (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE);
+    dmaco->s          = s;
+
+    if (s->regs[R_DMA_CTRL] & DMA_CTRL_CKSUM) {
+        co = qemu_coroutine_create(aspeed_smc_dma_checksum, dmaco);
+    } else {
+        co = qemu_coroutine_create(aspeed_smc_dma_rw, dmaco);
+    }
+
+    aspeed_smc_dma_schedule(co);
+}
+
+/*
+ * This is to run one DMA at a time. When INTR_CTRL_DMA_STATUS becomes
+ * 1, the DMA has completed and a new DMA can start even if the result
+ * of the previous was not collected.
+ */
+static bool aspeed_smc_dma_in_progress(AspeedSMCState *s)
+{
+    bool ret = (s->regs[R_DMA_CTRL] & DMA_CTRL_ENABLE) &&
+        !(s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_STATUS);
+    return ret;
+}
+
+static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
+{
+    if (dma_ctrl & DMA_CTRL_ENABLE) {
+        /* add locking on R_DMA_CTRL ? */
+        if (aspeed_smc_dma_in_progress(s)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA in progress\n",
+                          __func__);
+            return;
+        }
+
+        s->regs[R_DMA_CTRL] = dma_ctrl;
+
+        aspeed_smc_dma_start(s);
+    } else {
+        s->regs[R_DMA_CTRL] = dma_ctrl;
+
+        aspeed_smc_dma_stop(s);
+    }
+}
+
 static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned int size)
 {
@@ -715,6 +923,16 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
         if (value != s->regs[R_SEG_ADDR0 + cs]) {
             aspeed_smc_flash_set_segment(s, cs, value);
         }
+    } else if (addr == R_INTR_CTRL) {
+        s->regs[addr] = value;
+    } else if (s->ctrl->has_dma && addr == R_DMA_CTRL) {
+        aspeed_smc_dma_ctrl(s, value);
+    } else if (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) {
+        s->regs[addr] = DMA_DRAM_ADDR(s->sdram_base, value);
+    } else if (s->ctrl->has_dma && addr == R_DMA_FLASH_ADDR) {
+        s->regs[addr] = DMA_FLASH_ADDR(value);
+    } else if (s->ctrl->has_dma && addr == R_DMA_LEN) {
+        s->regs[addr] = DMA_LENGTH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
                       __func__, addr);
@@ -747,6 +965,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     s->r_timings = s->ctrl->r_timings;
     s->conf_enable_w0 = s->ctrl->conf_enable_w0;
 
+    /* DMA irq */
+    sysbus_init_irq(sbd, &s->irq);
+
     /* Enforce some real HW limits */
     if (s->num_cs > s->ctrl->max_slaves) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
@@ -757,7 +978,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     s->spi = ssi_create_bus(dev, "spi");
 
     /* Setup cs_lines for slaves */
-    sysbus_init_irq(sbd, &s->irq);
     s->cs_lines = g_new0(qemu_irq, s->num_cs);
     ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
 
-- 
2.7.4
