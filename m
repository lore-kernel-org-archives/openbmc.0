Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22b; helo=mail-pg0-x22b.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IfHDOrc4"; 
 dkim-atps=neutral
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn4HR1tTpzDrFT
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 10:30:27 +1000 (AEST)
Received: by mail-pg0-x22b.google.com with SMTP id d8so12277286pgt.4
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7qmMptUOUbrFVvTXmquSTzknXfnw/kD9LRKNDiERxOE=;
 b=IfHDOrc4pFEvT1we+VvaeV4MicViHUEnwFZakUs4k5+36kbrQAhemI9DWhxtsPGPsi
 gkkRCQDc0E7+PIL/8HoqJPCyq0U+OdGP2Hz/dux9vHbUr5/gibmWqIOmKmrQ5Z7+5btB
 uNNdmsAMz5Y7yDcPxWtqe2pnbznCD0MFYVuPmyhmR8xDXtWpMCVJTlOXlxL39eYRO8dw
 zihRVcU6zTTM/9Kdc8vY274xLfd1TMEuINgjFfaNWWDPIVOXCefbfWrgVZeaF7gWIK3g
 CYVitz8r2wcq+YIX7b7SV48qwEscyIty8ZIbEwTFCluXOeiibD63Ausoyq6KFnJe5j9c
 kiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7qmMptUOUbrFVvTXmquSTzknXfnw/kD9LRKNDiERxOE=;
 b=UwTjsennPaAQfhY6gNaizz82hLKfJYvuZTFgU9RCd6BXG4oIyfaR9JQEA+pSYAD67/
 hlmvpHrPn40W1tgXSeIzQu1FPOmOf66AGH/0+Di5YrvLLV4Qn44dKCGZn/7XXj1f+L+f
 BaqNF2EZdtUKzZOJJQL3ADerC6EXL3Pqi7V9rtMRDjJh0D4FsxWAwnWBgLZ/86cmlENT
 /aKcZ/9WbD9QVGR//4ognj4vAVYkHY0I+E4omZarMEfngkk8NzdoMl07EUaih3+lzxE5
 ETKqbhUKv/7FY75E3+YM6DYfYBnuqnopLz+cAitX2HL0QWutlc3Sss0iKFbpnHRA1rmT
 VdnQ==
X-Gm-Message-State: AHPjjUj2VC7GKDXXeoH02Bkc5jFcFbmJpsay8Ll01J3WA4YyI4iX2WYq
 3EVf1pzIFb/sM4b6
X-Google-Smtp-Source: ADKCNb7gjK4xZKk8zYTkIzn94mB2yX14ruJcla7gTp+W9rt3QOW0+IUp3MzIlb0wRMxJhv4sTzuBHw==
X-Received: by 10.84.235.5 with SMTP id o5mr6149059plk.4.1504657824961;
 Tue, 05 Sep 2017 17:30:24 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id v126sm176808pfv.113.2017.09.05.17.30.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 05 Sep 2017 17:30:24 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v3 1/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue,  5 Sep 2017 17:30:14 -0700
