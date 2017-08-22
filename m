Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbx6H3K2czDrCd
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 13:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CT2shNw5"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id m133so28127165pga.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7Gr700jqxjZQfKV98WdQbKzKjEnO5iZBZHo0V0Nyrhw=;
 b=CT2shNw5TaTV93YXKgvtMGGkw+gBPkfUrrDB9v4uW2Umc3W+C+QIEXAlAmcqvLrRbx
 ys75xng6pfqIuwqxyJaJ0GF6p7duo0o4ncz83J3y3q5rwFNYuPZvyRu/U4CbFUSTEjdN
 HjEdozeM1HE+ilXDgRlOxhJgBpCQs+nLCi1jRNZ2hqAi8dUoHxqPmyMHm6jri6P+jLvD
 bXpqF9UYIOD2T4c9p6tZv6LXpheSdocDdpp2zk/IvTjg6HMSM3gJT6qCgGLGQZTFxnU7
 Bt+kxSUh0wDLkvC18BJW3GXsxAiMLHM3GdqmZ9eZUtxGHi2M8/xueM7Hpe5gYFfvFM9x
 tMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7Gr700jqxjZQfKV98WdQbKzKjEnO5iZBZHo0V0Nyrhw=;
 b=uMUhWcDbJCRWUt9UCSLioxFUCdTIdbnqTf82QFYaoe0UJQTPzm0ImIi9NzDrJJw8TD
 T0/hjac19/1Og2DItYccPXH8fwcJC2p7OLW8yT1fRA4vVo/U3wr6+jjXLcICsEsjm2kp
 ythOZUl+t3byjSJzcj23dhn6zR2TlBLb2K398Li1nXeffqaJ7WxryhghMD/H6ywiiWs0
 I4Xf3rhrhGxn3PTKWLi8wasTFxCIF8xDJ8sJ74qLQioEmbMOiTWEAuh8jzu6LWENh3LP
 72548G92Dq+SoFthJBuVMLcNKiKldv4TIqVBWnYB2SP9k9YGyF+Zlx9SB6Co4HmzjaF2
 r5Jw==
X-Gm-Message-State: AHYfb5iFzoRXyjt4GdrEB1x9B04xqj3kUd3Y8XzWk/twjkZN5yBEoqAX
 UzB8deHxlnAtuxfm
X-Received: by 10.99.226.83 with SMTP id y19mr18374151pgj.257.1503372949261;
 Mon, 21 Aug 2017 20:35:49 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e184sm25044480pfe.172.2017.08.21.20.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Aug 2017 20:35:48 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 1/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Mon, 21 Aug 2017 20:35:00 -0700
Message-Id: <20170822033502.4100-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.480.gb18f417b89-goog
In-Reply-To: <20170822033502.4100-1-brendanhiggins@google.com>
References: <20170822033502.4100-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 22 Aug 2017 03:35:55 -0000

