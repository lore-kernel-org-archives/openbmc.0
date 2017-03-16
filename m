Return-Path: <maxims@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcn2YhczDqY5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rZ/mrJoa"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id n190so31126997pga.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SHuXvieCzQqH2F4BXhD8gcli8yN/VwJz8RfHK8udV3k=;
 b=rZ/mrJoadiy8Saa99el2XxNj9nzcAutvt/nXopEnrpUlVWsj27BgWBkuZBmDqqvXbV
 slwDw26XvNy6W0KcCWeScYHuUz+8gZNotJVNxVpERo7kEgcJwZ1QDe2LAdCTfOc46jnh
 5loD5KYtkMLi06dVVJmKORAplqIimR6JMbjKQf4wHDqGIKEP7ad7LV0D8iaUnvyddRbz
 +LK9t49f5q2lq9wvcsuyUXbsaRGPYol4TDaWnMkS9Hi7Uq/UfMY35PLfa67d4xFIFhnU
 N95rVSoySRFd+phJYRFe9s7RZ3lr3uZnLqJ/Hf9uh6YJDyS324e8Kgl7hNNsGLDV8Clu
 moag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SHuXvieCzQqH2F4BXhD8gcli8yN/VwJz8RfHK8udV3k=;
 b=cozRmFCix/SvvwiP7yvpFRJV1+5cZFjP7cq+8Pk8ROz9JUNDVZXlcwKsQDCJp1QIce
 mJAnoWaeYgujurXfdRkm28qj2mzlxZbHddzlqoA+6RCLDvq/InWpzvEFJAklUSeiC7DN
 +B92NWfnoM3aDiakbUI6pQkEPVud+yyjWrGIdBgA7dlMkcz1y4uF4JtT5kFAwmf+soTw
 botduEDPlTSJAzgE5Nw4olRmXPzp+Bp5uOMSB9EK4YoAMnDouefojAANalilxvqlg4Bd
 69cc4KSWnMv8A/wqy1kwIzdDhhygFM1Z6mx0CkUn+Iix69hWhI5YqW69vegH1wx6fMle
 693A==
X-Gm-Message-State: AFeK/H3y8Yq8FcaQbYa3o3y5a0Gm+9fW7fqrqIB9hEfxb1vmGSI/mZmdic11wweVZqQ7SGFV
X-Received: by 10.84.216.91 with SMTP id f27mr15311495plj.10.1489700199019;
 Thu, 16 Mar 2017 14:36:39 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:38 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 03/17] aspeed: Watchdog Timer Driver
Date: Thu, 16 Mar 2017 14:36:10 -0700
Message-Id: <20170316213624.140344-4-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:42 -0000

This driver supports ast2500 and ast2400 SoCs.
Only ast2500 supports reset_mask and thus the option of resettting
individual peripherals using WDT.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/include/asm/arch-aspeed/wdt.h |  53 ++++++++++++--
 arch/arm/mach-aspeed/ast_wdt.c         |  40 ++++++++---
 drivers/watchdog/Kconfig               |  13 ++++
 drivers/watchdog/Makefile              |   1 +
 drivers/watchdog/ast_wdt.c             | 125 +++++++++++++++++++++++++++++++++
 5 files changed, 219 insertions(+), 13 deletions(-)
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
index 0d7366f3df..10f34f5efa 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -9,3 +9,16 @@ config WDT
 	  start, restart, stop and reset (expire immediately).
 	  What exactly happens when the timer expires is up to a particular
 	  device/driver.
+
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
+endmenu
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1aabcb97ae..1d779a8446 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
 obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
 obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
 obj-$(CONFIG_WDT) += wdt-uclass.o
+obj-$(CONFIG_WDT_ASPEED) += ast_wdt.o
diff --git a/drivers/watchdog/ast_wdt.c b/drivers/watchdog/ast_wdt.c
new file mode 100644
index 0000000000..d53aada332
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
+static int ast_wdt_restart(struct udevice *dev)
+{
+	struct ast_wdt_priv *priv = dev_get_priv(dev);
+
+	writel(WDT_COUNTER_RESTART_VAL, &priv->regs->counter_restart);
+
+	return 0;
+}
+
+static int ast_wdt_reset(struct udevice *dev, ulong flags)
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
+	.restart = ast_wdt_restart,
+	.stop = ast_wdt_stop,
+	.reset = ast_wdt_reset,
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
2.12.0.367.g23dc2f6d3c-goog
