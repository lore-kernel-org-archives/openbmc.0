Return-Path: <maxims@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpX2m43zDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R+OPDij5"; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id e64so8236846pfd.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WkDFFoF+FpX3Ad7fUH3mlqfzygGNAVFxpBAg5hQySgs=;
 b=R+OPDij5OeUQ+5XxmBvKknp1N6kyB9MmRUhVVTmLuN4LFIfAK4peG4e5v3mIWcqXrI
 c33LXcwq9XvgLesGcfAmWMjJUhQgBKkJmrf1XOx4b24YarnGaPUy37RNayth4SHUq0od
 jb/FKHFzr+eHQjpT+imFO3HtnYUtuZhLCRosCFvb2SFcdLEuahJPdpJHBvZlVtSimzmx
 lu0d7Wp+zoQbFFmjiFuAHy6DtPpOVPoc4QbHS/Sh7ZlHu1L3rgl9AqJ0xixmllEPYKyx
 NR+1fqlAeBTiiNqQeyJoGvuQCvjmuQj3WlwDxTCJE/K7i9agH86tNi9eQQsKBJQ6hRa/
 GUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WkDFFoF+FpX3Ad7fUH3mlqfzygGNAVFxpBAg5hQySgs=;
 b=I2Nsa0wY9+pD1FCOlS4gVdeUEsqSckofjsz+fVv4aLwzFegwekM6nsJjh0pwbUBoJZ
 yk2nhuIKeHA7AN8gFYJoLCikzdSrAd6XzAPImLYMyvlmTTF6w7g1GWD04db7J9P82wT6
 2t1fmaOsGpiLKpMO2A+5nnjrqt0BQ4f1j/q8+cGMpVfTlPRSlYeEhLyReSFzw37t+hUq
 1lUXpBFqtEsBdCPivnykVhjl5tL/QF0JmB8dJXLk0Se8sVPw2nBg012jzHhTcbNVqWqu
 hbqnwSAUU1HJ1fnc/egEEhSm2BTAZ6ZOldyGUhH2ZJjiargh3jPLsvarOosfP63+EWoK
 7KPg==
X-Gm-Message-State: AN3rC/73idFkath51Wn12pPPFycmc2dtaRKwM9tUbBeZJCjz9amoBf29
 4tgOJ8DPdleewb1P
X-Received: by 10.99.121.138 with SMTP id u132mr6004071pgc.200.1494021697593; 
 Fri, 05 May 2017 15:01:37 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:36 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v2 03/15] aspeed: Watchdog Timer Driver
Date: Fri,  5 May 2017 15:01:03 -0700
Message-Id: <20170505220115.143025-4-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:41 -0000

This driver supports ast2500 and ast2400 SoCs.
Only ast2500 supports reset_mask and thus the option of resettting
individual peripherals using WDT.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v2: None
Changes in v1:
- Rename reset to expire_now
- Rename restart to reset


---
 arch/arm/include/asm/arch-aspeed/wdt.h |  53 ++++++++++++--
 arch/arm/mach-aspeed/ast_wdt.c         |  40 ++++++++---
 drivers/watchdog/Kconfig               |  11 +++
 drivers/watchdog/Makefile              |   1 +
 drivers/watchdog/ast_wdt.c             | 125 +++++++++++++++++++++++++++++++++
 5 files changed, 217 insertions(+), 13 deletions(-)
 create mode 100644 drivers/watchdog/ast_wdt.c

diff --git a/arch/arm/include/asm/arch-aspeed/wdt.h b/arch/arm/include/asm/arch-aspeed/wdt.h
index b292a0e67b..981fa05a56 100644
--- a/arch/arm/include/asm/arch-aspeed/wdt.h
+++ b/arch/arm/include/asm/arch-aspeed/wdt.h
@@ -67,15 +67,60 @@ struct ast_wdt {
 	u32 timeout_status;
 	u32 clr_timeout_status;
 	u32 reset_width;
-#ifdef CONFIG_ASPEED_AST2500
+	/* On pre-ast2500 SoCs this register is reserved. */
 	u32 reset_mask;
-#else
-	u32 reserved0;
-#endif
 };
 
