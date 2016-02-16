Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 85B1A1A000C
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 22:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=U/NkHrdG; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id A9A647EC080;
 Tue, 16 Feb 2016 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 llhgXN4zSNFWFC555D2MRQpsOoI=; b=U/NkHrdGWqm6BrDQpZ0eWfZvhMHq8jlW
 Cwb9tLolWV4SZgocpEbwJtBF0JgZc/yfKN8vdMxUMU0JCYdgBU/Lu+T8KWHe9EEH
 8uFJkUWmoe15EGxZBa/Vx+OOHqxs9Bd/5lNWF66Zk/6z7JsPm5xelm6woTCt6y3j
 znVH3mP0slI=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 9C3AB7EC060;
 Tue, 16 Feb 2016 03:35:08 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400 AVIC device model
Date: Tue, 16 Feb 2016 22:04:56 +1030
Message-Id: <1455622497-25966-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 16 Feb 2016 11:35:13 -0000

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
 hw/intc/aspeed_vic.c         | 256 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/aspeed_vic.h |  40 +++++++
 trace-events                 |   9 ++
 4 files changed, 306 insertions(+)
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 include/hw/intc/aspeed_vic.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 6a13a39..0e47f0f 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -31,3 +31,4 @@ obj-$(CONFIG_XICS_KVM) += xics_kvm.o
 obj-$(CONFIG_ALLWINNER_A10_PIC) += allwinner-a10-pic.o
 obj-$(CONFIG_S390_FLIC) += s390_flic.o
 obj-$(CONFIG_S390_FLIC_KVM) += s390_flic_kvm.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_vic.o
diff --git a/hw/intc/aspeed_vic.c b/hw/intc/aspeed_vic.c
new file mode 100644
index 0000000..c000936
--- /dev/null
+++ b/hw/intc/aspeed_vic.c
@@ -0,0 +1,256 @@
+/*
+ * ASPEED Interrupt Controller (New)
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2015, 2016 IBM Corp.
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
+#include "trace.h"
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
+    trace_aspeed_vic_update_fiq(!!flags);
+
+    flags = new & ~s->int_select;
+    if (!flags) {
+        qemu_set_irq(s->irq, !!flags);
+        trace_aspeed_vic_update_all_fiq();
+        return;
+    }
+
+    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
+        if (flags & (UINT64_C(1) << i)) {
+            qemu_set_irq(s->irq, 1);
+            trace_aspeed_vic_update_i(i);
+            return;
+        }
+    }
+
+    qemu_set_irq(s->irq, 0);
+    trace_aspeed_vic_update_none();
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
+        s->edge_status |= (UINT64_C(1) << irq);
+    } else {
+        s->edge_status &= ~(UINT64_C(1) << irq);
+    }
+
+    trace_aspeed_vic_set_irq(irq, level);
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
+    switch (n_offset) {
+    case 0x0: /* IRQ Status */
+        val = s->edge_status & ~s->int_select & s->int_enable;
+        break;
+    case 0x08: /* FIQ Status */
+        val = s->edge_status & s->int_select & s->int_enable;
+        break;
+    case 0x10: /* Raw Interrupt Status */
+        val = s->edge_status;
+        break;
+    case 0x18: /* Interrupt Selection */
+        val = s->int_select;
+        break;
+    case 0x20: /* Interrupt Enable */
+        val = s->int_enable;
+        break;
+    case 0x30: /* Software Interrupt */
+        val = s->int_trigger;
+        break;
+    case 0x40: /* Interrupt Sensitivity */
+        val = s->int_sense;
+        break;
+    case 0x48: /* Interrupt Both Edge Trigger Control */
+        val = s->int_dual_edge;
+        break;
+    case 0x50: /* Interrupt Event */
+        val = s->int_event;
+        break;
+    case 0x60: /* Edge Triggered Interrupt Status */
+        val = s->edge_status;
+        break;
+        /* Illegal */
+    case 0x28: /* Interrupt Enable Clear */
+    case 0x38: /* Software Interrupt Clear */
+    case 0x58: /* Edge Triggered Interrupt Clear */
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
+    trace_aspeed_vic_read(offset, size, val);
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
+    trace_aspeed_vic_write(offset, size, data);
+
+    if (high) {
+        data &= AVIC_H_MASK;
+        data <<= 32;
+    } else {
+        data &= AVIC_L_MASK;
+    }
+
+    switch (n_offset) {
+    case 0x18: /* Interrupt Selection */
+        if (high) {
+            s->int_select &= AVIC_L_MASK;
+        } else {
+            s->int_select &= ((UINT64_C(0) | AVIC_H_MASK) << 32);
+        }
+        s->int_select |= data;
+        break;
+    case 0x20: /* Interrupt Enable */
+        s->int_enable |= data;
+        break;
+    case 0x28: /* Interrupt Enable Clear */
+        s->int_enable &= ~data;
+        break;
+    case 0x30: /* Software Interrupt */
+        s->int_trigger |= data;
+        break;
+    case 0x38: /* Software Interrupt Clear */
+        s->int_trigger &= ~data;
+        break;
+    case 0x50: /* Interrupt Event */
+        s->int_event &= ~AVIC_INT_EVENT_W_MASK;
+        s->int_event |= (data & AVIC_INT_EVENT_W_MASK);
+        break;
+    case 0x58: /* Edge Triggered Interrupt Clear */
+        s->edge_status &= ~data;
+        break;
+    case 0x00: /* IRQ Status */
+    case 0x08: /* FIQ Status */
+    case 0x10: /* Raw Interrupt Status */
+    case 0x40: /* Interrupt Sensitivity */
+    case 0x48: /* Interrupt Both Edge Trigger Control */
+    case 0x60: /* Edge Triggered Interrupt Status */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "Write of read-only register with offset 0x%" HWADDR_PRIx "\n",
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
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
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
index 0000000..43b2ec6
--- /dev/null
+++ b/include/hw/intc/aspeed_vic.h
@@ -0,0 +1,40 @@
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
diff --git a/trace-events b/trace-events
index 5325a23..5718bdf 100644
--- a/trace-events
+++ b/trace-events
@@ -1899,3 +1899,12 @@ aspeed_timer_ctrl_op_overflow_interrupt(uint8_t i, bool enable) "Overflow interr
 aspeed_timer_set_ctrl2(uint32_t value) "CTRL2 set to 0x%" PRIx32
 aspeed_timer_set_value(int timer, int reg, uint32_t value) "Write to register %d of timer %d: 0x%" PRIx32
 aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "Read at 0x%" PRIx64 ": of size %u 0x%" PRIx64
+
+# hw/intc/aspeed_vic.c
+aspeed_vic_set_irq(int irq, int level) "Enabling IRQ %d: %d"
+aspeed_vic_update_fiq(int flags) "Raising FIQ %d"
+aspeed_vic_update_all_fiq(void) "All IRQs marked as fast"
+aspeed_vic_update_i(int irq) "Raising IRQ %d"
+aspeed_vic_update_none(void) "Lowering IRQs"
+aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "Read at 0x%" PRIx64 " of size %u: 0x% " PRIx64
+aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "Write at 0x% " PRIx64 " of size %u: %0x" PRIx64
-- 
2.5.0
