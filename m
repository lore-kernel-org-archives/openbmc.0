Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fJ05QnzDvns
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:59 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 508A8207C0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:56 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 0E6AA4800A3;
 Fri, 18 Nov 2016 15:25:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 20/38] aspeed/smc: handle dummy bytes when doing fast
 reads
Date: Fri, 18 Nov 2016 15:22:00 +0100
Message-Id: <1479478938-13267-21-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1113515011499854594
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:00 -0000

When doing fast read, a certain amount of dummy bytes should be sent
before the read. This number is configurable in the controler CE0
Control Register and needs to be modeled using fake transfers the
flash module.

When the controller is configured for Command mode, the SPI command
used to do the read is stored in the CE0 control register but, in User
mode, we need to snoop into the flow of bytes to catch the command. It
should be the first byte after CS select.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 57 ++++++++++++++++++++++++++++++++++++++-------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9596ea94a3bc..c0ae07ef8c96 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -71,7 +71,9 @@
 #define R_CTRL0           (0x10 / 4)
 #define   CTRL_CMD_SHIFT           16
 #define   CTRL_CMD_MASK            0xff
+#define   CTRL_DUMMY_HIGH_SHIFT    14
 #define   CTRL_AST2400_SPI_4BYTE   (1 << 13)
+#define   CTRL_DUMMY_LOW_SHIFT     6
 #define   CTRL_CE_STOP_ACTIVE      (1 << 2)
 #define   CTRL_CMD_MODE_MASK       0x3
 #define     CTRL_READMODE          0x0
@@ -151,6 +153,7 @@
 #define SPI_OP_WRDI       0x04    /* Write disable */
 #define SPI_OP_RDSR       0x05    /* Read status register */
 #define SPI_OP_WREN       0x06    /* Write enable */
+#define SPI_OP_READ_FAST  0x0b    /* Read data bytes (high frequency) */
 
 /* Used for Macronix and Winbond flashes. */
 #define SPI_OP_EN4B       0xb7    /* Enter 4-byte mode */
@@ -510,6 +513,12 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
     /* access can not exceed CS segment */
     addr = aspeed_smc_check_segment_addr(fl, addr);
 
+    /*
+     * Remember command as we might need to send dummy bytes before
+     * reading data
+     */
+    fl->cmd = cmd;
+
     /* TODO: do we have to send 4BYTE each time ? */
     if (aspeed_smc_flash_is_4byte(fl)) {
         ssi_transfer(s->spi, SPI_OP_EN4B);
@@ -525,27 +534,49 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
     ssi_transfer(s->spi, (addr & 0xff));
 }
 
+static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->id];
+
+    return ((((r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1) << 2) |
+            ((r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3)) * 8;
+}
+
+static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned size)
+{
+    AspeedSMCState *s = fl->controller;
+    uint64_t ret = 0;
+    int i;
+
+    if (fl->cmd == SPI_OP_READ_FAST) {
+        for (i = 0; i < aspeed_smc_flash_dummies(fl); i++) {
+            ssi_transfer(s->spi, 0x0);
+        }
+    }
+    fl->cmd = 0;
+
+    for (i = 0; i < size; i++) {
+        ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
+    }
+    return ret;
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSMCFlash *fl = opaque;
-    const AspeedSMCState *s = fl->controller;
     uint64_t ret = 0;
-    int i;
 
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
-        for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
-        }
+        ret = aspeed_smc_flash_do_read(fl, size);
         break;
     case CTRL_READMODE:
     case CTRL_FREADMODE:
         aspeed_smc_flash_select(fl);
         aspeed_smc_flash_setup_read(fl, addr);
 
-        for (i = 0; i < size; i++) {
-            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
-        }
+        ret = aspeed_smc_flash_do_read(fl, size);
 
         aspeed_smc_flash_unselect(fl);
         break;
@@ -596,6 +627,15 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
+        /*
+         * First write after chip select is the chip command. Remember
+         * it as we might need to send dummy bytes before reading
+         * data. It will be reseted when the chip is unselected.
+         */
+        if (!fl->cmd) {
+            fl->cmd = data & 0xff;
+        }
+
         for (i = 0; i < size; i++) {
             ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
         }
@@ -629,6 +669,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
 static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
     AspeedSMCState *s = fl->controller;
+    fl->cmd = 0;
     qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
 
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 88a904849801..3ae0a369073d 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,6 +52,7 @@ typedef struct AspeedSMCFlash {
 
     uint8_t id;
     uint32_t size;
+    uint8_t cmd;
 
     MemoryRegion mmio;
     DeviceState *flash;
-- 
2.7.4
