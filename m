Return-Path: <clg@kaod.org>
Received: from 17.mo7.mail-out.ovh.net (17.mo7.mail-out.ovh.net
 [188.165.35.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dy4ftKzDvnt
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:42 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id EF73020621
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:39 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id A7C5248009A;
 Fri, 18 Nov 2016 15:25:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 15/38] aspeed/smc: handle SPI flash Command mode
Date: Fri, 18 Nov 2016 15:21:55 +0100
Message-Id: <1479478938-13267-16-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1108729934333119234
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:43 -0000

The Aspeed SMC controllers have a mode (Command mode) in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

However, accesses are restricted to the segment window assigned the
the flash module by the controller. This window is defined by the
Segment Address Register.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 162 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 72a44150b0a1..eec087199a22 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -69,6 +69,7 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -135,6 +136,16 @@
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
 #define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
 
+/* Flash opcodes. */
+#define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
+#define SPI_OP_WRDI       0x04    /* Write disable */
+#define SPI_OP_RDSR       0x05    /* Read status register */
+#define SPI_OP_WREN       0x06    /* Write enable */
+
+/* Used for Macronix and Winbond flashes. */
+#define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
+#define SPI_OP_EX4B       0xe9    /* Exit 4-byte mode */
+
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
     return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
 }
 
+static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+    int cmd = (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
+
+    /* This is the default value for read mode. In other modes, the
+     * command should be defined */
+    if (aspeed_smc_flash_mode(fl) == CTRL_READMODE) {
+        cmd = SPI_OP_READ;
+    }
+
+    if (!cmd) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no command defined for mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
+    }
+
+    return cmd;
+}
+
+static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+
+    if (s->ctrl->segments == aspeed_segments_spi) {
+        return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
+    } else {
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
+    }
+}
+
+static void aspeed_smc_flash_select(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+
+    s->regs[s->r_ctrl0 + fl->id] &= ~CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static void aspeed_smc_flash_unselect(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+
+    s->regs[s->r_ctrl0 + fl->id] |= CTRL_CE_STOP_ACTIVE;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
+}
+
+static uint32_t aspeed_smc_check_segment_addr(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl->controller;
+    AspeedSegments seg;
+
+    aspeed_smc_reg_to_segment(s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    if ((addr & (seg.size - 1)) != addr) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid address 0x%08x for CS%d segment : "
+                      "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
+                      s->ctrl->name, addr, fl->id, seg.addr,
+                      seg.addr + seg.size);
+    }
+
+    addr &= seg.size - 1;
+    return addr;
+}
+
+static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl->controller;
+    uint8_t cmd = aspeed_smc_flash_cmd(fl);
+
+    /*
+     * To be checked: I am not sure the Aspeed SPI controller needs to
+     * enable writes when running in READ/FREAD command mode
+     */
+
+    /* access can not exceed CS segment */
+    addr = aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s->spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, (addr >> 24) & 0xff);
+    }
+    ssi_transfer(s->spi, (addr >> 16) & 0xff);
+    ssi_transfer(s->spi, (addr >> 8) & 0xff);
+    ssi_transfer(s->spi, (addr & 0xff));
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSMCFlash *fl = opaque;
@@ -364,19 +467,55 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     uint64_t ret = 0;
     int i;
 
-    if (aspeed_smc_is_usermode(fl)) {
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
         for (i = 0; i < size; i++) {
             ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
         }
-    } else {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        ret = -1;
+        break;
+    case CTRL_READMODE:
+    case CTRL_FREADMODE:
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_read(fl, addr);
+
+        for (i = 0; i < size; i++) {
+            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+        }
+
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
 
     return ret;
 }
 
+static void aspeed_smc_flash_setup_write(AspeedSMCFlash *fl, uint32_t addr)
+{
+    AspeedSMCState *s = fl->controller;
+    uint8_t cmd = aspeed_smc_flash_cmd(fl);
+
+    /* Flash access can not exceed CS segment */
+    addr = aspeed_smc_check_segment_addr(fl, addr);
+
+    /* TODO: do we have to send 4BYTE each time ? */
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, SPI_OP_EN4B);
+    }
+
+    ssi_transfer(s->spi, SPI_OP_WREN);
+    ssi_transfer(s->spi, cmd);
+
+    if (aspeed_smc_flash_is_4byte(fl)) {
+        ssi_transfer(s->spi, (addr >> 24) & 0xff);
+    }
+    ssi_transfer(s->spi, (addr >> 16) & 0xff);
+    ssi_transfer(s->spi, (addr >> 8) & 0xff);
+    ssi_transfer(s->spi, (addr & 0xff));
+}
+
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
 {
@@ -390,14 +529,25 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
         return;
     }
 
-    if (!aspeed_smc_is_usermode(fl)) {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        return;
-    }
+    switch (aspeed_smc_flash_mode(fl)) {
+    case CTRL_USERMODE:
+        for (i = 0; i < size; i++) {
+            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        }
+        break;
+    case CTRL_WRITEMODE:
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup_write(fl, addr);
+
+        for (i = 0; i < size; i++) {
+            ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        }
 
-    for (i = 0; i < size; i++) {
-        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+        aspeed_smc_flash_unselect(fl);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid flash mode %d\n",
+                      __func__, aspeed_smc_flash_mode(fl));
     }
 }
 
-- 
2.7.4
