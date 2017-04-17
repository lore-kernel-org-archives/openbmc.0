Return-Path: <maxims@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfS0x3XzDqB9
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q2Gqv0Kh"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id 72so67537325pge.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1JVrfpbur74DdtNJqlD9VqupK6iXiXPlkpgc7W+jO4I=;
 b=Q2Gqv0KhpLyrBcVWr+93DyL/h7NWd0qUdYhe3Kdw0QBtkA2m1U1n4rpHx6p7lK1Nlw
 3e+fAM9uEK0k1IJIuDmOzd+8+xB/L3MFP9UGmlQQx8QPK9rvOV6BCrswwWO60Mid9J7G
 3QWkxT7rlKpWOuw1xdxj6lsmViwi58JeDpiFdR+bZcrProdXYMDp0iD1TOz8MnujCjfh
 U5GBFpmijC46WPyCDRheSIIzNfFHA+v5D3F09QKKq7IZdwRdJo7fO2f3U+jV9YKHGK2A
 JponvSsO//5TKq41zQDl+L3OPx7SdnJW0BdIH0EatTPkuT2Q661YdX5tq/mT2yzQDn39
 jBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1JVrfpbur74DdtNJqlD9VqupK6iXiXPlkpgc7W+jO4I=;
 b=V3LJjcZjqiRspu6LE2Wx39X12s4wQN83laWOcxTACuMeK7oqZH30kkiZbCFG72agqm
 GzJcyQpyezeLGiEvuzCermXUTY8qRse9NaDevMwVumv+jG+vmI3BVIZx1UCDQEniL4wd
 R88u1o3PV2fxRhsYoAHp9QIyUQn5ozM5gw5h/nmvd4rIBqhioIt1sl3hm0VYm8K/MApt
 bgvT7yTTHLN3Y62j4YQ2N67eMREgVy75MR3FEBSzXbKch844AuRNPthVIJMjuU4ah6ND
 aVtdBl61nDnFgW880aJlkiCKYtz1PK4CXvqKQ2vf9YPwgxHdJ9OgCpCbUIwkudBTF9CF
 0s5Q==
X-Gm-Message-State: AN3rC/5GbTYF36h3kQqyimDPrALl5nXAfpVfjzjvHXyQaYa6ZPc+Pj+5
 DXBgDF49MBx0JcXy
X-Received: by 10.98.150.65 with SMTP id c62mr13196908pfe.96.1492455661375;
 Mon, 17 Apr 2017 12:01:01 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:00 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Konstantin Porotchkin <kostap@marvell.com>,
 Thomas Abraham <thomas.ab@samsung.com>, Wills Wang <wills.wang@live.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Minkyu Kang <mk7.kang@samsung.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v1 08/15] aspeed: AST2500 Pinctrl Driver
Date: Mon, 17 Apr 2017 12:00:27 -0700
Message-Id: <20170417190034.71945-9-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:04 -0000

This driver uses Generic Pinctrl framework and is compatible with
the Linux driver for ast2500: it uses the same device tree
configuration.

Not all pins are supported by the driver at the moment, so it actually
compatible with ast2400. In general, however, there are differences that
in the future would be easier to maintain separately.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1: None

 arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++++++++++
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  19 ++++
 drivers/pinctrl/Kconfig                        |   9 ++
 drivers/pinctrl/Makefile                       |   1 +
 drivers/pinctrl/aspeed/Makefile                |   1 +
 drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 +++++++++++++++++++++++++
 6 files changed, 209 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c

