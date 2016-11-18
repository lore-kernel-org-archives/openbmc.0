Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dv2YjNzDvyj
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:39 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id A53C8207A9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:36 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 7678948009A;
 Fri, 18 Nov 2016 15:25:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 14/38] aspeed/smc: autostrap CE0/1 configuration
Date: Fri, 18 Nov 2016 15:21:54 +0100
Message-Id: <1479478938-13267-15-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1107885509480254210
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:39 -0000

HW autodetect type and size of the first and second flash modules of
the FMC controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1c6c5089f265..72a44150b0a1 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -39,11 +39,14 @@
 #define   CONF_ENABLE_W2       18
 #define   CONF_ENABLE_W1       17
 #define   CONF_ENABLE_W0       16
-#define   CONF_FLASH_TYPE4     9
-#define   CONF_FLASH_TYPE3     7
-#define   CONF_FLASH_TYPE2     5
-#define   CONF_FLASH_TYPE1     3
-#define   CONF_FLASH_TYPE0     1
+#define   CONF_FLASH_TYPE4     8
+#define   CONF_FLASH_TYPE3     6
+#define   CONF_FLASH_TYPE2     4
+#define   CONF_FLASH_TYPE1     2
+#define   CONF_FLASH_TYPE0     0
+#define      CONF_FLASH_TYPE_NOR   0x0
+#define      CONF_FLASH_TYPE_NAND  0x1
+#define      CONF_FLASH_TYPE_SPI   0x2
 
 /* CE Control Register */
 #define R_CE_CTRL            (0x04 / 4)
@@ -435,6 +438,19 @@ static void aspeed_smc_reset(DeviceState *d)
         s->regs[R_SEG_ADDR0 + i] =
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
+
+    /* CE0 and CE1 HW strapping for FMC controllers : SPI flash type
+     * and 4BYTE mode
+     */
+    if (s->ctrl->segments == aspeed_segments_fmc ||
+        s->ctrl->segments == aspeed_segments_ast2500_fmc) {
+        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
+        s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1);
+
+        /* We should be able to detect the flash size in some ways. */
+        s->regs[s->r_ce_ctrl] |= (1 << (CTRL_EXTENDED0));
+        s->regs[s->r_ce_ctrl] |= (1 << (CTRL_EXTENDED1));
+    }
 }
 
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
-- 
2.7.4
