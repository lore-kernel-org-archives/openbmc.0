Return-Path: <clg@kaod.org>
Received: from 7.mo173.mail-out.ovh.net (7.mo173.mail-out.ovh.net
 [46.105.44.159])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03Y1BvwzDqZq
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:05 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5A4C5FF9C3F
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:04 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id F0299380083;
 Mon, 13 Jun 2016 19:16:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 03/10] ast2400: create SPI flash slaves
Date: Mon, 13 Jun 2016 19:16:29 +0200
Message-Id: <1465838196-31131-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16902009404621818626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 17:23:05 -0000

A set of SPI flash slaves is attached under the flash controllers of
the palmetto platform. "n25q256a" flash modules are used for the BMC
and "mx25l25635e" for the host. These types are common in the
OpenPower ecosystem.

The segment addresses used for the memory mappings are the defaults
provided by the specs. They can be changed with the Segment Address
Register but this is not supported in the current implementation.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c       |  3 +++
 hw/ssi/aspeed_smc.c         | 60 ++++++++++++++++++++++++++++++++++++++++++---
 include/hw/ssi/aspeed_smc.h | 10 ++++++++
 3 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index a51d960510ee..0aed97a7d9cf 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -47,6 +47,9 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
+    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
+
     palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 000a7b45c7cf..ce59cb59be9f 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -98,13 +98,32 @@
 #define R_SPI_MISC_CRTL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
 
+/*
+ * Default segments mappings and size for each slave
+ */
+static const AspeedSegments aspeed_segments_legacy[] = {
+    { 0x14000000, 32 * 1024 * 1024 },
+};
+
+static const AspeedSegments aspeed_segments_fmc[] = {
+    { 0x20000000, 64 * 1024 * 1024 },
+    { 0x24000000, 32 * 1024 * 1024 },
+    { 0x26000000, 32 * 1024 * 1024 },
+    { 0x28000000, 32 * 1024 * 1024 },
+    { 0x2A000000, 32 * 1024 * 1024 }
+};
+
+static const AspeedSegments aspeed_segments_spi[] = {
+    { 0x30000000, 64 * 1024 * 1024 },
+};
+
 static const AspeedSMCController controllers[] = {
     { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5 },
+      CONF_ENABLE_W0, 5, aspeed_segments_legacy },
     { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5 },
+      CONF_ENABLE_W0, 5, aspeed_segments_fmc },
     { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1 },
+      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi },
 };
 
 static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
@@ -254,6 +273,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
                           s->ctrl->name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
+
+    s->flashes = g_new0(AspeedSMCFlashState *, s->num_cs);
     return 0;
 }
 
@@ -395,3 +416,36 @@ static void aspeed_smc_flash_register_types(void)
 }
 
 type_init(aspeed_smc_flash_register_types)
+
+void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
+                             Error **errp)
+{
+    int i ;
+    char name[32];
+
+    for (i = 0; i < s->num_cs; ++i) {
+        Object *obj = object_new(TYPE_ASPEED_SMC_FLASH);
+        AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(obj);
+        qemu_irq cs_line;
+
+        s->flashes[i] = fl;
+
+        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+
+        fl->id = i;
+        fl->controller = s;
+        fl->size = s->ctrl->segments[i].size;
+
+        /* backing region */
+        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl, name,
+                              fl->size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
+
+        /* SPI Flash module */
+        fl->flash = ssi_create_slave(s->spi, flashtype);
+        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].addr);
+    }
+}
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index abd0005b01c2..2636c775c90f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -43,6 +43,11 @@ typedef struct AspeedSMCFlashState {
 #define ASPEED_SMC_FLASH(obj) \
     OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
 
+typedef struct AspeedSegments {
+    hwaddr addr;
+    uint32_t size;
+} AspeedSegments;
+
 typedef struct AspeedSMCController {
     const char *name;
     uint8_t r_conf;
@@ -51,6 +56,7 @@ typedef struct AspeedSMCController {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
     uint8_t max_slaves;
+    const AspeedSegments *segments;
 } AspeedSMCController;
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
@@ -90,6 +96,10 @@ typedef struct AspeedSMCState {
     uint8_t r_ctrl0;
     uint8_t r_timings;
     uint8_t conf_enable_w0;
+
+    AspeedSMCFlashState **flashes;
 } AspeedSMCState;
 
+extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
+                                    Error **errp);
 #endif /* ASPEED_SMC_H */
-- 
2.1.4
