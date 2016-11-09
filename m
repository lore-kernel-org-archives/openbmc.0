Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD8nb3XXKzDvbd
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 13:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ObRF4Fo4"; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id d2so117847164pfd.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 18:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9pk9DSBoBi8zW4qN4UtWRNl1iC2VwGrDe++jXRNhdy8=;
 b=ObRF4Fo4atTEGSDSQcdWdF77AK0Cu5IgFePR6i3rbVCFxNXhRFx+giXUb1/86xXD3n
 wrtURbw7qUh7ImjGndm+9zMcf9EkqwbWva+ct1OjT7U+e4Y1ay+VdZMmMjRba0g/+rcT
 C/VV4s041AQFwE7CEBnKNSPv5AWCi2QJHDHKXX0iyQHpTogb5jOdk9l9eZeiz/0zo+4b
 YBfdcO+3zcWu3IwQ6+bvUf+uqL2pEb+6YuxXb9anGPRT4aUDIuYicXFzDl977XagWpAv
 BrSWuMdIfYW+I0Fk7+hEbaTl0w7cEZf4qnniH6z2qJBE1kno2PkFdvszj8rDr9HvkIrZ
 ns3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9pk9DSBoBi8zW4qN4UtWRNl1iC2VwGrDe++jXRNhdy8=;
 b=mSRoyg4AMI4po1HdL03CqA+Hsp8PJ+LAHdcLxxz4QChKB/gDwi28ghqHeLZu8aMgPm
 mwYh7d2ZdBHIVvx6RZ6lURQfT07IGj/YH+1xIeRInAgnnr1r4N4DDnBaCuzsiRzaS6+h
 j0uRspFVrONTc7XNOXFMnHsvmQenHbtecaJ3BUoDRUUnm20rk3PUTUueR1ZF+JFmLHbF
 yGRWAR/ecobFGeLAKgXod60Fxl1+iAr8dLoDl7Gr80p+N+DXwbVSe8ftB5S+TawKbPQG
 64cWxZ+sGOHKoj/U9SbAicXVYGbgkwe+SCvw10uxmooS83yOzkKd7MewK5RXQOaF8NCu
 pbLg==
X-Gm-Message-State: ABUngveyeAi+FIZHUQDEarGC0GPsunmMLr+Heq9KncZb1uH1wjHoL6HtPLoj41/Gerby0x0m
X-Received: by 10.98.211.135 with SMTP id z7mr28953438pfk.109.1478657520694;
 Tue, 08 Nov 2016 18:12:00 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id sh9sm51056998pac.41.2016.11.08.18.11.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Nov 2016 18:11:59 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 2/3] drivers: hwmon: ASPEED AST2500 PWM driver
Date: Tue,  8 Nov 2016 18:11:44 -0800
Message-Id: <1478657505-23109-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478657505-23109-1-git-send-email-jaghu@google.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 02:12:04 -0000

The ASPEED AST2500 PWM controller can support upto 8 PWM output ports.
There are three different PWM sources(types M, N and O)
and each PWM output port can be assigned a particular PWM source.
There is a sysfs file through which the user can control
the duty cycle of a particular PWM port. The duty cycle can range from 0 to
100 percent.

v2:
- Merged the drivers for PWM controller and PWM device as one PWM driver.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/hwmon/Kconfig              |   5 +
 drivers/hwmon/Makefile             |   2 +-
 drivers/hwmon/aspeed_ast2500_pwm.c | 662 +++++++++++++++++++++++++++++++++++++
 drivers/hwmon/aspeed_ast2500_pwm.h | 128 +++++++
 4 files changed, 796 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.c
 create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3b34ba9..7edd94e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1800,6 +1800,11 @@ config SENSORS_ULTRA45
 	  This driver provides support for the Ultra45 workstation environmental
 	  sensors.

