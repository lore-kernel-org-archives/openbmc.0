Return-Path: <clg@kaod.org>
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03Y180czDqZn
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:05 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 54D40FF9D30
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:17 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 17E6738006E;
 Mon, 13 Jun 2016 19:17:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 06/10] ast2400: handle SPI flash Command mode (read
 only)
Date: Mon, 13 Jun 2016 19:16:32 +0200
Message-Id: <1465838196-31131-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16905668579416247042
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 17:23:05 -0000

To handle memory accesses when the SPI flash slave is configured in
Command mode, let's change the memory region of the SPI flash object
to a ROM memory region (like the pflash_cfi* object). The m25p80 flash
object creation is changed accordingly to use the new memory region as
a storage.

Only read only accesses are handled. Supporting write accesses would
demand using internal routines of the m25p80 flash model. This is not
required for the moment.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 63 +++++++++++++++++++++++++++++++++++++++++----
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ce59cb59be9f..8be00412b5b1 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -23,11 +23,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "include/qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "hw/block/flash.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
@@ -225,6 +227,12 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
      */
     s->regs[addr] = value;
     if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        int i;
+
+        for (i = 0; i < s->num_cs; ++i) {
+            memory_region_rom_device_set_romd(&s->flashes[i]->mmio,
+                                              !aspeed_smc_is_usermode(s, i));
+        }
         aspeed_smc_update_cs(s);
     }
 }
@@ -335,6 +343,35 @@ static void aspeed_smc_register_types(void)
 
 type_init(aspeed_smc_register_types)
 
+/* Sanity checks on the command mode and the SPI flash command being
+ * used */
+static inline bool aspeed_smc_check_mode(AspeedSMCState *s, int cs)
+{
+    uint8_t mode = aspeed_smc_flash_mode(s, cs);
+    uint8_t cmd = (s->regs[s->r_ctrl0 + cs] >> CTRL_CMD_SHIFT) && CTRL_CMD_MASK;
+    bool ret;
+
+    switch (mode) {
+    case CTRL_READMODE:
+        ret = (cmd == 0x3 || cmd == 0x0);
+        break;
+    case CTRL_FREADMODE:
+        ret = true;
+        break;
+    case CTRL_WRITEMODE:
+    default:
+        ret = false;
+        break;
+    }
+
+    if (!ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mode/command: %d/%d\n",
+                      __func__, cmd, mode);
+    }
+
+    return ret;
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(opaque);
@@ -347,8 +384,11 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
             ret = (ret << 8) | ssi_transfer(s->spi, 0x0);
         }
     } else {
-        error_report("%s: flash not in usermode", __func__);
-        ret = -1;
+        if (aspeed_smc_check_mode(s, fl->id)) {
+            for (i = 0; i < size; i++) {
+                ret = (ret << 8) | fl->storage[addr + i];
+            }
+        }
     }
 
     return ret;
@@ -422,6 +462,7 @@ void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
 {
     int i ;
     char name[32];
+    Error *err = NULL;
 
     for (i = 0; i < s->num_cs; ++i) {
         Object *obj = object_new(TYPE_ASPEED_SMC_FLASH);
@@ -437,12 +478,24 @@ void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
         fl->size = s->ctrl->segments[i].size;
 
         /* backing region */
-        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl, name,
-                              fl->size);
+        memory_region_init_rom_device(&fl->mmio, obj, &aspeed_smc_flash_ops,
+                                      fl, name, fl->size, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        vmstate_register_ram(&fl->mmio, DEVICE(fl));
         sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
 
+        fl->storage = memory_region_get_ram_ptr(&fl->mmio);
+
         /* SPI Flash module */
-        fl->flash = ssi_create_slave(s->spi, flashtype);
+        fl->flash = m25p80_create_rom(s->spi, flashtype, &fl->mmio, &err);
+        if (err) {
+            vmstate_unregister_ram(&fl->mmio, DEVICE(fl));
+            error_propagate(errp, err);
+            return;
+        }
         cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
         sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
 
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 2636c775c90f..069891b0bd5a 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -35,6 +35,7 @@ typedef struct AspeedSMCFlashState {
     MemoryRegion mmio;
     uint8_t id;
     size_t size;
+    uint8_t *storage;
     struct AspeedSMCState *controller;
     DeviceState *flash;
 } AspeedSMCFlashState;
-- 
2.1.4
