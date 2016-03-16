Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qPwp3632vzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 13:45:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Vjk9Hlp4; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id F01F67EC064;
 Tue, 15 Mar 2016 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 mpnu844nq9nstei5qg5yKkAUnRE=; b=Vjk9Hlp4PXi0GXuw6HoBUarLRjsf9Jk2
 4chokTzg7le/wCGijjy9tIpichGlUi5q7mK3xgDPYy2DNz1Am+g7pGsvGfmuewqX
 lYlnmIXS5+X96H0/h9CQ28KljgMqZ6ScfOHZrwz6bhgJ9DEGPHq4VNI1m/JINltQ
 oxYozLLQKPc=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 0689D7EC061;
 Tue, 15 Mar 2016 19:45:28 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
 Dmitry Osipenko <digetx@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v5 1/4] hw/timer: Add ASPEED timer device model
Date: Wed, 16 Mar 2016 13:15:14 +1030
Message-Id: <1458096317-25223-2-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 16 Mar 2016 02:45:32 -0000

Implement basic ASPEED timer functionality for the AST2400 SoC[1]: Up to
8 timers can independently be configured, enabled, reset and disabled.
Some hardware features are not implemented, namely clock value matching
and pulse generation, but the implementation is enough to boot the Linux
kernel configured with aspeed_defconfig.

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v4:
  * Fix to compile when using GCC 4.x
  * Drop unnecessary asserts

Since v3:
  * Drop unnecessary mention of VMStateDescription in timer_to_ctrl description
  * Mention hw/timer/a9gtimer.c with respect to clock value matching
  * Add missing VMSTATE_END_OF_LIST() to vmstate_aspeed_timer_state

Since v2:
  * Improve handling of timer configuration with respect to enabled state
  * Remove redundant enabled member from AspeedTimer
  * Implement VMStateDescriptions
  * Fix interrupt behaviour (edge triggered, both edges)
  * Fix various issues with trace-event declarations
  * Include qemu/osdep.h

Since v1:
  * Refactor initialisation of and respect requested clock rates (APB/External)
  * Simplify some index calculations
  * Use tracing infrastructure instead of internal DPRINTF
  * Enforce access size constraints and alignment in MemoryRegionOps

 default-configs/arm-softmmu.mak |   1 +
 hw/timer/Makefile.objs          |   1 +
 hw/timer/aspeed_timer.c         | 449 ++++++++++++++++++++++++++++++++++++++++
 include/hw/timer/aspeed_timer.h |  59 ++++++
 trace-events                    |   9 +
 5 files changed, 519 insertions(+)
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/timer/aspeed_timer.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index a9f82a1..2bcd236 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -110,3 +110,4 @@ CONFIG_IOH3420=y
 CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_SMBIOS=y