+/**
+ * Given flags parameter passed to wdt_reset or wdt_start uclass functions,
+ * gets Reset Mode value from it.
+ *
+ * @flags: flags parameter passed into wdt_reset or wdt_start
+ * @return Reset Mode value
+ */
+u32 ast_reset_mode_from_flags(ulong flags);
+
+/**
+ * Given flags parameter passed to wdt_reset or wdt_start uclass functions,
+ * gets Reset Mask value from it. Reset Mask is only supported on ast2500
+ *
+ * @flags: flags parameter passed into wdt_reset or wdt_start
+ * @return Reset Mask value
+ */
+u32 ast_reset_mask_from_flags(ulong flags);
+
+/**
+ * Given Reset Mask and Reset Mode values, converts them to flags,
+ * suitable for passing into wdt_start or wdt_reset uclass functions.
+ *
+ * On ast2500 Reset Mask is 25 bits wide and Reset Mode is 2 bits wide, so they
+ * can both be packed into single 32 bits wide value.
+ *
+ * @reset_mode: Reset Mode
+ * @reset_mask: Reset Mask
+ */
+ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask);
+
+#ifndef CONFIG_WDT
+/**
+ * Stop WDT
+ *
+ * @wdt: watchdog to stop
+ *
+ * When using driver model this function has different signature
+ */
 void wdt_stop(struct ast_wdt *wdt);
+
+/**
+ * Stop WDT
+ *
+ * @wdt: watchdog to start
+ * @timeout	watchdog timeout in number of clock ticks
+ *
+ * When using driver model this function has different signature
+ */
 void wdt_start(struct ast_wdt *wdt, u32 timeout);
+#endif  /* CONFIG_WDT */
 
 /**
  * Reset peripherals specified by mask
diff --git a/arch/arm/mach-aspeed/ast_wdt.c b/arch/arm/mach-aspeed/ast_wdt.c
index 22481ab7ea..895fba3366 100644
--- a/arch/arm/mach-aspeed/ast_wdt.c
+++ b/arch/arm/mach-aspeed/ast_wdt.c
@@ -9,6 +9,27 @@
 #include <asm/arch/wdt.h>
 #include <linux/err.h>
 
+u32 ast_reset_mode_from_flags(ulong flags)
+{
+	return flags & WDT_CTRL_RESET_MASK;
+}
+
+u32 ast_reset_mask_from_flags(ulong flags)
+{
+	return flags >> 2;
+}
+
+ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask)
+{
+	ulong ret = reset_mode & WDT_CTRL_RESET_MASK;
+
+	if (ret == WDT_CTRL_RESET_SOC)
+		ret |= (reset_mask << 2);
+
+	return ret;
+}
+
+#ifndef CONFIG_WDT
 void wdt_stop(struct ast_wdt *wdt)
 {
 	clrbits_le32(&wdt->ctrl, WDT_CTRL_EN);
@@ -26,15 +47,7 @@ void wdt_start(struct ast_wdt *wdt, u32 timeout)
 	setbits_le32(&wdt->ctrl,
 		     WDT_CTRL_EN | WDT_CTRL_RESET | WDT_CTRL_CLK1MHZ);
 }
-
-struct ast_wdt *ast_get_wdt(u8 wdt_number)
-{
-	if (wdt_number > CONFIG_WDT_NUM - 1)
-		return ERR_PTR(-EINVAL);
-
-	return (struct ast_wdt *)(WDT_BASE +
-				  sizeof(struct ast_wdt) * wdt_number);
-}
+#endif  /* CONFIG_WDT */
 
 int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask)
 {
@@ -57,3 +70,12 @@ int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask)
 	return -EINVAL;
 #endif
 }
+
+struct ast_wdt *ast_get_wdt(u8 wdt_number)
+{
+	if (wdt_number > CONFIG_WDT_NUM - 1)
+		return ERR_PTR(-EINVAL);
+
+	return (struct ast_wdt *)(WDT_BASE +
+				  sizeof(struct ast_wdt) * wdt_number);
+}
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7a725f1e6d..fab8dc9034 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -18,4 +18,15 @@ config WDT_SANDBOX
 		can be probed and supports all of the methods of WDT, but does not
 		really do anything.
 
+config WDT_ASPEED
+	bool "Aspeed ast2400/ast2500 watchdog timer support"
+	depends on WDT
+	default y if ARCH_ASPEED
+	help
+	  Select this to enable watchdog timer for Aspeed ast2500/ast2400 devices.
+	  The watchdog timer is stopped when initialized. It performs reset, either
+	  full SoC reset or CPU or just some peripherals, based on the flags.
+	  It currently does not support Boot Flash Addressing Mode Detection or
+	  Second Boot.
+
 endmenu
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f523d34d57..a30dd661b1 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
 obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
 obj-$(CONFIG_WDT) += wdt-uclass.o
 obj-$(CONFIG_WDT_SANDBOX) += sandbox_wdt.o
