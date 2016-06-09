Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQJ4b5QRTzDqFJ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 18:14:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=b+6174yt; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 08C9931A070;
 Thu,  9 Jun 2016 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 dxjkZkRBt+2wZH0ypOr5eNJeUd4=; b=b+6174yt0w76mDESZyX52afMjf09KRLQ
 y2PfgTajxJDwU7QlGSXSHZqAn1iAsoelAJhyXSXv+Q1rpDFHx1Tr2RVuarKb0Y/E
 B/YS1xtM/urx8PfUqO/NZElg9a6iB/pL112EwPrWPi5wkJQZym9SFUNq2dXGmflu
 TMKcDNctthU=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id 68D9A31A061;
 Thu,  9 Jun 2016 01:14:36 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu 1/2] hw/misc: Add a model for the ASPEED System Control
 Unit
Date: Thu,  9 Jun 2016 17:44:05 +0930
Message-Id: <1465460046-7692-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 09 Jun 2016 08:14:40 -0000

The SCU is a collection of chip-level control registers that manage the
various functions supported by the AST2400. Typically the bits control
interactions with clocks, external hardware or reset behaviour, and we
can largly take a hands-off approach to reads and writes.

Firmware makes heavy use of the state to determine how to boot, but the
reset values vary from SoC to SoC. Object properties are exposed so
that the integrating SoC model can configure the appropriate reset
values.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 295 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_scu.h | 105 +++++++++++++++
 trace-events                 |   3 +
 4 files changed, 404 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index bc0dd2cc7567..4895e950b377 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -51,3 +51,4 @@ obj-$(CONFIG_MIPS_ITU) += mips_itu.o
 obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
