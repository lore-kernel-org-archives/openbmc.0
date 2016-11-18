Return-Path: <clg@kaod.org>
Received: from 8.mo7.mail-out.ovh.net (8.mo7.mail-out.ovh.net [46.105.77.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fc3B47zDvvs
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:16 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6D0831C755
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:12 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 3CE0148009B;
 Fri, 18 Nov 2016 15:26:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 25/38] aspeed/sdmc: rework the locking register of the
 memory controller
Date: Fri, 18 Nov 2016 15:22:05 +0100
Message-Id: <1479478938-13267-26-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1118018611067521794
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:16 -0000

The lock register is unlocked with a write of a special value and
locked with a write of any other value. When unlocked, reads return
one and when locked a zero.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c         | 28 +++++++++++++++++++---------
 include/hw/misc/aspeed_sdmc.h |  1 +
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 5f3ac0b6f608..867caa2d64dc 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -83,17 +83,22 @@
 static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned size)
 {
     AspeedSDMCState *s = ASPEED_SDMC(opaque);
+    uint64_t val = 0;
 
     addr >>= 2;
 
-    if (addr >= ARRAY_SIZE(s->regs)) {
+    switch (addr) {
+    case R_PROT:
+        val = s->unlocked;
+        break;
+    default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, addr);
-        return 0;
+        break;
     }
 
-    return s->regs[addr];
+    return val;
 }
 
 static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
@@ -103,19 +108,18 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
 
     addr >>= 2;
 
-    if (addr >= ARRAY_SIZE(s->regs)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
+    if (addr == R_PROT) {
+        s->unlocked = (data == PROT_KEY_UNLOCK);
         return;
     }
 
-    if (addr != R_PROT && s->regs[R_PROT] != PROT_KEY_UNLOCK) {
+    if (!s->unlocked) { /* TODO protect : MCR04 ∼ MCR7C */
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
         return;
     }
 
-    if (addr == R_CONF) {
+    switch (addr) {
+    case R_CONF:
         /* Make sure readonly bits are kept */
         switch (s->silicon_rev) {
         case AST2400_A0_SILICON_REV:
@@ -128,6 +132,12 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
         default:
             g_assert_not_reached();
         }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+        return;
     }
 
     s->regs[addr] = data;
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 551c8afdf4be..a4415d9efc2f 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -28,6 +28,7 @@ typedef struct AspeedSDMCState {
     uint32_t ram_bits;
     uint64_t ram_size;
 
+    bool unlocked;
 } AspeedSDMCState;
 
 #endif /* ASPEED_SDMC_H */
-- 
2.7.4
