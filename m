Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0fN85Z2dzDrXN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 22:44:54 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBIBR4xM025125;
 Mon, 18 Dec 2017 13:27:05 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 186005A934; Mon, 18 Dec 2017 13:44:43 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v3 1/4] arm: npcm: add basic support for
 Nuvoton BMCs
Date: Mon, 18 Dec 2017 13:44:37 +0200
Message-Id: <1513597480-2913-2-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513597480-2913-1-git-send-email-tmaimon77@gmail.com>
References: <1513597480-2913-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 11:44:57 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Based on [v8,1/3] arm: npcm: add basic support for Nuvoton BMCs patch:
Brendan Higgins : - https://patchwork.kernel.org/patch/10063409/

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/Kconfig             |  2 ++
 arch/arm/Makefile            |  1 +
 arch/arm/mach-npcm/Kconfig   | 61 +++++++++++++++++++++++++++++++
 arch/arm/mach-npcm/Makefile  |  6 ++++
 arch/arm/mach-npcm/headsmp.S | 21 +++++++++++
 arch/arm/mach-npcm/npcm7xx.c | 26 ++++++++++++++
 arch/arm/mach-npcm/platsmp.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 202 insertions(+)
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 61a0cb15067e..05543f1cfbde 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -782,6 +782,8 @@ source "arch/arm/mach-netx/Kconfig"
 
 source "arch/arm/mach-nomadik/Kconfig"
 
+source "arch/arm/mach-npcm/Kconfig"
+
 source "arch/arm/mach-nspire/Kconfig"
 
 source "arch/arm/plat-omap/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 47d3a1ab08d2..60ca50c7d762 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
 machine-$(CONFIG_ARCH_MXS)		+= mxs
 machine-$(CONFIG_ARCH_NETX)		+= netx
 machine-$(CONFIG_ARCH_NOMADIK)		+= nomadik
+machine-$(CONFIG_ARCH_NPCM)		+= npcm
 machine-$(CONFIG_ARCH_NSPIRE)		+= nspire
 machine-$(CONFIG_ARCH_OXNAS)		+= oxnas
 machine-$(CONFIG_ARCH_OMAP1)		+= omap1
diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
new file mode 100644
index 000000000000..d7a8adb5d2f0
--- /dev/null
+++ b/arch/arm/mach-npcm/Kconfig
@@ -0,0 +1,61 @@
+menuconfig ARCH_NPCM
+	bool "Nuvoton NPCM Architecture"
+	select ARCH_REQUIRE_GPIOLIB
+	select USE_OF
+	select PINCTRL
+	select PINCTRL_NPCM7XX
+
+if ARCH_NPCM
+
+comment "NPCM Architecture type"
+
+config ARCH_NPCM7XX
+	depends on ARCH_NPCM && ARCH_MULTI_V7
+	bool "Support for NPCM7xx BMC (Poleg)"
+	select CACHE_L2X0
+	select CPU_V7
+	select ARM_GIC
+	select HAVE_ARM_SCU
+	select ARM_ERRATA_720789
+	select ARM_ERRATA_754322
+	select ARM_ERRATA_764369
+	select ARM_ERRATA_794072
+	select PL310_ERRATA_588369
+	select PL310_ERRATA_727915
+	select FIQ
+	select CPU_USE_DOMAINS
+	select GENERIC_CLOCKEVENTS
+	select CLKDEV_LOOKUP
+	select COMMON_CLK if OF
+	select NPCM7XX_TIMER
+	select MFD_SYSCON
+	help
+	  General support for NPCM7xx BMC (Poleg).
+
+	  Nuvoton NPCM7xx BMC based on the Cortex A9.
+
+choice
+prompt "NPCM7xx BMC type"
+
+config ARCH_NPCM750
+	depends on ARCH_NPCM7XX
+	default y if ARCH_NPCM7XX
+	bool "Support for NPCM750 BMC"
+	select SMP
+	select SMP_ON_UP
+	select HAVE_ARM_TWD if SMP
+	select USB_EHCI_ROOT_HUB_TT
+	select USB_ARCH_HAS_HCD
+	select USB_ARCH_HAS_EHCI
+	select USB_EHCI_HCD
+	select USB_ARCH_HAS_OHCI
+	select USB_OHCI_HCD
+	select USB
+	help
+	  General support for NPCM750 BMC (Poleg).
+
+	  Nuvoton NPCM750 BMC based on the Cortex A9.
+
+endchoice
+
+endif
diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
new file mode 100644
index 000000000000..37f05e4bd0b3
--- /dev/null
+++ b/arch/arm/mach-npcm/Makefile
@@ -0,0 +1,6 @@
+AFLAGS_headsmp.o		+= -march=armv7-a
+
+obj-$(CONFIG_ARCH_NPCM7XX)	+= npcm7xx.o
+obj-$(CONFIG_ARCH_NPCM750)	+= platsmp.o headsmp.o
+
+
diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
new file mode 100644
index 000000000000..1746a780a69e
--- /dev/null
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/linkage.h>
+#include <linux/init.h>
+#include <asm/assembler.h>
+
+/*
+ * The boot ROM does not start secondary CPUs in SVC mode, so we need to do that
+ * here.
+ */
+ENTRY(npcm7xx_secondary_startup)
+	safe_svcmode_maskall r0
+
+	b	secondary_startup
+ENDPROC(npcm7xx_secondary_startup)
diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
new file mode 100644
index 000000000000..ecef5c649a1a
--- /dev/null
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <asm/mach/arch.h>
+#include <asm/mach-types.h>
+#include <asm/mach/map.h>
+#include <asm/hardware/cache-l2x0.h>
+
+static const char *const npcm7xx_dt_match[] = {
+	"nuvoton,npcm750",
+	NULL
+};
+
+DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
+	.atag_offset	= 0x100,
+	.dt_compat	= npcm7xx_dt_match,
+	.l2c_aux_val	= 0x0,
+	.l2c_aux_mask	= ~0x0,
+MACHINE_END
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
new file mode 100644
index 000000000000..c7d143aaa660
--- /dev/null
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -0,0 +1,85 @@
+/*
+ * Copyright (c) 2014-2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#define pr_fmt(fmt) "nuvoton,npcm7xx-smp: " fmt
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/smp.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <asm/cacheflush.h>
+#include <asm/smp.h>
+#include <asm/smp_plat.h>
+#include <asm/smp_scu.h>
+
+#define NPCM7XX_SCRPAD_REG 0x13c
+
+extern void npcm7xx_secondary_startup(void);
+
+static int npcm7xx_smp_boot_secondary(unsigned int cpu,
+				      struct task_struct *idle)
+{
+	struct device_node *gcr_np;
+	void __iomem *gcr_base;
+	int ret = 0;
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	if (!gcr_np) {
+		pr_err("no gcr device node\n");
+		ret = -ENODEV;
+		goto out;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	if (!gcr_base) {
+		pr_err("could not iomap gcr");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* give boot ROM kernel start address. */
+	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
+		  NPCM7XX_SCRPAD_REG);
+	/* make sure the previous write is seen by all observers. */
+	dsb_sev();
+
+	iounmap(gcr_base);
+out:
+	return ret;
+}
+
+static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
+{
+	struct device_node *scu_np;
+	void __iomem *scu_base;
+
+	scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
+	if (!scu_np) {
+		pr_err("no scu device node\n");
+		return;
+	}
+	scu_base = of_iomap(scu_np, 0);
+	if (!scu_base) {
+		pr_err("could not iomap scu");
+		return;
+	}
+
+	scu_enable(scu_base);
+
+	iounmap(scu_base);
+}
+
+static struct smp_operations npcm7xx_smp_ops __initdata = {
+	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
+	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+};
+
+CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
-- 
2.14.1