new file mode 100644
index 000000000000..ae5a4c590bb6
--- /dev/null
+++ b/hw/misc/aspeed_scu.c
@@ -0,0 +1,295 @@
+/*
+ * ASPEED System Control Unit
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <inttypes.h>
+#include "hw/misc/aspeed_scu.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/bitops.h"
+#include "trace.h"
+
+#define SCU_KEY 0x1688A8A8
+#define SCU_IO_REGION_SIZE 0x20000
+
+#define TO_REG(o) ((o) >> 2)
+#define TO_REG_ID(o) [TO_REG(o)] = stringify(o)
+
+static const char *aspeed_scu_reg_ids[ASPEED_SCU_NR_REGS] = {
+    TO_REG_ID(ASPEED_SCU_PROT_KEY),
+    TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
+    TO_REG_ID(ASPEED_SCU_CLK_SEL),
+    TO_REG_ID(ASPEED_SCU_CLK_STOP_CTRL),
+    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_CTRL),
+    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_EVAL),
+    TO_REG_ID(ASPEED_SCU_IRQ_CTRL),
+    TO_REG_ID(ASPEED_SCU_D2PLL_PARAM),
+    TO_REG_ID(ASPEED_SCU_MPLL_PARAM),
+    TO_REG_ID(ASPEED_SCU_HPLL_PARAM),
+    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_RANGE),
+    TO_REG_ID(ASPEED_SCU_MISC_CTRL1),
+    TO_REG_ID(ASPEED_SCU_PCI_CTRL1),
+    TO_REG_ID(ASPEED_SCU_PCI_CTRL2),
+    TO_REG_ID(ASPEED_SCU_PCI_CTRL3),
+    TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
+    TO_REG_ID(ASPEED_SCU_SOC_SCRATCH1),
+    TO_REG_ID(ASPEED_SCU_SOC_SCRATCH2),
+    TO_REG_ID(ASPEED_SCU_MAC_CLK_DELAY),
+    TO_REG_ID(ASPEED_SCU_MISC_CTRL2),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH1),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH2),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH3),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH4),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH5),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH6),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH7),
+    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH8),
+    TO_REG_ID(ASPEED_SCU_HW_STRAP1),
+    TO_REG_ID(ASPEED_SCU_RNG_CTRL),
+    TO_REG_ID(ASPEED_SCU_RNG_DATA),
+    TO_REG_ID(ASPEED_SCU_REV_ID),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL1),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL2),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL3),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL4),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL5),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL6),
+    TO_REG_ID(ASPEED_SCU_WDT_RST_CTRL),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL7),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL8),
+    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL9),
+    TO_REG_ID(ASPEED_SCU_WAKEUP_EN),
+    TO_REG_ID(ASPEED_SCU_WAKEUP_CTRL),
+    TO_REG_ID(ASPEED_SCU_HW_STRAP2),
+    TO_REG_ID(ASPEED_SCU_FREE_CNTR4),
+    TO_REG_ID(ASPEED_SCU_FREE_CNTR4_EXT),
+    TO_REG_ID(ASPEED_SCU_CPU2_CTRL),
+    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG1),
+    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG2),
+    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG3),
+    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG4),
+    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG5),
+    TO_REG_ID(ASPEED_SCU_CPU2_CACHE_CTRL),
+    TO_REG_ID(ASPEED_SCU_UART_HPLL_CLK),
+    TO_REG_ID(ASPEED_SCU_PCIE_CTRL),
+    TO_REG_ID(ASPEED_SCU_BMC_MMIO_CTRL),
+    TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE1),
+    TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE2),
+    TO_REG_ID(ASPEED_SCU_MAILBOX_DECODE_BASE),
+    TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE1),
+    TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE2),
+    TO_REG_ID(ASPEED_SCU_BMC_REV_ID),
+    TO_REG_ID(ASPEED_SCU_BMC_DEV_ID),
+};
+
+void aspeed_scu_configure_reset(AspeedSCUState *scu,
+        const AspeedSCUResetCfg vals[], int n, Error **errp)
+{
+    int i;
+
+    for (i = 0; i < n; i++) {
+        const char *name = aspeed_scu_reg_ids[TO_REG(vals[i].offset)];
+
+        if (name) {
+            object_property_set_int(OBJECT(scu), vals[i].val, name, errp);
+            if (*errp) {
+                return;
+            }
+        }
+    }
+}
+
+static void aspeed_scu_get_reset(Object *obj, Visitor *v, const char *name,
+        void *opaque, Error **errp)
+{
+    AspeedSCUState *s = ASPEED_SCU(obj);
+    uint32_t value;
+    int offset, reg;
+
+    if (sscanf(name, "0x%x", &offset) != 1) {
+        error_setg(errp, "Error reading %s", name);
+        return;
+    }
+
+    reg = TO_REG(offset);
+
+    if (reg > ASPEED_SCU_NR_REGS) {
+        error_setg(errp, "Invalid register ID: %s", name);
+        return;
+    }
+
+    value = s->reset[reg];
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void aspeed_scu_set_reset(Object *obj, Visitor *v, const char *name,
+        void *opaque, Error **errp)
+{
+    AspeedSCUState *s = ASPEED_SCU(obj);
+    Error *local_err = NULL;
+    uint32_t value;
+    int offset, reg;
+
+    visit_type_uint32(v, name, &value, &local_err);
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (sscanf(name, "0x%x", &offset) != 1) {
+        error_setg(errp, "Error reading %s", name);
+    }
+
+    reg = TO_REG(offset);
+
+    if (reg > ASPEED_SCU_NR_REGS) {
+        error_setg(errp, "Invalid register ID: %s", name);
+        return;
+    }
+
+    s->reset[reg] = value;
+}
+
+static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case ASPEED_SCU_WAKEUP_EN:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return s->regs[TO_REG(offset)];
+}
+
+static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    if (offset > ASPEED_SCU_PROT_KEY && offset < ASPEED_SCU_CPU2_BASE_SEG1 &&
+            s->regs[TO_REG(ASPEED_SCU_PROT_KEY)] != SCU_KEY) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
+        return;
+    }
+
+    trace_aspeed_scu_write(offset, size, data);
+
+    switch (offset) {
+    case ASPEED_SCU_FREQ_CNTR_EVAL:
+    case ASPEED_SCU_VGA_SCRATCH1 ... ASPEED_SCU_VGA_SCRATCH8:
+    case ASPEED_SCU_RNG_DATA:
+    case ASPEED_SCU_REV_ID:
+    case ASPEED_SCU_FREE_CNTR4:
+    case ASPEED_SCU_FREE_CNTR4_EXT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[TO_REG(offset)] = (uint32_t) data;
+}
+
+static const MemoryRegionOps aspeed_scu_ops = {
+    .read = aspeed_scu_read,
+    .write = aspeed_scu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_scu_reset(DeviceState *dev)
+{
+    AspeedSCUState *s = ASPEED_SCU(dev);
+
+    memcpy(s->regs, s->reset, sizeof(s->regs));
+}
+
+static void aspeed_scu_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedSCUState *s = ASPEED_SCU(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_scu_ops, s,
+                          TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_scu = {
+    .name = "aspeed.new-vic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSCUState, ASPEED_SCU_NR_REGS),
+        VMSTATE_UINT32_ARRAY(reset, AspeedSCUState, ASPEED_SCU_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_scu_initfn(Object *obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(aspeed_scu_reg_ids); i++) {
+        const char *name = aspeed_scu_reg_ids[i];
+        if (name) {
+            object_property_add(obj, name, "uint32", aspeed_scu_get_reset,
+                                aspeed_scu_set_reset, NULL, NULL, NULL);
+        }
+    }
+}
+
+static void aspeed_scu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_scu_realize;
+    dc->reset = aspeed_scu_reset;
+    dc->desc = "ASPEED System Control Unit";
+    dc->vmsd = &vmstate_aspeed_scu;
+}
+
+static const TypeInfo aspeed_scu_info = {
+    .name = TYPE_ASPEED_SCU,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedSCUState),
+    .instance_init = aspeed_scu_initfn,
+    .class_init = aspeed_scu_class_init,
+};
+
+static void aspeed_scu_register_types(void)
+{
+    type_register_static(&aspeed_scu_info);
+}
+
+type_init(aspeed_scu_register_types);
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
new file mode 100644
index 000000000000..a33975cebcdf
--- /dev/null
+++ b/include/hw/misc/aspeed_scu.h
@@ -0,0 +1,105 @@
+/*
+ * ASPEED System Control Unit
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_SCU_H
+#define ASPEED_SCU_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SCU "aspeed.scu"
+#define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_SCU)
+
+#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
+
+#define ASPEED_SCU_PROT_KEY             0x00
+#define ASPEED_SCU_SYS_RST_CTRL         0x04
+#define ASPEED_SCU_CLK_SEL              0x08
+#define ASPEED_SCU_CLK_STOP_CTRL        0x0C
+#define ASPEED_SCU_FREQ_CNTR_CTRL       0x10
+#define ASPEED_SCU_FREQ_CNTR_EVAL       0x14
+#define ASPEED_SCU_IRQ_CTRL             0x18
+#define ASPEED_SCU_D2PLL_PARAM          0x1C
+#define ASPEED_SCU_MPLL_PARAM           0x20
+#define ASPEED_SCU_HPLL_PARAM           0x24
+#define ASPEED_SCU_FREQ_CNTR_RANGE      0x28
+#define ASPEED_SCU_MISC_CTRL1           0x2C
+#define ASPEED_SCU_PCI_CTRL1            0x30
+#define ASPEED_SCU_PCI_CTRL2            0x34
+#define ASPEED_SCU_PCI_CTRL3            0x38
+#define ASPEED_SCU_SYS_RST_STATUS       0x3C
+#define ASPEED_SCU_SOC_SCRATCH1         0x40
+#define ASPEED_SCU_SOC_SCRATCH2         0x44
+#define ASPEED_SCU_MAC_CLK_DELAY        0x48
+#define ASPEED_SCU_MISC_CTRL2           0x4C
+#define ASPEED_SCU_VGA_SCRATCH1         0x50
+#define ASPEED_SCU_VGA_SCRATCH2         0x54
+#define ASPEED_SCU_VGA_SCRATCH3         0x58
+#define ASPEED_SCU_VGA_SCRATCH4         0x5C
+#define ASPEED_SCU_VGA_SCRATCH5         0x60
+#define ASPEED_SCU_VGA_SCRATCH6         0x64
+#define ASPEED_SCU_VGA_SCRATCH7         0x68
+#define ASPEED_SCU_VGA_SCRATCH8         0x6C
+#define ASPEED_SCU_HW_STRAP1            0x70
+#define ASPEED_SCU_RNG_CTRL             0x74
+#define ASPEED_SCU_RNG_DATA             0x78
+#define ASPEED_SCU_REV_ID               0x7C
+#define ASPEED_SCU_PINMUX_CTRL1         0x80
+#define ASPEED_SCU_PINMUX_CTRL2         0x84
+#define ASPEED_SCU_PINMUX_CTRL3         0x88
+#define ASPEED_SCU_PINMUX_CTRL4         0x8C
+#define ASPEED_SCU_PINMUX_CTRL5         0x90
+#define ASPEED_SCU_PINMUX_CTRL6         0x94
+#define ASPEED_SCU_WDT_RST_CTRL         0x9C
+#define ASPEED_SCU_PINMUX_CTRL7         0xA0
+#define ASPEED_SCU_PINMUX_CTRL8         0xA4
+#define ASPEED_SCU_PINMUX_CTRL9         0xA8
+#define ASPEED_SCU_WAKEUP_EN            0xC0
+#define ASPEED_SCU_WAKEUP_CTRL          0xC4
+#define ASPEED_SCU_HW_STRAP2            0xD0
+#define ASPEED_SCU_FREE_CNTR4           0xE0
+#define ASPEED_SCU_FREE_CNTR4_EXT       0xE4
+#define ASPEED_SCU_CPU2_CTRL            0x100
+#define ASPEED_SCU_CPU2_BASE_SEG1       0x104
+#define ASPEED_SCU_CPU2_BASE_SEG2       0x108
+#define ASPEED_SCU_CPU2_BASE_SEG3       0x10C
+#define ASPEED_SCU_CPU2_BASE_SEG4       0x110
+#define ASPEED_SCU_CPU2_BASE_SEG5       0x114
+#define ASPEED_SCU_CPU2_CACHE_CTRL      0x118
+#define ASPEED_SCU_UART_HPLL_CLK        0x160
+#define ASPEED_SCU_PCIE_CTRL            0x180
+#define ASPEED_SCU_BMC_MMIO_CTRL        0x184
+#define ASPEED_SCU_RELOC_DECODE_BASE1   0x188
+#define ASPEED_SCU_RELOC_DECODE_BASE2   0x18C
+#define ASPEED_SCU_MAILBOX_DECODE_BASE  0x190
+#define ASPEED_SCU_SRAM_DECODE_BASE1    0x194
+#define ASPEED_SCU_SRAM_DECODE_BASE2    0x198
+#define ASPEED_SCU_BMC_REV_ID           0x19C
+#define ASPEED_SCU_BMC_DEV_ID           0x1A4
+
+typedef struct AspeedSCUState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SCU_NR_REGS];
+    uint32_t reset[ASPEED_SCU_NR_REGS];
+} AspeedSCUState;
+
+typedef struct AspeedSCUResetCfg {
+    uint32_t offset;
+    uint32_t val;
+} AspeedSCUResetCfg;
+
+void aspeed_scu_configure_reset(AspeedSCUState *scu,
+        const struct AspeedSCUResetCfg vals[], int n, Error **errp);
+
+#endif /* ASPEED_SCU_H */
diff --git a/trace-events b/trace-events
index 421d89f476b6..83994907f48e 100644
--- a/trace-events
+++ b/trace-events
@@ -2163,3 +2163,6 @@ e1000e_cfg_support_virtio(bool support) "Virtio header supported: %d"
 
 e1000e_vm_state_running(void) "VM state is running"
 e1000e_vm_state_stopped(void) "VM state is stopped"
+
+# hw/misc/aspeed_scu.c
+aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-- 
2.7.4
