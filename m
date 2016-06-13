Return-Path: <clg@kaod.org>
Received: from mo173.mail-out.ovh.net (mo173.mail-out.ovh.net [178.32.228.173])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03c2Ny2zDqcb
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:08 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 93D29FF9B99
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:16:55 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 33BD3380071;
 Mon, 13 Jun 2016 19:16:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 01/10] ast2400: add SMC controllers (FMC and SPI)
Date: Mon, 13 Jun 2016 19:16:27 +0200
Message-Id: <1465838196-31131-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16899476128603736834
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
X-List-Received-Date: Mon, 13 Jun 2016 17:23:09 -0000

The Aspeed AST2400 soc includes a static memory controller for the BMC
which supports NOR, NAND and SPI flash memory modules. This controller
has two modes : the SMC for the legacy interface which supports only
one module and the FMC for the new interface which supports up to five
modules. The AST2400 also includes a SPI only controller used for the
host firmware, commonly called BIOS on Intel. It can be used in three
mode : a SPI master, SPI slave and SPI pass-through

Below is the initial framework for the SMC controller (FMC mode only)
and the SPI controller: the sysbus object, MMIO for registers
configuration and controls. Each controller has a SPI bus and a
configurable number of CS lines for SPI flash slaves.

The differences between the controllers are small, so they are
abstracted using indirections on the register numbers.

Only SPI flash modules are supported.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c            |  31 +++++
 hw/ssi/Makefile.objs        |   1 +
 hw/ssi/aspeed_smc.c         | 300 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h    |   3 +
 include/hw/ssi/aspeed_smc.h |  79 ++++++++++++
 5 files changed, 414 insertions(+)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 4a9de0e10cbc..7ecd0293c841 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -23,6 +23,9 @@
 #define AST2400_UART_5_BASE      0x00184000
 #define AST2400_IOMEM_SIZE       0x00200000
 #define AST2400_IOMEM_BASE       0x1E600000
+#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
+#define AST2400_FMC_BASE         0X1E620000
+#define AST2400_SPI_BASE         0X1E630000
 #define AST2400_VIC_BASE         0x1E6C0000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
@@ -72,6 +75,14 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
     object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