diff --git a/arch/arm/include/asm/arch-aspeed/pinctrl.h b/arch/arm/include/asm/arch-aspeed/pinctrl.h
new file mode 100644
index 0000000000..365dc21dbc
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/pinctrl.h
@@ -0,0 +1,52 @@
+/*
+ * Copyright (c) 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+#ifndef _ASM_ARCH_PERIPH_H
+#define _ASM_ARCH_PERIPH_H
+
+/*
+ * Peripherals supported by the hardware.
+ * These are used to specify pinctrl settings.
+ */
+
+enum periph_id {
+	PERIPH_ID_UART1,
+	PERIPH_ID_UART2,
+	PERIPH_ID_UART3,
+	PERIPH_ID_UART4,
+	PERIPH_ID_LPC,
+	PERIPH_ID_PWM0,
+	PERIPH_ID_PWM1,
+	PERIPH_ID_PWM2,
+	PERIPH_ID_PWM3,
+	PERIPH_ID_PWM4,
+	PERIPH_ID_PWM5,
+	PERIPH_ID_PWM6,
+	PERIPH_ID_PWM7,
+	PERIPH_ID_PWM8,
+	PERIPH_ID_MAC1,
+	PERIPH_ID_MAC2,
+	PERIPH_ID_VIDEO,
+	PERIPH_ID_SPI1,
+	PERIPH_ID_SPI2,
+	PERIPH_ID_I2C1,
+	PERIPH_ID_I2C2,
+	PERIPH_ID_I2C3,
+	PERIPH_ID_I2C4,
+	PERIPH_ID_I2C5,
+	PERIPH_ID_I2C6,
+	PERIPH_ID_I2C7,
+	PERIPH_ID_I2C8,
+	PERIPH_ID_I2C9,
+	PERIPH_ID_I2C10,
+	PERIPH_ID_I2C11,
+	PERIPH_ID_I2C12,
+	PERIPH_ID_I2C13,
+	PERIPH_ID_I2C14,
+	PERIPH_ID_SD1,
+	PERIPH_ID_SD2,
+};
+
+#endif  /* _ASM_ARCH_SCU_AST2500_H */
diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index e2556f920d..1cdd3b9198 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -10,6 +10,8 @@
 
 #define SCU_HWSTRAP_VGAMEM_MASK		3
 #define SCU_HWSTRAP_VGAMEM_SHIFT	2
+#define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
+#define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
 #define SCU_HWSTRAP_DDR4		(1 << 24)
 #define SCU_HWSTRAP_CLKIN_25MHZ		(1 << 23)
 
@@ -59,6 +61,23 @@
 #define SCU_SYSRESET_AHB		(1 << 1)
 #define SCU_SYSRESET_SDRAM_WDT		(1 << 0)
 
