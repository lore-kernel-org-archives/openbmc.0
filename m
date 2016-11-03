Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8YQm3n5QzDvkP
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 16:28:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=KjDM2iqu; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=hZqLeD7X; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 362272077E;
 Thu,  3 Nov 2016 01:28:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 01:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:from:to:cc:subject:date:message-id; s=
 mesmtp; bh=jrH2KfdfZiI62rfD1x3OuQkIayM=; b=KjDM2iqu4l1LOu1K7leao
 zn2ZO2yoQNLBnNrp2nLJSZZEfqeZrs6gbPaxOZ6rFPiXlFc1Ldsul0Ka1u5js+Ti
 8ioSdOpjVAbN1ceMaQMser5xh4W2L9M2PONsi4n7+PVtyPMe1seV6K5JbONqeet8
 9JRpADYJnfx15/r1tkuvoM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:cc:subject
 :date:message-id; s=smtpout; bh=jrH2KfdfZiI62rfD1x3OuQkIayM=; b=
 hZqLeD7XEhvoAGbOTG6xOygFYoN0h8h9ET+b48180vh8lfwVUvXWHZgoXEN5Taek
 gVjp8htPmn1gHOfH26aVyXH3ClVYfydDriMxH6kxvVp2wdDsP8Ou/UA276pVfX5e
 et+2OMpt+cjJYinFZHmFc2krqSA+faShKKS2tVUxPPs=
X-ME-Sender: <xms:7soaWBnYmTZ3I_jbyqQ-LOF9lDE13WbfK6MCLk6wnt7yp_sey2oBag>
X-Sasl-enc: WWb7czBEG9vFeBcsYN19y84CaSBJgAw9GUk5/s4BnHu2 1478150891
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6DA1CC08D;
 Thu,  3 Nov 2016 01:28:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH qemu] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
Date: Thu,  3 Nov 2016 15:57:22 +1030
Message-Id: <1478150842-5636-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Thu, 03 Nov 2016 05:28:17 -0000

The implementation was incorrectly scaling the reload value by
nanoseconds per second. In reality the span represented by the reload
value is determined by the selected clock, either APB or 1MHz.

Test the selected clock and apply the appropriate scaling, then convert to
nanoseconds for the timer infrastructure. Note that the APB rate is hard-coded
and reflects the value used by the timer controller, and isn't necessarily an
accurate representation of the clock configuration programmed in the SCU.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

I'm hesitant to send this upstream as I don't like the idea of hardcoding the
clock rates in the way that we have (i.e. the timer as well). I think we should
rework the timer and the watchdog to derive their clocks from the SCU, but
that's more work than I'm willing to put in to get reboots working.

 hw/watchdog/wdt_aspeed.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 2ec01769b745..c81608d6ac74 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -61,11 +61,14 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 
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
@@ -78,21 +81,36 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     case WDT_RESTART:
         if ((data & 0xFFFF) == 0x4755) {
+            uint32_t reload;
+
             s->reg_status = s->reg_reload_value;
 
+            if (pclk) {
+                reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
+                        PCLK_HZ) ;
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
+                        PCLK_HZ) ;
+            } else {
+                reload = s->reg_reload_value * 1000;
+            }
+
             s->enabled = true;
-            timer_mod(s->timer,
-                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                      s->reg_reload_value * NANOSECONDS_PER_SECOND);
+            timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
         }
         else if (!en && s->enabled) {
             s->enabled = false;
-- 
2.7.4