+config ASPEED_AST2500_PWM
+	tristate "ASPEED AST2500 PWM driver"
+	help
+	  This driver provides support for ASPEED AST2500 PWM output ports.
+
 if ACPI

 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index c0f3201..23529c2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -163,7 +163,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
 obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
-
+obj-$(CONFIG_ASPEED_AST2500_PWM)	+= aspeed_ast2500_pwm.o
 obj-$(CONFIG_PMBUS)		+= pmbus/

 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
diff --git a/drivers/hwmon/aspeed_ast2500_pwm.c b/drivers/hwmon/aspeed_ast2500_pwm.c
new file mode 100644
index 0000000..fda49d7
--- /dev/null
+++ b/drivers/hwmon/aspeed_ast2500_pwm.c
@@ -0,0 +1,662 @@
+/*
+ * Aspeed AST2500 PWM device driver
+ * * Copyright (c) 2016 Google, Inc
+ *
+ * * This program is free software; you can redistribute it and/or modify
+ * * it under the terms of the GNU General Public License version 2 as
+ * * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/io.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/sysfs.h>
+
+#include "aspeed_pwm.h"
+
+struct ast_pwm_port_data {
+	u8 pwm_port;
+	u8 pwm_enable;
+	u8 pwm_type;
+	u8 pwm_duty_cycle;
+	void __iomem *base;
+};
+
+struct ast_pwm_controller_data {
+	void __iomem *base;
+};
+
+static inline void
+ast_pwm_write(void __iomem *base, u32 val, u32 reg)
+{
+	writel(val, base + reg);
+}
+
+static inline u32
+ast_pwm_read(void __iomem *base, u32 reg)
+{
+	u32 val = readl(base + reg);
+	return val;
+}
+
+static void
+ast_set_pwm_clock_enable(struct ast_pwm_controller_data *priv, u8 val)
+{
+	if (val) {
+		ast_pwm_write(priv->base,
+			ast_pwm_read(priv->base, AST_PTCR_CTRL) |
+			AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
+	} else {
+		ast_pwm_write(priv->base,
+			ast_pwm_read(priv->base, AST_PTCR_CTRL) &
+			~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
+	}
+}
+
+static void
+ast_set_pwm_clock_source(struct ast_pwm_controller_data *priv, u8 val)
+{
+	if (val) {
+		ast_pwm_write(priv->base,
+			ast_pwm_read(priv->base, AST_PTCR_CTRL) |
+			AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);
+	} else {
+		ast_pwm_write(priv->base,
+			ast_pwm_read(priv->base, AST_PTCR_CTRL) &
+			~AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);
+	}
+}
+
+static void
+ast_set_pwm_clock_division_h(struct ast_pwm_controller_data *priv,
+		u8 pwm_type, u8 div_high)
+{
+	switch (pwm_type) {
+	case PWM_TYPE_M:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEM_H_MASK) |
+			(div_high << AST_PTCR_CLK_CTRL_TYPEM_H),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEN_H_MASK) |
+			(div_high << AST_PTCR_CLK_CTRL_TYPEN_H),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_EXT_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEO_H_MASK) |
+			(div_high << AST_PTCR_CLK_CTRL_TYPEO_H),
+			AST_PTCR_CLK_EXT_CTRL);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_clock_division_l(struct ast_pwm_controller_data *priv,
+		u8 pwm_type, u8 div_low)
+{
+	switch (pwm_type) {
+	case PWM_TYPE_M:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEM_L_MASK) |
+			(div_low << AST_PTCR_CLK_CTRL_TYPEM_L),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEN_L_MASK) |
+			(div_low << AST_PTCR_CLK_CTRL_TYPEN_L),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_EXT_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEO_L_MASK) |
+			(div_low << AST_PTCR_CLK_CTRL_TYPEO_L),
+			AST_PTCR_CLK_EXT_CTRL);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_clock_unit(struct ast_pwm_controller_data *priv, u8 pwm_type,
+		u8 unit)
+{
+	switch (pwm_type) {
+	case PWM_TYPE_M:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEM_UNIT),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEN_UNIT),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_write(priv->base,
+			(ast_pwm_read(priv->base, AST_PTCR_CLK_EXT_CTRL) &
+			~AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEO_UNIT),
+			AST_PTCR_CLK_EXT_CTRL);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_enable(struct ast_pwm_port_data *priv, u8 enable)
+{
+	u8 pwm_ch = priv->pwm_port;
+
+	switch (pwm_ch) {
+	case PWMA:
+		if (enable)
+			ast_pwm_write(priv->base,
+				ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) |
+				AST_PTCR_CTRL_PWMA_EN,
+				AST_PTCR_CTRL);
+		else
+			ast_pwm_write(priv->base,
+				ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) &
+				~AST_PTCR_CTRL_PWMA_EN,
+				AST_PTCR_CTRL);
+		break;
+	case PWMB:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) |
+				AST_PTCR_CTRL_PWMB_EN),
+				AST_PTCR_CTRL);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) &
+				~AST_PTCR_CTRL_PWMB_EN),
+				AST_PTCR_CTRL);
+		break;
+	case PWMC:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) |
+				AST_PTCR_CTRL_PWMC_EN),
+				AST_PTCR_CTRL);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) &
+				~AST_PTCR_CTRL_PWMC_EN),
+				AST_PTCR_CTRL);
+		break;
+	case PWMD:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) |
+				AST_PTCR_CTRL_PWMD_EN),
+				AST_PTCR_CTRL);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL) &
+				~AST_PTCR_CTRL_PWMD_EN),
+				AST_PTCR_CTRL);
+		break;
+	case PWME:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) |
+				AST_PTCR_CTRL_PWME_EN),
+				AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) &
+				~AST_PTCR_CTRL_PWME_EN),
+				AST_PTCR_CTRL_EXT);
+		break;
+	case PWMF:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) |
+				AST_PTCR_CTRL_PWMF_EN),
+				AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) &
+				~AST_PTCR_CTRL_PWMF_EN),
+				AST_PTCR_CTRL_EXT);
+		break;
+	case PWMG:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) |
+				AST_PTCR_CTRL_PWMG_EN),
+				AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) &
+				~AST_PTCR_CTRL_PWMG_EN),
+				AST_PTCR_CTRL_EXT);
+		break;
+	case PWMH:
+		if (enable)
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) |
+				AST_PTCR_CTRL_PWMH_EN),
+				AST_PTCR_CTRL_EXT);
+		else
+			ast_pwm_write(priv->base,
+				(ast_pwm_read(priv->base,
+				AST_PTCR_CTRL_EXT) &
+				~AST_PTCR_CTRL_PWMH_EN),
+				AST_PTCR_CTRL_EXT);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_type(struct ast_pwm_port_data *priv, u8 type)
+{
+	u32 tmp1, tmp2;
+	u8 pwm_ch = priv->pwm_port;
+
+	tmp1 = ast_pwm_read(priv->base, AST_PTCR_CTRL);
+	tmp2 = ast_pwm_read(priv->base, AST_PTCR_CTRL_EXT);
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMA_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMA_TYPE(type);
+		ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
+
+		break;
+	case PWMB:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMB_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMB_TYPE(type);
+		ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWMC:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMC_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMC_TYPE(type);
+		ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWMD:
+		tmp1 &= ~AST_PTCR_CTRL_SET_PWMD_TYPE_MASK;
+		tmp1 |= AST_PTCR_CTRL_SET_PWMD_TYPE(type);
+		ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
+		break;
+	case PWME:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWME_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWME_TYPE(type);
+		ast_pwm_write(priv->base, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMF:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMF_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMF_TYPE(type);
+		ast_pwm_write(priv->base, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMG:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMG_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMG_TYPE(type);
+		ast_pwm_write(priv->base, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	case PWMH:
+		tmp2 &= ~AST_PTCR_CTRL_SET_PWMH_TYPE_MASK;
+		tmp2 |= AST_PTCR_CTRL_SET_PWMH_TYPE(type);
+		ast_pwm_write(priv->base, tmp2, AST_PTCR_CTRL_EXT);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_duty_rising(struct ast_pwm_port_data *priv, u8 rising)
+{
+	u32 tmp = 0;
+	u8 pwm_ch = priv->pwm_port;
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMB:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMC:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWMD:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWME:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMF:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMG:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_RISE_POINT_MASK;
+		tmp |= rising;
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	case PWMH:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_RISE_POINT_MASK;
+		tmp |= (rising << DUTY_CTRL_PWM2_RISE_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	}
+}
+
+static void
+ast_set_pwm_duty_falling(struct ast_pwm_port_data *priv, u8 falling)
+{
+	u32 tmp = 0;
+	u8 pwm_ch = priv->pwm_port;
+
+	switch (pwm_ch) {
+	case PWMA:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMB:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY0_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY0_CTRL);
+		break;
+	case PWMC:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWMD:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY1_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY1_CTRL);
+		break;
+	case PWME:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMF:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY2_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY2_CTRL);
+		break;
+	case PWMG:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM1_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM1_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	case PWMH:
+		tmp = ast_pwm_read(priv->base, AST_PTCR_DUTY3_CTRL);
+		tmp &= ~DUTY_CTRL_PWM2_FALL_POINT_MASK;
+		tmp |= (falling << DUTY_CTRL_PWM2_FALL_POINT);
+		ast_pwm_write(priv->base, tmp, AST_PTCR_DUTY3_CTRL);
+		break;
+	}
+}
+
+static u8
+ast_get_pwm_clock_unit(struct ast_pwm_port_data *priv, u8 pwm_type)
+{
+	u8 tmp = 0;
+
+	switch (pwm_type) {
+	case PWM_TYPE_M:
+		tmp = (ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK) >>
+			AST_PTCR_CLK_CTRL_TYPEM_UNIT;
+		break;
+	case PWM_TYPE_N:
+		tmp = (ast_pwm_read(priv->base, AST_PTCR_CLK_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK) >>
+			AST_PTCR_CLK_CTRL_TYPEN_UNIT;
+		break;
+	case PWM_TYPE_O:
+		tmp = (ast_pwm_read(priv->base, AST_PTCR_CLK_EXT_CTRL) &
+			AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK) >>
+			AST_PTCR_CLK_CTRL_TYPEO_UNIT;
+		break;
+	}
+	return tmp;
+}
+
+static void
+ast_set_pwm_duty_cycle(struct ast_pwm_port_data *priv, u8 duty_cycle)
+{
+	u8 period;
+	u8 dc_time_on;
+
+	period = ast_get_pwm_clock_unit(priv, priv->pwm_type);
+	period += 1;
+
+	dc_time_on = (duty_cycle * period) / 100;
+	if (dc_time_on == 0) {
+		ast_set_pwm_enable(priv, 0);
+	} else {
+		if (dc_time_on == period) {
+			dc_time_on = 0;
+		}
+		ast_set_pwm_duty_rising(priv, 0);
+		ast_set_pwm_duty_falling(priv, dc_time_on);
+		ast_set_pwm_enable(priv, 1);
+	}
+}
+
+static ssize_t
+set_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
+		size_t count)
+{
+	struct ast_pwm_port_data *priv = dev_get_drvdata(dev);
+	u8 duty_cycle;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &duty_cycle);
+	if (ret)
+		return -EINVAL;
+
+	if (duty_cycle < 0 || duty_cycle > 100)
+		return -EINVAL;
+
+	priv->pwm_duty_cycle = duty_cycle;
+	ast_set_pwm_duty_cycle(priv, duty_cycle);
+	return count;
+}
+
+static ssize_t
+show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct ast_pwm_port_data *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", priv->pwm_duty_cycle);
+}
+
+static SENSOR_DEVICE_ATTR(pwm, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
+
+static struct attribute *pwm_dev_attrs[] = {
+	&sensor_dev_attr_pwm.dev_attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(pwm_dev);
+
+static int
+aspeed_create_pwm_port(struct device *dev, struct device_node *child,
+		void __iomem *base)
+{
+	struct device *hwmon;
+	u8 val;
+	struct ast_pwm_port_data *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	hwmon = devm_hwmon_device_register_with_groups(dev, "pwm_port",
+		priv, pwm_dev_groups);
+	if (IS_ERR(hwmon)) {
+		dev_err(dev, "Failed to register hwmon device\n");
+		return PTR_ERR(hwmon);
+	}
+	priv->base = base;
+
+	of_property_read_u8(child, "pwm_port", &val);
+	priv->pwm_port = val;
+
+	of_property_read_u8(child, "pwm_enable", &val);
+	priv->pwm_enable = val;
+	ast_set_pwm_enable(priv, val);
+
+	of_property_read_u8(child, "pwm_type", &val);
+	priv->pwm_type = val;
+	ast_set_pwm_type(priv, val);
+
+	of_property_read_u8(child, "pwm_duty_cycle_percent", &val);
+	priv->pwm_duty_cycle = val;
+	ast_set_pwm_duty_cycle(priv, val);
+	return 0;
+}
+
+static int
+aspeed_ast2500_pwm_probe(struct platform_device *pdev)
+{
+	u32 buf[4];
+	struct device_node *np, *child;
+	struct resource *res;
+	u8 val;
+	int err;
+	struct ast_pwm_controller_data *priv;
+
+	np = pdev->dev.of_node;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct ast_pwm_controller_data),
+			GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		return -ENOENT;
+	}
+
+	priv->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!priv->base)
+		return -ENOMEM;
+
+	of_property_read_u8(np, "clock_enable", &val);
+	ast_set_pwm_clock_enable(priv, val);
+	of_property_read_u8(np, "clock_source", &val);
+	ast_set_pwm_clock_source(priv, val);
+
+	of_property_read_u32_array(np, "typem_pwm_clock", buf, 4);
+	if (buf[0] == 1) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_M, buf[1]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_M, buf[2]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_M, buf[3]);
+	}
+
+	of_property_read_u32_array(np, "typen_pwm_clock", buf, 4);
+	if (buf[0] == 1) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_N, buf[1]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_N, buf[2]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_N, buf[3]);
+	}
+
+	of_property_read_u32_array(np, "typeo_pwm_clock", buf, 4);
+	if (buf[0] == 1) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_O, buf[1]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_O, buf[2]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_O, buf[3]);
+	}
+
+	for_each_child_of_node(np, child) {
+		aspeed_create_pwm_port(&pdev->dev,
+				child, priv->base);
+		of_node_put(child);
+	}
+	of_node_put(np);
+	return 0;
+}
+
+static int
+aspeed_ast2500_pwm_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id of_pwm_match_table[] = {
+	{ .compatible = "aspeed,ast2500-pwm", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_match_table);
+
+static struct platform_driver aspeed_ast2500_pwm_driver = {
+	.probe		= aspeed_ast2500_pwm_probe,
+	.remove		= aspeed_ast2500_pwm_remove,
+	.driver		= {
+		.name	= "aspeed_ast2500_pwm",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_pwm_match_table,
+	},
+};
+
+module_platform_driver(aspeed_ast2500_pwm_driver);
+
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("ASPEED AST2500 PWM device driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/aspeed_ast2500_pwm.h b/drivers/hwmon/aspeed_ast2500_pwm.h
new file mode 100644
index 0000000..1986fd2
--- /dev/null
+++ b/drivers/hwmon/aspeed_ast2500_pwm.h
@@ -0,0 +1,128 @@
+/*
+ * ASPEED AST2500 PWM header file
+ * * Copyright (c) 2016 Google, Inc
+ *
+ * * This program is free software; you can redistribute it and/or modify
+ * * it under the terms of the GNU General Public License version 2 as
+ * * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __ASPEED_PWM_H
+#define __ASPEED_PWM_H __FILE__
+
+/* AST PWM & FAN Register Definition */
+#define AST_PTCR_CTRL			0x00
+#define AST_PTCR_CLK_CTRL		0x04
+#define AST_PTCR_DUTY0_CTRL		0x08
+#define AST_PTCR_DUTY1_CTRL		0x0c
+#define AST_PTCR_CTRL_EXT		0x40
+#define AST_PTCR_CLK_EXT_CTRL		0x44
+#define AST_PTCR_DUTY2_CTRL		0x48
+#define AST_PTCR_DUTY3_CTRL		0x4c
+
+/* COMMON Definition */
+#define PWM_TYPE_M	0x0
+#define PWM_TYPE_N	0x1
+#define PWM_TYPE_O	0x2
+
+#define PWMA	0x0
+#define PWMB	0x1
+#define PWMC	0x2
+#define PWMD	0x3
+#define PWME	0x4
+#define PWMF	0x5
+#define PWMG	0x6
+#define PWMH	0x7
+
+#define DUTY_CTRL_PWM2_FALL_POINT			(24)
+#define DUTY_CTRL_PWM2_FALL_POINT_MASK			(0xff<<24)
+#define DUTY_CTRL_PWM2_RISE_POINT			(16)
+#define DUTY_CTRL_PWM2_RISE_POINT_MASK			(0xff<<16)
+#define DUTY_CTRL_PWM1_FALL_POINT			(8)
+#define DUTY_CTRL_PWM1_FALL_POINT_MASK			(0xff<<8)
+#define DUTY_CTRL_PWM1_RISE_POINT			(0)
+#define DUTY_CTRL_PWM1_RISE_POINT_MASK			(0xff)
+
+/* AST_PTCR_CTRL : 0x00 - General Control Register */
+#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)		((x & 0x1) << 15 | \
+						(x & 0x2) << 6)
+#define AST_PTCR_CTRL_SET_PWMD_TYPE_MASK	((0x1 << 7) | (0x1 << 15))
+
+#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)		((x & 0x1) << 14 | \
+						(x & 0x2) << 5)
+#define AST_PTCR_CTRL_SET_PWMC_TYPE_MASK	((0x1 << 6) | (0x1 << 14))
+
+#define AST_PTCR_CTRL_SET_PWMB_TYPE(x)		((x & 0x1) << 13 | \
+						(x & 0x2) << 4)
+#define AST_PTCR_CTRL_SET_PWMB_TYPE_MASK	((0x1 << 5) | (0x1 << 13))
+
+#define AST_PTCR_CTRL_SET_PWMA_TYPE(x)		((x & 0x1) << 12 | \
+						(x & 0x2) << 3)
+#define AST_PTCR_CTRL_SET_PWMA_TYPE_MASK	((0x1 << 4) | (0x1 << 12))
+
+#define	AST_PTCR_CTRL_PWMD			(11)
+#define	AST_PTCR_CTRL_PWMD_EN		(0x1 << 11)
+#define	AST_PTCR_CTRL_PWMC			(10)
+#define	AST_PTCR_CTRL_PWMC_EN		(0x1 << 10)
+#define	AST_PTCR_CTRL_PWMB			(9)
+#define	AST_PTCR_CTRL_PWMB_EN		(0x1 << 9)
+#define	AST_PTCR_CTRL_PWMA			(8)
+#define	AST_PTCR_CTRL_PWMA_EN		(0x1 << 8)
+
+/*0:24Mhz, 1:MCLK */
+#define	AST_PTCR_CTRL_CLK_SRC		0x2
+#define	AST_PTCR_CTRL_CLK_EN		0x1
+
+/* AST_PTCR_CLK_CTRL : 0x04 - Clock Control Register */
+/* TYPE N */
+#define AST_PTCR_CLK_CTRL_TYPEN_UNIT			(24)
+#define AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK		(0xff << 24)
+#define AST_PTCR_CLK_CTRL_TYPEN_H			(20)
+#define AST_PTCR_CLK_CTRL_TYPEN_H_MASK			(0xf << 20)
+#define AST_PTCR_CLK_CTRL_TYPEN_L			(16)
+#define AST_PTCR_CLK_CTRL_TYPEN_L_MASK			(0xf << 16)
+/* TYPE M */
+#define AST_PTCR_CLK_CTRL_TYPEM_UNIT			(8)
+#define AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK		(0xff << 8)
+#define AST_PTCR_CLK_CTRL_TYPEM_H			(4)
+#define AST_PTCR_CLK_CTRL_TYPEM_H_MASK			(0xf << 4)
+#define AST_PTCR_CLK_CTRL_TYPEM_L			(0)
+#define AST_PTCR_CLK_CTRL_TYPEM_L_MASK			(0xf)
+
+/* AST_PTCR_CTRL_EXT : 0x40 - General Control Extension #1 Register */
+#define AST_PTCR_CTRL_SET_PWMH_TYPE(x)		((x & 0x1) << 15 | \
+						(x & 0x2) << 6)
+#define AST_PTCR_CTRL_SET_PWMH_TYPE_MASK	((0x1 << 7) | (0x1 << 15))
+
+#define AST_PTCR_CTRL_SET_PWMG_TYPE(x)		((x & 0x1) << 14 | \
+						(x & 0x2) << 5)
+#define AST_PTCR_CTRL_SET_PWMG_TYPE_MASK	((0x1 << 6) | (0x1 << 14))
+
+#define AST_PTCR_CTRL_SET_PWMF_TYPE(x)		((x & 0x1) << 13 | \
+						(x & 0x2) << 4)
+#define AST_PTCR_CTRL_SET_PWMF_TYPE_MASK	((0x1 << 5) | (0x1 << 13))
+
+#define AST_PTCR_CTRL_SET_PWME_TYPE(x)		((x & 0x1) << 12 | \
+						(x & 0x2) << 3)
+#define AST_PTCR_CTRL_SET_PWME_TYPE_MASK	((0x1 << 4) | (0x1 << 12))
+
+#define	AST_PTCR_CTRL_PWMH		(11)
+#define	AST_PTCR_CTRL_PWMH_EN		(0x1 << 11)
+#define	AST_PTCR_CTRL_PWMG		(10)
+#define	AST_PTCR_CTRL_PWMG_EN		(0x1 << 10)
+#define	AST_PTCR_CTRL_PWMF		(9)
+#define	AST_PTCR_CTRL_PWMF_EN		(0x1 << 9)
+#define	AST_PTCR_CTRL_PWME		(8)
+#define	AST_PTCR_CTRL_PWME_EN		(0x1 << 8)
+
+/* AST_PTCR_CLK_EXT_CTRL : 0x44 - Clock Control Extension #1 Register */
+/* TYPE O */
+#define AST_PTCR_CLK_CTRL_TYPEO_UNIT		(8)
+#define AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK	(0xff << 8)
+#define AST_PTCR_CLK_CTRL_TYPEO_H		(4)
+#define AST_PTCR_CLK_CTRL_TYPEO_H_MASK		(0xf << 4)
+#define AST_PTCR_CLK_CTRL_TYPEO_L		(0)
+#define AST_PTCR_CLK_CTRL_TYPEO_L_MASK		(0xf)
+
+#endif /* __ASPEED_PWM_H */
--
2.8.0.rc3.226.g39d4020
