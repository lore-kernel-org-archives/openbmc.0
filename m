Return-Path: <jaghu@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4k0k0nMYzDvQS
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 10:40:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=kVV7dfaH; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id e6so25772887pfk.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FfdY+Zp4bjPYNi99oypmcRTlJ/6sphtfybSVq4KHETs=;
 b=kVV7dfaHvNyQYAIpqKpEDWkLqAeAkp8hPjCRuIjDihfFpLLXn4jHjOyStToL5bprKk
 iK6v2get3O+8SL6vEHcysodrWRzry3ihChIqUzPWvz+dbl5e/APrTeiCGeauurKRZ25N
 ua53RHDGSIlrMygu2Wy02soH1YN8Y3EGYnmEh/9oeIMvHpRR56qzagDD2BT0UhWfNwYW
 BnWzchS4qFneC2LKgZh3nTHbSBKRSXjf9qVhH35N/9PENkoquyI+lqI0liIy+hOpM/mY
 acZN6mftXGC9QNBvJyggd4fZh7on70lhTcNM9MVwJh464FqMCbvyOwTsXeG1PBfHkwrd
 7lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FfdY+Zp4bjPYNi99oypmcRTlJ/6sphtfybSVq4KHETs=;
 b=epFn/YTzLfcbtYhedzINzE4qdXJ9iGln2Ymh48jNlbkf1Pgqqd19pqkNRnRCLSR+f0
 T4tdf+VIlFlimz/V7CNsp4KABbsGvHnZJDZIejLThwMvaOCMH921pQNuVHAtw27+/owq
 RBrUqaXZZ300XRzCt9I7e2uaWHoOQ+XLvL+IGCeVXOwsdACtov5XAHiynxh1FMep5cZt
 4nDn+XWAQeOw61NkzAdOq8kdxRu3V7Cs6H3FXOjdkpa2vQ33EGm4JSeb4V+ZdI0LYSs7
 8/tdG+rt9rl1AGFBqKZzpKljv2nyXSa2mBH5XYKEVriUMGdraLP+fEtkYxDw27+TtswQ
 59QQ==
X-Gm-Message-State: ABUngvfn3laR6nZ1jPEN0Eg2xtekmwZ9RvlRMcB29ao9kRvDUXAZ4d5tN7WjdqnMYIBC4jsu
X-Received: by 10.99.159.17 with SMTP id g17mr16103335pge.149.1477611650313;
 Thu, 27 Oct 2016 16:40:50 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y189sm14147467pfy.34.2016.10.27.16.40.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Oct 2016 16:40:49 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 2/3] drivers: hwmon: Drive support for ASPEED PWM
 device
Date: Thu, 27 Oct 2016 16:40:21 -0700
Message-Id: <1477611622-28120-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477611622-28120-1-git-send-email-jaghu@google.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 27 Oct 2016 23:40:54 -0000

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../bindings/hwmon/aspeed_pwm_device.txt           |  32 ++
 drivers/hwmon/Kconfig                              |   5 +
 drivers/hwmon/Makefile                             |   2 +-
 drivers/hwmon/aspeed_pwm_dev.c                     | 480 +++++++++++++++++++++
 4 files changed, 518 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_pwm_device.txt
 create mode 100644 drivers/hwmon/aspeed_pwm_dev.c

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_pwm_device.txt b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_device.txt
new file mode 100644
index 0000000..96305d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_device.txt
@@ -0,0 +1,32 @@
+Aspeed PWM device driver
+
+Required properties:
+- reg : address and length of the register set for the device.
+- #address-cells : should be 1.
+- #size-cells : should be 1.
+- compatible : should be "aspeed-pwm-dev".
+- pinctrl-names: A pinctrl state names "default" must be defined.
+- pinctrl-0 : Phandle referencing pin configuration of the aspeed pwm channel.
+- pwm_channel_enable : Indicates the PWM channel to enable. Values 0 through 7
+  indicate PWM channels A through H respectively.
+- pwm_type : Indicates the clock type for the PWM channel. value 0 is type M
+  PWM clock. value 1 is type N PWM clock. value 2 is type O PWM clock. Value
+  0 (type M ) is default. If any other type is preferred, say type N, then
+  typen_pwm_clock array of values have to be specified in pwm-controller node.
+- rising : Indicates the PWM channel rising point bit.
+- falling : Indicates the PWM channel falling point bit.
+
+Examples:
+
+pwm0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x78>;
+		compatible = "aspeed-pwm-dev";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm0_default>;
+		pwm_channel_enable = /bits/ 8 <0x00>;
+		pwm_type = /bits/ 8 <0x00>;
+		rising = /bits/ 8 <0x00>;
+		falling = /bits/ 8 <0x00>;
+};
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 59d6ea4..52bdf40 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1815,6 +1815,11 @@ config SENSORS_ULTRA45
 	  This driver provides support for the Ultra45 workstation environmental
 	  sensors.

