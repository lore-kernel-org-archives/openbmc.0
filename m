Return-Path: <clg@kaod.org>
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfcQK211jzDqvF
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 19:12:40 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2987CFF94BB
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 11:03:15 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 359274400C2;
 Wed, 29 Jun 2016 11:03:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu] ast2400: add a memory controller device model
Date: Wed, 29 Jun 2016 11:03:00 +0200
Message-Id: <1467190980-9353-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10291288102758812418
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 09:12:41 -0000

The uboot in the previous release of the SDK was using a hardcoded
value for memory size. This is not true anymore, the value is now
retrieved from the memory controller.

Below is a model for this device, only supporting unlock and
configuration. Without it, we endup running a guest with 64MB, which
is a bit low nowdays.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c              |  13 +++++
 hw/misc/Makefile.objs         |   2 +-
 hw/misc/aspeed_sdmc.c         | 126 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h      |   2 +
 include/hw/misc/aspeed_sdmc.h |  49 ++++++++++++++++
 5 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_sdmc.c
 create mode 100644 include/hw/misc/aspeed_sdmc.h

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index fcfa8e2fcff8..f08417c50ad0 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -28,6 +28,7 @@
 #define AST2400_FMC_BASE         0X1E620000
 #define AST2400_SPI_BASE         0X1E630000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SDMC_BASE        0x1E6E0000
 #define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
@@ -106,6 +107,10 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
     object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
     qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
+
+    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
+    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -214,6 +219,14 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0, AST2400_ETH1_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 2));
+
+    /* SDMC - SDRAM Memory Controller */
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 517c5fa0a4ce..2a8b6f1b978e 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -53,4 +53,4 @@ obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += aux.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
new file mode 100644
index 000000000000..52b6393b3f0b
--- /dev/null
+++ b/hw/misc/aspeed_sdmc.c
@@ -0,0 +1,126 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/aspeed_sdmc.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+/* Protection Key Register */
+#define R_PROT            (0x00 / 4)
+#define   PROT_KEY_UNLOCK     0xFC600309
+
+/* Configuration Register */
+#define R_CONF            (0x04 / 4)
+
+static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
+{
+    AspeedSDMCState *s = ASPEED_SDMC(opaque);
+
+    addr >>= 2;
+
+    if (addr >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    return s->regs[addr];
+}
+
+static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
+                             unsigned int size)
+{
+    AspeedSDMCState *s = ASPEED_SDMC(opaque);
+
+    addr >>= 2;
+
+    if (addr >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    if (addr != R_PROT && s->regs[R_PROT] != PROT_KEY_UNLOCK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
+        return;
+    }
+
+    s->regs[addr] = data;
+}
+
+static const MemoryRegionOps aspeed_sdmc_ops = {
+    .read = aspeed_sdmc_read,
+    .write = aspeed_sdmc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_sdmc_reset(DeviceState *dev)
+{
+    AspeedSDMCState *s = ASPEED_SDMC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->regs[R_CONF] = s->config;
+}
+
+static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedSDMCState *s = ASPEED_SDMC(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
+                          TYPE_ASPEED_SDMC, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_sdmc = {
+    .name = "aspeed.sdmc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSDMCState, ASPEED_SDMC_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_sdmc_properties[] = {
+    DEFINE_PROP_UINT32("configuration", AspeedSDMCState, config,
+                       ASPEED_SDMC_256MB),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_sdmc_realize;
+    dc->reset = aspeed_sdmc_reset;
+    dc->desc = "ASPEED SDRAM Memory Controller";
+    dc->vmsd = &vmstate_aspeed_sdmc;
+    dc->props = aspeed_sdmc_properties;
+}
+
+static const TypeInfo aspeed_sdmc_info = {
+    .name = TYPE_ASPEED_SDMC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedSDMCState),
+    .class_init = aspeed_sdmc_class_init,
+};
+
+static void aspeed_sdmc_register_types(void)
+{
+    type_register_static(&aspeed_sdmc_info);
+}
+
+type_init(aspeed_sdmc_register_types);
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index a1aa20a8abb9..d3a840f8c3ee 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -19,6 +19,7 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/net/ftgmac100.h"
+#include "hw/misc/aspeed_sdmc.h"
 
 typedef struct AST2400State {
     /*< private >*/
@@ -34,6 +35,7 @@ typedef struct AST2400State {
     AspeedSMCState smc;
     AspeedSMCState spi;
     Ftgmac100State ftgmac100;
+    AspeedSDMCState sdmc;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
new file mode 100644
index 000000000000..65fefebdb2cd
--- /dev/null
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -0,0 +1,49 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_SDMC_H
+#define ASPEED_SDMC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SDMC "aspeed.sdmc"
+#define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
+
+#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
+
+typedef struct AspeedSDMCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SDMC_NR_REGS];
+    uint32_t config;
+
+} AspeedSDMCState;
+
+/*
+ * For Aspeed AST2400 SOC
+ */
+#define ASPEED_SDMC_64MB    0x0
+#define ASPEED_SDMC_128MB   0x1
+#define ASPEED_SDMC_256MB   0x2
+#define ASPEED_SDMC_512MB   0x3
+
+/*
+ * For Aspeed AST2500 SOC and higher revision number
+ */
+#define ASPEED_SDMC_NEW_VERSION  (1 << 28)
+
+#define ASPEED_SDMC_NEW_128MB   (0x0 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_256MB   (0x1 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_512MB   (0x2 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_1024MB  (0x3 | ASPEED_SDMC_NEW_VERSION)
+
+#endif /* ASPEED_SDMC_H */
-- 
2.1.4
