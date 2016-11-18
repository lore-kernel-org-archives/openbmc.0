Return-Path: <clg@kaod.org>
Received: from mo7.mail-out.ovh.net (mo7.mail-out.ovh.net [178.32.228.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dg5XX4zDw0B
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:27 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C52BF207B0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:23 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 9441B4800AC;
 Fri, 18 Nov 2016 15:25:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 10/38] aspeed/smc: improve segment register support
Date: Fri, 18 Nov 2016 15:21:50 +0100
Message-Id: <1479478938-13267-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1104226337736461058
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:28 -0000

The HW does not enforce all the rules in the specs and allows a few
"curious" setups like zero size segments and overlaps. So change the
model to be in sync but keep the warnings which are always interesting
for debug.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6e8403ebc246..78f5aed53247 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -253,7 +253,8 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Tried to change CS0 start address to 0x%"
                       HWADDR_PRIx "\n", s->ctrl->name, seg.addr);
-        return;
+        seg.addr = s->ctrl->flash_window_base;
+        new = aspeed_smc_segment_to_reg(&seg);
     }
 
     /*
@@ -267,8 +268,10 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
         s->ctrl->segments[cs].size) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Tried to change CS%d end address to 0x%"
-                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr);
-        return;
+                      HWADDR_PRIx "\n", s->ctrl->name, cs, seg.addr + seg.size);
+        seg.size = s->ctrl->segments[cs].addr + s->ctrl->segments[cs].size -
+            seg.addr;
+        new = aspeed_smc_segment_to_reg(&seg);
     }
 
     /* Keep the segment in the overall flash window */
@@ -281,16 +284,14 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
     }
 
     /* Check start address vs. alignment */
-    if (seg.addr % seg.size) {
+    if (seg.size && !QEMU_IS_ALIGNED(seg.addr, seg.size)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is not "
                       "aligned : [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
                       s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
     }
 
-    /* And segments should not overlap */
-    if (aspeed_smc_flash_overlap(s, &seg, cs)) {
-        return;
-    }
+    /* And segments should not overlap (in the specs) */
+    aspeed_smc_flash_overlap(s, &seg, cs);
 
     /* All should be fine now to move the region */
     memory_region_transaction_begin();
-- 
2.7.4
