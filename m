Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qww0g6bYPzDqBZ
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 10:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=hMLIC4/4; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id y69so40680230pfb.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=ezJo354sknmyu9/MlV3q5NHK8V6pTxxiT8kxjTFkS70=;
 b=hMLIC4/4R+Gm6SFMH+2q9AgL7rmWvbp7Q4n73XNOIpLJH2UiFZVACkDxNSMoB7OAMs
 Gm4XZrXo403dqtiHa+zcnwFeCN9sci9QoSEEk0DhtOpTCJHF21kcfCiHaPaWMPGKtxwk
 /YURZlzGKAAlDRvDpuwDwHooQspyQutNxcjdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=ezJo354sknmyu9/MlV3q5NHK8V6pTxxiT8kxjTFkS70=;
 b=Qa7Yr+pYJivASYRaIpvIO9I7SbH+bpIpPO9Rs6E6GtWu1SGOWhFtC8rX/rcgyh6RwH
 jQqs2OTEn9FKz670Uaq8+9KNvicH2iXAYFrjDV7CTOjuHkWwMlOSjGgxAkElyuVkzfxC
 8lz6AybwN0I085jTqxc1HAgZYQ3KC3SawZw0XQHTJlKvLhm/a12jj47LEbT/1Xt7h8ix
 GmArO4xFK5mQIRAJvHEOw0xzKVuBaXumy5dJHjGrWWW6TjEjWXi25lvRyMKTgLNUwIC+
 SDI2owagu23LPa6ca/gfThXxXdrtwgXqfqePdgx+najqE4IpaHiln3s3fWoKzGrurcQf
 7uuw==
X-Gm-Message-State: AOPr4FU+fLdnojY3TGMVllhMwmqhaby3yv7BTFM5Ay/d/Fo4ylqIg3Fhoto3hsqnL3xHGw==
X-Received: by 10.98.73.142 with SMTP id r14mr25124678pfi.140.1461890593850;
 Thu, 28 Apr 2016 17:43:13 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:dbb:a970:cef7:c600])
 by smtp.gmail.com with ESMTPSA id x184sm18099802pfb.53.2016.04.28.17.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 28 Apr 2016 17:43:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [qemu 3/3] hw/watchdog: Add Apseed watchdog device model
Date: Fri, 29 Apr 2016 10:12:52 +0930
Message-Id: <1461890572-30636-4-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1461890572-30636-1-git-send-email-joel@jms.id.au>
References: <1461890572-30636-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Fri, 29 Apr 2016 00:43:16 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/watchdog/Makefile.objs        |   1 +
 hw/watchdog/wdt_aspeed.c         | 193 +++++++++++++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  33 +++++++
 3 files changed, 227 insertions(+)
 create mode 100644 hw/watchdog/wdt_aspeed.c
 create mode 100644 include/hw/watchdog/wdt_aspeed.h

diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
index 72e3ffd93c59..9589bed63a3d 100644
--- a/hw/watchdog/Makefile.objs
+++ b/hw/watchdog/Makefile.objs
@@ -2,3 +2,4 @@ common-obj-y += watchdog.o
 common-obj-$(CONFIG_WDT_IB6300ESB) += wdt_i6300esb.o
 common-obj-$(CONFIG_WDT_IB700) += wdt_ib700.o
 common-obj-$(CONFIG_WDT_DIAG288) += wdt_diag288.o
