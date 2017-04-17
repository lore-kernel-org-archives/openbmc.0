Return-Path: <maxims@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfQ4Vz0zDq9H
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LyrPwlkX"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id g2so75757466pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bbCBYUTwaAOWQ+x4pvduqarLegDB1l9uVAAANmzNgK8=;
 b=LyrPwlkX/qstVtocSjugY6UCC4N+CIPepklrYKdYCWd2y5iAxV2xSAeTJMB0ptad/U
 u1XMKmQ8OxkaLYBo+liBbKil1TleXlktNZr4V+ATkc4Vqcf9t/kNgJVDzccHOvlPUUps
 RjkPZocisNX6/ShTsVaLvFCEI5O82Hi3hCsNOOfRP8HzbVMwsuN1Rah1GT9j4X4DNorQ
 AOq15c4BUQQ1pO8sBadnQuqxHrRCouGUyWYQKO3SY+vWsmyIAL4XuL2mwMlwfRBCzUTF
 JvfhOwWsOQz9rbtx+Rux0C3Hd/m2ad2l9Wau2xC3A6zj9i+jORweqKB9rflA2feB0d3g
 RH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bbCBYUTwaAOWQ+x4pvduqarLegDB1l9uVAAANmzNgK8=;
 b=mzOaJAWdKQrM3QLxwtFcpes+M2Xz2fdvRNgI82G8tsN3Sz59qIh0dkpCoJDtQCArGV
 eNEkvlJMw5m0VIU/sN+YqEQLt3nE8V/2x9tSy4ZQCWzwgCLErlb2RKi0wF37WjKxKvIF
 eGHLylksBhSIcesj7nUJmvPB/YDiDrTrd96cttTqQ33WfnO9LUu3/MZOtGIs/agL/gL8
 26Qpi4oUJao54gPhp3G52+DZWwXBsmZgvkTcto0IBpTCa59uS095f9z9XSeT658gfiMs
 D+0sZf3ZX8hwRbbu+g4Gfj0r0nPv9rBqGgOnF9+rH9loTmgNZE9x+Ko5QncDBC1bad1W
 rFTw==
X-Gm-Message-State: AN3rC/7U44MVRQ+5PUCuGmrStvdTcwoh5UjHzlsKjuEH2KL3yTj7qtn8
 Tv37/YxV7cRUu+vU
X-Received: by 10.98.156.23 with SMTP id f23mr13347025pfe.3.1492455660297;
 Mon, 17 Apr 2017 12:01:00 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.00.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:00:59 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 07/15] aspeed: Refactor AST2500 RAM Driver and Sysreset
 Driver
Date: Mon, 17 Apr 2017 12:00:26 -0700
Message-Id: <20170417190034.71945-8-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:03 -0000

This change switches all existing users of ast2500 Watchdog to Driver
Model based Watchdog driver.

To perform system reset Sysreset Driver uses first Watchdog device found
via uclass_first_device call. Since the system is going to be reset
anyway it does not make much difference which watchdog is used.

Instead of using Watchdog to reset itself, SDRAM driver now uses Reset
driver to do that.

These were the only users of the old Watchdog API, so that API is
removed.

This all is done in one change to avoid having to maintain dual API for
watchdog in between.

Signed-off-by: Maxim Sloyko <maxims@google.com>

---

Changes in v1:
- Rename wdt_reset call to wdt_expire_now

---
 arch/arm/include/asm/arch-aspeed/wdt.h       | 39 ---------------------
 arch/arm/mach-aspeed/Kconfig                 |  8 +----
 arch/arm/mach-aspeed/ast2500/sdram_ast2500.c | 12 +++++--
 arch/arm/mach-aspeed/ast_wdt.c               | 51 ----------------------------
 configs/evb-ast2500_defconfig                |  2 ++
 drivers/sysreset/sysreset_ast.c              | 24 ++++++-------
 6 files changed, 24 insertions(+), 112 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/wdt.h b/arch/arm/include/asm/arch-aspeed/wdt.h