+CONFIG_ASPEED_SOC=y
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 5cfea6e..003c14f 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -32,3 +32,4 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
new file mode 100644
index 0000000..51e8303
--- /dev/null
+++ b/hw/timer/aspeed_timer.c
@@ -0,0 +1,449 @@
+/*
+ * ASPEED AST2400 Timer
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/ptimer.h"
+#include "hw/sysbus.h"
+#include "hw/timer/aspeed_timer.h"
+#include "qemu-common.h"
+#include "qemu/bitops.h"
+#include "qemu/main-loop.h"
+#include "qemu/timer.h"
+#include "trace.h"
+
+#define TIMER_NR_REGS 4
+
+#define TIMER_CTRL_BITS 4
+#define TIMER_CTRL_MASK ((1 << TIMER_CTRL_BITS) - 1)
+
+#define TIMER_CLOCK_USE_EXT true
+#define TIMER_CLOCK_EXT_HZ 1000000
+#define TIMER_CLOCK_USE_APB false
+#define TIMER_CLOCK_APB_HZ 24000000
+
+#define TIMER_REG_STATUS 0
+#define TIMER_REG_RELOAD 1
+#define TIMER_REG_MATCH_FIRST 2
+#define TIMER_REG_MATCH_SECOND 3
+
+#define TIMER_FIRST_CAP_PULSE 4
+
+enum timer_ctrl_op {
+    op_enable = 0,
+    op_external_clock,
+    op_overflow_interrupt,
+    op_pulse_enable
+};
+
+/**
+ * Avoid mutual references between AspeedTimerCtrlState and AspeedTimer
+ * structs, as it's a waste of memory. The ptimer BH callback needs to know
+ * whether a specific AspeedTimer is enabled, but this information is held in
+ * AspeedTimerCtrlState. So, provide a helper to hoist ourselves from an
+ * arbitrary AspeedTimer to AspeedTimerCtrlState.
+ */
+static inline AspeedTimerCtrlState *timer_to_ctrl(AspeedTimer *t)
+{
+    const AspeedTimer (*timers)[] = (void *)t - (t->id * sizeof(*t));
+    return container_of(timers, AspeedTimerCtrlState, timers);
+}
+
+static inline bool timer_ctrl_status(AspeedTimer *t, enum timer_ctrl_op op)
+{
+    return !!(timer_to_ctrl(t)->ctrl & BIT(t->id * TIMER_CTRL_BITS + op));
+}
+
+static inline bool timer_enabled(AspeedTimer *t)
+{
+    return timer_ctrl_status(t, op_enable);
+}
+
+static inline bool timer_overflow_interrupt(AspeedTimer *t)
+{
+    return timer_ctrl_status(t, op_overflow_interrupt);
+}
+
+static inline bool timer_can_pulse(AspeedTimer *t)
+{
+    return t->id >= TIMER_FIRST_CAP_PULSE;
+}
+
+static void aspeed_timer_expire(void *opaque)
+{
+    AspeedTimer *t = opaque;
+
+    /* Only support interrupts on match values of zero for the moment - this is
+     * sufficient to boot an aspeed_defconfig Linux kernel.
+     *
+     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer.c)
+     */
+    bool match = !(t->match[0] && t->match[1]);
+    bool interrupt = timer_overflow_interrupt(t) || match;
+    if (timer_enabled(t) && interrupt) {
+        t->level = !t->level;
+        qemu_set_irq(t->irq, t->level);
+    }
+}
+
+static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
+{
+    uint64_t value;
+
+    switch (reg) {
+    case TIMER_REG_STATUS:
+        value = ptimer_get_count(t->timer);
+        break;
+    case TIMER_REG_RELOAD:
+        value = t->reload;
+        break;
+    case TIMER_REG_MATCH_FIRST:
+    case TIMER_REG_MATCH_SECOND:
+        value = t->match[reg - 2];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Programming error: unexpected reg: %d\n",
+                      __func__, reg);
+        value = 0;
+        break;
+    }
+    return value;
+}
+
+static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedTimerCtrlState *s = opaque;
+    const int reg = (offset & 0xf) / 4;
+    uint64_t value;
+
+    switch (offset) {
+    case 0x30: /* Control Register */
+        value = s->ctrl;
+        break;
+    case 0x34: /* Control Register 2 */
+        value = s->ctrl2;
+        break;
+    case 0x00 ... 0x2c: /* Timers 1 - 4 */
+        value = aspeed_timer_get_value(&s->timers[(offset >> 4)], reg);
+        break;
+    case 0x40 ... 0x8c: /* Timers 5 - 8 */
+        value = aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], reg);
+        break;
+    /* Illegal */
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                __func__, offset);
+        value = 0;
+        break;
+    }
+    trace_aspeed_timer_read(offset, size, value);
+    return value;
+}
+
+static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
+                                   uint32_t value)
+{
+    AspeedTimer *t;
+
+    trace_aspeed_timer_set_value(timer, reg, value);
+    t = &s->timers[timer];
+    switch (reg) {
+    case TIMER_REG_STATUS:
+        if (timer_enabled(t)) {
+            ptimer_set_count(t->timer, value);
+        }
+        break;
+    case TIMER_REG_RELOAD:
+        t->reload = value;
+        ptimer_set_limit(t->timer, value, 1);
+        break;
+    case TIMER_REG_MATCH_FIRST:
+    case TIMER_REG_MATCH_SECOND:
+        if (value) {
+            /* Non-zero match values are unsupported. As such an interrupt will
+             * always be triggered when the timer reaches zero even if the
+             * overflow interrupt control bit is clear.
+             */
+            qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by device: "
+                    "0x%" PRIx32 "\n", __func__, value);
+        } else {
+            t->match[reg - 2] = value;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Programming error: unexpected reg: %d\n",
+                      __func__, reg);
+        break;
+    }
+}
+
+/* Control register operations are broken out into helpers that can be
+ * explictly called on aspeed_timer_reset(), but also from
+ * aspeed_timer_ctrl_op().
+ */
+
+static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
+{
+    trace_aspeed_timer_ctrl_enable(t->id, enable);
+    if (enable) {
+        ptimer_run(t->timer, 0);
+    } else {
+        ptimer_stop(t->timer);
+        ptimer_set_limit(t->timer, t->reload, 1);
+    }
+}
+
+static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
+{
+    trace_aspeed_timer_ctrl_external_clock(t->id, enable);
+    if (enable) {
+        ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
+    } else {
+        ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
+    }
+}
+
+static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
+{
+    trace_aspeed_timer_ctrl_overflow_interrupt(t->id, enable);
+}
+
+static void aspeed_timer_ctrl_pulse_enable(AspeedTimer *t, bool enable)
+{
+    if (timer_can_pulse(t)) {
+        trace_aspeed_timer_ctrl_pulse_enable(t->id, enable);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: Timer does not support pulse mode\n", __func__);
+    }
+}
+
+/**
+ * Given the actions are fixed in number and completely described in helper
+ * functions, dispatch with a lookup table rather than manage control flow with
+ * a switch statement.
+ */
+static void (*const ctrl_ops[])(AspeedTimer *, bool) = {
+    [op_enable] = aspeed_timer_ctrl_enable,
+    [op_external_clock] = aspeed_timer_ctrl_external_clock,
+    [op_overflow_interrupt] = aspeed_timer_ctrl_overflow_interrupt,
+    [op_pulse_enable] = aspeed_timer_ctrl_pulse_enable,
+};
+
+/**
+ * Conditionally affect changes chosen by a timer's control bit.
+ *
+ * The aspeed_timer_ctrl_op() interface is convenient for the
+ * aspeed_timer_set_ctrl() function as the "no change" early exit can be
+ * calculated for all operations, which cleans up the caller code. However the
+ * interface isn't convenient for the reset function where we want to enter a
+ * specific state without artificially constructing old and new values that
+ * will fall through the change guard (and motivates extracting the actions
+ * out to helper functions).
+ *
+ * @t: The timer to manipulate
+ * @op: The type of operation to be performed
+ * @old: The old state of the timer's control bits
+ * @new: The incoming state for the timer's control bits
+ */
+static void aspeed_timer_ctrl_op(AspeedTimer *t, enum timer_ctrl_op op,
+                                 uint8_t old, uint8_t new)
+{
+    const uint8_t mask = BIT(op);
+    const bool enable = !!(new & mask);
+    const bool changed = ((old ^ new) & mask);
+    if (!changed) {
+        return;
+    }
+    ctrl_ops[op](t, enable);
+}
+
+static void aspeed_timer_set_ctrl(AspeedTimerCtrlState *s, uint32_t reg)
+{
+    int i;
+    int shift;
+    uint8_t t_old, t_new;
+    AspeedTimer *t;
+    const uint8_t enable_mask = BIT(op_enable);
+
+    /* Handle a dependency between the 'enable' and remaining three
+     * configuration bits - i.e. if more than one bit in the control set has
+     * changed, including the 'enable' bit, then we want either disable the
+     * timer and perform configuration, or perform configuration and then
+     * enable the timer
+     */
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        t = &s->timers[i];
+        shift = (i * TIMER_CTRL_BITS);
+        t_old = (s->ctrl >> shift) & TIMER_CTRL_MASK;
+        t_new = (reg >> shift) & TIMER_CTRL_MASK;
+
+        /* If we are disabling, do so first */
+        if ((t_old & enable_mask) && !(t_new & enable_mask)) {
+            aspeed_timer_ctrl_enable(t, false);
+        }
+        aspeed_timer_ctrl_op(t, op_external_clock, t_old, t_new);
+        aspeed_timer_ctrl_op(t, op_overflow_interrupt, t_old, t_new);
+        aspeed_timer_ctrl_op(t, op_pulse_enable, t_old, t_new);
+        /* If we are enabling, do so last */
+        if (!(t_old & enable_mask) && (t_new & enable_mask)) {
+            aspeed_timer_ctrl_enable(t, true);
+        }
+    }
+    s->ctrl = reg;
+}
+
+static void aspeed_timer_set_ctrl2(AspeedTimerCtrlState *s, uint32_t value)
+{
+    trace_aspeed_timer_set_ctrl2(value);
+}
+
+static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    const uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
+    const int reg = (offset & 0xf) / 4;
+    AspeedTimerCtrlState *s = opaque;
+
+    switch (offset) {
+    /* Control Registers */
+    case 0x30:
+        aspeed_timer_set_ctrl(s, tv);
+        break;
+    case 0x34:
+        aspeed_timer_set_ctrl2(s, tv);
+        break;
+    /* Timer Registers */
+    case 0x00 ... 0x2c:
+        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
+        break;
+    case 0x40 ... 0x8c:
+        aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv);
+        break;
+    /* Illegal */
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                __func__, offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps aspeed_timer_ops = {
+    .read = aspeed_timer_read,
+    .write = aspeed_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
+{
+    QEMUBH *bh;
+    AspeedTimer *t = &s->timers[id];
+
+    t->id = id;
+    bh = qemu_bh_new(aspeed_timer_expire, t);
+    t->timer = ptimer_init(bh);
+}
+
+static void aspeed_timer_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedTimerCtrlState *s = ASPEED_TIMER(dev);
+
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        aspeed_init_one_timer(s, i);
+        sysbus_init_irq(sbd, &s->timers[i].irq);
+    }
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_timer_ops, s,
+                          TYPE_ASPEED_TIMER, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_timer_reset(DeviceState *dev)
+{
+    int i;
+    AspeedTimerCtrlState *s = ASPEED_TIMER(dev);
+
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        AspeedTimer *t = &s->timers[i];
+        /* Explictly call helpers to avoid any conditional behaviour through
+         * aspeed_timer_set_ctrl().
+         */
+        aspeed_timer_ctrl_enable(t, false);
+        aspeed_timer_ctrl_external_clock(t, TIMER_CLOCK_USE_APB);
+        aspeed_timer_ctrl_overflow_interrupt(t, false);
+        aspeed_timer_ctrl_pulse_enable(t, false);
+        t->level = 0;
+        t->reload = 0;
+        t->match[0] = 0;
+        t->match[1] = 0;
+    }
+    s->ctrl = 0;
+    s->ctrl2 = 0;
+}
+
+static const VMStateDescription vmstate_aspeed_timer = {
+    .name = "aspeed.timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(id, AspeedTimer),
+        VMSTATE_INT32(level, AspeedTimer),
+        VMSTATE_PTIMER(timer, AspeedTimer),
+        VMSTATE_UINT32(reload, AspeedTimer),
+        VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_aspeed_timer_state = {
+    .name = "aspeed.timerctrl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
+        VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
+        VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
+                             ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_timer,
+                             AspeedTimer),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_timer_realize;
+    dc->reset = aspeed_timer_reset;
+    dc->desc = "ASPEED Timer";
+    dc->vmsd = &vmstate_aspeed_timer_state;
+}
+
+static const TypeInfo aspeed_timer_info = {
+    .name = TYPE_ASPEED_TIMER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedTimerCtrlState),
+    .class_init = timer_class_init,
+};
+
+static void aspeed_timer_register_types(void)
+{
+    type_register_static(&aspeed_timer_info);
+}
+
+type_init(aspeed_timer_register_types)
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
new file mode 100644
index 0000000..44dc2f8
--- /dev/null
+++ b/include/hw/timer/aspeed_timer.h
@@ -0,0 +1,59 @@
+/*
+ *  ASPEED AST2400 Timer
+ *
+ *  Andrew Jeffery <andrew@aj.id.au>
+ *
+ *  Copyright (C) 2016 IBM Corp.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, write to the Free Software Foundation, Inc.,
+ *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+#ifndef ASPEED_TIMER_H
+#define ASPEED_TIMER_H
+
+#include "hw/ptimer.h"
+
+#define ASPEED_TIMER(obj) \
+    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
+#define TYPE_ASPEED_TIMER "aspeed.timer"
+#define ASPEED_TIMER_NR_TIMERS 8
+
+typedef struct AspeedTimer {
+    qemu_irq irq;
+
+    uint8_t id;
+
+    /**
+     * Track the line level as the ASPEED timers implement edge triggered
+     * interrupts, signalling with both the rising and falling edge.
+     */
+    int32_t level;
+    ptimer_state *timer;
+    uint32_t reload;
+    uint32_t match[2];
+} AspeedTimer;
+
+typedef struct AspeedTimerCtrlState {
+    /*< private >*/
+    SysBusDevice parent;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t ctrl;
+    uint32_t ctrl2;
+    AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
+} AspeedTimerCtrlState;
+
+#endif /* ASPEED_TIMER_H */
diff --git a/trace-events b/trace-events
index 0ad8a1c..e589230 100644
--- a/trace-events
+++ b/trace-events
@@ -1892,3 +1892,12 @@ qio_channel_command_new_pid(void *ioc, int writefd, int readfd, int pid) "Comman
 qio_channel_command_new_spawn(void *ioc, const char *binary, int flags) "Command new spawn ioc=%p binary=%s flags=%d"
 qio_channel_command_abort(void *ioc, int pid) "Command abort ioc=%p pid=%d"
 qio_channel_command_wait(void *ioc, int pid, int ret, int status) "Command abort ioc=%p pid=%d ret=%d status=%d"
+
+# hw/timer/aspeed_timer.c
+aspeed_timer_ctrl_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
+aspeed_timer_ctrl_external_clock(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
+aspeed_timer_ctrl_overflow_interrupt(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
+aspeed_timer_ctrl_pulse_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
+aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" PRIx32
+aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d register %d: 0x%" PRIx32
+aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRIx64 ": of size %u: 0x%" PRIx64
-- 
2.5.0
