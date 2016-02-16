Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 8669C1A0019
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 22:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=H6JNPRgV; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 2F26B7EC07D;
 Tue, 16 Feb 2016 03:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 CGzrxzs6lZOjLbzAKry8zUMsDY4=; b=H6JNPRgVWq4IiRU3mtSfMBDRaRkZiaoX
 kS6xG+aFbliHKH3lTwZ53mL01ewo6CNldx7HHoncuM1Bsb7N1w2AW0U5HcGvR0Cf
 lyZN/WW5TwrTXeoG5oXTI6ExkFgqg79+lBQvIymin2Q/V/OpG/boPO8mM/M1AbIH
 kLDPUcSL5Ds=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 063507EC060;
 Tue, 16 Feb 2016 03:35:06 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer device model
Date: Tue, 16 Feb 2016 22:04:55 +1030
Message-Id: <1455622497-25966-2-git-send-email-andrew@aj.id.au>
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

Implement basic AST2400 timer functionality: Timers can be configured,
enabled, reset and disabled.

A number of hardware features are not implemented:

* Timer Overflow interrupts
* Clock value matching
* Pulse generation

The implementation is enough to boot the Linux kernel configured with
aspeed_defconfig.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 default-configs/arm-softmmu.mak |   2 +
 hw/timer/Makefile.objs          |   2 +
 hw/timer/aspeed_timer.c         | 313 ++++++++++++++++++++++++++++++++++++++++
 include/hw/timer/aspeed_timer.h |  55 +++++++
 trace-events                    |   9 ++
 5 files changed, 381 insertions(+)
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/timer/aspeed_timer.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index a9f82a1..4072174 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -110,3 +110,5 @@ CONFIG_IOH3420=y
 CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_SMBIOS=y
