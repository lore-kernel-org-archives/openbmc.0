Return-Path: <clg@kaod.org>
X-Greylist: delayed 344 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:31:07 AEDT
Received: from 10.mo7.mail-out.ovh.net (10.mo7.mail-out.ovh.net
 [178.33.250.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mC25HzzDvnq
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:07 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0C0502078B
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:14 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id CEAC248009E;
 Fri, 18 Nov 2016 15:25:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 07/38] aspeed: add the definitions for the AST2400 A1 SoC
Date: Fri, 18 Nov 2016 15:21:47 +0100
Message-Id: <1479478938-13267-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1101693061458135810
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:07 -0000
X-List-Received-Date: Fri, 18 Nov 2016 14:31:07 -0000

There is not much differences with the A0 revision a part from the DDR
calibration.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c          | 10 ++++++++++
 hw/misc/aspeed_scu.c         |  2 ++
 hw/misc/aspeed_sdmc.c        |  3 +++
 include/hw/misc/aspeed_scu.h |  1 +
 4 files changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 387b712d8fd5..503efe0f5f77 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -59,6 +59,16 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
     }, {
+        .name         = "ast2400-a1",
+        .cpu_model    = "arm926",
+        .silicon_rev  = AST2400_A1_SILICON_REV,
+        .sdram_base   = AST2400_SDRAM_BASE,
+        .sram_size    = 0x8000,
+        .spis_num     = 1,
+        .spi_bases    = aspeed_soc_ast2400_spi_bases,
+        .fmc_typename = "aspeed.smc.fmc",
+        .spi_typename = aspeed_soc_ast2400_typenames,
+    }, {
         .name         = "ast2400",
         .cpu_model    = "arm926",
         .silicon_rev  = AST2400_A0_SILICON_REV,
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index b1f3e6f6b87a..34e86385d837 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -231,6 +231,7 @@ static void aspeed_scu_reset(DeviceState *dev)
 
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         reset = ast2400_a0_resets;
         break;
     case AST2500_A0_SILICON_REV:
@@ -249,6 +250,7 @@ static void aspeed_scu_reset(DeviceState *dev)
 
 static uint32_t aspeed_silicon_revs[] = {
     AST2400_A0_SILICON_REV,
+    AST2400_A1_SILICON_REV,
     AST2500_A0_SILICON_REV,
     AST2500_A1_SILICON_REV,
 };
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 8830dc084c38..5f3ac0b6f608 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -119,6 +119,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
         /* Make sure readonly bits are kept */
         switch (s->silicon_rev) {
         case AST2400_A0_SILICON_REV:
+        case AST2400_A1_SILICON_REV:
             data &= ~ASPEED_SDMC_READONLY_MASK;
             break;
         case AST2500_A0_SILICON_REV:
@@ -193,6 +194,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     /* Set ram size bit and defaults values */
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         s->regs[R_CONF] |=
             ASPEED_SDMC_VGA_COMPAT |
             ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
@@ -224,6 +226,7 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
 
     switch (s->silicon_rev) {
     case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
         s->ram_bits = ast2400_rambits(s);
         break;
     case AST2500_A0_SILICON_REV:
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 14ffc43de809..bd4ac013f997 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -32,6 +32,7 @@ typedef struct AspeedSCUState {
 } AspeedSCUState;
 
 #define AST2400_A0_SILICON_REV   0x02000303U
+#define AST2400_A1_SILICON_REV   0x02010303U
 #define AST2500_A0_SILICON_REV   0x04000303U
 #define AST2500_A1_SILICON_REV   0x04010303U
 
-- 
2.7.4