+common-obj-$(CONFIG_ASPEED_SOC) += wdt_aspeed.o
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
new file mode 100644
index 000000000000..19e0dabea067
--- /dev/null
+++ b/hw/watchdog/wdt_aspeed.c
@@ -0,0 +1,193 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/watchdog.h"
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#include "hw/watchdog/wdt_aspeed.h"
+
+#define WDT_IO_REGION_SIZE 0x20000
+
+#define WDT_STATUS              0x00
+#define WDT_RELOAD_VALUE        0x04
+#define WDT_RESTART             0x08
+#define WDT_CTRL                0x0C
+#define WDT_TIMEOUT_STATUS      0x10
+#define WDT_TIMEOUT_CLEAR       0x14
+#define WDT_RESET_WDITH         0x18
+
+#define WDT_RESTART_MAGIC       0x4755
+
+static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedWDTState *s = ASPEED_WDT(opaque);
+
+    switch (offset) {
+    case WDT_STATUS:
+        return s->reg_status;
+        break;
+    case WDT_RELOAD_VALUE:
+        return s->reg_reload_value;
+        break;
+    case WDT_RESTART:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: read from WO reg at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    case WDT_CTRL:
+        return s->reg_ctrl;
+        break;
+    case WDT_TIMEOUT_STATUS:
+    case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_WDITH:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return 0;
+}
+
+static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
+				 unsigned size)
+{
+    AspeedWDTState *s = ASPEED_WDT(opaque);
+    bool en = data & BIT(0);
+
+    switch (offset) {
+    case WDT_STATUS:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to RO reg at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    case WDT_RELOAD_VALUE:
+        s->reg_reload_value = data;
+        break;
+    case WDT_RESTART:
+        if ((data & 0xFFFF) == 0x4755) {
+            s->reg_status = s->reg_reload_value;
+
+            if (s->enabled) {
+                timer_mod(s->timer,
+                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                          s->reg_reload_value * NANOSECONDS_PER_SECOND);
+            }
+        }
+        break;
+    case WDT_CTRL:
+        if (en && !s->enabled) {
+            s->enabled = true;
+            timer_mod(s->timer,
+                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                      s->reg_reload_value * NANOSECONDS_PER_SECOND);
+        } else if (!en && s->enabled) {
+            s->enabled = false;
+            timer_del(s->timer);
+        }
+        break;
+    case WDT_TIMEOUT_STATUS:
+    case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_WDITH:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+    }
+    return;
+}
+
+static WatchdogTimerModel model = {
+    .wdt_name = TYPE_ASPEED_WDT,
+    .wdt_description = "aspeed watchdog device",
+};
+
+static const VMStateDescription vmstate_aspeed_wdt = {
+    .name = "vmstate_aspeed_wdt",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(timer, AspeedWDTState),
+        VMSTATE_BOOL(enabled, AspeedWDTState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const MemoryRegionOps aspeed_wdt_ops = {
+    .read = aspeed_wdt_read,
+    .write = aspeed_wdt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_wdt_reset(DeviceState *dev)
+{
+    AspeedWDTState *s = ASPEED_WDT(dev);
+
+    s->reg_status = 0x3EF1480;
+    s->reg_reload_value = 0x03EF1480;
+    s->reg_restart = 0;
+    s->reg_ctrl = 0;
+
+    s->enabled = false;
+    timer_del(s->timer);
+}
+
+static void aspeed_wdt_timer_expired(void *dev)
+{
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+}
+
+static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedWDTState *s = ASPEED_WDT(dev);
+
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired,
+                            dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
+                          TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_wdt_realize;
+    dc->reset = aspeed_wdt_reset;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->vmsd = &vmstate_aspeed_wdt;
+}
+
+static const TypeInfo aspeed_wdt_info = {
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .name  = TYPE_ASPEED_WDT,
+    .instance_size  = sizeof(AspeedWDTState),
+    .class_init = aspeed_wdt_class_init,
+};
+
+static void wdt_aspeed_register_types(void)
+{
+    watchdog_add_model(&model);
+    type_register_static(&aspeed_wdt_info);
+}
+
+type_init(wdt_aspeed_register_types)
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
new file mode 100644
index 000000000000..52cbafe1120f
--- /dev/null
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -0,0 +1,33 @@
+#ifndef ASPEED_WDT_H
+#define ASPEED_WDT_H
+
+#include "hw/qdev.h"
+
+#define TYPE_ASPEED_WDT "aspeed.wdt"
+#define ASPEED_WDT(obj) \
+    OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
+#define ASPEED_WDT_CLASS(klass) \
+    OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
+#define ASPEED_WDT_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
+
+#define WDT_ASPEED_INIT      0
+#define WDT_ASPEED_CHANGE    1
+#define WDT_ASPEED_CANCEL    2
+
+typedef struct AspeedWDTState {
+    /*< private >*/
+    DeviceState parent_obj;
+    QEMUTimer *timer;
+    bool enabled;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t reg_status;
+    uint32_t reg_reload_value;
+    uint32_t reg_restart;
+    uint32_t reg_ctrl;
+} AspeedWDTState;
+
+#endif  /* ASPEED_WDT_H */
-- 
2.7.4