+config ASPEED_PWM_DEVICE
+	tristate "Aspeed PWM device"
+	help
+	  This driver provides support for ASPEED PWM device.
+
 if ACPI

 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 83156f8..b28ad1d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -166,6 +166,6 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_ASPEED_PWM_CONTROLLER)	+= aspeed_pwm_controller.o
 obj-$(CONFIG_PMBUS)		+= pmbus/
-
+obj-$(CONFIG_ASPEED_PWM_DEV)		+= aspeed_pwm_dev.o
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG

diff --git a/drivers/hwmon/aspeed_pwm_dev.c b/drivers/hwmon/aspeed_pwm_dev.c
new file mode 100644
index 0000000..476001e
--- /dev/null
+++ b/drivers/hwmon/aspeed_pwm_dev.c
@@ -0,0 +1,480 @@
+/*
+ * Aspeed PWM device driver
+ * * Copyright (c) 2016 Google, Inc
+ *
+ * * This program is free software; you can redistribute it and/or modify
+ * * it under the terms of the GNU General Public License version 2 as
+ * * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/sysfs.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+
+#include "aspeed_pwm.h"
+
+struct ast_pwm_dev_data {
+	void __iomem *base;
+	u8 pwm_channel;
+	u8 pwm_type;
+	u8 pwm_value;
+};
+
+static inline void
+ast_pwm_dev_write(struct ast_pwm_dev_data *priv, u32 val, u32 reg)
+{
+	writel(val, priv->base + reg);
+}
+
+static inline u32
+ast_pwm_dev_read(struct ast_pwm_dev_data *priv, u32 reg)
+{
+	u32 val = readl(priv->base + reg);
+	return val;
+}
+
+static void
+ast_set_pwm_enable(struct ast_pwm_dev_data *priv, u8 pwm_ch, u8 enable)
+{
+	switch (pwm_ch) {
+	case PWMA:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					ast_pwm_dev_read(priv, AST_PTCR_CTRL) |
+					AST_PTCR_CTRL_PWMA_EN, AST_PTCR_CTRL);
+		else
+			ast_pwm_dev_write(priv,
+					ast_pwm_dev_read(priv, AST_PTCR_CTRL) &
+					~AST_PTCR_CTRL_PWMA_EN,
+					AST_PTCR_CTRL);
+		break;
+	case PWMB:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) |
+					 AST_PTCR_CTRL_PWMB_EN),
+					AST_PTCR_CTRL);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) &
+					 ~AST_PTCR_CTRL_PWMB_EN),
+					AST_PTCR_CTRL);
+		break;
+	case PWMC:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) |
+					 AST_PTCR_CTRL_PWMC_EN),
+					AST_PTCR_CTRL);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) &
+					 ~AST_PTCR_CTRL_PWMC_EN),
+					AST_PTCR_CTRL);
+		break;
+	case PWMD:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) |
+					 AST_PTCR_CTRL_PWMD_EN),
+					AST_PTCR_CTRL);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv, AST_PTCR_CTRL) &
+					 ~AST_PTCR_CTRL_PWMD_EN),
+					AST_PTCR_CTRL);
+		break;
+	case PWME:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) |
+					AST_PTCR_CTRL_PWME_EN),
+					AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					  AST_PTCR_CTRL_EXT) &
+					 ~AST_PTCR_CTRL_PWME_EN),
+					AST_PTCR_CTRL_EXT);
+		break;
+	case PWMF:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+							  AST_PTCR_CTRL_EXT) |
+						 AST_PTCR_CTRL_PWMF_EN),
+						AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) &
+					 ~AST_PTCR_CTRL_PWMF_EN),
+					AST_PTCR_CTRL_EXT);
+		break;
+	case PWMG:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) |
+					AST_PTCR_CTRL_PWMG_EN),
+					AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) &
+					 ~AST_PTCR_CTRL_PWMG_EN),
+					AST_PTCR_CTRL_EXT);
+		break;
+	case PWMH:
+		if (enable)
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) |
+					 AST_PTCR_CTRL_PWMH_EN),
+					AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_dev_write(priv,
+					(ast_pwm_dev_read(priv,
+					AST_PTCR_CTRL_EXT) &
+					 ~AST_PTCR_CTRL_PWMH_EN),
+					AST_PTCR_CTRL_EXT);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_type(struct ast_pwm_dev_data *priv, u8 pwm_ch, u8 type)
+{
+	u32 tmp1, tmp2;
+
+	tmp1 = ast_pwm_dev_read(priv, AST_PTCR_CTRL);
+	tmp2 = ast_pwm_dev_read(priv, AST_PTCR_CTRL_EXT);
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMA_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMA_TYPE(type);
+		ast_pwm_dev_write(priv, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWMB:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMB_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMB_TYPE(type);
+		ast_pwm_dev_write(priv, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWMC:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMC_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMC_TYPE(type);
+		ast_pwm_dev_write(priv, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWMD:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMD_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMD_TYPE(type);
+		ast_pwm_dev_write(priv, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWME:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWME_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWME_TYPE(type);
+		ast_pwm_dev_write(priv, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMF:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMF_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMF_TYPE(type);
+		ast_pwm_dev_write(priv, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMG:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMG_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMG_TYPE(type);
+		ast_pwm_dev_write(priv, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMH:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMH_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMH_TYPE(type);
+		ast_pwm_dev_write(priv, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_duty_rising(struct ast_pwm_dev_data *priv, u8 pwm_ch, u8 rising)
+{
+	u32 tmp = 0;
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMB:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMC:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWMD:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWME:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMF:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMG:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	case PWMH:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_duty_falling(struct ast_pwm_dev_data *priv, u8 pwm_ch, u8 falling)
+{
+	u32 tmp = 0;
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMB:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMC:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWMD:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWME:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMF:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMG:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	case PWMH:
+		tmp = ast_pwm_dev_read(priv, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_dev_write(priv, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	}
+}
+
+static u8
+ast_get_pwm_clock_unit(struct ast_pwm_dev_data *priv, u8 pwm_type)
+{
+	u8 tmp = 0;
+
+	switch (pwm_type) {
+	case PWM_TYPE_M:
+		tmp = (ast_pwm_dev_read(priv, AST_PTCR_CLK_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK) >>
+			AST_PTCR_CLK_CTRL_TYPEM_UNIT;
+		break;
+	case PWM_TYPE_N:
+		tmp = (ast_pwm_dev_read(priv, AST_PTCR_CLK_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK) >>
+			 AST_PTCR_CLK_CTRL_TYPEN_UNIT;
+		break;
+	case PWM_TYPE_O:
+		tmp = (ast_pwm_dev_read(priv, AST_PTCR_CLK_EXT_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK) >>
+			AST_PTCR_CLK_CTRL_TYPEO_UNIT;
+		break;
+	}
+	return tmp;
+}
+
+static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct ast_pwm_dev_data *priv = dev_get_drvdata(dev);
+	u8 period;
+	u8 val;
+	u8 duty;
+	int ret;
+
+	period = ast_get_pwm_clock_unit(priv, priv->pwm_type);
+	period += 1;
+	ret = kstrtou8(buf, 10, &val);
+	if (ret)
+		return -EINVAL;
+
+	duty = (val * period) / 100;
+	if (duty == 0) {
+		ast_set_pwm_enable(priv, priv->pwm_channel, 0);
+	} else {
+		if (duty == period) {
+			duty = 0;
+		}
+		priv->pwm_value = val;
+		ast_set_pwm_duty_rising(priv, priv->pwm_channel, 0);
+		ast_set_pwm_duty_falling(priv, priv->pwm_channel, duty);
+		ast_set_pwm_enable(priv, priv->pwm_channel, 1);
+	}
+	return count;
+}
+
+static ssize_t show_pwm(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ast_pwm_dev_data *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", priv->pwm_value);
+}
+
+static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
+
+static struct attribute *pwm_dev_attrs[] = {
+	&sensor_dev_attr_pwm1.dev_attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(pwm_dev);
+
+static int aspeed_pwm_dev_probe(struct platform_device *pdev)
+{
+	struct device *hwmon;
+	struct device_node *np;
+	struct ast_pwm_dev_data *priv;
+	struct resource *res;
+	u8 val;
+	int err = 0;
+
+	np = pdev->dev.of_node;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!priv->base) {
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwm_dev",
+		priv, pwm_dev_groups);
+	if (IS_ERR(hwmon)) {
+		dev_err(&pdev->dev, "Failed to register hwmon device\n");
+		return PTR_ERR(hwmon);
+	}
+
+	err = of_property_read_u8(np, "pwm_channel_enable", &val);
+	if (!err) {
+		priv->pwm_channel = val;
+		ast_set_pwm_enable(priv, priv->pwm_channel, 1);
+	} else {
+		return err;
+	}
+
+	err = of_property_read_u8(np, "pwm_type", &val);
+	if (!err) {
+		priv->pwm_type = val;
+		ast_set_pwm_type(priv, priv->pwm_channel, val);
+	} else {
+		return err;
+	}
+
+	err = of_property_read_u8(np, "rising", &val);
+	if (!err) {
+		ast_set_pwm_duty_rising(priv, priv->pwm_channel, val);
+	} else {
+		return err;
+	}
+
+	err = of_property_read_u8(np, "falling", &val);
+	if (!err) {
+		ast_set_pwm_duty_falling(priv, priv->pwm_channel, val);
+	} else {
+		return err;
+	}
+	return 0;
+
+}
+
+static int aspeed_pwm_dev_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id of_pwm_dev_match_table[] = {
+	{ .compatible = "aspeed-pwm-dev", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_dev_match_table);
+
+static struct platform_driver aspeed_pwm_dev_driver = {
+	.probe		= aspeed_pwm_dev_probe,
+	.remove		= aspeed_pwm_dev_remove,
+	.driver		= {
+		.name	= "aspeed_pwm_dev",
+		.owner	= THIS_MODULE,
+		.of_match_table	= of_pwm_dev_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pwm_dev_driver);
+
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("ASPEED PWM dev driver");
+MODULE_LICENSE("GPL");
--
2.8.0.rc3.226.g39d4020