index 981fa05a56..db8ecbcbe4 100644
--- a/arch/arm/include/asm/arch-aspeed/wdt.h
+++ b/arch/arm/include/asm/arch-aspeed/wdt.h
@@ -100,45 +100,6 @@ u32 ast_reset_mask_from_flags(ulong flags);
  * @reset_mask: Reset Mask
  */
 ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask);
-
-#ifndef CONFIG_WDT
-/**
- * Stop WDT
- *
- * @wdt: watchdog to stop
- *
- * When using driver model this function has different signature
- */
-void wdt_stop(struct ast_wdt *wdt);
-
-/**
- * Stop WDT
- *
- * @wdt: watchdog to start
- * @timeout	watchdog timeout in number of clock ticks
- *
- * When using driver model this function has different signature
- */
-void wdt_start(struct ast_wdt *wdt, u32 timeout);
-#endif  /* CONFIG_WDT */
-
-/**
- * Reset peripherals specified by mask
- *
- * Note, that this is only supported by ast2500 SoC
- *
- * @wdt: watchdog to use for this reset
- * @mask: reset mask.
- */
-int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask);
-
-/**
- * ast_get_wdt() - get a pointer to watchdog registers
- *
- * @wdt_number: 0-based WDT peripheral number
- * @return pointer to registers or -ve error on error
- */
-struct ast_wdt *ast_get_wdt(u8 wdt_number);
 #endif  /* __ASSEMBLY__ */
 
 #endif /* _ASM_ARCH_WDT_H */
diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index c5b90bd96a..4f021baa06 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -11,19 +11,13 @@ config SYS_TEXT_BASE
 
 config ASPEED_AST2500
 	bool "Support Aspeed AST2500 SoC"
+	depends on DM_RESET
 	select CPU_ARM1176
 	help
 	  The Aspeed AST2500 is a ARM-based SoC with arm1176 CPU.
 	  It is used as Board Management Controller on many server boards,
 	  which is enabled by support of LPC and eSPI peripherals.
 
-config WDT_NUM
-	int "Number of Watchdog Timers"
-	default 3 if ASPEED_AST2500
-	help
-	  The number of Watchdot Timers on a SoC.
-	  AST2500 has three WDTsk earlier versions have two or fewer.
-
 source "arch/arm/mach-aspeed/ast2500/Kconfig"
 
 endif
diff --git a/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c b/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
index cb6e03fa34..efcf452b17 100644
--- a/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
+++ b/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
@@ -12,6 +12,7 @@
 #include <errno.h>
 #include <ram.h>
 #include <regmap.h>
+#include <reset.h>
 #include <asm/io.h>
 #include <asm/arch/scu_ast2500.h>
 #include <asm/arch/sdram_ast2500.h>
@@ -328,6 +329,7 @@ static void ast2500_sdrammc_lock(struct dram_info *info)
 
 static int ast2500_sdrammc_probe(struct udevice *dev)
 {
+	struct reset_ctl reset_ctl;
 	struct dram_info *priv = (struct dram_info *)dev_get_priv(dev);
 	struct ast2500_sdrammc_regs *regs = priv->regs;
 	int i;
@@ -345,9 +347,15 @@ static int ast2500_sdrammc_probe(struct udevice *dev)
 	}
 
 	clk_set_rate(&priv->ddr_clk, priv->clock_rate);
-	ret = ast_wdt_reset_masked(ast_get_wdt(0), WDT_RESET_SDRAM);
+	ret = reset_get_by_index(dev, 0, &reset_ctl);
 	if (ret) {
-		debug("%s(): SDRAM reset failed\n", __func__);
+		debug("%s(): Failed to get reset signal\n", __func__);
+		return ret;
+	}
+
+	ret = reset_assert(&reset_ctl);
+	if (ret) {
+		debug("%s(): SDRAM reset failed: %u\n", __func__, ret);
 		return ret;
 	}
 
diff --git a/arch/arm/mach-aspeed/ast_wdt.c b/arch/arm/mach-aspeed/ast_wdt.c
index 895fba3366..1a858b1020 100644
--- a/arch/arm/mach-aspeed/ast_wdt.c
+++ b/arch/arm/mach-aspeed/ast_wdt.c
@@ -28,54 +28,3 @@ ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask)
 
 	return ret;
 }
