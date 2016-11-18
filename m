Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0g368TJzDw2r
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:39 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E5A1D1EC6D
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:36 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id B30954800AB;
 Fri, 18 Nov 2016 15:26:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 32/38] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
Date: Fri, 18 Nov 2016 15:22:12 +0100
Message-Id: <1479478938-13267-33-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1124774007305505538
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:40 -0000

From: Andrew Jeffery <andrew@aj.id.au>

The implementation was incorrectly scaling the reload value by
nanoseconds per second. In reality the span represented by the reload
value is determined by the selected clock, either APB or 1MHz.

Test the selected clock and apply the appropriate scaling, then
convert to nanoseconds for the timer infrastructure. Note that the APB
rate is hard-coded and reflects the value used by the timer
controller, and isn't necessarily an accurate representation of the
clock configuration programmed in the SCU.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 29d9d7f91463..860d4b73e2b6 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -56,11 +56,14 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 
 }
 
+#define PCLK_HZ 24000000
+
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
     bool en = data & BIT(0);
+    bool pclk = !(data & BIT(4));
 
     switch (offset) {
     case WDT_STATUS:
@@ -73,21 +76,36 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     case WDT_RESTART:
         if ((data & 0xFFFF) == 0x4755) {
+            uint32_t reload;
+
             s->reg_status = s->reg_reload_value;
 
+            if (pclk) {
+                reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
+                                  PCLK_HZ) ;
+            } else {
+                reload = s->reg_reload_value * 1000;
+            }
+
             if (s->enabled) {
                 timer_mod(s->timer,
-                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                          s->reg_reload_value * NANOSECONDS_PER_SECOND);
+                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
             }
         }
         break;
     case WDT_CTRL:
         if (en && !s->enabled) {
+            uint32_t reload;
+
+            if (pclk) {
+                reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
+                                  PCLK_HZ);
+            } else {
+                reload = s->reg_reload_value * 1000;
+            }
+
             s->enabled = true;
-            timer_mod(s->timer,
-                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                      s->reg_reload_value * NANOSECONDS_PER_SECOND);
+            timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
         } else if (!en && s->enabled) {
             s->enabled = false;
             timer_del(s->timer);
-- 
2.7.4
