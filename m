Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4k0Z3WxczDvQC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 10:40:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Y0Lj2Pht; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id n85so25892743pfi.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/ayxzu3wgqIpVJR+fn3Ny7vhc0lzrwdiMSVoe3EiqOc=;
 b=Y0Lj2Phtu8Bdw1xlC4g2fVHmCiiZTtskICOIyvrb+19oCOIuh+kieIhMgCwS+EaM9s
 ynvZg3iPbinZE+VEB5VerluGXDgQfocH9n4nx0RzBVOwWz4b2s9TTsQtKnZ+Bf4E0KUf
 PAdMelv54n3NPuBcgJqpYnQ4mOLKZBFN5KNDcpqOJsPLuUKF0Nj8NevWFri2lNtahcLX
 tThtWa4lM0ABw0CYQ5zojCdZ+je2IopNDQ/F8mxC+7rc+Z0G0Yjyi+pc2Vk+AE+3XCL4
 UUHqsw5lx1PPHWDkubDSuSXwddaorT/Gxf6ef4s3a6h21nWuMUzrrajNObvlpIxK0jPa
 Rt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/ayxzu3wgqIpVJR+fn3Ny7vhc0lzrwdiMSVoe3EiqOc=;
 b=TG1e6xCvQlWGfGpdoKI/ewbIB+Bm6nWzmR4NywsP2SqCrIvLmh8VAkVCX7L7bmfCZK
 DNa1L4JA5irDP4FANt7Wv1P/Nq+j+Z682h414/mjbyYrOHKNpuj+v2wFvGRGs0hCOeQR
 X4XRl50UzO+ttzty9ZLbsuxCIoU7qPRE4GZ7LT09PqKD+3zXsUPpE4R6hqOayCcozX8H
 05S/xhLze+UqMuTvlB7NW2TX99Emv7b7rSIuf9uKf5GnZTTw221FuQagCBubHpXHHET6
 IMer8foCPyENJBC811gyIMCGkLpgbGuoF15FejXf7UdXrdrxCkz/LtqGzyOfWjjHSYL1
 jN9g==
X-Gm-Message-State: ABUngvcAG+prMdOBkJPtSJsAXAU+NvrSY6M90FXRTYkh9BHIlKN/aRis9M1tfu9mjk1Lyp+Z
X-Received: by 10.98.70.208 with SMTP id o77mr19153279pfi.177.1477611644293;
 Thu, 27 Oct 2016 16:40:44 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y189sm14147467pfy.34.2016.10.27.16.40.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Oct 2016 16:40:43 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 1/3] drivers: hwmon: Support for Aspeed PWM
 controller driver
Date: Thu, 27 Oct 2016 16:40:20 -0700
Message-Id: <1477611622-28120-2-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 27 Oct 2016 23:40:47 -0000

Support to give all the common information required by all the PWM channels.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../bindings/hwmon/aspeed_pwm_controller.txt       |  33 +++
 drivers/hwmon/Kconfig                              |   5 +
 drivers/hwmon/Makefile                             |   2 +-
 drivers/hwmon/aspeed_pwm.h                         | 159 ++++++++++++++
 drivers/hwmon/aspeed_pwm_controller.c              | 237 +++++++++++++++++++++
 5 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
 create mode 100644 drivers/hwmon/aspeed_pwm.h
 create mode 100644 drivers/hwmon/aspeed_pwm_controller.c

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
new file mode 100644
index 0000000..2b5c895
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
@@ -0,0 +1,33 @@
+Aspeed PWM controller driver
+
+Required properties:
+- reg : address and length of the register set for the device.
+- #address-cells : should be 1.
+- #size-cells : should be 1.
+- compatible : should be "aspeed-pwm-controller".
+- clock_enable : option to enable PWM and fan tach clock. should be 1.
+- clock_source : option for clock source selection. 0 indicates 24MHz clock
+  and 1 indicates MCLK.
+- typem_pwm_clock : This array contains 3 values. The first value indicates
+  the type M PWM clock division L bit. The second value indicates type M PWM
+  clock divison H bit. The third value indicates type M PWM period bit.
+
+Optional properties:
+- typen_pwm_clock : This array contains 3 values. The first value indicates
+  the type N PWM clock division L bit. The second value indicates type N PWM
+  clock division H bit. The third value indicates type N PWM period bit.
+- typeo_pwm_clock : This array contains 3 values. The first value indicates
+  the type O PWM clock division L bit. The second value indicates type O PWM
+  clock divison H bit. The third value indicates type O PWM period bit.
+
+Examples:
+
+pwm_controller {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x78>;
+		compatible = "aspeed-pwm-controller";
+		clock_enable = /bits/ 8 <0x01>;
+		clock_source = /bits/ 8 <0x00>;
+		typem_pwm_clock = <5 0 95>;
+};
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d4de8d5..59d6ea4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1803,6 +1803,11 @@ config SENSORS_WM8350
 	  This driver can also be built as a module.  If so, the module
 	  will be called wm8350-hwmon.

