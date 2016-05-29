Return-Path: <clg@kaod.org>
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2b2B1PzDqPD
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:38 +1000 (AEST)
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:36 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:35 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id D2FAD17D805A
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:40 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
 [9.149.37.212])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKZY816384486
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:35 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKYrM013553
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:34 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKYXr013550; Sun, 29 May 2016 15:20:34 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id B2DA9220164;
 Sun, 29 May 2016 23:20:33 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 10/12] ast2400: add a BT device
Date: Sun, 29 May 2016 23:20:03 +0200
Message-Id: <1464556805-4340-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0009-0000-0000-0000188278FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Sun, 29 May 2016 21:20:40 -0000

This is an dummy empty shell for the moment. The plan would be to plug
this device in the IPMI framework already available in qemu and work
on a backend to connect it to an external host (a powernv guest) or a
ipmi-host simulator.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c            |  17 +++++
 hw/misc/Makefile.objs       |   2 +-
 hw/misc/aspeed_bt.c         | 175 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h    |   2 +
 include/hw/misc/aspeed_bt.h |  31 ++++++++
 5 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_bt.c
 create mode 100644 include/hw/misc/aspeed_bt.h

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 8f678983cee5..a4a7c10e4361 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -29,6 +29,8 @@
 #define AST2400_VIC_BASE         0x1E6C0000
 #define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
+#define AST2400_LPC_BASE         0x1E789000
+#define AST2400_IBT_BASE         (AST2400_LPC_BASE + 0x140)
 #define AST2400_I2C_BASE         0x1E78A000
 
 static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
@@ -88,6 +90,11 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->spi, sizeof(s->spi), TYPE_ASPEED_SMC);
     object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
     qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
