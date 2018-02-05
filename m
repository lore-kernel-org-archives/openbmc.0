Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cVKv8kk2"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zb4KZ1fTXzF0vM
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 10:58:09 +1100 (AEDT)
Received: by mail-pg0-x244.google.com with SMTP id g2so114240pgn.7
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 15:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jd0HypqfkQCmn4eqCyb5hLFmbuRSczLWFEuLzaAYzaY=;
 b=cVKv8kk2vF8YJkzM8chxT+ucgDsl1R2jimlxriClIfGQfzpYia1DPCotRcxlTpfMob
 vvLFrA4yhlMXg2qSuzrgn9GnOGoPsXB8bg56bzVOA2QZ3QINIOKYm9ERkOjIeTAGT4mn
 uY0I/LQ1XRkvm7YD0EuuwdOgn47ohHDlIY6T3i9bkPuGzkiDDIGGE9nskioi2cA94ypc
 ziCZ+vDalHwDkIq4KpcAwsrd+xhDCxe0QlxIRT474lqBouIpGB9DK2J01gfmHmRiGnP1
 8G7b+vNn23bjotQ/d3/ydS5UrtkaNciHuRphEqWlyC3kp1qHnIKktdDgG1K7er/OsDhS
 EAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jd0HypqfkQCmn4eqCyb5hLFmbuRSczLWFEuLzaAYzaY=;
 b=SBs8iEOOqufTbsW4XDpCLTkp42B05X31KqeIWic5moR3uTKONOnIpLSo8Pcj9g2w4q
 n/Ml5ENgNOLBOf1Y4Y0JrdIS0y58UohwErpI4720BuPTASblZvreAJAtW3DQdJbJi6Tl
 JUaz7ZQJJJIpmp2BIQl6u1Y84YPr2+MDOkaUeY2+FkljUFq/2Nh+8Wt03HYY9Pqa++DC
 GHrWsfTfk8PdehBSglYakbIx5jgGFFDLLRoMomyP3Pi13pLaxOqXN8sd9nR3ZOrrqUKh
 A/cyB/QqTH5Duvr7ugruinvdCDFhgXITIjHRVDWorMHpnOSngHuErBkGg9hXaMJlCoRK
 Bgcg==
X-Gm-Message-State: APf1xPBvRAtOxRlYCn53i6nYVBNOlzpdsQiH8P8dhbmEbngZRbPvK3ke
 6+xuS1qYyFX8CQz7pojmrUgMWA==
X-Google-Smtp-Source: AH8x224lXZTueAVeraSxnUrLb3r7BrXjkE+LOmPyiPwlx79g14DFymObzJ/H3HNugI7hS/OY1seR3Q==
X-Received: by 10.99.141.202 with SMTP id z193mr385716pgd.418.1517875087015;
 Mon, 05 Feb 2018 15:58:07 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id c1sm17803694pfa.119.2018.02.05.15.58.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Feb 2018 15:58:06 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v9 1/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Mon,  5 Feb 2018 15:57:55 -0800
Message-Id: <20180205235757.246758-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180205235757.246758-1-brendanhiggins@google.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 23:58:10 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
---
 arch/arm/Kconfig             |  2 ++
 arch/arm/Makefile            |  1 +
 arch/arm/mach-npcm/Kconfig   | 48 ++++++++++++++++++++++++++
 arch/arm/mach-npcm/Makefile  |  3 ++
 arch/arm/mach-npcm/headsmp.S | 17 ++++++++++
 arch/arm/mach-npcm/npcm7xx.c | 20 +++++++++++
 arch/arm/mach-npcm/platsmp.c | 81 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 172 insertions(+)
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
index 000000000000..6ff9df2636be
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
+comment "NPCM7XX CPU type"
+
+config ARCH_NPCM750
+	depends on ARCH_NPCM && ARCH_MULTI_V7
+	bool "Support for NPCM750 BMC CPU (Poleg)"
+	select CACHE_L2X0
+	select CPU_V7
+	select ARM_GIC
+	select HAVE_SMP
+	select SMP
+	select SMP_ON_UP
+	select HAVE_ARM_SCU
+	select HAVE_ARM_TWD if SMP
+	select ARM_ERRATA_720789
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
index 000000000000..c7a1316d27c1
--- /dev/null
+++ b/arch/arm/mach-npcm/Makefile
@@ -0,0 +1,3 @@
+AFLAGS_headsmp.o		+= -march=armv7-a
+
+obj-$(CONFIG_ARCH_NPCM750)	+= npcm7xx.o platsmp.o headsmp.o
diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
new file mode 100644
index 000000000000..c083fe09a07b
--- /dev/null
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
index 000000000000..5f7cd88103ef
--- /dev/null
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
+MACHINE_END
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
new file mode 100644
index 000000000000..49079cd5c63c
--- /dev/null
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology corporation.
+// Copyright 2018 Google, Inc.
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
2.16.0.rc1.238.g530d649a79-goog