+obj-$(CONFIG_WDT_ASPEED) += ast_wdt.o
diff --git a/drivers/watchdog/ast_wdt.c b/drivers/watchdog/ast_wdt.c
new file mode 100644
index 0000000000..b2bd912ad5
--- /dev/null
+++ b/drivers/watchdog/ast_wdt.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <wdt.h>
+#include <asm/io.h>
+#include <asm/arch/wdt.h>
+
+#define WDT_AST2500	2500
+#define WDT_AST2400	2400
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct ast_wdt_priv {
+	struct ast_wdt *regs;
+};
+
+static int ast_wdt_start(struct udevice *dev, u64 timeout, ulong flags)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+	ulong driver_data = dev_get_driver_data(dev);
+	u32 reset_mode = ast_reset_mode_from_flags(flags);
+
+	clrsetbits_le32(&priv->regs->ctrl,
+			WDT_CTRL_RESET_MASK << WDT_CTRL_RESET_MODE_SHIFT,
+			reset_mode << WDT_CTRL_RESET_MODE_SHIFT);
+
+	if (driver_data >= WDT_AST2500 && reset_mode == WDT_CTRL_RESET_SOC)
+		writel(ast_reset_mask_from_flags(flags),
+		       &priv->regs->reset_mask);
+
+	writel((u32) timeout, &priv->regs->counter_reload_val);
+	writel(WDT_COUNTER_RESTART_VAL, &priv->regs->counter_restart);
+	/*
+	 * Setting CLK1MHZ bit is just for compatibility with ast2400 part.
+	 * On ast2500 watchdog timer clock is fixed at 1MHz and the bit is
+	 * read-only
+	 */
+	setbits_le32(&priv->regs->ctrl,
+		     WDT_CTRL_EN | WDT_CTRL_RESET | WDT_CTRL_CLK1MHZ);
+
+	return 0;
+}
+
+static int ast_wdt_stop(struct udevice *dev)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+
+	clrbits_le32(&priv->regs->ctrl, WDT_CTRL_EN);
+
+	return 0;
+}
+
+static int ast_wdt_reset(struct udevice *dev)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+
+	writel(WDT_COUNTER_RESTART_VAL, &priv->regs->counter_restart);
+
+	return 0;
+}
+
+static int ast_wdt_expire_now(struct udevice *dev, ulong flags)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = ast_wdt_start(dev, 1, flags);
+	if (ret)
+		return ret;
+
+	while (readl(&priv->regs->ctrl) & WDT_CTRL_EN)
+		;
+
+	return ast_wdt_stop(dev);
+}
+
+static int ast_wdt_ofdata_to_platdata(struct udevice *dev)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+
+	priv->regs = dev_get_addr_ptr(dev);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	return 0;
+}
+
+static const struct wdt_ops ast_wdt_ops = {
+	.start = ast_wdt_start,
+	.reset = ast_wdt_reset,
+	.stop = ast_wdt_stop,
+	.expire_now = ast_wdt_expire_now,
+};
+
+static const struct udevice_id ast_wdt_ids[] = {
+	{ .compatible = "aspeed,wdt", .data = WDT_AST2500 },
+	{ .compatible = "aspeed,ast2500-wdt", .data = WDT_AST2500 },
+	{ .compatible = "aspeed,ast2400-wdt", .data = WDT_AST2400 },
+	{}
+};
+
+static int ast_wdt_probe(struct udevice *dev)
+{
+	debug("%s() wdt%u\n", __func__, dev->seq);
+	ast_wdt_stop(dev);
+
+	return 0;
+}
+
+U_BOOT_DRIVER(ast_wdt) = {
+	.name = "ast_wdt",
+	.id = UCLASS_WDT,
+	.of_match = ast_wdt_ids,
+	.probe = ast_wdt_probe,
+	.priv_auto_alloc_size = sizeof(struct ast_wdt_priv),
+	.ofdata_to_platdata = ast_wdt_ofdata_to_platdata,
+	.ops = &ast_wdt_ops,
+	.flags = DM_FLAG_PRE_RELOC,
+};
-- 
2.13.0.rc1.294.g07d810a77f-goog
