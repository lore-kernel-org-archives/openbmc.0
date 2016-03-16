Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qPwp56x7wzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 13:45:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=HO5b2Fb2; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 208617EC063;
 Tue, 15 Mar 2016 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 Xd2GrIUYG0Pv0TdAiczzJTqrHS0=; b=HO5b2Fb2irPpCGgduDwAtcRDL7DrT0wL
 nfPRTa8GY0kcz1+4MyI8IdZfefazIinghBMIuRb9Boc4qrZFftHGGmeejMOCbvUy
 FLQ3GOuT+bu+JeDeAxcIXTgJGSbSHM2lV4uTJudXoAtQaN7DwzeMvdv1ZO/EtE27
 RcuPSPuho3E=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 608187EC061;
 Tue, 15 Mar 2016 19:45:31 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
 Dmitry Osipenko <digetx@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v5 2/4] hw/intc: Add (new) ASPEED VIC device model
Date: Wed, 16 Mar 2016 13:15:15 +1030
Message-Id: <1458096317-25223-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
References: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 16 Mar 2016 02:45:34 -0000

Implement a basic ASPEED VIC device model for the AST2400 SoC[1], with
enough functionality to boot an aspeed_defconfig Linux kernel. The model
implements the 'new' (revised) register set: While the hardware exposes
both the new and legacy register sets, accesses to the model's legacy
register set will not be serviced (however the access will be logged).

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v3:
  * Switch from g_assert() to qemu_log_mask(LOG_GUEST_ERROR, ...) in guest path

