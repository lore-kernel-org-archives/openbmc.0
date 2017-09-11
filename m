Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.52.147; helo=8.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1201 seconds by postgrey-1.36 at bilbo;
 Mon, 11 Sep 2017 19:55:58 AEST
Received: from 8.mo2.mail-out.ovh.net (8.mo2.mail-out.ovh.net [188.165.52.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrNbf5Q0LzDrWD
 for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2017 19:55:57 +1000 (AEST)
Received: from player770.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 3FFAEA4DCC
 for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2017 11:16:53 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 1D2323C0096;
 Mon, 11 Sep 2017 11:16:49 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH qemu] aspeed: add support for the witherspoon-bmc board
Date: Mon, 11 Sep 2017 11:16:43 +0200
Message-Id: <20170911091643.25203-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6089992599422667522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedtgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 11 Sep 2017 09:55:59 -0000

The Witherspoon boards are OpenPOWER system hosting a POWER9
Processor. Let's add support for their BMC including a couple
of I2C devices as found on real HW.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 02c0c1613c86..484ae1003d26 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -46,6 +46,7 @@ enum {
     PALMETTO_BMC,
     AST2500_EVB,
     ROMULUS_BMC,
+    WITHERSPOON_BMC,
 };
 
 /* Palmetto hardware value: 0x120CE416 */
@@ -83,9 +84,13 @@ enum {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
+#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
+
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
 static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
+static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
 
 static const AspeedBoardConfig aspeed_boards[] = {
     [PALMETTO_BMC] = {
@@ -112,6 +117,14 @@ static const AspeedBoardConfig aspeed_boards[] = {
         .num_cs    = 2,
         .i2c_init  = romulus_bmc_i2c_init,
     },
+    [WITHERSPOON_BMC]  = {
+        .soc_name  = "ast2500-a1",
+        .hw_strap1 = WITHERSPOON_BMC_HW_STRAP1,
+        .fmc_model = "mx25l25635e",
+        .spi_model = "mx66l1g45g",
+        .num_cs    = 2,
+        .i2c_init  = witherspoon_bmc_i2c_init,
+    },
 };
 
 #define FIRMWARE_ADDR 0x0
@@ -347,11 +360,60 @@ static const TypeInfo romulus_bmc_type = {
     .class_init = romulus_bmc_class_init,
 };
 
+static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    DeviceState *dev;
+    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552", 0x60);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105", 0x4a);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "rx8900", 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552",
+                     0x60);
+
+    dev = qdev_create((BusState *) aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11),
+                      "smbus-eeprom");
+    qdev_prop_set_uint8(dev, "address", 0x51);
+    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    qdev_init_nofail(dev);
+}
+
+static void witherspoon_bmc_init(MachineState *machine)
+{
+    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
+}
+
+static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "OpenPOWER Witherspoon BMC (ARM1176)";
+    mc->init = witherspoon_bmc_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+}
+
+static const TypeInfo witherspoon_bmc_type = {
+    .name = MACHINE_TYPE_NAME("witherspoon-bmc"),
+    .parent = TYPE_MACHINE,
+    .class_init = witherspoon_bmc_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
     type_register_static(&ast2500_evb_type);
     type_register_static(&romulus_bmc_type);
+    type_register_static(&witherspoon_bmc_type);
 }
 
 type_init(aspeed_machine_init)
-- 
2.13.5