+/* Bits 16-27 in the register control pin functions for I2C devices 3-14 */
+#define SCU_PINMUX_CTRL5_I2C		(1 << 16)
+
+/*
+ * The values are grouped by function, not by register.
+ * They are actually scattered across multiple loosely related registers.
+ */
+#define SCU_PIN_FUN_MAC1_MDC		(1 << 30)
+#define SCU_PIN_FUN_MAC1_MDIO		(1 << 31)
+#define SCU_PIN_FUN_MAC1_PHY_LINK		(1 << 0)
+#define SCU_PIN_FUN_MAC2_MDIO		(1 << 2)
+#define SCU_PIN_FUN_MAC2_PHY_LINK		(1 << 1)
+#define SCU_PIN_FUN_SCL1		(1 << 12)
+#define SCU_PIN_FUN_SCL2		(1 << 14)
+#define SCU_PIN_FUN_SDA1		(1 << 13)
+#define SCU_PIN_FUN_SDA2		(1 << 15)
+
 #ifndef __ASSEMBLY__
 
 struct ast2500_clk_priv {
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index efcb4c0003..3b7dd5f0c5 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -175,6 +175,15 @@ config PIC32_PINCTRL
 	  by a device tree node which contains both GPIO defintion and pin control
 	  functions.
 
+config ASPEED_AST2500_PINCTRL
+  bool "Aspeed AST2500 pin control driver"
+  depends on DM && PINCTRL_GENERIC && ASPEED_AST2500
+  default y
+  help
+    Support pin multiplexing control on Aspeed ast2500 SoC. The driver uses
+	Generic Pinctrl framework and is compatible with the Linux driver,
+	i.e. it uses the same device tree configuration.
+
 endif
 
 source "drivers/pinctrl/meson/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 512112af64..5392c3ed45 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_PIC32_PINCTRL)	+= pinctrl_pic32.o
 obj-$(CONFIG_PINCTRL_EXYNOS)	+= exynos/
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-$(CONFIG_PINCTRL_MVEBU)	+= mvebu/
+obj-$(CONFIG_ARCH_ASPEED) += aspeed/
diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
new file mode 100644
index 0000000000..2e6ed604c8
--- /dev/null
+++ b/drivers/pinctrl/aspeed/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ASPEED_AST2500_PINCTRL) += pinctrl_ast2500.o
diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2500.c b/drivers/pinctrl/aspeed/pinctrl_ast2500.c
new file mode 100644
index 0000000000..01f97c1b48
--- /dev/null
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2500.c
@@ -0,0 +1,127 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <asm/io.h>
+#include <asm/arch/pinctrl.h>
+#include <asm/arch/scu_ast2500.h>
+#include <dm/pinctrl.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+/*
+ * This driver works with very simple configuration that has the same name
+ * for group and function. This way it is compatible with the Linux Kernel
+ * driver.
+ */
+
+struct ast2500_pinctrl_priv {
+	struct ast2500_scu *scu;
+};
+
+static int ast2500_pinctrl_probe(struct udevice *dev)
+{
+	struct ast2500_pinctrl_priv *priv = dev_get_priv(dev);
+
+	priv->scu = ast_get_scu();
+
+	return 0;
+}
+
+struct ast2500_group_config {
+	char *group_name;
+	/* Control register number (1-10) */
+	unsigned reg_num;
+	/* The mask of control bits in the register */
+	u32 ctrl_bit_mask;
+};
+
+static const struct ast2500_group_config ast2500_groups[] = {
+	{ "I2C1", 8, (1 << 13) | (1 << 12) },
+	{ "I2C2", 8, (1 << 15) | (1 << 14) },
+	{ "I2C3", 8, (1 << 16) },
+	{ "I2C4", 5, (1 << 17) },
+	{ "I2C4", 5, (1 << 17) },
+	{ "I2C5", 5, (1 << 18) },
+	{ "I2C6", 5, (1 << 19) },
+	{ "I2C7", 5, (1 << 20) },
+	{ "I2C8", 5, (1 << 21) },
+	{ "I2C9", 5, (1 << 22) },
+	{ "I2C10", 5, (1 << 23) },
+	{ "I2C11", 5, (1 << 24) },
+	{ "I2C12", 5, (1 << 25) },
+	{ "I2C13", 5, (1 << 26) },
+	{ "I2C14", 5, (1 << 27) },
+	{ "MAC1LINK", 1, (1 << 0) },
+	{ "MDIO1", 3, (1 << 31) | (1 << 30) },
+	{ "MAC2LINK", 1, (1 << 1) },
+	{ "MDIO2", 5, (1 << 2) },
+};
+
+static int ast2500_pinctrl_get_groups_count(struct udevice *dev)
+{
+	debug("PINCTRL: get_(functions/groups)_count\n");
+
+	return ARRAY_SIZE(ast2500_groups);
+}
+
+static const char *ast2500_pinctrl_get_group_name(struct udevice *dev,
+						  unsigned selector)
+{
+	debug("PINCTRL: get_(function/group)_name %u\n", selector);
+
+	return ast2500_groups[selector].group_name;
+}
+
+static int ast2500_pinctrl_group_set(struct udevice *dev, unsigned selector,
+				     unsigned func_selector)
+{
+	struct ast2500_pinctrl_priv *priv = dev_get_priv(dev);
+	const struct ast2500_group_config *config;
+	u32 *ctrl_reg;
+
+	debug("PINCTRL: group_set <%u, %u>\n", selector, func_selector);
+	if (selector >= ARRAY_SIZE(ast2500_groups))
+		return -EINVAL;
+
+	config = &ast2500_groups[selector];
+	if (config->reg_num > 6)
+		ctrl_reg = &priv->scu->pinmux_ctrl1[config->reg_num - 7];
+	else
+		ctrl_reg = &priv->scu->pinmux_ctrl[config->reg_num - 1];
+
+	ast_scu_unlock(priv->scu);
+	setbits_le32(ctrl_reg, config->ctrl_bit_mask);
+	ast_scu_lock(priv->scu);
+
+	return 0;
+}
+
+static struct pinctrl_ops ast2500_pinctrl_ops = {
+	.set_state = pinctrl_generic_set_state,
+	.get_groups_count = ast2500_pinctrl_get_groups_count,
+	.get_group_name = ast2500_pinctrl_get_group_name,
+	.get_functions_count = ast2500_pinctrl_get_groups_count,
+	.get_function_name = ast2500_pinctrl_get_group_name,
+	.pinmux_group_set = ast2500_pinctrl_group_set,
+};
+
+static const struct udevice_id ast2500_pinctrl_ids[] = {
+	{ .compatible = "aspeed,ast2500-pinctrl" },
+	{ .compatible = "aspeed,g5-pinctrl" },
+	{ }
+};
+
+U_BOOT_DRIVER(pinctrl_ast2500) = {
+	.name = "aspeed_ast2500_pinctrl",
+	.id = UCLASS_PINCTRL,
+	.of_match = ast2500_pinctrl_ids,
+	.priv_auto_alloc_size = sizeof(struct ast2500_pinctrl_priv),
+	.ops = &ast2500_pinctrl_ops,
+	.probe = ast2500_pinctrl_probe,
+};
-- 
2.12.2.762.g0e3151a226-goog
