Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qww0b0jwlzDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 10:43:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Ijs+QypA; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id 77so8131185pfv.2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=3lR9Y9HIRp++lP/z00epiWrHt5YJtFO/zpSyLGLMUFo=;
 b=Ijs+QypAGKGx6RdehOj3Lgvk0az3AT52vCkKR8ri3w9oqfyTorITv9H02vr9+YPJ1/
 thFfAFLYmCse24PjyUVMEsuobetLZIlWC7o/GnJHUDgjZh5LZCLgXVnVEQRRuRI4dUAQ
 ZLCEQ+ajDQSWIy4g69gH5wHpO6OLYsM20NgRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=3lR9Y9HIRp++lP/z00epiWrHt5YJtFO/zpSyLGLMUFo=;
 b=HcY4PNUoqGSR+kBtSNci+mV+HdgY7FFGlQM2MgAPBNlrwcNMr+nDJjtK09aLmXfpFS
 dMcINu43nXA0td8F3ROrQpsEBME3UMi9CUgKsOG+T7GchZG47tN65mPJxi7q2UARXQ43
 +eqLLwH3MhVYB2IhxJt+ueOlEdKKR2dc7P/QmxbCFZyxN65fMi+NuBxqCwEo6JCiIDni
 wWR4q7+JoYC3cJYdj1IxxUB1yUKorsE7zFv0AGxRcxo2DgJygV3u6NzK+sQ5rKg8BpBl
 0YLsXW7nluKgKe6AY4hgOuxzT1JdbxxPFRTlTkldfw4G53LvldsbU9n6rTovdmLCd4D5
 fo8g==
X-Gm-Message-State: AOPr4FVjB3y+SQwbu+qAeEEO9g8fPkMAS4k7yO9y+aqhkCe7v0ZBvyEjz9H6jXW2QZN2Zw==
X-Received: by 10.98.27.78 with SMTP id b75mr24969794pfb.49.1461890588442;
 Thu, 28 Apr 2016 17:43:08 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:dbb:a970:cef7:c600])
 by smtp.gmail.com with ESMTPSA id x184sm18099802pfb.53.2016.04.28.17.43.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 28 Apr 2016 17:43:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [qemu 1/3] hw/arm/ast2500: Integrate SCU
Date: Fri, 29 Apr 2016 10:12:50 +0930
Message-Id: <1461890572-30636-2-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Fri, 29 Apr 2016 00:43:11 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/ast2500.c         | 23 +++++++++++++++++++++++
 hw/misc/aspeed_scu.c     | 30 +++++++++++++++++-------------
 include/hw/arm/ast2500.h |  2 ++
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/hw/arm/ast2500.c b/hw/arm/ast2500.c
index 7bc425d7c858..4474440158e2 100644
--- a/hw/arm/ast2500.c
+++ b/hw/arm/ast2500.c
@@ -23,6 +23,7 @@
 #define AST2500_IOMEM_SIZE       0x00200000
 #define AST2500_IOMEM_BASE       0x1E600000
 #define AST2500_VIC_BASE         0x1E6C0000
+#define AST2500_SCU_BASE         0x1E6E2000
 #define AST2500_TIMER_BASE       0x1E782000
 
 static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
@@ -66,6 +67,10 @@ static void ast2500_init(Object *obj)
     object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
     object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), NULL);
     qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
+
+    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
+    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
 }
 
 static void ast2500_realize(DeviceState *dev, Error **errp)
@@ -114,6 +119,24 @@ static void ast2500_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* SCU */
+    object_property_set_int(OBJECT(&s->scu), 0xEFF43E8BU, "scu0c", &err);
+    object_property_set_int(OBJECT(&s->scu), 0x93000400U, "scu24", &err);
+    /* SCU70 bit 23: 0 24Mhz. bit 11:9: 0b001 AXI:ABH ratio 2:1 */
+    object_property_set_int(OBJECT(&s->scu), 0x00000200U, "scu70", &err);
+    /* AST2500 revision A1 */
+    object_property_set_int(OBJECT(&s->scu), 0x04010303U, "scu7c", &err);
+    object_property_set_int(OBJECT(&s->scu), 0x03000000U, "scu88", &err);
+    object_property_set_int(OBJECT(&s->scu), 0x00000000U, "scu8c", &err);
+    object_property_set_int(OBJECT(&s->scu), 0x023FFFF3U, "scu9c", &err);
+
+    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+	return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2500_SCU_BASE);
+
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 1950a0e301cc..5505d3e95ffd 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -21,7 +21,9 @@
 #define OFFSET_TO_REG(o) (o >> 2)
 
 #define SCU00 OFFSET_TO_REG(0x00)
+#define SCU08 OFFSET_TO_REG(0x08)
 #define SCU0C OFFSET_TO_REG(0x0C)
+#define SCU24 OFFSET_TO_REG(0x24)
 #define SCU2C OFFSET_TO_REG(0x2C)
 #define SCU3C OFFSET_TO_REG(0x3C)
 #define SCU70 OFFSET_TO_REG(0x70)
@@ -46,19 +48,21 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
     }
 
     switch (offset) {
-        case 0x00:
-        case 0x0C:
-        case 0x2C:
-        case 0x3C:
-        case 0x70:
-        case 0x7C:
-        case 0x80 ... 0x9C:
-            break;
-        default:
-            qemu_log_mask(LOG_UNIMP,
-                          "%s: Read from uninitialised register 0x%" HWADDR_PRIx "\n",
-                          __func__, offset);
-            break;
+    case 0x00:
+    case 0x08:
+    case 0x0C:
+    case 0x24:
+    case 0x2C:
+    case 0x3C:
+    case 0x70:
+    case 0x7C:
+    case 0x80 ... 0x9C:
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                "%s: Read from uninitialised register 0x%" HWADDR_PRIx "\n",
+                __func__, offset);
+        break;
     }
 
     return s->regs[OFFSET_TO_REG(offset)];
diff --git a/include/hw/arm/ast2500.h b/include/hw/arm/ast2500.h
index 860e29099c00..9177e7fbcd92 100644
--- a/include/hw/arm/ast2500.h
+++ b/include/hw/arm/ast2500.h
@@ -14,6 +14,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
+#include "hw/misc/aspeed_scu.h"
 #include "hw/timer/aspeed_timer.h"
 
 typedef struct AST2500State {
@@ -25,6 +26,7 @@ typedef struct AST2500State {
     MemoryRegion iomem;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
+    AspeedSCUState scu;
 } AST2500State;
 
 #define TYPE_AST2500 "ast2500"
-- 
2.7.4
