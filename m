Return-Path: <maxims@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfN2k3fzDqBH
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="C0wDit0m"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id 72so67536626pge.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zn3t2GQPnNkiVVGbugTJjPGs6KU2m0t+cfsoYY/kB2Q=;
 b=C0wDit0mQ8WzWzZQdIGHbpRSoX1aIzNGHUI5QVleuzYdjRL1ma4pGfK+FOdOHPBAoG
 4e/92KuC7H/3es5FJkCpFOfOiP5d68bKQnVxL+X0mDeWrRmL1GLXF2uvPvcH2T2xCx/h
 UC1igRm2l6EYmKFK3F4lEqF7X4aFmfGUvxlLGynZ9V54tJRcQ4znSkMMAHIJWNrg3VEH
 NkquhBrNSSsMP4bOFNVcTfbbe9NkcL9fAtQxBNCTpd6yjToBkxI++53DJtweSy9UPXs+
 sehNrfDKqZ/YjdDqLCLDUsEgu9PyoS+i2uAs4BRYgweOgofd3I2hA5Ny5fse7axHDpur
 NmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zn3t2GQPnNkiVVGbugTJjPGs6KU2m0t+cfsoYY/kB2Q=;
 b=nJPmJz1tIHHyMMZ/DLagv+O3q11tlxxZhIYlQ4iEeg9swWf5LJr/M3BPKhcWnD8f36
 LxKbRZcxahag+3zHTFBPv13kMX9exN5gQn4Ta3hMR7tw6SDaBAlLXyBLA+nM1C0ZVS6N
 t+wcM5vk/vSZm206L78ZpGnmMa7FuEc5wuv/i6d50q8UImO/GcoX7V5e+eNxRcKvQ6/W
 /kueDSsORZseWOP3knlchSUZ3KuPHt2gMCplqeRLbonYtS2cePLnqKzzTkXTDxU0nMWc
 o4YNIFtsfB83LovyZaWe4OXPd92RHvhZEh+k31WStB1EmysawRmxzELO3WSaTCulEVHK
 JJvw==
X-Gm-Message-State: AN3rC/6XEPi8uJcR2vlryZnqsmj8uSVB0Ra6C3wrejVYMwNeFUGSG5bW
 Bti4DyrR8oFAzrkE
X-Received: by 10.99.44.82 with SMTP id s79mr13590267pgs.116.1492455658421;
 Mon, 17 Apr 2017 12:00:58 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.00.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:00:57 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v1 05/15] aspeed: Reset Driver
Date: Mon, 17 Apr 2017 12:00:24 -0700
Message-Id: <20170417190034.71945-6-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:01 -0000

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

Changes in v1:
- Remove unnecessary check for error in dev_get_priv
- Fix comment
- Rename wdt_reset call to wdt_expire_now

---
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  28 +++++++
 drivers/reset/Kconfig                          |  10 +++
 drivers/reset/Makefile                         |   1 +
 drivers/reset/ast2500-reset.c                  | 106 +++++++++++++++++++++++++
 4 files changed, 145 insertions(+)
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
index 0000000000..b2c89e1f1e
--- /dev/null
+++ b/drivers/reset/ast2500-reset.c
@@ -0,0 +1,106 @@
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
+	/*
+	 * To reset SDRAM, a specifal flag in SYSRESET register
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
+		ret = wdt_expire_now(priv->wdt, reset_ctl->id);
+		clrbits_le32(&priv->scu->sysreset_ctrl1,
+			     SCU_SYSRESET_SDRAM_WDT);
+		ast_scu_lock(priv->scu);
+	} else {
+		ret = wdt_expire_now(priv->wdt, reset_ctl->id);
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
2.12.2.762.g0e3151a226-goog