Message-Id: <20170906003016.2159-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170906003016.2159-1-brendanhiggins@google.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 06 Sep 2017 00:30:27 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/arm/Kconfig             |  2 +
 arch/arm/Makefile            |  1 +
 arch/arm/mach-npcm/Kconfig   | 48 ++++++++++++++++++++++++
 arch/arm/mach-npcm/Makefile  |  3 ++
 arch/arm/mach-npcm/headsmp.S | 17 +++++++++
 arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++++++
 arch/arm/mach-npcm/platsmp.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 194 insertions(+)
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
index 000000000000..dfb17afa0230
--- /dev/null
+++ b/arch/arm/mach-npcm/Kconfig
@@ -0,0 +1,48 @@
+menuconfig ARCH_NPCM
+	bool "Nuvoton NPCM Architecture"
+	select ARCH_REQUIRE_GPIOLIB
+	select USE_OF
+	select PINCTRL
+	select PINCTRL_NPCM7XX
+
+if ARCH_NPCM
+
+comment "NPCMX50 CPU type"
+
+config CPU_NPCM750
+	depends on ARCH_NPCM && ARCH_MULTI_V7
+	bool "Support for NPCM750 BMC CPU (Poleg)"
+	select CACHE_L2X0
+	select CPU_V7
+	select ARM_GIC
+	select HAVE_SMP
+	select HAVE_ARM_SCU
+	select HAVE_ARM_TWD if SMP
+	select ARM_ERRATA_458693
+	select ARM_ERRATA_720789
+	select ARM_ERRATA_742231
+	select ARM_ERRATA_754322
+	select ARM_ERRATA_764369
+	select ARM_ERRATA_794072
+	select PL310_ERRATA_588369
+	select PL310_ERRATA_727915
+	select USB_EHCI_ROOT_HUB_TT
+	select USB_ARCH_HAS_HCD
+	select USB_ARCH_HAS_EHCI
+	select USB_EHCI_HCD
+	select USB_ARCH_HAS_OHCI
+	select USB_OHCI_HCD
+	select USB
+	select FIQ
+	select CPU_USE_DOMAINS
+	select GENERIC_CLOCKEVENTS
+	select CLKDEV_LOOKUP
+	select COMMON_CLK if OF
+	select NPCM750_TIMER
+	select MFD_SYSCON
+	help
+	  Support for NPCM750 BMC CPU (Poleg).
+
+	  Nuvoton NPCM750 BMC based on the Cortex A9.
+
+endif
diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
new file mode 100644
index 000000000000..78416055b854
--- /dev/null
+++ b/arch/arm/mach-npcm/Makefile
@@ -0,0 +1,3 @@
+AFLAGS_headsmp.o		+= -march=armv7-a
+
+obj-$(CONFIG_CPU_NPCM750)	+= npcm7xx.o platsmp.o headsmp.o
diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
new file mode 100644
index 000000000000..9fccbbd49ed4
--- /dev/null
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -0,0 +1,17 @@
+/*
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/linkage.h>
+#include <linux/init.h>
+#include <asm/assembler.h>
+
+ENTRY(npcm7xx_secondary_startup)
+	safe_svcmode_maskall r0
+
+	b	secondary_startup
+ENDPROC(npcm7xx_secondary_startup)
diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
new file mode 100644
index 000000000000..132e9d587857
--- /dev/null
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <asm/mach/arch.h>
+#include <asm/mach-types.h>
+#include <asm/mach/map.h>
+#include <asm/hardware/cache-l2x0.h>
+
+#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH |			       \
+			 L310_AUX_CTRL_DATA_PREFETCH |			       \
+			 L310_AUX_CTRL_NS_LOCKDOWN |			       \
+			 L310_AUX_CTRL_CACHE_REPLACE_RR |		       \
+			 L2C_AUX_CTRL_SHARED_OVERRIDE |			       \
+			 L310_AUX_CTRL_FULL_LINE_ZERO)
+
+static const char *const npcm7xx_dt_match[] = {
+	"nuvoton,npcm750",
+	NULL
+};
+
+DT_MACHINE_START(NPCM7XX_DT, "NPCMX50 Chip family")
+	.atag_offset	= 0x100,
+	.dt_compat	= npcm7xx_dt_match,
+	.l2c_aux_val	= NPCM7XX_AUX_VAL,
+	.l2c_aux_mask	= ~NPCM7XX_AUX_VAL,
+MACHINE_END
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
new file mode 100644
index 000000000000..144e3e7ec7e6
--- /dev/null
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define pr_fmt(fmt) "PLATSMP: " fmt
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
+		ret = -EFAULT;
+		goto out;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	if (!gcr_base) {
+		pr_err("could not iomap gcr at: 0x%llx\n", gcr_base);
+		ret = -EFAULT;
+		goto out;
+	}
+
+	/* give boot ROM kernel start address. */
+	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
+		  NPCM7XX_SCRPAD_REG);
+	/* make sure npcm7xx_secondary_startup is seen by all observers. */
+	smp_wmb();
+	dsb_sev();
+	/* make sure write buffer is drained */
+	mb();
+
+out:
+	iounmap(gcr_base);
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
+		pr_err("could not iomap scu at: 0x%llx\n", scu_base);
+		return;
+	}
+
+	scu_enable(scu_base);
+
+out:
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
2.14.1.581.gf28d330327-goog
