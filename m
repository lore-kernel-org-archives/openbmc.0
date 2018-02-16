Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X2nNC/d8"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjHS56bWXzF1Jv
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:40:21 +1100 (AEDT)
Received: by mail-pl0-x241.google.com with SMTP id k8so941817pli.8
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vOtvhqV3AeAVtbLMF2Da+wV0R0y0urgXeYhBbrVlsjM=;
 b=X2nNC/d8e6N3iCYCtDnNvLEcWG952FAwJdSw8MWzydwY8oMWeWwuQBvYjLbSFxLx6V
 nY/u43gUmdS7Cer/wpajDkXYmR+ChJaPuCGI5L0JVAN552dwADWtfa7sVIRihvjqJTK1
 NBZpFMjsrsavpoG070oHvOP0cA1edcTUmyNtLO+OzzNRYagjyWWvvxw2pfcCwt6ZHQZI
 1h7ou/8uHHniWeBbHEOKhOamnzSWTgNhKqD4saPRb/mXcOMirc2ppytnlSr8AFD/fGwr
 FeeG/VDG1kQ1pzaLfnPwT0Y5E1R1K721ngCvLPr+IXh4KFgOTOMNvEBs2a/e654uT5B6
 CJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vOtvhqV3AeAVtbLMF2Da+wV0R0y0urgXeYhBbrVlsjM=;
 b=HSiLrNim+fBLC6mRTBGph3jVvTWclhfGQeGS0J8NnRd8u9d9FEp+o+LvQT88FMKMU0
 FjOhcqAuosYe5AREFlND4LP8VIeJX2pyDlBhUKzIStSVtU6bQuAB2G0mhh+/MQWkmeg3
 1U47uPeANezDm8pS/PLT67shcYFUNBsY2vM2S6b7gNX9MS5CB/1W+J+Hh9YXrD0O50QF
 TUuIcVZJUdf8bA6NIvKFmiVX3CfUKAfKi8vdpVsbBgAqmzPUjbFC3YDV4ICeQ4qfB2SZ
 O8MpYpt3BdlYNG2v8QGbcYbZeYHXrX3cLJJCUzUtIqaSU45KKxpEM4tXFpnPfbhOQqfC
 cyQg==
X-Gm-Message-State: APf1xPDK95IuiVo7lM+F1rSKft3PbaNDMzILpiESwDdvZ/PAw0RMiWBx
 QsU9kcPoPK0yDIdWsNBAo8SqeA==
X-Google-Smtp-Source: AH8x227y3ksPFqHhlJkKBADYmN0thO4tTcuERIHcOkhLuqwkssL8sfB0vGgFAJjXTk9cf4kYImbwMw==
X-Received: by 2002:a17:902:5501:: with SMTP id
 f1-v6mr4373811pli.50.1518748819649; 
 Thu, 15 Feb 2018 18:40:19 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g16sm9094041pfd.23.2018.02.15.18.40.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 15 Feb 2018 18:40:19 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com,
 pombredanne@nexb.com, arnd@arndb.de, olof@lixom.net, khilman@kernel.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 1/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 15 Feb 2018 18:40:09 -0800
Message-Id: <20180216024011.189157-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.1.291.g4437f3f132-goog
In-Reply-To: <20180216024011.189157-1-brendanhiggins@google.com>
References: <20180216024011.189157-1-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 02:40:23 -0000
X-List-Received-Date: Fri, 16 Feb 2018 02:40:23 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
---
 arch/arm/Kconfig             |  2 +
 arch/arm/Makefile            |  1 +
 arch/arm/mach-npcm/Kconfig   | 48 +++++++++++++++++++++
 arch/arm/mach-npcm/Makefile  |  3 ++
 arch/arm/mach-npcm/headsmp.S | 17 ++++++++
 arch/arm/mach-npcm/npcm7xx.c | 20 +++++++++
 arch/arm/mach-npcm/platsmp.c | 81 ++++++++++++++++++++++++++++++++++++
 7 files changed, 172 insertions(+)
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7e3d53575486..6a8404cd5150 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -779,6 +779,8 @@ source "arch/arm/mach-netx/Kconfig"
 
 source "arch/arm/mach-nomadik/Kconfig"
 
+source "arch/arm/mach-npcm/Kconfig"
+
 source "arch/arm/mach-nspire/Kconfig"
 
 source "arch/arm/plat-omap/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index e83f5161fdd8..e4e537f27339 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -196,6 +196,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
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
index 000000000000..21633c70fe7f
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
+CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);
-- 
2.16.1.291.g4437f3f132-goog
