Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id C851E1A020A
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 16:46:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=esbz7RQ2; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id C72E74B006F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 5WzSXGPOx8wPoOXqnVgUSlYItkM=; b=esbz7RQ2+DMl4f7s9OXhyGDoJq3/O4RG
 HHZ++Wby8FrvpNJP9VV1Ivr8+XGs5KKUUT/HOTz9Zy2IxyBqKOshLqauDc9O3v2p
 VQiHz7/P1aKUJMywMEqjd3pFm/V/21oOV3+28bKdiw9LbFJx2KsJAXBQN9s1fsnN
 N4+Y810GkZM=
Received: from localhost.localdomain (unknown [138.44.251.155])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 6D4184B0062
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:46 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] intc: Add (new) ASPEED AST2400 AVIC device model
Date: Wed,  3 Feb 2016 16:46:32 +1100
Message-Id: <1454478393-11973-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
References: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 05:46:48 -0000

Implement a minimal ASPEED AVIC device model, enough to boot a Linux
kernel configured with aspeed_defconfig. The VIC implements the 'new'
register set and expects this to be reflected in the device tree.

The implementation is a little awkward as the hardware uses 32bit
registers to manage 51 IRQs, and makes use of low and high registers for
each conceptual register. The model's implementation uses 64bit data
types to store the register values but must cope with access offset values
in multiples of 4 passed to the callbacks. As such the read() and
write() implementations process the provided offset to understand
whether the access is requesting the lower or upper 32bits of the 64bit
quantity.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/intc/Makefile.objs        |   1 +
 hw/intc/aspeed_vic.c         | 288 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/aspeed_vic.h |  42 +++++++
 3 files changed, 331 insertions(+)
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 include/hw/intc/aspeed_vic.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 004b0c2..9763e50 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -14,6 +14,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gic.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv2m.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
 common-obj-$(CONFIG_OPENPIC) += openpic.o
+common-obj-y += aspeed_vic.o
 
 obj-$(CONFIG_APIC) += apic.o apic_common.o
 obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
