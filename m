Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B0606A6B5
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DgGAIUsb
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jc5FB12bJz30g6;
	Sat, 28 Nov 2026 20:53:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795859581;
	cv=none; b=Mnn/q1U4kIIduQJ9ETroNyobjylrGtTY99dY5+6iQPnwL+s4+S7kP+zcVAPxYNeEjJpelATGFE0OZs0b43d7GzR4k9ttbmcVzDtnkBYHwNTXVAmMa7rubM5FJuAC29Cf5/O80RwYZH7gwivG5l/AMIYdXT4XqKMIxEcpkZAzQyDQ7fPuI0+o+YnxNFkgA5vsGHSdrVxJXLf4iw4acgF5zBo/HNR2b9dsp1Ohd9DxBNsX/gWiLj7o+BlmNyolZzNMfDxzLR8ZPhMXRMRxXj+wwUrKDWZPHycm54vNVAebhnqOsZYriAzHm5wNHlSH4RbOddzDFDpvkALAFdmp8pT4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795859581; c=relaxed/relaxed;
	bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGLariPT4+gQzb9DSxLqcSjYcO4Corn+4/E/AWKWMkIgTlMxAIuBiyhNxfH1s/bbC9gCS/Or30x9sFShJCBq0JZxooicL/W0nPU7gv9rHAqARL9yXGa3+Hes8/zPSGOpRC2fcu4afsclFN2Rh2UA3CKkikwykk0Ifd/uc2lvHDRXOxzEpQn6UyC8H5LNN7z5JWho2UsASLR9e6g6Fsv44gkKDDTN8NsV8ECBet2n+02KxaYfGBtmxeH2FEdtIgwxwNIRw47LEybAYTk/cw0PV8pZXWBNk8rI2d8Ls1df99tL/s87xjJSsBaDgXv60kpIdWAkDe8xvv1g9VywWoYeMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DgGAIUsb; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DgGAIUsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jc5F75wfWz2xlh
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 20:52:59 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso4004418a91.3
        for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795859576; x=1796464376; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=DgGAIUsbyNRk1oCDU4egf4g5LMyV6K1RU6ZxG+adRG3/dl9AkS1eoSeqVsULGJ5P8v
         +nFtm8VAQgIUkbV14nGi0Uu2+wz2HQ8QtvdMnQHD01xf1cu9oq913EP80dQkVVdMchcd
         olm5ocVeLRSc4cJfd+q7J0e/p6N4AHggKjBEcB7VA0Wxb53PY75PQLd3nDkbK1TiF1M+
         SOsEXW62X1v3KLbZgP8kLWBTIGCVD5jYy+AoOecIFLyq5arz+E2G+SvWsNEi8B3gt5np
         yC2i7Zc5gfcAIrWVtC+PN+O+sgyj0CkPU5/afIq8XJEVl6unEHtnLDAKSPdczy3d4X1U
         JbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795859576; x=1796464376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrDq8tmdXzrkRgk1EoLyp7UlG92pPquVxMGIdXH3Fx0=;
        b=wNTwIUZavfXea1LxCd7qyM6tyviwctoeEm4mdXcNbyNDeUVRhrRR9yGX2re8D89hKW
         R1jz5SA+TYWnjaETi8R12S029BCctOhhHZnp+4xTZuXN84qfQCL3xzr/aKumxD+4rfQk
         auLNCzAVLnWIB8X096hK++m0Ovtk6Rz6CeW0df+JkJ/aybrTaK7gt4tetDNYQLldezD8
         DSP2F9FkDpggy1jCjBumoTC+Fk2iabCJb9T+BpKvITNydhGEdhgPBA4td5rdAfFEY8Er
         uonutsOc8XX0I0KrY/PW37TZSpSp84vvg598tEBEY8zMmllvFIL5E9vvAtpR9O63Tufl
         p9BQ==
X-Forwarded-Encrypted: i=1; AL+hErHHBQtS1YUubwj5EtXoyCTqi+nYB4+Ox5q04+2dx/Z2OflFz4Fm3dRGvOEomue75jErjIgAl43+@lists.ozlabs.org
X-Gm-Message-State: APuU4Z9dbalCQwaaGNSfTkCjneKBAROMN9yLrSBoeT/qBiMJdu3SIuCy
	H3cVTrKvG+IgaPWIV06g1XBaHmODNTOtL5rqM7ehDWwVBs64yQgfcfPLsPTQdNMj2io=
