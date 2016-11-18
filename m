Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mJ0fBxzDvwV
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:11 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 73B16207B3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:33 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 420CE480075;
 Fri, 18 Nov 2016 15:25:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 13/38] aspeed/smc: introduce a
 aspeed_smc_flash_update_cs() helper
Date: Fri, 18 Nov 2016 15:21:53 +0100
Message-Id: <1479478938-13267-14-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1107041087549967106
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:12 -0000

aspeed_smc_update_cs() was uselessly looping on all CS to update their
status.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 91cdc0bf1ac7..1c6c5089f265 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -408,14 +408,10 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
     },
 };
 
-static void aspeed_smc_update_cs(const AspeedSMCState *s)
+static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
-    int i;
-
-    for (i = 0; i < s->num_cs; ++i) {
-        qemu_set_irq(s->cs_lines[i],
-                     aspeed_smc_is_ce_stop_active(&s->flashes[i]));
-    }
+    AspeedSMCState *s = fl->controller;
+    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
 }
 
 static void aspeed_smc_reset(DeviceState *d)
@@ -431,6 +427,7 @@ static void aspeed_smc_reset(DeviceState *d)
     /* Unselect all slaves */
     for (i = 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
+        qemu_set_irq(s->cs_lines[i], true);
     }
 
     /* setup default segment register values for all */
@@ -438,8 +435,6 @@ static void aspeed_smc_reset(DeviceState *d)
         s->regs[R_SEG_ADDR0 + i] =
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
-
-    aspeed_smc_update_cs(s);
 }
 
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
@@ -489,8 +484,9 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
         addr == s->r_ce_ctrl) {
         s->regs[addr] = value;
     } else if (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        int cs = addr - s->r_ctrl0;
         s->regs[addr] = value;
-        aspeed_smc_update_cs(s);
+        aspeed_smc_flash_update_cs(&s->flashes[cs]);
     } else if (addr >= R_SEG_ADDR0 &&
                addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
         int cs = addr - R_SEG_ADDR0;
-- 
2.7.4
