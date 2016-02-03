Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 789401A0204
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 16:46:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kyuBcYwS; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 7FB1B4B007C
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 f1V6th11n2K6bjq6aY6TuAAvaeU=; b=kyuBcYwSaMkyOQJjC0q7A6GdKPWh/ORz
 aOMhGggYYe5SuCzkMZqFKb3/pPpHEQB37xlYbtpiUEoijU4T4J4xzkLY7JIiiCRK
 E1DhWJ2paMUENs6Ty7WJ5B6OiUAsPsM9QE5sgNLN9cV4SHeuBXpg+2JYK0lu7mcJ
 loffbGfZBgE=
Received: from localhost.localdomain (unknown [138.44.251.155])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 2521D4B0062
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:46 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] ast2400: Add ASPEED AST2400 machine type
Date: Wed,  3 Feb 2016 16:46:33 +1100
Message-Id: <1454478393-11973-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
References: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 03 Feb 2016 05:46:49 -0000

Adds the AST2400 machine type with ASPEED AVIC and timer models. The
new machine type is functional enough to boot Linux to userspace.

Also, update the build infrastructure to only build the AST2400 code if
arm-softmmu is in target-list.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 default-configs/arm-softmmu.mak |   2 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 126 ++++++++++++++++++++++++++++++++++++++++
 hw/intc/Makefile.objs           |   2 +-
 hw/timer/Makefile.objs          |   3 +-
 5 files changed, 132 insertions(+), 2 deletions(-)
 create mode 100644 hw/arm/ast2400.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index d9b90a5..ef79e69 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -109,3 +109,5 @@ CONFIG_IOH3420=y
 CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_SMBIOS=y
+
+CONFIG_ASPEED_SOC=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2195b60..2045110 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -15,3 +15,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
+obj-$(CONFIG_ASPEED_SOC) += ast2400.o
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
new file mode 100644
index 0000000..b85f5b6
--- /dev/null
+++ b/hw/arm/ast2400.c
@@ -0,0 +1,126 @@
+/*
+ * Aspeed 2400
+ *
+ * Copyright (c) 2015 IBM
+ *
+ * Authors: Jeremy Kerr, Andrew Jeffery
+ */
+
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/boards.h"
+#include "hw/char/serial.h"
+#include "hw/sysbus.h"
+#include "hw/intc/aspeed_vic.h"
+#include "hw/timer/aspeed_timer.h"
+
+#define ASPEED_SDRAM_ADDR 0x40000000
+#define ASPEED_IOMEM_BASE 0x1e600000
+#define ASPEED_IOMEM_SIZE 0x00200000
+
+static struct arm_boot_info ast2400_binfo = {
+    .loader_start = ASPEED_SDRAM_ADDR,
+    .board_id = 0,
+};
+
+/*
+ * IO handler: simply catch any reads/writes to IO addresses that aren't
+ * handled by a device mapping.
+ */
+static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
+{
+    printf("%s: 0x%" HWADDR_PRIx "[%d]\n", __func__, offset, size);
+    return 0;
+}
+
+static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value,
+                unsigned size)
+{
+    printf("%s: 0x%" HWADDR_PRIx "[%d] <- 0x%" PRIx64 "\n",
+            __func__, offset, size, value);
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
+    memory_region_add_subregion(ast2400.address_space, ASPEED_SDRAM_ADDR,
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
+    sysbus_create_varargs(TYPE_ASPEED_TIMER, TIMER_BASE, pic[16], pic[17],
+            pic[18], pic[35], pic[36], pic[37], pic[38], pic[39], NULL);
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
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 9763e50..6c52a8b 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -14,7 +14,6 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gic.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv2m.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
 common-obj-$(CONFIG_OPENPIC) += openpic.o
-common-obj-y += aspeed_vic.o
 
 obj-$(CONFIG_APIC) += apic.o apic_common.o
 obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
@@ -31,3 +30,4 @@ obj-$(CONFIG_XICS_KVM) += xics_kvm.o
 obj-$(CONFIG_ALLWINNER_A10_PIC) += allwinner-a10-pic.o
 obj-$(CONFIG_S390_FLIC) += s390_flic.o
 obj-$(CONFIG_S390_FLIC_KVM) += s390_flic_kvm.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_vic.o
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index c22ccf3..f6f7351 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -17,7 +17,6 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
 common-obj-$(CONFIG_IMX) += imx_gpt.o
 common-obj-$(CONFIG_LM32) += lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
-common-obj-y += aspeed_timer.o
 
 obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
@@ -34,3 +33,5 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
+
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
-- 
2.5.0
