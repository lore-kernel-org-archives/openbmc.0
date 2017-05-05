Return-Path: <maxims@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpY5n47zDqCf
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U87Hx6W+"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id u187so383503pgb.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tMvqhx7IsVwFH6uFQA10x8+IgV6hcg5YNlzFRg/cS6U=;
 b=U87Hx6W+BZhyvsV12rbl6it72oEOXLBED9OtVLNQONCsfTi44CCwqf2ryYFfpV/z82
 BxYtD4ndmikvu816X59xsnlE8VPwwj9DfkfIl4LCljFJqCvwWGavLFbYLcL27O9Y0RIb
 7bRSewxUjFigUnPAe/ddZS3GRK0cQ4lrScwb2U8vz69hp+vxdlHnXTWKzTlddhRXqstg
 AfwiUBaqLhLvH+kqcEERs7lG3tsNLzlHmnAgnYk2KVJFIWqej+yPx+X8gGf4Ci2r5qWc
 XijhqGITqJRBSuexSm1Mrpjm531sgt9uV4pJgDfjRqZ91yKj8I385VieBNI+r26GmRYe
 E8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tMvqhx7IsVwFH6uFQA10x8+IgV6hcg5YNlzFRg/cS6U=;
 b=e+cq45mZ2cAJpzO/Wp+lcEPsGlFUctt2uMHU+VZkNR01+6asgW4TTDBsh96v1RqykL
 Epf3yiDMoty9+OKKPd6osU3o0yaRpPlgec+E/tUQIf/tfEbRT+4XdILRTNPlAn5zYf8g
 0MjbKXKP+8sJF165hQBddA21Mt1S3DecPzqlv6zUXWdR1VSiYh/D7x6PJZr1hOEkzUaT
 K+tBBEDyoQ8P0mLc/+tDPafIPNFH8aAO6B2ksA+TcPGK2kdlThg2LzKaK/0IzxTGkcjX
 Q+gQCjymOvyi1Y3AVT0ZfuZAvjvRXAfRHdnvPpBE4pe2by4lhT1ngnUjbTeeM4Feeaqo
 VcXQ==
X-Gm-Message-State: AN3rC/7Vx1fVx8wyjwpfeHCvcffGIAYMDxpq0ywD7hVwzbe701uhIzrz
 iHxnT3vgc5RkkuUHhE5TCg==
X-Received: by 10.99.44.140 with SMTP id s134mr5942215pgs.178.1494021699690;
 Fri, 05 May 2017 15:01:39 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:39 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v2 05/15] aspeed: Reset Driver
Date: Fri,  5 May 2017 15:01:05 -0700
Message-Id: <20170505220115.143025-6-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:42 -0000

Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
perform resets and thus depends on it. The actual Watchdog device used
needs to be configured in Device Tree using "aspeed,wdt" property, which
must be WDT phandle, for example:

rst: reset-controller {
    compatible = "aspeed,ast2500-reset";
    aspeed,wdt = <&wdt1>;
}

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v2: None
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
2.13.0.rc1.294.g07d810a77f-goog