new file mode 100644
index 0000000..0bcce76
--- /dev/null
+++ b/hw/intc/aspeed_vic.c
@@ -0,0 +1,288 @@
+/*
+ * ASPEED Interrupt Controller (New)
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2015 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Based off of the i.MX31 Vectored Interrupt Controller
+ *
+ * Note that this device model does not implement the legacy register space.
+ * The assumption is that the device base address is exposed such that all
+ * offsets are calculated relative to the address of the first "new" register.
+ */
+#include <inttypes.h>
+#include "hw/intc/aspeed_vic.h"
+
+#ifdef DEBUG
+# define DPRINTF(format, ...) fprintf(stderr, format , ## __VA_ARGS__)
+#else
+# define DPRINTF(format, ...) do { } while (0)
+#endif
+
+#define AVIC_EDGE_STATUS 0x60
+
+#define AVIC_L_MASK 0xFFFFFFFF
+#define AVIC_H_MASK 0x00007FFF
+#define AVIC_INT_EVENT_W_MASK (UINT64_C(0x78000) << 32)
+
+static void aspeed_vic_update(AspeedVICState *s)
+{
+    int i;
+    uint64_t new = (s->edge_status & s->int_enable);
+    uint64_t flags;
+
+    flags = new & s->int_select;
+    qemu_set_irq(s->fiq, !!flags);
+
+    flags = new & ~s->int_select;
+    if (!flags) {
+        qemu_set_irq(s->irq, !!flags);
+        return;
+    }
+
+    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
+        if (flags & (UINT64_C(1) << i)) {
+            qemu_set_irq(s->irq, 1);
+            return;
+        }
+    }
+
+    qemu_set_irq(s->irq, 0);
+}
+
+static void aspeed_vic_set_irq(void *opaque, int irq, int level)
+{
+    AspeedVICState *s = (AspeedVICState *)opaque;
+    if (irq > ASPEED_VIC_NR_IRQS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Out-of-range interrupt number: %d\n",
+                      irq);
+        return;
+    }
+
+    if (level) {
+        DPRINTF("Raising IRQ %d\n", irq);
+        s->edge_status |= (UINT64_C(1) << irq);
+    } else {
+        DPRINTF("Clearing IRQ %d\n", irq);
+        s->edge_status &= ~(UINT64_C(1) << irq);
+    }
+
+    aspeed_vic_update(s);
+}
+
+static uint64_t aspeed_vic_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t val;
+    const bool high = !!(offset & 0x4);
+    const hwaddr n_offset = (offset & ~0x4);
+    AspeedVICState *s = (AspeedVICState *)opaque;
+
+    if (offset > AVIC_EDGE_STATUS + 4) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Out of bounds register access with offset %ld\n",
+                      offset);
+        return 0;
+    }
+
+    if (size != sizeof(uint32_t)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Unexpected read size %d with offset %ld\n", size,
+                      offset);
+        return 0;
+    }
+
+    switch (n_offset) {
+    case 0x0: /* AVIC_IRQ_STATUS */
+        val = s->edge_status & ~s->int_select & s->int_enable;
+        break;
+    case 0x08: /* AVIC_FIQ_STATUS */
+        val = s->edge_status & s->int_select & s->int_enable;
+        break;
+    case 0x10: /* AVIC_RAW_STATUS */
+        val = s->edge_status;
+        break;
+    case 0x18: /* AVIC_INT_SELECT */
+        val = s->int_select;
+        break;
+    case 0x20: /* AVIC_INT_ENABLE */
+        val = s->int_enable;
+        break;
+    case 0x30: /* AVIC_INT_TRIGGER */
+        val = s->int_trigger;
+        break;
+    case 0x40: /* AVIC_INT_SENSE */
+        val = s->int_sense;
+        break;
+    case 0x48: /* AVIC_INT_DUAL_EDGE */
+        val = s->int_dual_edge;
+        break;
+    case 0x50: /* AVIC_INT_EVENT */
+        val = s->int_event;
+        break;
+    case 0x60: /* AVIC_EDGE_STATUS */
+        val = s->edge_status;
+        break;
+        /* Illegal */
+    case 0x28: /* AVIC_INT_ENABLE_CLR */
+    case 0x38: /* AVIC_INT_TRIGGER_CLR */
+    case 0x58: /* AVIC_EDGE_CLR */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "Read of write-only register with offset 0x%" HWADDR_PRIx "\n",
+                offset);
+        val = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
+                TYPE_ASPEED_VIC, __func__, offset);
+        val = 0;
+        break;
+    }
+    if (high) {
+        val >>= 32;
+        val &= AVIC_H_MASK;
+    }
+    DPRINTF("offset=0x%" HWADDR_PRIx ", size=%u, val=0x%" PRIx64 "\n",
+            offset, size, val);
+    return val;
+}
+
+static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    const bool high = !!(offset & 0x4);
+    const hwaddr n_offset = (offset & ~0x4);
+    AspeedVICState *s = (AspeedVICState *)opaque;
+
+    if (size != sizeof(uint32_t)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "Write of unexpected size %u with offset 0x%" HWADDR_PRIx "\n",
+                size, offset);
+        return;
+    }
+
+    if (offset > AVIC_EDGE_STATUS + 4) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "Out of bounds access with offset 0x%" HWADDR_PRIx "\n",
+                offset);
+        return;
+    }
+    DPRINTF("offset=0x%" HWADDR_PRIx ", size=%u, data=0x%" PRIx64 "\n",
+            offset, data, size);
+
+    if (high) {
+        data &= AVIC_H_MASK;
+        data <<= 32;
+    } else {
+        data &= AVIC_L_MASK;
+    }
+    DPRINTF("After %s masking, value is 0x%" PRIx64 "\n",
+            high ? "high" : "low", data);
+
+    switch (n_offset) {
+    case 0x18: /* AVIC_INT_SELECT */
+        if (high) {
+            s->int_select &= AVIC_L_MASK;
+        } else {
+            s->int_select &= ((UINT64_C(0) | AVIC_H_MASK) << 32);
+        }
+        s->int_select |= data;
+        break;
+    case 0x20: /* AVIC_INT_ENABLE */
+        s->int_enable |= data;
+        break;
+    case 0x28: /* AVIC_INT_ENABLE_CLR */
+        s->int_enable &= ~data;
+        break;
+    case 0x30: /* AVIC_INT_TRIGGER */
+        s->int_trigger |= data;
+        break;
+    case 0x38: /* AVIC_INT_TRIGGER_CLR */
+        s->int_trigger &= ~data;
+        break;
+    case 0x50: /* AVIC_INT_EVENT */
+        s->int_event &= ~AVIC_INT_EVENT_W_MASK;
+        s->int_event |= (data & AVIC_INT_EVENT_W_MASK);
+        break;
+    case 0x58: /* AVIC_EDGE_CLR */
+        s->edge_status &= ~data;
+        break;
+    case 0x00: /* AVIC_IRQ_STATUS */
+    case 0x08: /* AVIC_FIQ_STATUS */
+    case 0x10: /* AVIC_RAW_STATUS */
+    case 0x40: /* AVIC_INT_SENSE */
+    case 0x48: /* AVIC_INT_DUAL_EDGE */
+    case 0x60: /* AVIC_EDGE_STATUS */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "Write of read-only register with offset %" HWADDR_PRIx "\n",
+                offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
+                TYPE_ASPEED_VIC, __func__, offset);
+        break;
+    }
+    aspeed_vic_update(s);
+}
+
+static const MemoryRegionOps aspeed_vic_ops = {
+    .read = aspeed_vic_read,
+    .write = aspeed_vic_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void aspeed_vic_reset(DeviceState *dev)
+{
+    AspeedVICState *s = ASPEED_VIC(dev);
+
+    s->int_select = 0;
+    s->int_enable = 0;
+    s->int_trigger = 0;
+    s->int_sense = (UINT64_C(0x1F07) << 32) | 0xFFF8FFFF;
+    s->int_dual_edge = (UINT64_C(0xF8) << 32) | 0x00070000;
+    s->int_event = (UINT64_C(0x5F07) << 32) | 0xFFF8FFFF;
+    s->edge_status = 0;
+}
+
+static void aspeed_vic_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedVICState *s = ASPEED_VIC(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_vic_ops, s,
+                          TYPE_ASPEED_VIC, 0x20000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    qdev_init_gpio_in(dev, aspeed_vic_set_irq, ASPEED_VIC_NR_IRQS);
+    sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->fiq);
+}
+
+static void aspeed_vic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_vic_realize;
+    dc->reset = aspeed_vic_reset;
+    dc->desc = "ASPEED Interrupt Controller (New)";
+}
+
+static const TypeInfo aspeed_vic_info = {
+    .name = TYPE_ASPEED_VIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedVICState),
+    .class_init = aspeed_vic_class_init,
+};
+
+static void aspeed_vic_register_types(void)
+{
+    type_register_static(&aspeed_vic_info);
+}
+
+type_init(aspeed_vic_register_types);
diff --git a/include/hw/intc/aspeed_vic.h b/include/hw/intc/aspeed_vic.h
new file mode 100644
index 0000000..1eed03d
--- /dev/null
+++ b/include/hw/intc/aspeed_vic.h
@@ -0,0 +1,42 @@
+/*
+ * ASPEED Interrupt Controller (New)
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2015 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Need to add SVIC and CVIC support
+ */
+#ifndef ASPEED_VIC_H
+#define ASPEED_VIC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_VIC "aspeed.vic"
+#define ASPEED_VIC(obj) OBJECT_CHECK(AspeedVICState, (obj), TYPE_ASPEED_VIC)
+
+#define ASPEED_VIC_NR_IRQS 51
+
+#define ASPEED_VIC_BASE 0x1e6c0080
+
+typedef struct AspeedVICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint64_t int_select;
+    uint64_t int_enable;
+    uint64_t int_trigger;
+    uint64_t int_sense;
+    uint64_t int_dual_edge;
+    uint64_t int_event;
+    uint64_t edge_status;
+    qemu_irq irq;
+    qemu_irq fiq;
+} AspeedVICState;
+
+#endif /* ASPEED_VIC_H */
-- 
2.5.0
