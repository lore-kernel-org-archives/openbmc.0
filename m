Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9t853KkbzDqCT
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 13:04:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=xmxrqYYR; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id BFFE35EC079;
 Thu, 19 May 2016 20:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=dd0wM6P917KQrfO2RUd+dZt
 JdfA=; b=xmxrqYYRRhtT0REGMuVRTeBegDcP6rOHxjZq9SUnvWBkKkOAi6d6FDp
 oO/gY9i/g+2w+HeM32JQUHipnUSND3tdLgFL/KeJiy/U532m5Meuh1D24fww6+At
 1yTblFFB3L7tbSaoJhm1/0ax33sr5a2Anv02kozmawNoTbc0y0bQ=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id CD3E95EC072;
 Thu, 19 May 2016 20:04:32 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu] hw/timer: Add clock value matching support to
 aspeed_timer
Date: Fri, 20 May 2016 12:34:21 +0930
Message-Id: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Fri, 20 May 2016 03:04:38 -0000

Clock value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on
the palmetto-bmc machine. Two match registers are provided for each
timer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/timer/aspeed_timer.c         | 132 +++++++++++++++++++++++++++++-----------
 include/hw/timer/aspeed_timer.h |   5 +-
 2 files changed, 101 insertions(+), 36 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 51e8303cdaa3..e88234e7823f 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -9,13 +9,12 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <math.h>
 #include "qemu/osdep.h"
-#include "hw/ptimer.h"
 #include "hw/sysbus.h"
 #include "hw/timer/aspeed_timer.h"
 #include "qemu-common.h"
 #include "qemu/bitops.h"
-#include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "trace.h"
 
@@ -76,21 +75,96 @@ static inline bool timer_can_pulse(AspeedTimer *t)
     return t->id >= TIMER_FIRST_CAP_PULSE;
 }
 
