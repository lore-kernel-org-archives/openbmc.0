Return-Path: <maxims@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcp4ltwzDqY5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sbcFT3N4"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id n190so31127290pga.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Wx670w3sR8CS5CqMb4qTSGCLija2VHL/kKvf5Rn5f4o=;
 b=sbcFT3N4amXbzNbKt3o3gAl6xhTPrdFFLoGJYUnxiYAZu4bjvwlyYnt2HvkXpSg2ZJ
 NxEZ9eyFzgAlDSpSn7vT0fGeNlI8gfWnOy8F9L9LkywwJ60oaPv+gQ/nJUH9yvAG9REs
 dfEtZJqZ00t0Rar0+UbxwiJjbuOWYkYZcDXjD4kDmleJ3zGQWILb5u9GD0WGNUUXmBno
 ifnvvuPGtRMS3SW4Y0c+nc34+h6FjvAnBjOZUM1GnpQ9I4jUDJCjTODFWZ90PwaGpLNm
 5a6AoB0YOfOziemfLH3F+Qb1bVgPrutC5GkpaqFJ1aBWAw5hjq8YOVR8IGRfDrpXTRhi
 roMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Wx670w3sR8CS5CqMb4qTSGCLija2VHL/kKvf5Rn5f4o=;
 b=E9qHhdlFFEDxcHrcw+KnnM5ECIwJZSoNJIP62P/WxSVP6s1vuy7EKwzp+jEcqVsnjD
 99PWqKLohJIpboUEMJWx5RK/yXhVO9V+z9IMlDSsNymeJkkxEMsGoL2TKk/4gZxEpCPz
 ev8cm0Bn/CFY6cHyNNKTwJlcAbhunCRz8mz1b9OnWZOjL61P4s5YOXQRId5IUcaIfS4O
 6wOeUa6crsFFdIrDDVldYZyJyc2h3DvGD1NmV2EUPNeBJu/k+hQ3iRC+v/Uc+6kTc7bx
 SfGGKXBdZ6G02lXrOFX00QeApZA23vZ/hf1oeglF5ZOnN9LFkIU9OY0OqDsjTHZy6DcI
 +qKA==
X-Gm-Message-State: AFeK/H2wsWar7wX65AziA7WSzElsIiG6Du2yQ6PMbGApKTcm8QuwSX8kGn/w9HfrHZf9V9Za
X-Received: by 10.98.11.8 with SMTP id t8mr12754721pfi.195.1489700200818;
 Thu, 16 Mar 2017 14:36:40 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:40 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Stephen Warren <swarren@nvidia.com>
Subject: [PATCH 05/17] aspeed: Reset Driver
Date: Thu, 16 Mar 2017 14:36:12 -0700
Message-Id: <20170316213624.140344-6-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:43 -0000

Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
perform resets and thus depends on it. The actual Watchdog device used
needs to be configured in Device Tree using "aspeed,wdt" property, which
must be WDT phandle, for example:

rst: reset-controller {
    compatible = "aspeed,ast2500-reset";
    aspeed,wdt = <&wdt1>;
}

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  28 +++++++
 drivers/reset/Kconfig                          |  10 +++
 drivers/reset/Makefile                         |   1 +
 drivers/reset/ast2500-reset.c                  | 109 +++++++++++++++++++++++++
 4 files changed, 148 insertions(+)
 create mode 100644 drivers/reset/ast2500-reset.c

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 0fa3ecb9b9..e2556f920d 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -31,6 +31,34 @@
 
 #define SCU_MISC_UARTCLK_DIV13		(1 << 12)
 
