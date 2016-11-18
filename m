Return-Path: <clg@kaod.org>
Received: from 19.mo7.mail-out.ovh.net (19.mo7.mail-out.ovh.net
 [178.33.251.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dn4yShzDvqT
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:33 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 476FC2079A
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:30 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 094E148009B;
 Fri, 18 Nov 2016 15:25:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 12/38] aspeed/smc: rework the prototype of the
 AspeedSMCFlash helper routines
Date: Fri, 18 Nov 2016 15:21:52 +0100
Message-Id: <1479478938-13267-13-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1106196660509313794
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:34 -0000

Change the routines prototype to use a 'AspeedSMCFlash *' instead of
'AspeedSMCState *'. The result will help in making future changes
clearer.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 37 ++++++++++++++++++++++---------------
 include/hw/ssi/aspeed_smc.h |  2 +-
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 78f5aed53247..91cdc0bf1ac7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -328,19 +328,30 @@ static const MemoryRegionOps aspeed_smc_flash_default_ops = {
     },
 };
 
-static inline int aspeed_smc_flash_mode(const AspeedSMCState *s, int cs)
+static inline int aspeed_smc_flash_mode(const AspeedSMCFlash *fl)
 {
-    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
+    AspeedSMCState *s = fl->controller;
+
+    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CMD_MODE_MASK;
 }
 
-static inline bool aspeed_smc_is_usermode(const AspeedSMCState *s, int cs)
+static inline bool aspeed_smc_is_usermode(const AspeedSMCFlash *fl)
 {
-    return aspeed_smc_flash_mode(s, cs) == CTRL_USERMODE;
+    return aspeed_smc_flash_mode(fl) == CTRL_USERMODE;
 }
 
-static inline bool aspeed_smc_is_writable(const AspeedSMCState *s, int cs)
+static inline bool aspeed_smc_is_ce_stop_active(const AspeedSMCFlash *fl)
 {
-    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+    AspeedSMCState *s = fl->controller;
+
+    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CE_STOP_ACTIVE;
+}
+
+static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
+{
+    AspeedSMCState *s = fl->controller;
+
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
 }
 
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
@@ -350,7 +361,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     uint64_t ret = 0;
     int i;
 
-    if (aspeed_smc_is_usermode(s, fl->id)) {
+    if (aspeed_smc_is_usermode(fl)) {
         for (i = 0; i < size; i++) {
             ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
         }
@@ -370,13 +381,13 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
     const AspeedSMCState *s = fl->controller;
     int i;
 
-    if (!aspeed_smc_is_writable(s, fl->id)) {
+    if (!aspeed_smc_is_writable(fl)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x%"
                       HWADDR_PRIx "\n", __func__, addr);
         return;
     }
 
-    if (!aspeed_smc_is_usermode(s, fl->id)) {
+    if (!aspeed_smc_is_usermode(fl)) {
         qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
                       __func__);
         return;
@@ -397,17 +408,13 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
     },
 };
 
-static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs)
-{
-    return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
-}
-
 static void aspeed_smc_update_cs(const AspeedSMCState *s)
 {
     int i;
 
     for (i = 0; i < s->num_cs; ++i) {
-        qemu_set_irq(s->cs_lines[i], aspeed_smc_is_ce_stop_active(s, i));
+        qemu_set_irq(s->cs_lines[i],
+                     aspeed_smc_is_ce_stop_active(&s->flashes[i]));
     }
 }
 
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index bdfbcc0ffa7d..c64954f6103f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
 } AspeedSMCController;
 
 typedef struct AspeedSMCFlash {
-    const struct AspeedSMCState *controller;
+    struct AspeedSMCState *controller;
 
     uint8_t id;
     uint32_t size;
-- 
2.7.4