+    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
+
+    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
+    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
+    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
 }
 
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -126,6 +137,26 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
+
+    /* SMC */
+    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
+    object_property_set_bool(OBJECT(&s->smc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
+
+    /* SPI */
+    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
+    object_property_set_bool(OBJECT(&s->spi), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
index fcbb79ef0185..c79a8dcd86a9 100644
--- a/hw/ssi/Makefile.objs
+++ b/hw/ssi/Makefile.objs
@@ -2,6 +2,7 @@ common-obj-$(CONFIG_PL022) += pl022.o
 common-obj-$(CONFIG_SSI) += ssi.o
 common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
 common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
 
 obj-$(CONFIG_OMAP) += omap_spi.o
 obj-$(CONFIG_IMX) += imx_spi.o
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
new file mode 100644
index 000000000000..7937a9030903
--- /dev/null
+++ b/hw/ssi/aspeed_smc.c
@@ -0,0 +1,300 @@
+/*
+ * ASPEED AST2400 SMC Controller (SPI Flash Only)
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "include/qemu/error-report.h"
+#include "exec/address-spaces.h"
+
+#include "hw/ssi/aspeed_smc.h"
+
+/* CE Type Setting Register */
+#define R_CONF            (0x00 / 4)
+#define   CONF_LEGACY_DISABLE  (1 << 31)
+#define   CONF_ENABLE_W4       20
+#define   CONF_ENABLE_W3       19
+#define   CONF_ENABLE_W2       18
+#define   CONF_ENABLE_W1       17
+#define   CONF_ENABLE_W0       16
+#define   CONF_FLASH_TYPE4     9
+#define   CONF_FLASH_TYPE3     7
+#define   CONF_FLASH_TYPE2     5
+#define   CONF_FLASH_TYPE1     3
+#define   CONF_FLASH_TYPE0     1
+
+/* CE Control Register */
+#define R_CE_CTRL            (0x04 / 4)
+#define   CRTL_EXTENDED4       4  /* 32 bit addressing for SPI */
+#define   CRTL_EXTENDED3       3  /* 32 bit addressing for SPI */
+#define   CRTL_EXTENDED2       2  /* 32 bit addressing for SPI */
+#define   CRTL_EXTENDED1       1  /* 32 bit addressing for SPI */
+#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
+
+/* Interrupt Control and Status Register */
+#define R_INTR_CTRL       (0x08 / 4)
+
+/* CEx Control Register */
+#define R_CTRL0           (0x10 / 4)
+#define   CTRL_CMD_SHIFT           16
+#define   CTRL_CMD_MASK            0xff
+#define   CTRL_CE_STOP_ACTIVE      (1 << 2)
+#define   CTRL_CMD_MODE_MASK       0x3
+#define     CTRL_READMODE          0x0
+#define     CTRL_FREADMODE         0x1
+#define     CTRL_WRITEMODE         0x2
+#define     CTRL_USERMODE          0x3
+#define R_CTRL1           (0x14 / 4)
+#define R_CTRL2           (0x18 / 4)
+#define R_CTRL3           (0x1C / 4)
+#define R_CTRL4           (0x20 / 4)
+
+/* CEx Segment Address Register */
+#define R_SEG_ADDR0       (0x30 / 4)
+#define   SEG_SIZE_SHIFT       24   /* 8MB units */
+#define   SEG_SIZE_MASK        0x7f
+#define   SEG_START_SHIFT      16   /* address bit [A29-A23] */
+#define   SEG_START_MASK       0x7f
+#define R_SEG_ADDR1       (0x34 / 4)
+#define R_SEG_ADDR2       (0x38 / 4)
+#define R_SEG_ADDR3       (0x3C / 4)
+#define R_SEG_ADDR4       (0x40 / 4)
+
+/* Misc Control Register #1 */
+#define R_MISC_CRTL1      (0x50 / 4)
+
+/* Misc Control Register #2 */
+#define R_MISC_CRTL2      (0x54 / 4)
+
+/* Misc Control Register #2 */
+#define R_TIMINGS         (0x94 / 4)
+
+/* SPI controller registers and bits */
+#define R_SPI_CONF        (0x00 / 4)
+#define   SPI_CONF_ENABLE_W0   0
+#define R_SPI_CTRL0       (0x4 / 4)
+#define R_SPI_MISC_CRTL   (0x10 / 4)
+#define R_SPI_TIMINGS     (0x14 / 4)
+
+static const AspeedSMCController controllers[] = {
+    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
+      CONF_ENABLE_W0, 5 },
+    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
+      CONF_ENABLE_W0, 5 },
+    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
+      SPI_CONF_ENABLE_W0, 1 },
+};
+
+static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
+}
+
+static void aspeed_smc_update_cs(AspeedSMCState *s)
+{
+    int i;
+
+    for (i = 0; i < s->num_cs; ++i) {
+        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i));
+    }
+}
+
+static void aspeed_smc_reset(DeviceState *d)
+{
+    AspeedSMCState *s = ASPEED_SMC(d);
+    int i;
+
+    memset(s->regs, 0, sizeof s->regs);
+
+    /* Unselect all slaves */
+    for (i = 0; i < s->num_cs; ++i) {
+        s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
+    }
+
+    aspeed_smc_update_cs(s);
+}
+
+static bool aspeed_smc_is_implemented(AspeedSMCState *s, hwaddr addr)
+{
+    return (addr == s->r_conf || addr == s->r_timings || addr == s->r_ce_ctrl ||
+            (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs));
+}
+
+static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    AspeedSMCState *s = ASPEED_SMC(opaque);
+
+    addr >>= 2;
+
+    if (addr >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    if (!aspeed_smc_is_implemented(s, addr)) {
+        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
+                __func__, addr);
+        return 0;
+    }
+
+    return s->regs[addr];
+}
+
+static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
+                             unsigned int size)
+{
+    AspeedSMCState *s = ASPEED_SMC(opaque);
+    uint32_t value = data;
+
+    addr >>= 2;
+
+    if (addr >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    if (!aspeed_smc_is_implemented(s, addr)) {
+        qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    /*
+     * Not much to do apart from storing the value and set the cs
+     * lines if the register is a controlling one.
+     */
+    s->regs[addr] = value;
+    if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        aspeed_smc_update_cs(s);
+    }
+}
+
+static const MemoryRegionOps aspeed_smc_ops = {
+    .read = aspeed_smc_read,
+    .write = aspeed_smc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.unaligned = true,
+};
+
+static int aspeed_smc_init(SysBusDevice *sbd)
+{
+    DeviceState *dev = DEVICE(sbd);
+    AspeedSMCState *s = ASPEED_SMC(dev);
+    AspeedSMCClass *mc = ASPEED_SMC_GET_CLASS(s);
+    int i;
+
+    s->ctrl = mc->ctrl;
+
+    /* keep a copy under AspeedSMCState to speed up accesses */
+    s->r_conf = s->ctrl->r_conf;
+    s->r_ce_ctrl = s->ctrl->r_ce_ctrl;
+    s->r_ctrl0 = s->ctrl->r_ctrl0;
+    s->r_timings = s->ctrl->r_timings;
+    s->conf_enable_w0 = s->ctrl->conf_enable_w0;
+
+    /* Enforce some real HW limits */
+    if (s->num_cs > s->ctrl->max_slaves) {
+        s->num_cs = s->ctrl->max_slaves;
+    }
+
+    s->spi = ssi_create_bus(dev, "spi");
+
+    /* Setup cs_lines for slaves */
+    sysbus_init_irq(sbd, &s->irq);
+    s->cs_lines = g_new0(qemu_irq, s->num_cs);
+    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
+
+    for (i = 0; i < s->num_cs; ++i) {
+        sysbus_init_irq(sbd, &s->cs_lines[i]);
+    }
+
+    aspeed_smc_reset(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
+                          s->ctrl->name, ASPEED_SMC_R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->mmio);
+    return 0;
+}
+
+static const VMStateDescription vmstate_aspeed_smc = {
+    .name = "aspeed.smc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(num_cs, AspeedSMCState),
+        VMSTATE_UINT8(r_conf, AspeedSMCState),
+        VMSTATE_UINT8(r_ctrl0, AspeedSMCState),
+        VMSTATE_UINT8(conf_enable_w0, AspeedSMCState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_smc_properties[] = {
+    DEFINE_PROP_UINT8("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_smc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
+    AspeedSMCClass *mc = ASPEED_SMC_CLASS(klass);
+
+    k->init = aspeed_smc_init;
+    dc->reset = aspeed_smc_reset;
+    dc->props = aspeed_smc_properties;
+    dc->vmsd = &vmstate_aspeed_smc;
+    mc->ctrl = data;
+}
+
+static const TypeInfo aspeed_smc_info = {
+    .name           = TYPE_ASPEED_SMC,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedSMCState),
+    .class_size     = sizeof(AspeedSMCClass),
+    .abstract       = true,
+};
+
+static void aspeed_smc_register_types(void)
+{
+    int i;
+
+    type_register_static(&aspeed_smc_info);
+    for (i = 0; i < ARRAY_SIZE(controllers); ++i) {
+        TypeInfo ti = {
+            .name       = controllers[i].name,
+            .parent     = TYPE_ASPEED_SMC,
+            .class_init = aspeed_smc_class_init,
+            .class_data = (void *)&controllers[i],
+        };
+        type_register(&ti);
+    }
+}
+
+type_init(aspeed_smc_register_types)
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index c05ed5376736..1c6d0d82344c 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -16,6 +16,7 @@
 #include "hw/intc/aspeed_vic.h"
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "hw/ssi/aspeed_smc.h"
 
 typedef struct AST2400State {
     /*< private >*/
@@ -27,6 +28,8 @@ typedef struct AST2400State {
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedSMCState smc;
+    AspeedSMCState spi;
 } AST2400State;
 
 #define TYPE_AST2400 "ast2400"
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
new file mode 100644
index 000000000000..2d3e9f6b46d5
--- /dev/null
+++ b/include/hw/ssi/aspeed_smc.h
@@ -0,0 +1,79 @@
+/*
+ * ASPEED AST2400 SMC Controller (SPI Flash Only)
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef ASPEED_SMC_H
+#define ASPEED_SMC_H
+
+#include "hw/ssi/ssi.h"
+
+typedef struct AspeedSMCController {
+    const char *name;
+    uint8_t r_conf;
+    uint8_t r_ce_ctrl;
+    uint8_t r_ctrl0;
+    uint8_t r_timings;
+    uint8_t conf_enable_w0;
+    uint8_t max_slaves;
+} AspeedSMCController;
+
+#define TYPE_ASPEED_SMC "aspeed.smc"
+#define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_SMC)
+#define ASPEED_SMC_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedSMCClass, (klass), TYPE_ASPEED_SMC)
+#define ASPEED_SMC_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedSMCClass, (obj), TYPE_ASPEED_SMC)
+
+typedef struct  AspeedSMCClass {
+    SysBusDevice parent_obj;
+    const AspeedSMCController *ctrl;
+}  AspeedSMCClass;
+
+#define ASPEED_SMC_R_MAX        (0x100 / 4)
+
+typedef struct AspeedSMCState {
+    SysBusDevice parent_obj;
+
+    const AspeedSMCController *ctrl;
+
+    MemoryRegion mmio;
+
+    qemu_irq irq;
+    int irqline;
+
+    uint8_t num_cs;
+    qemu_irq *cs_lines;
+
+    SSIBus *spi;
+
+    uint32_t regs[ASPEED_SMC_R_MAX];
+
+    /* depends on the controller type */
+    uint8_t r_conf;
+    uint8_t r_ce_ctrl;
+    uint8_t r_ctrl0;
+    uint8_t r_timings;
+    uint8_t conf_enable_w0;
+} AspeedSMCState;
+
+#endif /* ASPEED_SMC_H */
-- 
2.1.4