X-Gm-Gg: AZFdTZd8+jtUcn0q+JmPMnFwcY4WChpv4udZcWVv3YeMe4kzOaLvOlIo0LfgM3dNDPm
	+R5pdv4aQFoqaRDMPjsZ+whi+wMu0NKolHPYs+AtkMVgHPVUmHcDZbC/vVNUR+bQFmdJyKvTuQt
	MWVh0FR9inRSpTBLJOqc2YCu6zus9/XxcfUcakFuZGcMQPP9jk9PMqZWdBJGP/MPNuDE2aXantw
	mQEdKL9ywhEelxMIljbDPVsGgxRv68hFqsnqLtPuzZO08I6c55AePSxjZO7pKVoNyOTFzGeBMET
	mC7Yz0xu5p41EkzMRDQCh1522pkWbzO/V2r8cM9+O630gTIfbN7YfPoLp4ChoY9lo5y6cPODznP
	xbAIerQw85ayYa36270bOrsp4W5OyXNmUw0+LX0hCoxrNcqdAf4xdvlgSaewPrrvvbKLVUBdh6y
	RqMinyBetw09PJ2bpl5vKWnye5zZXJLhJmEXbeYeKMJSqzQfYAwmztxTMZ7oa+T1CcYUKV+38eq
	OLA+ZV7uXf37EdM1GmC61TYZTYimujHo/57BuVREul14ULtDB/cJzEvK8BRxHH+oSwOXrRVVYli
	NigK4YJ1AEFb8+aRFr2hr3rXFscfWOoVmsWSn0C2mULVl4JrRFVAe+ILlqM1/uDjxxowk3V4rL7
	oF69GKltU2YfUUdSjcWolQPPpbxLmenfcVTQ=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr27534660a91.23.1795859576339;
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm29481748a91.0.2026.11.28.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:52:56 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v3] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Sat, 28 Nov 2026 09:52:54 +0000
Message-ID: <20261128095254.358131-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kexec_load() fails with -EINVAL on NPCM7xx because the platform does not
provide the CPU hotplug callbacks that machine_kexec_prepare() requires
on SMP systems. Add them.

The NPCM7xx cannot reset or power down a single core, so hand an offlined
core back to the boot ROM instead of leaving it in a WFI loop in kernel
text. The dying core switches to a static stack, takes the identity
mapping, disables caches and branch prediction, flushes L1, leaves
coherency, turns the MMU off and jumps to the reset vector in the ROM.
The ROM then parks it as it does after a real reset, overwriting SCRPAD
and waiting in WFE for npcm7xx_smp_boot_secondary(). The core can
therefore be brought back online, and it no longer executes from RAM that
a kexec'd kernel is free to overwrite.

cpu_kill() waits for the ROM to overwrite the kernel entry point left in
SCRPAD before reporting the core dead.

Map the GCR once in smp_prepare_cpus() since it is now also needed after
init.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
Changes in v3:
- Park offlined secondary cores back in the boot ROM reset vector instead of a
  WFI loop in kernel text so cores can be re-onlined and do not execute from
  RAM across kexec.
- Poll GCR SCRPAD in cpu_kill() until the ROM overwrites the kernel entry
  point, and map GCR once in smp_prepare_cpus().
- Drop Tomer's Reviewed-by due to the implementation rewrite.
- Link to v2: https://lore.kernel.org/r/20231102101009.15104-1-william@wkennington.com

Changes in v2:
- Fix NPCM7xx/NPCN8xx typo in the commit message.

 arch/arm/mach-npcm/headsmp.S |  38 ++++++++++++
 arch/arm/mach-npcm/platsmp.c | 109 ++++++++++++++++++++++++++++-------
 2 files changed, 127 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
index 84d2b6daaf0b..1718b70b7e1d 100644
--- a/arch/arm/mach-npcm/headsmp.S
+++ b/arch/arm/mach-npcm/headsmp.S
@@ -5,6 +5,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <asm/assembler.h>
+#include <asm/cp15.h>
 
 .arch armv7-a
 
@@ -17,3 +18,40 @@ ENTRY(npcm7xx_secondary_startup)
 
 	b	secondary_startup
 ENDPROC(npcm7xx_secondary_startup)
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * void npcm7xx_cpu_park(unsigned long phys_reset, unsigned long rom_addr)
+ *
+ * Exit cache coherency and jump back to the boot ROM reset vector via
+ * cpu_reset() in the identity mapping.  Must be called after
+ * setup_mm_for_reboot() with IRQs and FIQs disabled, and must not access
+ * memory or the stack once SCTLR.C is cleared.
+ */
+ENTRY(npcm7xx_cpu_park)
+	mov	r7, r0
+	mov	r8, r1
+
+	mrc	p15, 0, r0, c1, c0, 0
+	bic	r0, r0, #(CR_I | CR_Z)
+	bic	r0, r0, #(CR_C | CR_A)
+	mcr	p15, 0, r0, c1, c0, 0
+	isb
+
+	bl	v7_flush_dcache_louis
+
+	mrc	p15, 0, r0, c1, c0, 1
+	bic	r0, r0, #(1 << 6)		@ clear ACTLR.SMP
+	mcr	p15, 0, r0, c1, c0, 1
+
+	mov	r0, #0
+	mcr	p15, 0, r0, c7, c5, 0		@ ICIALLU
+	mcr	p15, 0, r0, c7, c5, 6		@ BPIALL
+	dsb
+	isb
+
+	mov	r0, r8
+	mov	r1, #0
+	bx	r7
+ENDPROC(npcm7xx_cpu_park)
+#endif
diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 4c1fc9983746..6055d44075ac 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -7,37 +7,35 @@
 #include <linux/delay.h>
 #include <linux/smp.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <asm/cacheflush.h>
