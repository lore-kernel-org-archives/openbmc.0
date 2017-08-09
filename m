Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS1ZG1snXzDqjB
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 16:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Jm6SYB99"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dqGLmE/3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DBA921D8E;
 Wed,  9 Aug 2017 02:29:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GNDR9v
 AWMtBkJSHNWfHfTP0dAWDNQ4A24GlGMzS/HTE=; b=Jm6SYB99QtOLhJTExMaFwj
 YT+KsU5B9Rj+ZLf8lVrDvAPF59UNM4SnXYc2Fu60C2sohnT39D3iz7HiKWUVBnuZ
 mpSP6uIGquIyNrWxpLdDI0uUTQvFisWhCJJGLoIwImGHuF1UjB62BAzAmsGhTF1g
 Fth5MzzEVZUk3LecahNW2goX7kwvnLg7FK/EdGyJ0fR8SQ2Za7fQASp3TcjuFxYt
 W/PGR8ThnkGelYxXaerc9Hs6G4mFMr30xVRAinEzLBwhTWgvkzVxNvtj+EomkqLv
 nb2llqBEhiqRW+SdA88c0GsD8E0kmPPcQG+dLgn4z0OfwusEIuMMSJ6DCEcIRcAQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GNDR9vAWMtBkJSHNWfHfTP0dAWDNQ4A24GlGMzS/H
 TE=; b=dqGLmE/3WW2auXadagzWBkO+erkgutMijd9/oxliUv/kcURIggiTefLXJ
 Xg9cOcJFCx8Iz7lGyEvvKeVC0vsmK+kQ7eAdD6Op8G+hL+LaaXAFekJuMmGQN/3+
 UiinTm4nMfkKatxBxSkBtEaiEIZsttxm/d3/lwGnAyDAMQGxxqSLjkaUCGWOuu6p
 kzBQjG003H/8nwsFOrAf3RZMjt74EQ+b54azneAfjTheZhWNEyq874v18Ocv8mlr
 qYtxdJlDegN7W1jBE4mbU9zFlC9MQ2qasHEnIhJz9TA13I/RMJ8t4hz+2vtnPswl
 h+cyc95W8e/jn8ivKMkm61s805WdQ==
X-ME-Sender: <xms:tKuKWfyzKbRVjFHDzuH6DlSj9U_LwVgwSO-muUHYdEaKMrquw5W3PQ>
X-Sasl-enc: ZU1C114svhnd1gywXlZDwGaDCqnAj4irrggN3aF2tm9D 1502260147
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE5147E4EA;
 Wed,  9 Aug 2017 02:29:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, clg@kaod.org,
 peter.maydell@linaro.org, joel@jms.id.au, f4bug@amsat.org,
 ryan_chen@aspeedtech.com, openbmc@lists.ozlabs.org
Subject: [PATCH for 2.11 v2 1/2] watchdog: wdt_aspeed: Add support for the
 reset width register
Date: Wed,  9 Aug 2017 15:58:26 +0930
Message-Id: <20170809062828.3673-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 06:29:11 -0000

The reset width register controls how the pulse on the SoC's WDTRST{1,2}
pins behaves. A pulse is emitted if the external reset bit is set in
WDT_CTRL. On the AST2500 WDT_RESET_WIDTH can consume magic bit patterns
to configure push-pull/open-drain and active-high/active-low
behaviours and thus needs some special handling in the write path.

As some of the capabilities depend on the SoC version a silicon-rev
property is introduced, which is used to guard version-specific
behaviour.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/watchdog/wdt_aspeed.c         | 93 +++++++++++++++++++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  2 +
 2 files changed, 84 insertions(+), 11 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 8bbe579b6b66..22bce364d7b5 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -8,16 +8,19 @@
  */
 
 #include "qemu/osdep.h"
+
+#include "qapi/error.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "sysemu/watchdog.h"
+#include "hw/misc/aspeed_scu.h"
 #include "hw/sysbus.h"
-#include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
 
-#define WDT_STATUS              (0x00 / 4)
-#define WDT_RELOAD_VALUE        (0x04 / 4)
-#define WDT_RESTART             (0x08 / 4)
-#define WDT_CTRL                (0x0C / 4)
+#define WDT_STATUS                      (0x00 / 4)
+#define WDT_RELOAD_VALUE                (0x04 / 4)
+#define WDT_RESTART                     (0x08 / 4)
+#define WDT_CTRL                        (0x0C / 4)
 #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
 #define   WDT_CTRL_1MHZ_CLK             BIT(4)
@@ -25,18 +28,41 @@
 #define   WDT_CTRL_WDT_INTR             BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
 #define   WDT_CTRL_ENABLE               BIT(0)
+#define WDT_RESET_WIDTH                 (0x18 / 4)
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
+#define     WDT_POLARITY_MASK           (0xFF << 24)
+#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
+#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
+#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
 
-#define WDT_TIMEOUT_STATUS      (0x10 / 4)
-#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
-#define WDT_RESET_WDITH         (0x18 / 4)
+#define WDT_TIMEOUT_STATUS              (0x10 / 4)
+#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
-#define WDT_RESTART_MAGIC       0x4755
+#define WDT_RESTART_MAGIC               0x4755
 
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
 }
 
+static bool is_ast2500(const AspeedWDTState *s)
+{
+    switch (s->silicon_rev) {
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        return true;
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+    default:
+        break;
+    }
+
+    return false;
+}
+
 static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
@@ -55,9 +81,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     case WDT_CTRL:
         return s->regs[WDT_CTRL];
+    case WDT_RESET_WIDTH:
+        return s->regs[WDT_RESET_WIDTH];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -119,9 +146,27 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
             timer_del(s->timer);
         }
         break;
+    case WDT_RESET_WIDTH:
+    {
+        uint32_t property = data & WDT_POLARITY_MASK;
+
+        if (property && is_ast2500(s)) {
+            if (property == WDT_ACTIVE_HIGH_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
+            } else if (property == WDT_ACTIVE_LOW_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+            } else if (property == WDT_PUSH_PULL_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
+            } else if (property == WDT_OPEN_DRAIN_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
+            }
+        }
+        s->regs[WDT_RESET_WIDTH] &= ~s->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] |= data & s->ext_pulse_width_mask;
+        break;
+    }
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -167,6 +212,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
     s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_RESET_WIDTH] = 0xFF;
 
     timer_del(s->timer);
 }
@@ -187,6 +233,25 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
 
+    if (!is_supported_silicon_rev(s->silicon_rev)) {
+        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
+                s->silicon_rev);
+        return;
+    }
+
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+        s->ext_pulse_width_mask = 0xff;
+        break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        s->ext_pulse_width_mask = 0xfffff;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
 
     /* FIXME: This setting should be derived from the SCU hw strapping
@@ -199,6 +264,11 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static Property aspeed_wdt_properties[] = {
+    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -207,6 +277,7 @@ static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
     dc->reset = aspeed_wdt_reset;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->vmsd = &vmstate_aspeed_wdt;
+    dc->props = aspeed_wdt_properties;
 }
 
 static const TypeInfo aspeed_wdt_info = {
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 080c2231222e..7de3e5c224fb 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -27,6 +27,8 @@ typedef struct AspeedWDTState {
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
     uint32_t pclk_freq;
+    uint32_t silicon_rev;
+    uint32_t ext_pulse_width_mask;
 } AspeedWDTState;
 
 #endif  /* ASPEED_WDT_H */
-- 
2.11.0