+     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->bt, sizeof(s->bt), TYPE_ASPEED_BT);
+    object_property_add_child(obj, "bt", OBJECT(&s->bt), NULL);
+    qdev_set_parent_bus(DEVICE(&s->bt), sysbus_get_default());
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -204,6 +211,16 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
+
+    /* iBT */
+    object_property_set_bool(OBJECT(&s->bt), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->bt), 0, AST2400_IBT_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->bt), 0,
+                       qdev_get_gpio_in(DEVICE(&s->vic), 10));
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index e50596965b03..b2931f85f097 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -51,4 +51,4 @@ obj-$(CONFIG_MIPS_ITU) += mips_itu.o
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_bt.o
diff --git a/hw/misc/aspeed_bt.c b/hw/misc/aspeed_bt.c
new file mode 100644
index 000000000000..496c9aa0be4a
--- /dev/null
+++ b/hw/misc/aspeed_bt.c
@@ -0,0 +1,175 @@
+/*
+ * ASPEED iBT Device
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <inttypes.h>
+#include "hw/misc/aspeed_bt.h"
+#include "hw/qdev-properties.h"
+#include "qemu/bitops.h"
+#include "trace.h"
+
+#ifdef ASPEED_BT_DEBUG
+#define DB_PRINT(fmt, ...) do {         \
+        fprintf(stderr,  "%s: " fmt, __func__, ## __VA_ARGS__);  \
+    } while (0);
+#else
+    #define DB_PRINT(...) do {} while (0)
+#endif
+
+#define BT_IO_REGION_SIZE 0x1C
+
+#define TO_REG(o) (o >> 2)
+
+#define BT_CR0                0x0
+#define   BT_CR0_IO_BASE         16
+#define   BT_CR0_IRQ             12
+#define   BT_CR0_EN_CLR_SLV_RDP  0x8
+#define   BT_CR0_EN_CLR_SLV_WRP  0x4
+#define   BT_CR0_ENABLE_IBT      0x1
+#define BT_CR1                0x4
+#define   BT_CR1_IRQ_H2B         0x01
+#define   BT_CR1_IRQ_HBUSY       0x40
+#define BT_CR2                0x8
+#define   BT_CR2_IRQ_H2B         0x01
+#define   BT_CR2_IRQ_HBUSY       0x40
+#define BT_CR3                0xc
+#define BT_CTRL                  0x10
+#define   BT_CTRL_B_BUSY         0x80
+#define   BT_CTRL_H_BUSY         0x40
+#define   BT_CTRL_OEM0           0x20
+#define   BT_CTRL_SMS_ATN        0x10
+#define   BT_CTRL_B2H_ATN        0x08
+#define   BT_CTRL_H2B_ATN        0x04
+#define   BT_CTRL_CLR_RD_PTR     0x02
+#define   BT_CTRL_CLR_WR_PTR     0x01
+#define BT_BMC2HOST            0x14
+#define BT_INTMASK             0x18
+#define   BT_INTMASK_B2H_IRQEN   0x01
+#define   BT_INTMASK_B2H_IRQ     0x02
+#define   BT_INTMASK_BMC_HWRST   0x80
+
+static uint64_t aspeed_bt_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedBTState *s = ASPEED_BT(opaque);
+
+    DB_PRINT("To 0x%" HWADDR_PRIx " of size %u\n", offset, size);
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case 0x00 ... 0x18:
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Read from uninitialised register 0x%"
+                      HWADDR_PRIx "\n", __func__, offset);
+        break;
+    }
+
+    return s->regs[TO_REG(offset)];
+}
+
+static void aspeed_bt_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedBTState *s = ASPEED_BT(opaque);
+
+    DB_PRINT("To 0x%" HWADDR_PRIx " of size %u: 0x%" PRIx64"\n",
+             offset, size, data);
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (offset) {
+    case 0x00 ... 0x18:
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Write to uninitialised register 0x%"
+                      HWADDR_PRIx "\n", __func__, offset);
+        break;
+    }
+
+    s->regs[TO_REG(offset)] = (uint32_t) data;
+}
+
+static const MemoryRegionOps aspeed_bt_ops = {
+    .read = aspeed_bt_read,
+    .write = aspeed_bt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_bt_reset(DeviceState *dev)
+{
+    AspeedBTState *s = ASPEED_BT(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_bt_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedBTState *s = ASPEED_BT(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_bt_ops, s,
+                          TYPE_ASPEED_BT, BT_IO_REGION_SIZE);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static Property aspeed_bt_props[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_aspeed_bt = {
+    .name = "aspeed.bt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedBTState, ASPEED_BT_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_bt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_bt_realize;
+    dc->reset = aspeed_bt_reset;
+    dc->desc = "ASPEED iBT Device";
+    dc->vmsd = &vmstate_aspeed_bt;
+    dc->props = aspeed_bt_props;
+}
+
+static const TypeInfo aspeed_bt_info = {
+    .name = TYPE_ASPEED_BT,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedBTState),
+    .class_init = aspeed_bt_class_init,
+};
+
+static void aspeed_bt_register_types(void)
+{
+    type_register_static(&aspeed_bt_info);
+}
+
+type_init(aspeed_bt_register_types);
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index 9ba4245619c1..2b517e89eeea 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -18,6 +18,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_bt.h"
 
 typedef struct AST2400State {
     /*< private >*/
@@ -33,6 +34,7 @@ typedef struct AST2400State {
     AspeedI2CState i2c;
     AspeedSMCState smc;
     AspeedSMCState spi;
+    AspeedBTState bt;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
diff --git a/include/hw/misc/aspeed_bt.h b/include/hw/misc/aspeed_bt.h
new file mode 100644
index 000000000000..1e9aa9510959
--- /dev/null
+++ b/include/hw/misc/aspeed_bt.h
@@ -0,0 +1,31 @@
+/*
+ * ASPEED iBT Device
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_BT_H
+#define ASPEED_BT_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_BT "aspeed.bt"
+#define ASPEED_BT(obj) OBJECT_CHECK(AspeedBTState, (obj), TYPE_ASPEED_BT)
+
+#define ASPEED_BT_NR_REGS (0x1C >> 2)
+
+typedef struct AspeedBTState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_BT_NR_REGS];
+
+} AspeedBTState;
+
+#endif /* ASPEED_BT_H */
-- 
2.1.4