+
+CONFIG_ASPEED_SOC=y
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 133bd0d..f6f7351 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -33,3 +33,5 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
+
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
new file mode 100644
index 0000000..0359528
--- /dev/null
+++ b/hw/timer/aspeed_timer.c
@@ -0,0 +1,313 @@
+/*
+ *  ASPEED AST2400 Timer
+ *
+ *  Andrew Jeffery <andrew@aj.id.au>
+ *
+ *  Copyright (C) 2015, 2016 IBM Corp.
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
+
+#include <assert.h>
+#include <stdio.h>
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#include "qemu-common.h"
+#include "hw/ptimer.h"
+#include "qemu/main-loop.h"
+#include "hw/timer/aspeed_timer.h"
+#include "trace.h"
+
+#define TIMER_NR_REGS 4
+
+#define TIMER_CTRL_BITS 4
+
+#define TIMER_CLOCK_USE_EXT true
+#define TIMER_CLOCK_EXT_HZ 1000000
+#define TIMER_CLOCK_USE_APB false
+#define TIMER_CLOCK_APB_HZ 24000000
+
+#define TIMER_CTRL_OP_ENABLE 0
+#define TIMER_CTRL_OP_CLOCK_SELECT 1
+#define TIMER_CTRL_OP_OVERFLOW_INTERRUPT 2
+#define TIMER_CTRL_OP_PULSE_ENABLE 3
+
+#define TIMER_REG_STATUS 0
+#define TIMER_REG_RELOAD 1
+#define TIMER_REG_MATCH_FIRST 2
+#define TIMER_REG_MATCH_SECOND 3
+
+static inline bool timer_can_pulse(AspeedTimer *t)
+{
+    return t->id >= 4;
+}
+
+static void aspeed_timer_irq_update(AspeedTimer *t)
+{
+    qemu_set_irq(t->irq, t->enabled);
+}
+
+static void aspeed_timer_tick(void *opaque)
+{
+    AspeedTimer *t = opaque;
+
+    aspeed_timer_irq_update(t);
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
+        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %d\n",
+                      reg);
+        value = 0;
+        break;
+    }
+    return value;
+}
+
+static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedTimerState *s = opaque;
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
+static void aspeed_timer_set_value(AspeedTimerState *s, int timer, int reg,
+                                   uint32_t value)
+{
+    AspeedTimer *t;
+
+    assert(timer >= 0 && timer < ASPEED_TIMER_NR_TIMERS &&
+            "Programming error: Unexpected timer index");
+    trace_aspeed_timer_set_value(timer, reg, value);
+    t = &s->timers[timer];
+    switch (reg) {
+    case TIMER_REG_STATUS:
+        if (t->enabled) {
+            ptimer_set_count(t->timer, value);
+        }
+        break;
+    case TIMER_REG_RELOAD:
+        t->reload = value;
+        ptimer_set_limit(t->timer, value, 1);
+        break;
+    case TIMER_REG_MATCH_FIRST:
+    case TIMER_REG_MATCH_SECOND:
+        /* Nothing is done to make matching work, we just record the value */
+        t->match[reg - 2] = value;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Programming error: unexpected reg: %d\n",
+                      reg);
+        break;
+    }
+}
+
+static void aspeed_timer_ctrl_op(AspeedTimer *t, int op, bool set)
+{
+    switch (op) {
+    case TIMER_CTRL_OP_ENABLE:
+        trace_aspeed_timer_ctrl_op_timer_enable(t->id, set);
+        if (set) {
+            ptimer_run(t->timer, 0);
+        } else {
+            ptimer_stop(t->timer);
+            ptimer_set_limit(t->timer, t->reload, 1);
+        }
+        t->enabled = set;
+        break;
+    case TIMER_CTRL_OP_CLOCK_SELECT:
+        trace_aspeed_timer_ctrl_op_clock_select(t->id, set);
+        if (set) {
+            ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
+        } else {
+            ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
+        }
+        break;
+    case TIMER_CTRL_OP_OVERFLOW_INTERRUPT:
+        trace_aspeed_timer_ctrl_op_overflow_interrupt(t->id, set);
+        break;
+    case TIMER_CTRL_OP_PULSE_ENABLE:
+        if (timer_can_pulse(t)) {
+            trace_aspeed_timer_ctrl_op_pulse_enable(t->id, set);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                    "Timer does not support pulse mode\n");
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Programming error, unexpected op: %d\n",
+                op);
+        break;
+    }
+}
+
+static void aspeed_timer_set_ctrl(AspeedTimerState *s, uint32_t new)
+{
+    int i;
+    uint32_t changed = s->ctrl ^ new;
+
+    while (32 > (i = ctz32(changed))) {
+        int timer, op;
+        bool set;
+        AspeedTimer *t;
+
+        timer = i / TIMER_CTRL_BITS;
+        assert(timer < ASPEED_TIMER_NR_TIMERS);
+        t = &s->timers[timer];
+        op = i % TIMER_CTRL_BITS;
+        set = new & (1U << i);
+        aspeed_timer_ctrl_op(t, op, set);
+        changed &= ~(1U << i);
+    }
+    s->ctrl = new;
+}
+
+static void aspeed_timer_set_ctrl2(AspeedTimerState *s, uint32_t value)
+{
+    trace_aspeed_timer_set_ctrl2(value);
+}
+
+static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    const uint32_t tv = (uint32_t)(value & 0xFFFFFFFF);
+    const int reg = (offset & 0xf) / 4;
+    AspeedTimerState *s = opaque;
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
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_timer_init(AspeedTimer *t, uint8_t id, bool ext_clock)
+{
+    QEMUBH *bh;
+
+    t->id = id;
+    bh = qemu_bh_new(aspeed_timer_tick, t);
+    assert(bh);
+    t->timer = ptimer_init(bh);
+    assert(t->timer);
+    aspeed_timer_ctrl_op(t, TIMER_CTRL_OP_CLOCK_SELECT, ext_clock);
+}
+
+static void aspeed_timers_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedTimerState *s = ASPEED_TIMER(dev);
+    uint32_t clock_mask = 0;
+
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        aspeed_timer_init(&s->timers[i], i, TIMER_CLOCK_USE_APB);
+        clock_mask |= (1 << (1 + i * TIMER_CTRL_BITS));
+        sysbus_init_irq(sbd, &s->timers[i].irq);
+    }
+    /* Ensure control reg has timers configured with APB clock selected */
+    s->ctrl &= ~clock_mask;
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_timer_ops, s,
+                          TYPE_ASPEED_TIMER, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_timers_realize;
+    dc->desc = "ASPEED Timer";
+}
+
+static const TypeInfo aspeed_timer_info = {
+    .name = TYPE_ASPEED_TIMER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedTimerState),
+    .class_init = timer_class_init,
+};
+
+static void aspeed_timer_register_types(void)
+{
+    type_register_static(&aspeed_timer_info);
+}
+
+type_init(aspeed_timer_register_types);
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
new file mode 100644
index 0000000..a14db74
--- /dev/null
+++ b/include/hw/timer/aspeed_timer.h
@@ -0,0 +1,55 @@
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
+    OBJECT_CHECK(AspeedTimerState, (obj), TYPE_ASPEED_TIMER);
+#define TYPE_ASPEED_TIMER "aspeed.timer"
+#define ASPEED_TIMER_NR_TIMERS 8
+
+typedef struct AspeedTimer {
+    uint8_t id;
+    ptimer_state *timer;
+    uint32_t reload;
+    uint32_t match[2];
+    qemu_irq irq;
+    /* ptimer doesn't expose any method to check whether it's enabled, which we
+     * require for updating the timer IRQ state */
+    bool enabled;
+} AspeedTimer;
+
+typedef struct AspeedTimerState {
+    /* < private > */
+    SysBusDevice parent;
+
+    /* < public > */
+    MemoryRegion iomem;
+    AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
+    uint32_t ctrl;
+    uint32_t ctrl2;
+    qemu_irq irq;
+} AspeedTimerState;
+
+#endif /* ASPEED_TIMER_H */
diff --git a/trace-events b/trace-events
index f986c81..5325a23 100644
--- a/trace-events
+++ b/trace-events
@@ -1890,3 +1890,12 @@ qio_channel_command_new_pid(void *ioc, int writefd, int readfd, int pid) "Comman
 qio_channel_command_new_spawn(void *ioc, const char *binary, int flags) "Command new spawn ioc=%p binary=%s flags=%d"
 qio_channel_command_abort(void *ioc, int pid) "Command abort ioc=%p pid=%d"
 qio_channel_command_wait(void *ioc, int pid, int ret, int status) "Command abort ioc=%p pid=%d ret=%d status=%d"
+
+# hw/timer/aspeed_timer.c
+aspeed_timer_ctrl_op_timer_enable(uint8_t i, bool enable) "Configure timer %" PRIu8 ": %d"
+aspeed_timer_ctrl_op_clock_select(uint8_t i, bool enable) "Use external clock on %" PRIu8 ": %d"
+aspeed_timer_ctrl_op_pulse_enable(uint8_t i, bool enable) "Configure pulse mode on %" PRIu8 ": %d"
+aspeed_timer_ctrl_op_overflow_interrupt(uint8_t i, bool enable) "Overflow interrupt on %" PRIu8 ": %d"
+aspeed_timer_set_ctrl2(uint32_t value) "CTRL2 set to 0x%" PRIx32
+aspeed_timer_set_value(int timer, int reg, uint32_t value) "Write to register %d of timer %d: 0x%" PRIx32
+aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "Read at 0x%" PRIx64 ": of size %u 0x%" PRIx64
-- 
2.5.0