-
-#ifndef CONFIG_WDT
-void wdt_stop(struct ast_wdt *wdt)
-{
-	clrbits_le32(&wdt->ctrl, WDT_CTRL_EN);
-}
-
-void wdt_start(struct ast_wdt *wdt, u32 timeout)
-{
-	writel(timeout, &wdt->counter_reload_val);
-	writel(WDT_COUNTER_RESTART_VAL, &wdt->counter_restart);
-	/*
-	 * Setting CLK1MHZ bit is just for compatibility with ast2400 part.
-	 * On ast2500 watchdog timer clock is fixed at 1MHz and the bit is
-	 * read-only
-	 */
-	setbits_le32(&wdt->ctrl,
-		     WDT_CTRL_EN | WDT_CTRL_RESET | WDT_CTRL_CLK1MHZ);
-}
-#endif  /* CONFIG_WDT */
-
-int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask)
-{
-#ifdef CONFIG_ASPEED_AST2500
-	if (!mask)
-		return -EINVAL;
-
-	writel(mask, &wdt->reset_mask);
-	clrbits_le32(&wdt->ctrl,
-		     WDT_CTRL_RESET_MASK << WDT_CTRL_RESET_MODE_SHIFT);
-	wdt_start(wdt, 1);
-
-	/* Wait for WDT to reset */
-	while (readl(&wdt->ctrl) & WDT_CTRL_EN)
-		;
-	wdt_stop(wdt);
-
-	return 0;
-#else
-	return -EINVAL;
-#endif
-}
-
-struct ast_wdt *ast_get_wdt(u8 wdt_number)
-{
-	if (wdt_number > CONFIG_WDT_NUM - 1)
-		return ERR_PTR(-EINVAL);
-
-	return (struct ast_wdt *)(WDT_BASE +
-				  sizeof(struct ast_wdt) * wdt_number);
-}
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index cc5fea9a81..74808a71ee 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -15,3 +15,5 @@ CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SYSRESET=y
 CONFIG_TIMER=y
+CONFIG_WDT=y
+CONFIG_DM_RESET=y
diff --git a/drivers/sysreset/sysreset_ast.c b/drivers/sysreset/sysreset_ast.c
index a0ab12851d..3c3f552df8 100644
--- a/drivers/sysreset/sysreset_ast.c
+++ b/drivers/sysreset/sysreset_ast.c
@@ -8,21 +8,19 @@
 #include <dm.h>
 #include <errno.h>
 #include <sysreset.h>
+#include <wdt.h>
 #include <asm/io.h>
 #include <asm/arch/wdt.h>
 #include <linux/err.h>
 
-/* Number of Watchdog Timer ticks before reset */
-#define AST_WDT_RESET_TIMEOUT	10
-#define AST_WDT_FOR_RESET	0
-
 static int ast_sysreset_request(struct udevice *dev, enum sysreset_t type)
 {
-	struct ast_wdt *wdt = ast_get_wdt(AST_WDT_FOR_RESET);
-	u32 reset_mode = 0;
+	struct udevice *wdt;
+	u32 reset_mode;
+	int ret = uclass_first_device(UCLASS_WDT, &wdt);
 
-	if (IS_ERR(wdt))
-		return PTR_ERR(wdt);
+	if (ret)
+		return ret;
 
 	switch (type) {
 	case SYSRESET_WARM:
@@ -35,11 +33,11 @@ static int ast_sysreset_request(struct udevice *dev, enum sysreset_t type)
 		return -EPROTONOSUPPORT;
 	}
 
-	/* Clear reset mode bits */
-	clrsetbits_le32(&wdt->ctrl,
-			(WDT_CTRL_RESET_MODE_MASK << WDT_CTRL_RESET_MODE_SHIFT),
-			(reset_mode << WDT_CTRL_RESET_MODE_SHIFT));
-	wdt_start(wdt, AST_WDT_RESET_TIMEOUT);
+	ret = wdt_expire_now(wdt, reset_mode);
+	if (ret) {
+		debug("Sysreset failed: %d", ret);
+		return ret;
+	}
 
 	return -EINPROGRESS;
 }
-- 
2.12.2.762.g0e3151a226-goog
