Return-Path: <clg@kaod.org>
Received: from e06smtp06.uk.ibm.com (e06smtp06.uk.ibm.com [195.75.94.102])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Y4PgxzDqPD
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:36 +1000 (AEST)
Received: from localhost
 by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:33 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
 by e06smtp06.uk.ibm.com (192.168.101.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:31 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id C889E17D8062
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:36 +0100 (BST)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
 [9.149.37.251])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKVX966846830
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:31 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TKKWgQ018651
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 14:20:33 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TKKWkS018646; Sun, 29 May 2016 14:20:32 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id AE81822051C;
 Sun, 29 May 2016 23:20:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 03/12] ast2400: create SPI flash slaves
Date: Sun, 29 May 2016 23:19:56 +0200
Message-Id: <1464556805-4340-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0025-0000-0000-00001F141BB4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Sun, 29 May 2016 21:20:38 -0000

This patch creates a number of SPI flash slaves of the same type under
the SMC/FMC and under the SMC/SPI controllers. We use a "n25q256a"
flash module type for the BMC and a "mx25l25635e" for the host. These
types are common in the OpenPower ecosystem.

The segment addresses used for the memory mappings are the defaults
provided by the specs. They can be changed with the Segment Address
Register but this is not supported in the current implementation.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c       |  3 +++
 hw/ssi/aspeed_smc.c         | 62 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/aspeed_smc.h |  3 +++
 3 files changed, 68 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 6367f978bc7b..c4099987d354 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -50,6 +50,9 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
+    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a");
+    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e");
+
     palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 43743628ba0c..4175356141e7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -215,6 +215,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
                           name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
+    s->flashes = g_new0(AspeedSMCFlashState *, s->num_cs);
+
     return 0;
 }
 
@@ -368,3 +370,63 @@ static void aspeed_smc_flash_register_types(void)
 }
 
 type_init(aspeed_smc_flash_register_types)
+
+/*
+ * Default segments mappings and size for each slave
+ */
+typedef struct AspeedSegments {
+    hwaddr addr;
+    uint32_t size;
+} AspeedSegments;
+
+/* unused */
+static const AspeedSegments aspeed_segment_legacy[] = {
+    { 0x14000000, 32 * 1024 * 1024 },
+};
+
+static const AspeedSegments aspeed_segment_fmc[] = {
+    { 0x20000000, 64 * 1024 * 1024 },
+    { 0x24000000, 32 * 1024 * 1024 },
+    { 0x26000000, 32 * 1024 * 1024 },
+    { 0x28000000, 32 * 1024 * 1024 },
+    { 0x2A000000, 32 * 1024 * 1024 }
+};
+
+static const AspeedSegments aspeed_segment_spi[] = {
+    { 0x30000000, 64 * 1024 * 1024 },
+};
+
+static const AspeedSegments *aspeed_segments[] = {
+    aspeed_segment_legacy, aspeed_segment_fmc, aspeed_segment_spi
+};
+
+void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype)
+{
+    int i ;
+    char name[32];
+
+    for (i = 0; i < s->num_cs; ++i) {
+        Object *new = object_new(TYPE_ASPEED_SMC_FLASH);
+        AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(new);
+        qemu_irq cs_line;
+
+        s->flashes[i] = fl;
+
+        snprintf(name, sizeof(name), "aspeed.%s.%d",
+                 aspeed_smc_types[s->smc_type], i);
+
+        fl->id = i;
+        fl->controller = s;
+        fl->flash = ssi_create_slave(s->spi, flashtype);
+
+        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+
+        memory_region_init_io(&fl->mmio, new, &aspeed_smc_flash_ops, fl, name,
+                              aspeed_segments[s->smc_type][i].size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(new), &fl->mmio);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(new), 0,
+                        aspeed_segments[s->smc_type][i].addr);
+    }
+}
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6cea1313eabd..1625dfb76a63 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -74,10 +74,13 @@ typedef struct AspeedSMCState {
     uint8_t r_conf;
     uint8_t r_ctrl0;
     uint8_t conf_enable_w0;
+
+    AspeedSMCFlashState **flashes;
 } AspeedSMCState;
 
 #define TYPE_ASPEED_SPI "aspeed.spi"
 #define ASPEED_SPI(obj) OBJECT_CHECK(AspeedSPIState, (obj), TYPE_ASPEED_SPI)
 
+extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype);
 
 #endif /* ASPEED_SMC_H */
-- 
2.1.4
