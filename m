Return-Path: <clg@kaod.org>
X-Greylist: delayed 556 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:36:06 AEDT
Received: from 12.mo7.mail-out.ovh.net (12.mo7.mail-out.ovh.net
 [178.33.107.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0sy2q0YzDsyJ
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:36:06 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 2A7C91EC55
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:40 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id E74C5480079;
 Fri, 18 Nov 2016 15:26:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 33/38] wdt: aspeed: use scu to get clock freq
Date: Fri, 18 Nov 2016 15:22:13 +0100
Message-Id: <1479478938-13267-34-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1125899908019817218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:36:06 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/misc/aspeed_scu.c             | 12 ++++++++++++
 hw/watchdog/wdt_aspeed.c         | 19 +++++++++++++++----
 include/hw/misc/aspeed_scu.h     |  1 +
 include/hw/watchdog/wdt_aspeed.h |  2 ++
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2926ed2dd46d..06c1f03555b1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -173,6 +173,8 @@ static void aspeed_soc_init(Object *obj)
     object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
     object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
     qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
+    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
+                                   NULL);
 }
 
 static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index b5efba9121b2..3f577ca12771 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -268,6 +268,18 @@ bool is_supported_silicon_rev(uint32_t silicon_rev)
     return false;
 }
 
+#define ASPEED_PLL_25MHZ    25000000
+#define ASPEED_PLL_24MHZ    24000000
+#define ASPEED_PLL_12MHZ    12000000
+
+uint32_t aspeed_scu_get_clk(AspeedSCUState *scu)
+{
+    if (scu->hw_strap1 & AST2400_CLK_25M_IN)
+        return ASPEED_PLL_25MHZ;
+    else
+        return ASPEED_PLL_24MHZ;
+}
+
 static void aspeed_scu_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 860d4b73e2b6..276783de90ad 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -7,10 +7,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "sysemu/watchdog.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
+#include "hw/misc/aspeed_scu.h"
 
 #define WDT_IO_REGION_SIZE      0x1000
 
@@ -56,8 +58,6 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 
 }
 
-#define PCLK_HZ 24000000
-
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
@@ -82,7 +82,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
 
             if (pclk) {
                 reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
-                                  PCLK_HZ) ;
+                                  s->pclk_freq);
             } else {
                 reload = s->reg_reload_value * 1000;
             }
@@ -99,7 +99,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
 
             if (pclk) {
                 reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
-                                  PCLK_HZ);
+                                  s->pclk_freq);
             } else {
                 reload = s->reg_reload_value * 1000;
             }
@@ -177,10 +177,21 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    Object *obj;
+    Error *err = NULL;
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired,
                             dev);
 
+    obj = object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_setg(errp, "%s: required link 'scu' not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->pclk_freq = aspeed_scu_get_clk(ASPEED_SCU(obj));
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
                           TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index bd4ac013f997..067f9f01819d 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -37,6 +37,7 @@ typedef struct AspeedSCUState {
 #define AST2500_A1_SILICON_REV   0x04010303U
 
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
+extern uint32_t aspeed_scu_get_clk(AspeedSCUState *scu);
 
 /*
  * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index dbf45ae968db..0483335ecee5 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
     uint32_t reg_reload_value;
     uint32_t reg_restart;
     uint32_t reg_ctrl;
+
+    uint32_t pclk_freq;
 } AspeedWDTState;
 
 #endif  /* ASPEED_WDT_H */
-- 
2.7.4