+/*
+ * SYSRESET is actually more like a Power register,
+ * except that corresponding bit set to 1 means that
+ * the peripheral is off.
+ */
+#define SCU_SYSRESET_XDMA		(1 << 25)
+#define SCU_SYSRESET_MCTP		(1 << 24)
+#define SCU_SYSRESET_ADC		(1 << 23)
+#define SCU_SYSRESET_JTAG		(1 << 22)
+#define SCU_SYSRESET_MIC		(1 << 18)
+#define SCU_SYSRESET_SDIO		(1 << 16)
+#define SCU_SYSRESET_USB11HOST		(1 << 15)
+#define SCU_SYSRESET_USBHUB		(1 << 14)
+#define SCU_SYSRESET_CRT		(1 << 13)
+#define SCU_SYSRESET_MAC2		(1 << 12)
+#define SCU_SYSRESET_MAC1		(1 << 11)
+#define SCU_SYSRESET_PECI		(1 << 10)
+#define SCU_SYSRESET_PWM		(1 << 9)
+#define SCU_SYSRESET_PCI_VGA		(1 << 8)
+#define SCU_SYSRESET_2D			(1 << 7)
+#define SCU_SYSRESET_VIDEO		(1 << 6)
+#define SCU_SYSRESET_LPC		(1 << 5)
+#define SCU_SYSRESET_HAC		(1 << 4)
+#define SCU_SYSRESET_USBHID		(1 << 3)
+#define SCU_SYSRESET_I2C		(1 << 2)
+#define SCU_SYSRESET_AHB		(1 << 1)
+#define SCU_SYSRESET_SDRAM_WDT		(1 << 0)
+
 #ifndef __ASSEMBLY__
 
 struct ast2500_clk_priv {
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index c42b0bcf0e..eb54189d4b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -43,4 +43,14 @@ config RESET_UNIPHIER
 	  Say Y if you want to control reset signals provided by System Control
 	  block, Media I/O block, Peripheral Block.
 
+config AST2500_RESET
+	bool "Reset controller driver for AST2500 SoCs"
+	depends on DM_RESET && WDT_ASPEED
+	default y if ASPEED_AST2500
+	help
+	  Support for reset controller on AST2500 SoC. This controller uses
+	  watchdog to reset different peripherals and thus only supports
+	  resets that are supported by watchdog. The main limitation though
+	  is that some reset signals, like I2C or MISC reset multiple devices.
+
 endmenu
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 5c4305cc1d..16ad7eed5b 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset-test.o
 obj-$(CONFIG_TEGRA_CAR_RESET) += tegra-car-reset.o
 obj-$(CONFIG_TEGRA186_RESET) += tegra186-reset.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
+obj-$(CONFIG_AST2500_RESET) += ast2500-reset.o
diff --git a/drivers/reset/ast2500-reset.c b/drivers/reset/ast2500-reset.c
new file mode 100644
index 0000000000..0afa4bd01a
--- /dev/null
+++ b/drivers/reset/ast2500-reset.c
@@ -0,0 +1,109 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <misc.h>
+#include <reset.h>
+#include <reset-uclass.h>
+#include <wdt.h>
+#include <asm/io.h>
+#include <asm/arch/scu_ast2500.h>
+#include <asm/arch/wdt.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct ast2500_reset_priv {
+	/* WDT used to perform resets. */
+	struct udevice *wdt;
+	struct ast2500_scu *scu;
+};
+
+static int ast2500_ofdata_to_platdata(struct udevice *dev)
+{
+	struct ast2500_reset_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = uclass_get_device_by_phandle(UCLASS_WDT, dev, "aspeed,wdt",
+					   &priv->wdt);
+	if (ret) {
+		debug("%s: can't find WDT for reset controller", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ast2500_reset_assert(struct reset_ctl *reset_ctl)
+{
+	struct ast2500_reset_priv *priv = dev_get_priv(reset_ctl->dev);
+	u32 reset_mode, reset_mask;
+	bool reset_sdram;
+	int ret;
+
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	/*
+	 * To reset SDRAM, specifal flag in SYSRESET register
+	 * needs to be enabled first
+	 */
+	reset_mode = ast_reset_mode_from_flags(reset_ctl->id);
+	reset_mask = ast_reset_mask_from_flags(reset_ctl->id);
+	reset_sdram = reset_mode == WDT_CTRL_RESET_SOC &&
+		(reset_mask & WDT_RESET_SDRAM);
+
+	if (reset_sdram) {
+		ast_scu_unlock(priv->scu);
+		setbits_le32(&priv->scu->sysreset_ctrl1,
+			     SCU_SYSRESET_SDRAM_WDT);
+		ret = wdt_reset(priv->wdt, reset_ctl->id);
+		clrbits_le32(&priv->scu->sysreset_ctrl1,
+			     SCU_SYSRESET_SDRAM_WDT);
+		ast_scu_lock(priv->scu);
+	} else {
+		ret = wdt_reset(priv->wdt, reset_ctl->id);
+	}
+
+	return ret;
+}
+
+static int ast2500_reset_request(struct reset_ctl *reset_ctl)
+{
+	debug("%s(reset_ctl=%p) (dev=%p, id=%lu)\n", __func__, reset_ctl,
+	      reset_ctl->dev, reset_ctl->id);
+
+	return 0;
+}
+
+static int ast2500_reset_probe(struct udevice *dev)
+{
+	struct ast2500_reset_priv *priv = dev_get_priv(dev);
+
+	priv->scu = ast_get_scu();
+
+	return 0;
+}
+
+static const struct udevice_id ast2500_reset_ids[] = {
+	{ .compatible = "aspeed,ast2500-reset" },
+	{ }
+};
+
+struct reset_ops ast2500_reset_ops = {
+	.rst_assert = ast2500_reset_assert,
+	.request = ast2500_reset_request,
+};
+
+U_BOOT_DRIVER(ast2500_reset) = {
+	.name		= "ast2500_reset",
+	.id		= UCLASS_RESET,
+	.of_match = ast2500_reset_ids,
+	.probe = ast2500_reset_probe,
+	.ops = &ast2500_reset_ops,
+	.ofdata_to_platdata = ast2500_ofdata_to_platdata,
+	.priv_auto_alloc_size = sizeof(struct ast2500_reset_priv),
+};
-- 
2.12.0.367.g23dc2f6d3c-goog
