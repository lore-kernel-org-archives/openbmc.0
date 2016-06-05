Return-Path: <teddy.reed@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNCPz4HGBzDqFC
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 08:37:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rxBihBLh; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id fg1so10341138pad.3
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=08naGjNce5lvJMjsZUKsLuszWV2cX47RapEjTFJIA8k=;
 b=rxBihBLhEmPgK505ZOCM1dWDgM/y1ciRYcxJaLZe8VPDbHYGWUf8z8Rsxh4n81mKHx
 cpbCJz/ghzyZw7xKzHYK+vm0B5SDbxZ/qa4CDbrwb/Zjoafbi3zF4T4DjYD2/WCaSiv2
 kMtmdJ6/E7W3oyWUgiRjPx2Jxzl92v1KEvBR4Rb09gmiYLsq1hfcQepusSp+lFoiSlxg
 oYyS8fgkPZoX0R+6K5x8a/fiCOsCBWZufTaWGtOlk2iUidh0rsdpnsUiKo+B6WxCGILo
 GO5VE2jmNH0xSuywSYGJyVyAq+tvzEvqt9XTmBLxNe2RhtBMs7oz+AQzqRNFjBkt3RC0
 ooDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=08naGjNce5lvJMjsZUKsLuszWV2cX47RapEjTFJIA8k=;
 b=beZzhAd+t6XLtqol8jyT4aHTQRAKqb0sIsgCcLy90cjB59bVW0Bn3c7u2ZXkuoobYP
 fnlHa+GIAzTdfp/OjluRKstEeOFRHH6rEthZfFDV5JV4Wpp4hJWJW6CfoRJowlw2a98F
 2uMLtUyACBKkbNet+gTk7XDeW6lr5sIXNU2Q9Fs2C4BRRSLc1Z+V4SvqkqWQVZ136mPh
 CKdnziuMS6z2MwXytz2WCI4VaqkD/3JDf3iFuJmU3rNp8lMgUKwavL3zRHaG4sPEbvuB
 51rhnY2mOw4tV9t9THTyFRXfjNFFkmiM8BXk6ZR2vEO+sdb6qmHQGdfw4GsJfBZfnJL8
 sAVg==
X-Gm-Message-State: ALyK8tJ8/qTI4dfFxXFPAKQLwuUoPD5VyQtS8UNgDWPDKh9jUYlmCxYf0wWAd0taWwaIxw==
X-Received: by 10.67.4.7 with SMTP id ca7mr20208718pad.55.1465166244983;
 Sun, 05 Jun 2016 15:37:24 -0700 (PDT)
Received: from maverics (c-24-6-55-56.hsd1.ca.comcast.net. [24.6.55.56])
 by smtp.gmail.com with ESMTPSA id ba4sm20088670pac.42.2016.06.05.15.37.24
 for <openbmc@lists.ozlabs.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 05 Jun 2016 15:37:24 -0700 (PDT)
Date: Sun, 5 Jun 2016 15:37:23 -0700
From: Teddy Reed <teddy.reed@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu] Add OpenCompute Yosemite BMC ARM board
Message-Id: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 05 Jun 2016 22:37:28 -0000

The Yosemite BMC board is very similar to the Palmetto BMC. They both configure
an AST2400 SoC and have rather simple device sets.

The Yosemite uses dual SPI flashes but the AST2400's memory controller, via
hardware strapping, makes either a NAND, NOR, or SPI available at boot at
0x0 and 0x2000:0000. For the board emulation included here the SPIs are replaced
with CFI flash to allow simple pflash configuration via the caller.

Additionally, to support an SPL boot where DRAM has not been calibrated, the
board relocates global data and the stack into the small 32kb of SRAM.
---
 hw/arm/Makefile.objs    |   2 +-
 hw/arm/fbyosemite-bmc.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fbyosemite-bmc.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2fcd33a..cbf5c3e 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
-obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o fbyosemite-bmc.o
diff --git a/hw/arm/fbyosemite-bmc.c b/hw/arm/fbyosemite-bmc.c
new file mode 100644
index 0000000..e506977
--- /dev/null
+++ b/hw/arm/fbyosemite-bmc.c
@@ -0,0 +1,115 @@
+/*
+ * OpenCompute Facebook Yosemite BMC
+ *
+ * Teddy Reed <reed@fb.com>
+ *
+ * Copyright 2016-Present, Facebook, Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/arm/ast2400.h"
+#include "hw/boards.h"
+#include "hw/block/flash.h"
+
+#define AST2400_FLASH0_BASE 0x20000000
+#define AST2400_FLASH0_SIZE 0x02000000 /* Max is 64k, but set 32kB */
+#define AST2400_FLASH1_BASE 0x24000000
+#define AST2400_FLASH1_SIZE 0x02000000
+#define FBYOSEMITE_TEXT_BASE 0x0
+
+static struct arm_boot_info fbyosemite_bmc_binfo = {
+    .loader_start = FBYOSEMITE_TEXT_BASE,
+    .board_id = 0,
+    .nb_cpus = 1,
+};
+
+typedef struct FBYosemiteBMCState {
+    AST2400State soc;
+    MemoryRegion ram;
+    MemoryRegion flash0_alias;
+} FBYosemiteBMCState;
+
+static pflash_t* pflash_register(hwaddr base, hwaddr size, const char* name,
+                            DriveInfo *info) {
+    int sector_len = 128 * 1024;
+    int be = 0;
+    pflash_t *pf;
+
+    pf = pflash_cfi01_register(base, NULL, name, size,
+                               info ? blk_by_legacy_dinfo(info) : NULL,
+                               sector_len, size / sector_len,
+                               2, 0, 0, 0, 0, be);
+    if (pf == NULL) {
+        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        exit(1);
+    }
+    return pf;
+}
+
+static void fbyosemite_bmc_init(MachineState *machine)
+{
+    FBYosemiteBMCState *bmc;
+    DriveInfo *dinfo;
+    pflash_t *pflash0;
+    MemoryRegion *pflash0mem;
+
+    bmc = g_new0(FBYosemiteBMCState, 1);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
+                              &error_abort);
+
+    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size);
+    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+                                &bmc->ram);
+    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
+                                   &error_abort);
+    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
+                             &error_abort);
+
+    /* Connect flash0 */
+    dinfo = drive_get_next(IF_PFLASH);
+    pflash0 = pflash_register(AST2400_FLASH0_BASE, AST2400_FLASH0_SIZE,
+                              "fbyosemite.flash0", dinfo);
+
+    /* Map flash0 to FBYOSEMITE_TEXT_BASE */
+    pflash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
+    memory_region_set_readonly(pflash0mem, true);
+    memory_region_init_alias(&bmc->flash0_alias, NULL,
+                             "flash0.alias", pflash0mem, FBYOSEMITE_TEXT_BASE,
+                             AST2400_FLASH0_SIZE);
+    memory_region_add_subregion(get_system_memory(), FBYOSEMITE_TEXT_BASE,
+                                &bmc->flash0_alias);
+    memory_region_set_readonly(&bmc->flash0_alias, true);
+
+    /* Connect flash1 */
+    dinfo = drive_get_next(IF_PFLASH);
+    pflash_register(AST2400_FLASH1_BASE, AST2400_FLASH1_SIZE,
+                   "fbyosemite.flash1", dinfo);
+
+    fbyosemite_bmc_binfo.kernel_filename = machine->kernel_filename;
+    fbyosemite_bmc_binfo.initrd_filename = machine->initrd_filename;
+    fbyosemite_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
+    fbyosemite_bmc_binfo.ram_size = ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &fbyosemite_bmc_binfo);
+}
+
+static void fbyosemite_bmc_machine_init(MachineClass *mc)
+{
+    mc->desc = "OpenCompute Facebook Yosemite BMC";
+    mc->init = fbyosemite_bmc_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_parallel = 1;
+}
+
+DEFINE_MACHINE("fbyosemite-bmc", fbyosemite_bmc_machine_init);
-- 
2.7.4