+#include <asm/idmap.h>
+#include <asm/irqflags.h>
+#include <asm/proc-fns.h>
 #include <asm/smp.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
 
 #define NPCM7XX_SCRPAD_REG 0x13c
 
+/* The boot ROM is mapped at the high vectors and holds the reset vector. */
+#define NPCM7XX_ROM_RESET_VECTOR 0xffff0000
+
 extern void npcm7xx_secondary_startup(void);
+#ifdef CONFIG_HOTPLUG_CPU
+extern void __noreturn npcm7xx_cpu_park(unsigned long phys_reset,
+					unsigned long rom_addr);
+#endif
+
+static void __iomem *gcr_base;
 
 static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 				      struct task_struct *idle)
 {
-	struct device_node *gcr_np;
-	void __iomem *gcr_base;
-	int ret = 0;
-
-	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
-	if (!gcr_np) {
-		pr_err("no gcr device node\n");
-		ret = -ENODEV;
-		goto out;
-	}
-	gcr_base = of_iomap(gcr_np, 0);
-	of_node_put(gcr_np);
-	if (!gcr_base) {
-		pr_err("could not iomap gcr");
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!gcr_base)
+		return -ENODEV;
 
 	/* give boot ROM kernel start address. */
 	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
@@ -45,13 +43,12 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 	/* make sure the previous write is seen by all observers. */
 	dsb_sev();
 
-	iounmap(gcr_base);
-out:
-	return ret;
+	return 0;
 }
 
 static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 {
+	struct device_node *gcr_np;
 	struct device_node *scu_np;
 	void __iomem *scu_base;
 
@@ -70,11 +67,83 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 	scu_enable(scu_base);
 
 	iounmap(scu_base);
+
+	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
+	if (!gcr_np) {
+		pr_err("no gcr device node\n");
+		return;
+	}
+	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
+	if (!gcr_base)
+		pr_err("could not iomap gcr\n");
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+/*
+ * The dying CPU moves to this stack before it takes the identity mapping,
+ * because its vmapped idle stack is not guaranteed to be mapped there. One
+ * stack is enough: CPU hotplug is serialised and npcm7xx_cpu_kill() waits
+ * for the CPU to leave the kernel.
+ */
+static u64 npcm7xx_cpu_die_stack[64];
+
+/*
+ * The SoC cannot reset or power down a single core, so hand the core back
+ * to the boot ROM instead. Entered through the reset vector with the MMU
+ * and caches off, the ROM parks a secondary core the same way it does
+ * after a real reset: it overwrites SCRPAD and waits in WFE for
+ * npcm7xx_smp_boot_secondary(). The core no longer executes from RAM.
+ */
+static void __noreturn npcm7xx_cpu_reset(void)
+{
+	unsigned long phys_reset = virt_to_idmap(cpu_reset);
+
+	setup_mm_for_reboot();
+	npcm7xx_cpu_park(phys_reset, NPCM7XX_ROM_RESET_VECTOR);
+}
+
+static void npcm7xx_cpu_die(unsigned int cpu)
+{
+	u64 *stack = npcm7xx_cpu_die_stack +
+		     ARRAY_SIZE(npcm7xx_cpu_die_stack);
+
+	local_fiq_disable();
+
+	asm volatile("mov\tsp, %0\n\t"
+		     "mov\tfp, #0\n\t"
+		     "bx\t%1"
+		     :
+		     : "r" (stack), "r" (npcm7xx_cpu_reset)
+		     : "memory");
+
+	unreachable();
+}
+
+static int npcm7xx_cpu_kill(unsigned int cpu)
+{
+	u32 val;
+
+	if (!gcr_base)
+		return 0;
+
+	/*
+	 * The boot ROM overwrites the kernel entry point left in SCRPAD once
+	 * the core is parked, so wait for that before declaring it dead.
+	 */
+	return !readl_poll_timeout(gcr_base + NPCM7XX_SCRPAD_REG, val,
+				   val != __pa_symbol(npcm7xx_secondary_startup),
+				   100, 100 * USEC_PER_MSEC);
 }
+#endif
 
 static struct smp_operations npcm7xx_smp_ops __initdata = {
 	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
 	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die = npcm7xx_cpu_die,
+	.cpu_kill = npcm7xx_cpu_kill,
+#endif
 };
 
 CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);

