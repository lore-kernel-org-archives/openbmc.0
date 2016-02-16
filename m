Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 7EA771A000B
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 22:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vgOJqTpY; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 21ACF7EC060;
 Tue, 16 Feb 2016 03:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 jJS0tQEljCtFuLUe8yH5JW8r18A=; b=vgOJqTpYlG+oEpbcatiPLRSG5NxY21e+
 S+Ooij/U6LSGN5Rd9d68V47Xg5c9ms5LtYkW8uPUa3L2TrD6Wyr6Cu0bAoGI6cSZ
 5/IvfAMP2Zvoy4UtsZ+F8mMrd1vLLZXyVRzkVYS12R/wEm91mVQdDmzLDffgpgnf
 KxgkoIzjJI0=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 270D07EC084;
 Tue, 16 Feb 2016 03:35:09 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/3] hw/arm: Add ASPEED AST2400 machine type
Date: Tue, 16 Feb 2016 22:04:57 +1030
Message-Id: <1455622497-25966-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2016 11:35:13 -0000

Adds the AST2400 machine type with ASPEED AVIC and timer models. The
new machine type is functional enough to boot Linux to userspace.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/Makefile.objs |   1 +
 hw/arm/ast2400.c     | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++
 trace-events         |   4 ++
 3 files changed, 144 insertions(+)
 create mode 100644 hw/arm/ast2400.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a711e4d..f333b7f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,3 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
+obj-$(CONFIG_ASPEED_SOC) += ast2400.o
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
new file mode 100644
index 0000000..e3cd496
--- /dev/null
+++ b/hw/arm/ast2400.c
@@ -0,0 +1,139 @@
+/*
+ * ASPEED AST2400
+ *
+ * Jeremy Kerr <jk@ozlabs.org>
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2015, 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Based off of the i.MX31 Vectored Interrupt Controller
+ *
+ * Note that this device model does not implement the legacy register space.
+ * The assumption is that the device base address is exposed such that all
+ * offsets are calculated relative to the address of the first "new" register.
+ */
+
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/boards.h"
+#include "hw/char/serial.h"
+#include "hw/sysbus.h"
+#include "hw/intc/aspeed_vic.h"
+#include "hw/timer/aspeed_timer.h"
+#include "trace.h"
+
+#define ASPEED_SDRAM_BASE 0x40000000
+#define ASPEED_IOMEM_BASE 0x1e600000
+#define ASPEED_IOMEM_SIZE 0x00200000
+#define ASPEED_TIMER_BASE 0x1E782000
+#define ASPEED_VIC_BASE 0x1E6C0080
+
+static struct arm_boot_info ast2400_binfo = {
+    .loader_start = ASPEED_SDRAM_BASE,
+    .board_id = 0,
+};
+
+/*
+ * IO handler: simply catch any reads/writes to IO addresses that aren't
+ * handled by a device mapping.
+ */
+static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
+{
+    trace_ast2400_io_read(offset, size);
+    return 0;
+}
+
+static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value,
+                unsigned size)
+{
+    trace_ast2400_io_write(offset, value, size);
+}
+
+static const MemoryRegionOps ast2400_io_ops = {
+    .read = ast2400_io_read,
+    .write = ast2400_io_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+typedef struct AspeedState {
+    ARMCPU *cpu;
+    MemoryRegion *address_space;
+    MemoryRegion *ram;
+    ram_addr_t ram_size;
+    MemoryRegion *iomem;
+    AspeedVICState avic;
+    AspeedTimerState timer;
+} AspeedState;
+
+static void ast2400_init(MachineState *machine)
+{
+    AspeedState ast2400;
+    DeviceState *dev;
+    qemu_irq pic[ASPEED_VIC_NR_IRQS] = {0};
+    int i;
+
+    if (!machine->cpu_model) {
+        machine->cpu_model = "arm926";
+    }
+
+    ast2400.cpu = cpu_arm_init(machine->cpu_model);
+    if (!ast2400.cpu) {
+        fprintf(stderr, "Unable to find CPU definition\n");
+        exit(1);
+    }
+
+    ast2400.address_space = get_system_memory();
+    ram_size = machine->ram_size;
+
+    /* System RAM */
+    ast2400.ram = g_new(MemoryRegion, 1);
+    memory_region_allocate_system_memory(ast2400.ram, NULL, "ast2400.ram",
+            ram_size);
+    memory_region_add_subregion(ast2400.address_space, ASPEED_SDRAM_BASE,
+            ast2400.ram);
+
+    /* IO space */
+    ast2400.iomem = g_new(MemoryRegion, 1);
+    memory_region_init_io(ast2400.iomem, NULL, &ast2400_io_ops, NULL,
+            "ast2400.io", ASPEED_IOMEM_SIZE);
+    memory_region_add_subregion(ast2400.address_space, ASPEED_IOMEM_BASE,
+            ast2400.iomem);
+
+    /* AVIC */
+    dev = sysbus_create_varargs(TYPE_ASPEED_VIC, ASPEED_VIC_BASE,
+                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_IRQ),
+                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_FIQ),
+                    NULL);
+
+    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
+        pic[i] = qdev_get_gpio_in(dev, i);
+    }
+
+    /* Timer */
+    sysbus_create_varargs(TYPE_ASPEED_TIMER, ASPEED_TIMER_BASE, pic[16],
+            pic[17], pic[18], pic[35], pic[36], pic[37], pic[38], pic[39],
+            NULL);
+
+    /* UART - attach an 8250 to the IO space as our UART5 */
+    if (serial_hds[0]) {
+            serial_mm_init(ast2400.iomem, 0x184000, 2, pic[10], 38400,
+                    serial_hds[0], DEVICE_NATIVE_ENDIAN);
+    }
+
+    ast2400_binfo.kernel_filename = machine->kernel_filename;
+    ast2400_binfo.initrd_filename = machine->initrd_filename;
+    ast2400_binfo.kernel_cmdline = machine->kernel_cmdline;
+    ast2400_binfo.ram_size = ram_size;
+    arm_load_kernel(ast2400.cpu, &ast2400_binfo);
+}
+
+static void ast2400_machine_init(MachineClass *mc)
+{
+    mc->desc = "ASpeed ast2400 BMC (ARM926EJ-S)";
+    mc->init = ast2400_init;
+}
+
+DEFINE_MACHINE("ast2400", ast2400_machine_init);
diff --git a/trace-events b/trace-events
index 5718bdf..e19dfc6 100644
--- a/trace-events
+++ b/trace-events
@@ -1908,3 +1908,7 @@ aspeed_vic_update_i(int irq) "Raising IRQ %d"
 aspeed_vic_update_none(void) "Lowering IRQs"
 aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "Read at 0x%" PRIx64 " of size %u: 0x% " PRIx64
 aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "Write at 0x% " PRIx64 " of size %u: %0x" PRIx64
+
+# hw/arm/ast2400.c
+ast2400_io_read(uint64_t offset, unsigned size) "0x%" HWADDR_PRIx "[%d]"
+ast2400_io_write(uint64_t offset, uint64_t value, unsigned size) "0x%" HWADDR_PRIx "[%d] <- 0x" PRIx64
-- 
2.5.0