Adds basic support for the Nuvoton NPCM750 BMC.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/arm/Kconfig             |   2 +
 arch/arm/Makefile            |   1 +
 arch/arm/mach-npcm/Kconfig   |  60 +++++++++++++++
 arch/arm/mach-npcm/Makefile  |   3 +
 arch/arm/mach-npcm/headsmp.S | 120 ++++++++++++++++++++++++++++++
 arch/arm/mach-npcm/npcm7xx.c |  34 +++++++++
 arch/arm/mach-npcm/platsmp.c | 170 +++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 390 insertions(+)
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
index 000000000000..82714b8a890f
--- /dev/null
+++ b/arch/arm/mach-npcm/Kconfig
@@ -0,0 +1,60 @@
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
+	depends on ARCH_NPCM
+	bool "Support for NPCM750 BMC CPU (Poleg)"
+	select CACHE_L2X0
+	select CPU_V7
+	select ARM_GIC
+	select ARM_ERRATA_754322
+	select ARM_ERRATA_764369
+	select USB_EHCI_ROOT_HUB_TT
+	select USB_ARCH_HAS_HCD
+	select USB_ARCH_HAS_EHCI
+	select USB_EHCI_HCD
+	select USB_ARCH_HAS_OHCI
+	select USB_OHCI_HCD
+	select USB
+	select FIQ
+	select CPU_USE_DOMAINS
+	select COMMON_CLK if OF
+	select NPCM750_TIMER
+	select MFD_SYSCON
+	help
+	  Support for single core NPCM750 BMC CPU (Poleg).
+
+	  Single core variant of the Nuvoton NPCM750 BMC based on the Cortex A9.
+
+config CPU_NPCM750_SMP
+	depends on ARCH_NPCM
+	bool "Support for NPCM750 BMC CPU SMP (Poleg)"
+	select HAVE_SMP
+	select HAVE_ARM_SCU
+	select ARM_ERRATA_458693
+	select ARM_ERRATA_742231
+	select ARM_ERRATA_794072
+	select PL310_ERRATA_588369
+	select PL310_ERRATA_727915
+	select ARM_ERRATA_720789
+	select DEBUG_SPINLOCK
+	select GENERIC_CLOCKEVENTS
+	select SMP
+	select HAVE_ARM_TWD if SMP
+	select HAVE_ARM_SCU if SMP
+	select CLKDEV_LOOKUP
+	select COMMON_CLK if OF
+	help
+	  Support for dual core NPCM750 BMC CPU (Poleg).
+
+	  Dual core variant of the Nuvoton NPCM750 BMC based on the Cortex A9.
+
+endif
diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
new file mode 100644
index 000000000000..e7d27340f968
--- /dev/null
+++ b/arch/arm/mach-npcm/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
+
+obj-$(CONFIG_ARCH_NPCM)		+= npcm7xx.o
diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
new file mode 100644
index 000000000000..d22d2fc1a35c
--- /dev/null
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -0,0 +1,120 @@
+/*
+ * linux/arch/arm/mach-realview/headsmp.S
+ *
+ * Copyright (c) 2003 ARM Limited
+ * Copyright 2017 Google, Inc.
+ *  All Rights Reserved
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/linkage.h>
+#include <linux/init.h>
+
+.equ SVC_MODE, 0x13
+.equ I_BIT, 0x80
+.equ F_BIT, 0x40
+
+ENTRY(npcm7xx_wakeup_z1)
+	stmfd	sp!, {r0-r12, lr}
+	ldr	r0, =0x01
+	ldr	r1, =0x01
+	ldr	r2, =0x01
+
+	and	r3, r0, #0x0F /* Mask off unused bits of ID, and move to r3 */
+	and	r1, r1, #0x0F /* Mask off unused bits of target_filter */
+	and	r2, r2, #0x0F /* Mask off unused bits of filter_list */
+
+	orr	r3, r3, r1, LSL #16 /* Combine ID and target_filter */
+	orr	r3, r3, r2, LSL #24 /* and now the filter list */
+
+	/* Get the address of the GIC */
+	mrc	p15, 4, r0, c15, c0, 0 /* Read periph base address */
+	add	r0, r0, #0x1F00 /* Add offset of the sgi_trigger reg */
+
+	/* Write to the Software Generated Interrupt Register (ICDSGIR) */
+	str	r3, [r0]
+
+	ldmfd	sp!, {r0-r12, pc}
+ENDPROC(npcm7xx_wakeup_z1)
+
+ENTRY(v7_invalidate_l1_npcmX50)
+	mov	r0, #0
+	mcr	p15, 0, r0, c7, c5, 0 /* invalidate I cache */
+	mcr	p15, 2, r0, c0, c0, 0
+	mrc	p15, 1, r0, c0, c0, 0
+
+	ldr	r1, =0x7fff
+	and	r2, r1, r0, lsr #13
+
+	ldr	r1, =0x3ff
+
+	and	r3, r1, r0, lsr #3 /* NumWays - 1 */
+	add	r2, r2, #1         /* NumSets */
+
+	and	r0, r0, #0x7
+	add	r0, r0, #4 /* SetShift */
+
+	clz	r1, r3     /* WayShift */
+	add	r4, r3, #1 /* NumWays */
+1:	sub	r2, r2, #1 /* NumSets-- */
+	mov	r3, r4     /* Temp = NumWays */
+2:	subs	r3, r3, #1 /* Temp-- */
+	mov	r5, r3, lsl r1
+	mov	r6, r2, lsl r0
+	/* Reg = (Temp << WayShift) | (NumSets << SetShift) */
+	orr	r5, r5, r6
+	mcr	p15, 0, r5, c7, c6, 2
+	bgt	2b
+	cmp	r2, #0
+	bgt	1b
+	dsb
+	isb
+	mov	pc, lr
+ENDPROC(v7_invalidate_l1_npcmX50)
+
+/*
+ * MSM specific entry point for secondary CPUs.  This provides
+ * a "holding pen" into which all secondary cores are held until we're
+ * ready for them to initialise.
+ */
+ENTRY(npcm7xx_secondary_startup)
+	msr	CPSR_c, #(SVC_MODE)
+
+	bl	v7_invalidate_l1_npcmX50
+	/* disable vector table remapping */
+	mrc	p15, 0,r0, c1, c0, 0
+	and	r0, #0xffffdfff
+	mcr	p15, 0,r0, c1, c0, 0
+
+#ifdef CONFIG_CACHE_L2X0
+	/* Enable L1 & L2 prefetch + Zero line */
+	mrc	p15, 0, r0, c1, c0, 1
+	orr	r0, r0, #(7 << 1)
+	mcr	p15, 0, r0, c1, c0, 1
+#endif /* CONFIG_CACHE_L2X0 */
+
+	mrc	p15, 0, r0, c0, c0, 5
+	and	r0, r0, #15
+	adr	r4, 1f
+	ldmia	r4, {r5, r6}
+	sub	r4, r4, r5
+	add	r6, r6, r4
+	str r3,[r2]
+
+pen:	ldr	r7, [r6]
+	cmp	r7, r0
+	bne	pen
+
+	/*
+	 * we've been released from the holding pen: secondary_stack
+	 * should now contain the SVC stack for this core
+	 */
+	b	secondary_startup
+ENDPROC(npcm7xx_secondary_startup)
+
+	.align
+1:	.long	.
+	.long	pen_release
diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
new file mode 100644
index 000000000000..8ff4b269db14
--- /dev/null
+++ b/arch/arm/mach-npcm/npcm7xx.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2014 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation;version 2 of the License.
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
+	"nuvoton,npcm7xx",
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
index 000000000000..181a71510acb
--- /dev/null
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -0,0 +1,170 @@
+/*
+ * Copyright (C) 2002 ARM Ltd.
+ * Copyright (C) 2008 STMicroelctronics.
+ * Copyright (C) 2009 ST-Ericsson.
+ * Copyright 2017 Google, Inc.
+ *
+ * This file is based on arm realview platform
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
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
+static void __iomem *gcr_base;
+static void __iomem *scu_base;
+
+/* This is called from headsmp.S to wakeup the secondary core */
+extern void npcm7xx_secondary_startup(void);
+extern void npcm7xx_wakeup_z1(void);
+
+/*
+ * Write pen_release in a way that is guaranteed to be visible to all
+ * observers, irrespective of whether they're taking part in coherency
+ * or not.  This is necessary for the hotplug code to work reliably.
+ */
+static void npcm7xx_write_pen_release(int val)
+{
+	pen_release = val;
+	/* write to pen_release must be visible to all observers. */
+	smp_wmb();
+	__cpuc_flush_dcache_area((void *)&pen_release, sizeof(pen_release));
+	outer_clean_range(__pa(&pen_release), __pa(&pen_release + 1));
+}
+
+static DEFINE_SPINLOCK(boot_lock);
+
+static void npcm7xx_smp_secondary_init(unsigned int cpu)
+{
+	/*
+	 * let the primary processor know we're out of the
+	 * pen, then head off into the C entry point
+	 */
+	npcm7xx_write_pen_release(-1);
+
+	/*
+	 * Synchronise with the boot thread.
+	 */
+	spin_lock(&boot_lock);
+	spin_unlock(&boot_lock);
+}
+
+static int npcm7xx_smp_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	unsigned long timeout;
+
+	/*
+	 * set synchronisation state between this boot processor
+	 * and the secondary one
+	 */
+	spin_lock(&boot_lock);
+
+	/*
+	 * The secondary processor is waiting to be released from
+	 * the holding pen - release it, then wait for it to flag
+	 * that it has been released by resetting pen_release.
+	 */
+	npcm7xx_write_pen_release(cpu_logical_map(cpu));
+	iowrite32(virt_to_phys(npcm7xx_secondary_startup),
+		  gcr_base + NPCM7XX_SCRPAD_REG);
+	/* make npcm7xx_secondary_startup visible to all observers. */
+	smp_rmb();
+
+	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+	timeout  = jiffies + (HZ * 1);
+	while (time_before(jiffies, timeout)) {
+		/* make sure we see any writes to pen_release. */
+		smp_rmb();
+		if (pen_release == -1)
+			break;
+
+		udelay(10);
+	}
+
+	/*
+	 * now the secondary core is starting up let it run its
+	 * calibrations, then wait for it to finish
+	 */
+	spin_unlock(&boot_lock);
+
+	return pen_release != -1 ? -EIO : 0;
+}
+
+
+static void __init npcm7xx_wakeup_secondary(void)
+{
+	/*
+	 * write the address of secondary startup into the backup ram register
+	 * at offset 0x1FF4, then write the magic number 0xA1FEED01 to the
+	 * backup ram register at offset 0x1FF0, which is what boot rom code
+	 * is waiting for. This would wake up the secondary core from WFE
+	 */
+	iowrite32(virt_to_phys(npcm7xx_secondary_startup), gcr_base +
+		  NPCM7XX_SCRPAD_REG);
+	/* make sure npcm7xx_secondary_startup is seen by all observers. */
+	smp_wmb();
+	dsb_sev();
+
+	/* make sure write buffer is drained */
+	mb();
+}
+
+static void __init npcm7xx_smp_init_cpus(void)
+{
+	struct device_node *gcr_np, *scu_np;
+	unsigned int i, ncores;
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	gcr_base = of_iomap(gcr_np, 0);
+	if (IS_ERR(gcr_base)) {
+		pr_err("no gcr device node: %ld\n", PTR_ERR(gcr_base));
+		return;
+	}
+
+	scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
+	scu_base = of_iomap(scu_np, 0);
+	if (IS_ERR(scu_base)) {
+		pr_err("no scu device node: %ld\n", PTR_ERR(scu_base));
+		return;
+	}
+
+	ncores = scu_get_core_count(scu_base);
+
+	if (ncores > nr_cpu_ids) {
+		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
+			ncores, nr_cpu_ids);
+		ncores = nr_cpu_ids;
+	}
+
+	for (i = 0; i < ncores; i++)
+		set_cpu_possible(i, true);
+}
+
+static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
+{
+	scu_enable(scu_base);
+	npcm7xx_wakeup_secondary();
+}
+
+static struct smp_operations npcm7xx_smp_ops __initdata = {
+	.smp_init_cpus    = npcm7xx_smp_init_cpus,
+	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
+	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+	.smp_secondary_init = npcm7xx_smp_secondary_init,
+};
+
+CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
-- 
2.14.1.480.gb18f417b89-goog
