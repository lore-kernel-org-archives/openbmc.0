Return-Path: <clg@kaod.org>
X-Greylist: delayed 109444 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:25:11 AEDT
Received: from 8.mo7.mail-out.ovh.net (8.mo7.mail-out.ovh.net [46.105.77.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0dM14XqzDvrX
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:11 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 91BCD20752
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:07 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 5F3A6480080;
 Fri, 18 Nov 2016 15:25:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 05/38] aspeed: add support for the romulus-bmc board
Date: Fri, 18 Nov 2016 15:21:45 +0100
Message-Id: <1479478938-13267-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1099722737993026306
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
X-List-Received-Date: Fri, 18 Nov 2016 14:25:11 -0000

The Romulus machine is an OpenPOWER system with an AST2500 SoC for
the BMC and a POWER9 chip for the host. It does not make much
difference for qemu a part from the fact that the FMC controller has
two SPI flash module slaves.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 159d562e8912..aea73f79d92c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -41,8 +41,10 @@ typedef struct AspeedBoardConfig {
 enum {
     PALMETTO_BMC,
     AST2500_EVB,
+    ROMULUS_BMC,
 };
 
+/* 0x120CE416 */
 #define PALMETTO_BMC_HW_STRAP1 (                                        \
         SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               \
         SCU_AST2400_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=6, CWL=5 */) | \
@@ -56,6 +58,7 @@ enum {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
 
+/* 0xF100C2E6 */
 #define AST2500_EVB_HW_STRAP1 ((                                        \
         AST2500_HW_STRAP1_DEFAULTS |                                    \
         SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
@@ -66,6 +69,17 @@ enum {
         SCU_HW_STRAP_MAC0_RGMII) &                                      \
         ~SCU_HW_STRAP_2ND_BOOT_WDT)
 
+/* 0xF10AE216 */
+#define ROMULUS_BMC_HW_STRAP1 (                                     \
+        AST2500_HW_STRAP1_DEFAULTS |                                    \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
+        SCU_HW_STRAP_SPI_WIDTH |                                        \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN))
+
 static const AspeedBoardConfig aspeed_boards[] = {
     [PALMETTO_BMC] = {
         .soc_name  = "ast2400-a0",
@@ -79,6 +93,12 @@ static const AspeedBoardConfig aspeed_boards[] = {
         .fmc_model = "n25q256a",
         .spi_model = "mx25l25635e",
     },
+    [ROMULUS_BMC]  = {
+        .soc_name  = "ast2500-a1",
+        .hw_strap1 = ROMULUS_BMC_HW_STRAP1,
+        .fmc_model = "n25q256a",
+        .spi_model = "mx66l1g45g",
+    },
 };
 
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
@@ -200,10 +220,35 @@ static const TypeInfo ast2500_evb_type = {
     .class_init = ast2500_evb_class_init,
 };
 
+static void romulus_bmc_init(MachineState *machine)
+{
+    aspeed_board_init(machine, &aspeed_boards[ROMULUS_BMC]);
+}
+
+static void romulus_bmc_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "OpenPOWER Romulus BMC (ARM1176)";
+    mc->init = romulus_bmc_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+}
+
+static const TypeInfo romulus_bmc_type = {
+    .name = MACHINE_TYPE_NAME("romulus-bmc"),
+    .parent = TYPE_MACHINE,
+    .class_init = romulus_bmc_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
     type_register_static(&ast2500_evb_type);
+    type_register_static(&romulus_bmc_type);
 }
 
 type_init(aspeed_machine_init)
-- 
2.7.4