+config ASPEED_PWM_CONTROLLER
+	tristate "Aspeed PWM controller"
+	help
+	  This driver provides support for ASPEED PWM controller.
+
 config SENSORS_ULTRA45
 	tristate "Sun Ultra45 PIC16F747"
 	depends on SPARC64
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4455478..83156f8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -164,7 +164,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
 obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
-
+obj-$(CONFIG_ASPEED_PWM_CONTROLLER)	+= aspeed_pwm_controller.o
 obj-$(CONFIG_PMBUS)		+= pmbus/

 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
diff --git a/drivers/hwmon/aspeed_pwm.h b/drivers/hwmon/aspeed_pwm.h
new file mode 100644
index 0000000..b3dd6b1
--- /dev/null
+++ b/drivers/hwmon/aspeed_pwm.h
@@ -0,0 +1,159 @@
+/*
+ * Aspeed PWM header file
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
+#define AST_PTCR_TYPEM_CTRL0		0x10
+#define AST_PTCR_TYPEM_CTRL1		0x14
+#define AST_PTCR_TYPEN_CTRL0		0x18
+#define AST_PTCR_TYPEN_CTRL1		0x1c
+#define AST_PTCR_TACH_SOURCE		0x20
+#define AST_PTCR_TRIGGER		0x28
+#define AST_PTCR_RESULT			0x2c
+#define AST_PTCR_INTR_CTRL		0x30
+#define AST_PTCR_INTR_STS		0x34
+#define AST_PTCR_TYPEM_LIMIT		0x38
+#define AST_PTCR_TYPEN_LIMIT		0x3C
+#define AST_PTCR_CTRL_EXT		0x40
+#define AST_PTCR_CLK_EXT_CTRL		0x44
+#define AST_PTCR_DUTY2_CTRL		0x48
+#define AST_PTCR_DUTY3_CTRL		0x4c
+#define AST_PTCR_TYPEO_CTRL0		0x50
+#define AST_PTCR_TYPEO_CTRL1		0x54
+#define AST_PTCR_TACH_SOURCE_EXT	0x60
+#define AST_PTCR_TYPEO_LIMIT		0x78
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
+#define AST_PTCR_CTRL_GET_PWMD_TYPE(x)		(((x & (0x1 << 7)) >> 6) | \
+						((x & (0x1 << 15)) >> 15))
+#define AST_PTCR_CTRL_SET_PWMD_TYPE_MASK	((0x1 << 7) | (0x1 << 15))
+
+#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)		((x & 0x1) << 14 | \
+						(x & 0x2) << 5)
+#define AST_PTCR_CTRL_GET_PWMC_TYPE(x)		(((x & (0x1 << 6)) >> 5) | \
+						((x & (0x1 << 14)) >> 14))
+#define AST_PTCR_CTRL_SET_PWMC_TYPE_MASK	((0x1 << 6) | (0x1 << 14))
+
+#define AST_PTCR_CTRL_SET_PWMB_TYPE(x)		((x & 0x1) << 13 | \
+						(x & 0x2) << 4)
+#define AST_PTCR_CTRL_GET_PWMB_TYPE(x)		(((x & (0x1 << 5)) >> 4) | \
+						((x & (0x1 << 13)) >> 13))
+#define AST_PTCR_CTRL_SET_PWMB_TYPE_MASK	((0x1 << 5) | (0x1 << 13))
+
+#define AST_PTCR_CTRL_SET_PWMA_TYPE(x)		((x & 0x1) << 12 | \
+						(x & 0x2) << 3)
+#define AST_PTCR_CTRL_GET_PWMA_TYPE(x)		(((x & (0x1 << 4)) >> 3) | \
+						((x & (0x1 << 12)) >> 12))
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
+#define AST_PTCR_CTRL_GET_PWMH_TYPE(x)		(((x & (0x1 << 7)) >> 6) | \
+						((x & (0x1 << 15)) >> 15))
+#define AST_PTCR_CTRL_SET_PWMH_TYPE_MASK	((0x1 << 7) | (0x1 << 15))
+
+#define AST_PTCR_CTRL_SET_PWMG_TYPE(x)		((x & 0x1) << 14 | \
+						(x & 0x2) << 5)
+#define AST_PTCR_CTRL_GET_PWMG_TYPE(x)		(((x & (0x1 << 6)) >> 5) | \
+						((x & (0x1 << 14)) >> 14))
+#define AST_PTCR_CTRL_SET_PWMG_TYPE_MASK	((0x1 << 6) | (0x1 << 14))
+
+#define AST_PTCR_CTRL_SET_PWMF_TYPE(x)		((x & 0x1) << 13 | \
+						(x & 0x2) << 4)
+#define AST_PTCR_CTRL_GET_PWMF_TYPE(x)		(((x & (0x1 << 5)) >> 4) | \
+						((x & (0x1 << 13)) >> 13))
+#define AST_PTCR_CTRL_SET_PWMF_TYPE_MASK	((0x1 << 5) | (0x1 << 13))
+
+#define AST_PTCR_CTRL_SET_PWME_TYPE(x)		((x & 0x1) << 12 | \
+						(x & 0x2) << 3)
+#define AST_PTCR_CTRL_GET_PWME_TYPE(x)		(((x & (0x1 << 4)) >> 3) | \
+						((x & (0x1 << 12)) >> 12))
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
diff --git a/drivers/hwmon/aspeed_pwm_controller.c b/drivers/hwmon/aspeed_pwm_controller.c
new file mode 100644
index 0000000..f846132
--- /dev/null
+++ b/drivers/hwmon/aspeed_pwm_controller.c
@@ -0,0 +1,237 @@
+/*
+ * Aspeed PWM controller driver
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
+
+#include "aspeed_pwm.h"
+
+struct ast_pwm_controller_data {
+	void __iomem *base;
+};
+
+static inline void
+ast_pwm_controller_write(struct ast_pwm_controller_data *priv, u32 val, u32 reg)
+{
+	writel(val, priv->base + reg);
+}
+
+static inline u32
+ast_pwm_controller_read(struct ast_pwm_controller_data *priv, u32 reg)
+{
+	u32 val = readl(priv->base + reg);
+	return val;
+}
+
+static void
+ast_set_pwm_clock_enable(struct ast_pwm_controller_data *priv, u8 val)
+{
+	if (val) {
+		ast_pwm_controller_write(priv,
+			ast_pwm_controller_read(priv, AST_PTCR_CTRL) |
+			AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
+	} else {
+		ast_pwm_controller_write(priv,
+			ast_pwm_controller_read(priv, AST_PTCR_CTRL) &
+			~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
+	}
+}
+
+static void
+ast_set_pwm_clock_source(struct ast_pwm_controller_data *priv, u8 val)
+{
+	if (val) {
+		ast_pwm_controller_write(priv,
+			ast_pwm_controller_read(priv, AST_PTCR_CTRL) |
+			AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);
+	} else {
+		ast_pwm_controller_write(priv,
+			ast_pwm_controller_read(priv, AST_PTCR_CTRL) &
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
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEM_H_MASK) |
+			(div_high << AST_PTCR_CLK_CTRL_TYPEM_H),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEN_H_MASK) |
+			(div_high << AST_PTCR_CLK_CTRL_TYPEN_H),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEO_H_MASK) |
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
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEM_L_MASK) |
+			(div_low << AST_PTCR_CLK_CTRL_TYPEM_L),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEN_L_MASK) |
+			(div_low << AST_PTCR_CLK_CTRL_TYPEN_L),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEO_L_MASK) |
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
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEM_UNIT),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_N:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEN_UNIT),
+			AST_PTCR_CLK_CTRL);
+		break;
+	case PWM_TYPE_O:
+		ast_pwm_controller_write(priv,
+			(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &
+			 ~AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK) |
+			(unit << AST_PTCR_CLK_CTRL_TYPEO_UNIT),
+			AST_PTCR_CLK_EXT_CTRL);
+		break;
+	}
+}
+
+static int
+aspeed_pwm_controller_probe(struct platform_device *pdev)
+{
+	u32 buf[3];
+	int err;
+	struct device_node *np;
+	struct resource *res;
+	u8 val;
+	struct ast_pwm_controller_data *priv;
+
+	np = pdev->dev.of_node;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	priv->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!priv->base)
+		return -ENOMEM;
+
+	err = of_property_read_u8(np, "clock_enable", &val);
+	if (!err) {
+		ast_set_pwm_clock_enable(priv, val);
+	} else {
+		return err;
+	}
+	err = of_property_read_u8(np, "clock_source", &val);
+	if (!err) {
+		ast_set_pwm_clock_source(priv, val);
+	} else {
+		return err;
+	}
+
+	err = of_property_read_u32_array(np, "typem_pwm_clock", buf, 3);
+	if (!err) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_M, buf[0]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_M, buf[1]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_M, buf[2]);
+	}
+
+	err = of_property_read_u32_array(np, "typen_pwm_clock", buf, 3);
+	if (!err) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_N, buf[0]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_N, buf[1]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_N, buf[2]);
+	}
+
+	err = of_property_read_u32_array(np, "typeo_pwm_clock", buf, 3);
+	if (!err) {
+		ast_set_pwm_clock_division_l(priv, PWM_TYPE_O, buf[0]);
+		ast_set_pwm_clock_division_h(priv, PWM_TYPE_O, buf[1]);
+		ast_set_pwm_clock_unit(priv, PWM_TYPE_O, buf[2]);
+	}
+
+	return 0;
+}
+
+static int
+aspeed_pwm_controller_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id of_pwm_controller_match_table[] = {
+	{ .compatible = "aspeed-pwm-controller", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_controller_match_table);
+
+static struct platform_driver aspeed_pwm_controller_driver = {
+	.probe		= aspeed_pwm_controller_probe,
+	.remove		= aspeed_pwm_controller_remove,
+	.driver		= {
+		.name	= "aspeed_pwm_controller",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_pwm_controller_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pwm_controller_driver);
+
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("ASPEED PWM controller driver");
+MODULE_LICENSE("GPL");
--
2.8.0.rc3.226.g39d4020