Since v2:
  * Implement all supported interrupt types and configurations
  * Implement a VMStateDescription
  * Log accesses to legacy IO space
  * Add documentation on some implementation and hardware details
  * Switch to extract64/deposit64 where possible
  * Drop int_ prefix from some struct member names
  * Fix various issues with trace-event declarations
  * Include qemu/osdep.h

 hw/intc/Makefile.objs        |   1 +
 hw/intc/aspeed_vic.c         | 339 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/aspeed_vic.h |  48 ++++++
 trace-events                 |   7 +
 4 files changed, 395 insertions(+)
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
index 0000000..19a0ff7
--- /dev/null
+++ b/hw/intc/aspeed_vic.c
@@ -0,0 +1,339 @@
+/*
+ * ASPEED Interrupt Controller (New)
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2015, 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/* The hardware exposes two register sets, a legacy set and a 'new' set. The
+ * model implements the 'new' register set, and logs warnings on accesses to
+ * the legacy IO space.
+ *
+ * The hardware uses 32bit registers to manage 51 IRQs, with low and high
+ * registers for each conceptual register. The device model's implementation
+ * uses 64bit data types to store both low and high register values (in the one
+ * member), but must cope with access offset values in multiples of 4 passed to
+ * the callbacks. As such the read() and write() implementations process the
+ * provided offset to understand whether the access is requesting the lower or
+ * upper 32 bits of the 64bit member.
+ *
+ * Additionally, the "Interrupt Enable", "Edge Status" and "Software Interrupt"
+ * fields have separate "enable"/"status" and "clear" registers, where set bits
+ * are written to one or the other to change state (avoiding a
+ * read-modify-write sequence).
+ */
+
+#include "qemu/osdep.h"
+#include <inttypes.h>
+#include "hw/intc/aspeed_vic.h"
+#include "qemu/bitops.h"
+#include "trace.h"
+
+#define AVIC_NEW_BASE_OFFSET 0x80
+
+#define AVIC_L_MASK 0xFFFFFFFFU
+#define AVIC_H_MASK 0x0007FFFFU
+#define AVIC_EVENT_W_MASK (0x78000ULL << 32)
+
+static void aspeed_vic_update(AspeedVICState *s)
+{
+    uint64_t new = (s->raw & s->enable);
+    uint64_t flags;
+
+    flags = new & s->select;
+    trace_aspeed_vic_update_fiq(!!flags);
+    qemu_set_irq(s->fiq, !!flags);
+
+    flags = new & ~s->select;
+    trace_aspeed_vic_update_irq(!!flags);
+    qemu_set_irq(s->irq, !!flags);
+}
+
+static void aspeed_vic_set_irq(void *opaque, int irq, int level)
+{
+    uint64_t irq_mask;
+    bool raise;
+    AspeedVICState *s = (AspeedVICState *)opaque;
+
+    if (irq > ASPEED_VIC_NR_IRQS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid interrupt number: %d\n",
+                      __func__, irq);
+        return;
+    }
+
+    trace_aspeed_vic_set_irq(irq, level);
+
+    irq_mask = BIT(irq);
+    if (s->sense & irq_mask) {
+        /* level-triggered */
+        if (s->event & irq_mask) {
+            /* high-sensitive */
+            raise = level;
+        } else {
+            /* low-sensitive */
+            raise = !level;
+        }
+        s->raw = deposit64(s->raw, irq, 1, raise);
+    } else {
+        uint64_t old_level = s->level & irq_mask;
+
+        /* edge-triggered */
+        if (s->dual_edge & irq_mask) {
+            raise = (!!old_level) != (!!level);
+        } else {
+            if (s->event & irq_mask) {
+                /* rising-sensitive */
+                raise = !old_level && level;
+            } else {
+                /* falling-sensitive */
+                raise = old_level && !level;
+            }
+        }
+        if (raise) {
+            s->raw = deposit64(s->raw, irq, 1, raise);
+        }
+    }
+    s->level = deposit64(s->level, irq, 1, level);
+    aspeed_vic_update(s);
+}
+
+static uint64_t aspeed_vic_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t val;
+    const bool high = !!(offset & 0x4);
+    hwaddr n_offset = (offset & ~0x4);
+    AspeedVICState *s = (AspeedVICState *)opaque;
+
+    if (offset < AVIC_NEW_BASE_OFFSET) {
+        qemu_log_mask(LOG_UNIMP, "%s: Ignoring read from legacy registers "
+                      "at 0x%" HWADDR_PRIx "[%u]\n", __func__, offset, size);
+        return 0;
+    }
+
+    n_offset -= AVIC_NEW_BASE_OFFSET;
+
+    switch (n_offset) {
+    case 0x0: /* IRQ Status */
+        val = s->raw & ~s->select & s->enable;
+        break;
+    case 0x08: /* FIQ Status */
+        val = s->raw & s->select & s->enable;
+        break;
+    case 0x10: /* Raw Interrupt Status */
+        val = s->raw;
+        break;
+    case 0x18: /* Interrupt Selection */
+        val = s->select;
+        break;
+    case 0x20: /* Interrupt Enable */
+        val = s->enable;
+        break;
+    case 0x30: /* Software Interrupt */
+        val = s->trigger;
+        break;
+    case 0x40: /* Interrupt Sensitivity */
+        val = s->sense;
+        break;
+    case 0x48: /* Interrupt Both Edge Trigger Control */
+        val = s->dual_edge;
+        break;
+    case 0x50: /* Interrupt Event */
+        val = s->event;
+        break;
+    case 0x60: /* Edge Triggered Interrupt Status */
+        val = s->raw & ~s->sense;
+        break;
+        /* Illegal */
+    case 0x28: /* Interrupt Enable Clear */
+    case 0x38: /* Software Interrupt Clear */
+    case 0x58: /* Edge Triggered Interrupt Clear */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only register with offset 0x%"
+                      HWADDR_PRIx "\n", __func__, offset);
+        val = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        val = 0;
+        break;
+    }
+    if (high) {
+        val = extract64(val, 32, 19);
+    }
+    trace_aspeed_vic_read(offset, size, val);
+    return val;
+}
+
+static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    const bool high = !!(offset & 0x4);
+    hwaddr n_offset = (offset & ~0x4);
+    AspeedVICState *s = (AspeedVICState *)opaque;
+
+    if (offset < AVIC_NEW_BASE_OFFSET) {
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Ignoring write to legacy registers at 0x%"
+                      HWADDR_PRIx "[%u] <- 0x%" PRIx64 "\n", __func__, offset,
+                      size, data);
+        return;
+    }
+
+    n_offset -= AVIC_NEW_BASE_OFFSET;
+    trace_aspeed_vic_write(offset, size, data);
+
+    /* Given we have members using separate enable/clear registers, deposit64()
+     * isn't quite the tool for the job. Instead, relocate the incoming bits to
+     * the required bit offset based on the provided access address
+     */
+    if (high) {
+        data &= AVIC_H_MASK;
+        data <<= 32;
+    } else {
+        data &= AVIC_L_MASK;
+    }
+
+    switch (n_offset) {
+    case 0x18: /* Interrupt Selection */
+        /* Register has deposit64() semantics - overwrite requested 32 bits */
+        if (high) {
+            s->select &= AVIC_L_MASK;
+        } else {
+            s->select &= ((uint64_t) AVIC_H_MASK) << 32;
+        }
+        s->select |= data;
+        break;
+    case 0x20: /* Interrupt Enable */
+        s->enable |= data;
+        break;
+    case 0x28: /* Interrupt Enable Clear */
+        s->enable &= ~data;
+        break;
+    case 0x30: /* Software Interrupt */
+        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable. "
+                      "IRQs requested: 0x%016" PRIx64 "\n", __func__, data);
+        break;
+    case 0x38: /* Software Interrupt Clear */
+        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable. "
+                      "IRQs to be cleared: 0x%016" PRIx64 "\n", __func__, data);
+        break;
+    case 0x50: /* Interrupt Event */
+        /* Register has deposit64() semantics - overwrite the top four valid
+         * IRQ bits, as only the top four IRQs (GPIOs) can change their event
+         * type */
+        if (high) {
+            s->event &= ~AVIC_EVENT_W_MASK;
+            s->event |= (data & AVIC_EVENT_W_MASK);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Ignoring invalid write to interrupt event register");
+        }
+        break;
+    case 0x58: /* Edge Triggered Interrupt Clear */
+        s->raw &= ~(data & ~s->sense);
+        break;
+    case 0x00: /* IRQ Status */
+    case 0x08: /* FIQ Status */
+    case 0x10: /* Raw Interrupt Status */
+    case 0x40: /* Interrupt Sensitivity */
+    case 0x48: /* Interrupt Both Edge Trigger Control */
+    case 0x60: /* Edge Triggered Interrupt Status */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write of read-only register with offset 0x%"
+                      HWADDR_PRIx "\n", __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+    aspeed_vic_update(s);
+}
+
+static const MemoryRegionOps aspeed_vic_ops = {
+    .read = aspeed_vic_read,
+    .write = aspeed_vic_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_vic_reset(DeviceState *dev)
+{
+    AspeedVICState *s = ASPEED_VIC(dev);
+
+    s->level = 0;
+    s->raw = 0;
+    s->select = 0;
+    s->enable = 0;
+    s->trigger = 0;
+    s->sense = 0x1F07FFF8FFFFULL;
+    s->dual_edge = 0xF800070000ULL;
+    s->event = 0x5F07FFF8FFFFULL;
+}
+
+#define AVIC_IO_REGION_SIZE 0x20000
+
+static void aspeed_vic_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedVICState *s = ASPEED_VIC(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_vic_ops, s,
+                          TYPE_ASPEED_VIC, AVIC_IO_REGION_SIZE);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    qdev_init_gpio_in(dev, aspeed_vic_set_irq, ASPEED_VIC_NR_IRQS);
+    sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->fiq);
+}
+
+static const VMStateDescription vmstate_aspeed_vic = {
+    .name = "aspeed.new-vic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(level, AspeedVICState),
+        VMSTATE_UINT64(raw, AspeedVICState),
+        VMSTATE_UINT64(select, AspeedVICState),
+        VMSTATE_UINT64(enable, AspeedVICState),
+        VMSTATE_UINT64(trigger, AspeedVICState),
+        VMSTATE_UINT64(sense, AspeedVICState),
+        VMSTATE_UINT64(dual_edge, AspeedVICState),
+        VMSTATE_UINT64(event, AspeedVICState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_vic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_vic_realize;
+    dc->reset = aspeed_vic_reset;
+    dc->desc = "ASPEED Interrupt Controller (New)";
+    dc->vmsd = &vmstate_aspeed_vic;
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
index 0000000..107ff17
--- /dev/null
+++ b/include/hw/intc/aspeed_vic.h
@@ -0,0 +1,48 @@
+/*
+ * ASPEED Interrupt Controller (New)
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
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
+    qemu_irq irq;
+    qemu_irq fiq;
+
+    uint64_t level;
+    uint64_t raw;
+    uint64_t select;
+    uint64_t enable;
+    uint64_t trigger;
+
+    /* 0=edge, 1=level */
+    uint64_t sense;
+
+    /* 0=single-edge, 1=dual-edge */
+    uint64_t dual_edge;
+
+    /* 0=low-sensitive/falling-edge, 1=high-sensitive/rising-edge */
+    uint64_t event;
+} AspeedVICState;
+
+#endif /* ASPEED_VIC_H */
diff --git a/trace-events b/trace-events
index e589230..d494de1 100644
--- a/trace-events
+++ b/trace-events
@@ -1901,3 +1901,10 @@ aspeed_timer_ctrl_pulse_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
 aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" PRIx32
 aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d register %d: 0x%" PRIx32
 aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRIx64 ": of size %u: 0x%" PRIx64
+
+# hw/intc/aspeed_vic.c
+aspeed_vic_set_irq(int irq, int level) "Enabling IRQ %d: %d"
+aspeed_vic_update_fiq(int flags) "Raising FIQ: %d"
+aspeed_vic_update_irq(int flags) "Raising IRQ: %d"
+aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-- 
2.5.0