+static inline bool timer_external_clock(AspeedTimer *t)
+{
+    return timer_ctrl_status(t, op_external_clock);
+}
+
+static inline double calculate_period(struct AspeedTimer *t)
+{
+    double rate;
+
+    rate = timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ : TIMER_CLOCK_APB_HZ;
+
+    return NANOSECONDS_PER_SECOND / rate;
+}
+
+static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
+{
+    double ticks;
+
+    ticks = floor((now_ns - t->start) / calculate_period(t));
+
+    return t->reload - MIN(t->reload, (uint32_t) ticks);
+}
+
+static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
+{
+    double delta_ns;
+
+    ticks = MIN(t->reload, ticks);
+    delta_ns = floor((t->reload - ticks) * calculate_period(t));
+
+    return t->start + (uint64_t) delta_ns;
+}
+
+static uint64_t calculate_next(struct AspeedTimer *t)
+{
+    uint64_t now;
+    uint64_t next;
+    int i;
+    uint64_t seq[] = {
+        MAX(t->match[0], t->match[1]),
+        MIN(t->match[0], t->match[1]),
+        0,
+    };
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    for (i = 0; i < ARRAY_SIZE(seq); i++) {
+        next = calculate_time(t, seq[i]);
+        if (now < next) {
+            return next;
+        }
+    }
+
+    {
+        uint64_t reload_ns;
+
+        reload_ns = (uint64_t) floor(t->reload * calculate_period(t));
+        t->start = now - ((now - t->start) % reload_ns);
+    }
+
+    return calculate_next(t);
+}
+
 static void aspeed_timer_expire(void *opaque)
 {
     AspeedTimer *t = opaque;
+    bool interrupt = false;
+    uint32_t ticks;
 
-    /* Only support interrupts on match values of zero for the moment - this is
-     * sufficient to boot an aspeed_defconfig Linux kernel.
-     *
-     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer.c)
-     */
-    bool match = !(t->match[0] && t->match[1]);
-    bool interrupt = timer_overflow_interrupt(t) || match;
-    if (timer_enabled(t) && interrupt) {
+    if (!timer_enabled(t)) {
+        return;
+    }
+
+    ticks = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+
+    interrupt = !ticks && timer_overflow_interrupt(t);
+
+    if (!interrupt) {
+        interrupt = ticks <= MIN(t->match[0], t->match[1]);
+    }
+
+    if (!interrupt) {
+        interrupt = ticks <= MAX(t->match[0], t->match[1]);
+    }
+
+    if (interrupt) {
         t->level = !t->level;
         qemu_set_irq(t->irq, t->level);
     }
+
+    timer_mod(&t->timer, calculate_next(t));
 }
 
 static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
@@ -99,7 +173,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
 
     switch (reg) {
     case TIMER_REG_STATUS:
-        value = ptimer_get_count(t->timer);
+        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case TIMER_REG_RELOAD:
         value = t->reload;
@@ -159,24 +233,21 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     switch (reg) {
     case TIMER_REG_STATUS:
         if (timer_enabled(t)) {
-            ptimer_set_count(t->timer, value);
+            uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
+
+            t->start += delta * calculate_period(t);
+            timer_mod(&t->timer, calculate_next(t));
         }
         break;
     case TIMER_REG_RELOAD:
         t->reload = value;
-        ptimer_set_limit(t->timer, value, 1);
         break;
     case TIMER_REG_MATCH_FIRST:
     case TIMER_REG_MATCH_SECOND:
-        if (value) {
-            /* Non-zero match values are unsupported. As such an interrupt will
-             * always be triggered when the timer reaches zero even if the
-             * overflow interrupt control bit is clear.
-             */
-            qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by device: "
-                    "0x%" PRIx32 "\n", __func__, value);
-        } else {
-            t->match[reg - 2] = value;
+        t->match[reg - 2] = value;
+        if (timer_enabled(t)) {
+            timer_mod(&t->timer, calculate_next(t));
         }
         break;
     default:
@@ -195,21 +266,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
 {
     trace_aspeed_timer_ctrl_enable(t->id, enable);
     if (enable) {
-        ptimer_run(t->timer, 0);
+        t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        timer_mod(&t->timer, calculate_next(t));
     } else {
-        ptimer_stop(t->timer);
-        ptimer_set_limit(t->timer, t->reload, 1);
+        timer_del(&t->timer);
     }
 }
 
 static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
 {
     trace_aspeed_timer_ctrl_external_clock(t->id, enable);
-    if (enable) {
-        ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
-    } else {
-        ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
-    }
 }
 
 static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
@@ -350,12 +416,10 @@ static const MemoryRegionOps aspeed_timer_ops = {
 
 static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
 {
-    QEMUBH *bh;
     AspeedTimer *t = &s->timers[id];
 
     t->id = id;
-    bh = qemu_bh_new(aspeed_timer_expire, t);
-    t->timer = ptimer_init(bh);
+    timer_init_ns(&t->timer, QEMU_CLOCK_VIRTUAL, aspeed_timer_expire, t);
 }
 
 static void aspeed_timer_realize(DeviceState *dev, Error **errp)
@@ -403,7 +467,7 @@ static const VMStateDescription vmstate_aspeed_timer = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(id, AspeedTimer),
         VMSTATE_INT32(level, AspeedTimer),
-        VMSTATE_PTIMER(timer, AspeedTimer),
+        VMSTATE_TIMER(timer, AspeedTimer),
         VMSTATE_UINT32(reload, AspeedTimer),
         VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
         VMSTATE_END_OF_LIST()
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 44dc2f89d5c6..e614c8714134 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -22,7 +22,7 @@
 #ifndef ASPEED_TIMER_H
 #define ASPEED_TIMER_H
 
-#include "hw/ptimer.h"
+#include "qemu/typedefs.h"
 
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
@@ -33,15 +33,16 @@ typedef struct AspeedTimer {
     qemu_irq irq;
 
     uint8_t id;
+    QEMUTimer timer;
 
     /**
      * Track the line level as the ASPEED timers implement edge triggered
      * interrupts, signalling with both the rising and falling edge.
      */
     int32_t level;
-    ptimer_state *timer;
     uint32_t reload;
     uint32_t match[2];
+    uint64_t start;
 } AspeedTimer;
 
 typedef struct AspeedTimerCtrlState {
-- 
2.7.4
