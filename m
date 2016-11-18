Return-Path: <clg@kaod.org>
Received: from 9.mo7.mail-out.ovh.net (9.mo7.mail-out.ovh.net [46.105.60.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fQ53pRzDvvy
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:06 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id BDE88207BF
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:02 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 8CFB648009B;
 Fri, 18 Nov 2016 15:25:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 22/38] aspeed: use first SPI flash as a boot ROM
Date: Fri, 18 Nov 2016 15:22:02 +0100
Message-Id: <1479478938-13267-23-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1115203857744628482
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:07 -0000

Fill a ROM region with the flash content to support U-Boot. This is a
little hacky but until we can boot from a MMIO region, it seems
difficult to do anything else.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5e35d4562de0..3e1781f30f55 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -20,6 +20,8 @@
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "hw/loader.h"
+#include "qemu/error-report.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -101,6 +103,28 @@ static const AspeedBoardConfig aspeed_boards[] = {
     },
 };
 
+#define FIRMWARE_ADDR 0x0
+
+static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
+                           Error **errp)
+{
+    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+    uint8_t *storage;
+
+    if (rom_size > blk_getlength(blk)) {
+        rom_size = blk_getlength(blk);
+    }
+
+    storage = g_new0(uint8_t, rom_size);
+    if (blk_pread(blk, 0, storage, rom_size) < 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
+    g_free(storage);
+}
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       Error **errp)
 {
@@ -132,6 +156,7 @@ static void aspeed_board_init(MachineState *machine,
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
+    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
 
     bmc = g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
@@ -163,6 +188,22 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abort);
     aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_abort);
 
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl = &bmc->soc.fmc.flashes[0];
+        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+
+        /*
+         * create a ROM region using the default mapping window size of
+         * the flash module.
+         */
+        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+                               fl->size, &error_abort);
+        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
+                                    boot_rom);
+        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+    }
+
     aspeed_board_binfo.kernel_filename = machine->kernel_filename;
     aspeed_board_binfo.initrd_filename = machine->initrd_filename;
     aspeed_board_binfo.kernel_cmdline = machine->kernel_cmdline;
-- 
2.7.4
