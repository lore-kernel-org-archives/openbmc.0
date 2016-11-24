Return-Path: <jaghu@google.com>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPYkZ0vpzzDw6X
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 20:27:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RufZ++Yt"; 
 dkim-atps=neutral
Received: by mail-pg0-x22e.google.com with SMTP id 3so16835788pgd.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 01:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzMMuXVGlhpWGFBVDbZ8Olmai67MOVH/BzmrvuV2rk4=;
 b=RufZ++Ytq/ql5Ej7/+tyXrjViibZhHazIGIcztePgbaC4l+8qfskQGclZlBv+SuUl8
 56fpSWL9P0zIUpumd7d4PsQPd30jHIqunv05vIPOPMxXN65YwL8asZB1G/GoEuarve9/
 6jBHeoTYWqlGqw8ah+oMiE5LIaCDsrhJ3Y0Tu4z+POXccvLYgPWSX0VYu+lC6beDDONB
 fuiEnHn4jVVEkWBM6CHFdF7nUj7rohgOhC92VWP/btMGQaa4fVlmHz6Mna9/AJwWZT7I
 hAVqKSutG8/ek1KhRnpxNN5ODHQ280Exanadu+GgGHdrTTcSVki25tHWpQg+dMhBr8Xj
 vfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzMMuXVGlhpWGFBVDbZ8Olmai67MOVH/BzmrvuV2rk4=;
 b=cuRYw+FmcOcsETGbAnwBzqlJGHFx88UP94cMkyPP9b0sgxVCNbI57e4DJs9Z/BLtkc
 Hqq3wOeHlq2aT6My9dX/wOOMpQvlBogplSwRU3rD/VQbxHDeNhcOjE6bv4Y6LDR9WmaC
 rlm+JekWVMFIzt0Gbk93ppz7yas7r0y122EUjM6Ya/GgsuzNOaeKon2xAPydiErDPHcd
 q2T7r086RDgRv0UK7+riGD9LK/pp2A/+l7rZs0lmhEd+KKePpNtXW+c6rpLjh5jRDMVm
 yxxQnR70XRvHy6Lg4z1rKRL0JNj/0GqcupOc6qJX7ANKy0EYaddOLKDkbZzKeuSfhq6t
 8oZg==
X-Gm-Message-State: AKaTC00JL9WLbys1oxu4JfHvG0NdSou4B1lyjlngk1Q57WKDgoZ1MrR0tc155FQd+ritKyjr
X-Received: by 10.84.198.3 with SMTP id o3mr3331357pld.122.1479979619489;
 Thu, 24 Nov 2016 01:26:59 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id q145sm58705035pfq.22.2016.11.24.01.26.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Nov 2016 01:26:58 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 2/3] drivers: hwmon: Hwmon driver for ASPEED
 AST2400/2500 PWM support
Date: Thu, 24 Nov 2016 01:26:49 -0800
Message-Id: <1479979610-2958-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479979610-2958-1-git-send-email-jaghu@google.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 09:27:02 -0000

The ASPEED AST2400/2500 PWM controller supports 8 PWM output ports.
PWM clock types M, N and 0 are three types just to have three independent PWM
sources. Each port can be assigned a different PWM clock type.
The device driver matches on the device tree node. The configuration values
are read from the device tree and written to the respective registers.
The driver provides a sysfs entry "pwm" through which the user can
configure the duty-cycle value (ranging from 0 to 100 percent).

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Merged the drivers for PWM controller and PWM device as one PWM driver.

v3:
- Mentioned that this driver is supported for AST2400 and AST2500.
- Provided explanation of why this is hwmon driver.
- Entered changelog in the correct place.
- Removed name at the top of the file.
- Corrected style of multi-line comments.
- Added GPL version 2 or later.
- Changed prefix as "aspeed".
- Changed val to bool as mentioned in comment.
- Removed switch statements and added a representation that would allow
-  to look up the values without requiring a switch statement.
- Changed some variable names.
- Added enum for pwm_port and pwm_clock_type.
- Replaced hwmon name as "aspeed_pwm".
- Removed struct ast_pwm_controller_data allocation in the probe function.
- Used struct clk and related logic.
- Removed remove function.
- Moved header file content to c file.
- Removed some duplicate definitions not needed.
- Used BIT(x).
- Removed guarding () for integers in #define statements. Retained guarding
-  for complex calculations; ow getting error when running checkpatch.pl script.
- Added documentation for hwmon driver.

 Documentation/hwmon/aspeed-pwm |  18 ++
 drivers/hwmon/Kconfig          |  13 +
 drivers/hwmon/Makefile         |   3 +-
 drivers/hwmon/aspeed-pwm.c     | 660 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 692 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/hwmon/aspeed-pwm
 create mode 100644 drivers/hwmon/aspeed-pwm.c

diff --git a/Documentation/hwmon/aspeed-pwm b/Documentation/hwmon/aspeed-pwm
new file mode 100644
index 0000000..f1affe0
--- /dev/null
+++ b/Documentation/hwmon/aspeed-pwm
@@ -0,0 +1,18 @@
+Kernel driver aspeed-pwm
+========================
+
+Supported chips:
+	ASPEED AST2400/2500
+
+Authors:
+	<jaghu@google.com>
+
+Description:
+------------
+The ASPEED AST2400/2500 PWM controller supports 8 PWM output ports.
+PWM clock types M, N and 0 are three types just to have three independent PWM
+sources. Each port can be assigned a different PWM clock type.
+The device driver matches on the device tree node. The configuration values
+are read from the device tree and written to the respective registers.
+The driver provides a sysfs entry "pwm1" through which the user can
+configure the duty-cycle value (ranging from 0 to 255; 255 is 100 percent).
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d4de8d5..7f75b01 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -341,6 +341,19 @@ config SENSORS_ASB100
 	  This driver can also be built as a module.  If so, the module
 	  will be called asb100.

+config SENSORS_ASPEED_PWM
+	tristate "ASPEED AST2400/AST2500 PWM driver"
+	help
+	  This driver provides support for ASPEED AST2400/AST2500 PWM
+	  controller and output ports. The ASPEED PWM controller can support 8
+	  PWM outputs. PWM clock types M, N and 0 are three types just to have three
+	  independent PWM sources. Each could be assigned to the 8 PWM port
+	  with its own settings. The user can configure duty cycle through
+	  the exposed hwmon sysfs entry "pwm".
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called aspeed-pwm.
+
 config SENSORS_ATXP1
 	tristate "Attansic ATXP1 VID controller"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4455478..f39c057 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
+obj-$(CONFIG_SENSORS_ASPEED_PWM)	+= aspeed-pwm.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
@@ -164,8 +165,6 @@ obj-$(CONFIG_SENSORS_W83L785TS)	+= w83l785ts.o
 obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
-
 obj-$(CONFIG_PMBUS)		+= pmbus/

 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
-
diff --git a/drivers/hwmon/aspeed-pwm.c b/drivers/hwmon/aspeed-pwm.c
new file mode 100644
index 0000000..1c96bbe
--- /dev/null
+++ b/drivers/hwmon/aspeed-pwm.c
@@ -0,0 +1,660 @@
+/*
+ * Copyright (c) 2016 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or later as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+
+/* ASPEED PWM & FAN Register Definition */
+#define ASPEED_PTCR_CTRL		0x00
+#define ASPEED_PTCR_CLK_CTRL		0x04
+#define ASPEED_PTCR_DUTY0_CTRL		0x08
+#define ASPEED_PTCR_DUTY1_CTRL		0x0c
+#define ASPEED_PTCR_CTRL_EXT		0x40
+#define ASPEED_PTCR_CLK_CTRL_EXT	0x44
+#define ASPEED_PTCR_DUTY2_CTRL		0x48
+#define ASPEED_PTCR_DUTY3_CTRL		0x4c
+
+#define DUTY_CTRL_PWM2_FALL_POINT	24
+#define DUTY_CTRL_PWM2_RISE_POINT	16
+#define DUTY_CTRL_PWM1_FALL_POINT	8
+#define DUTY_CTRL_PWM1_RISE_POINT	0
+
+/* ASPEED_PTCR_CTRL : 0x00 - General Control Register */
+#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART1	15
+#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART2	6
+#define ASPEED_PTCR_CTRL_SET_PWMD_TYPE_MASK	(BIT(7) | BIT(15))
+
+#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART1	14
+#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART2	5
+#define ASPEED_PTCR_CTRL_SET_PWMC_TYPE_MASK	(BIT(6) | BIT(14))
+
+#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART1	13
+#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART2	4
+#define ASPEED_PTCR_CTRL_SET_PWMB_TYPE_MASK	(BIT(5) | BIT(13))
+
+#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1	12
+#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2	3
+#define ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK	(BIT(4) | BIT(12))
+
+#define	ASPEED_PTCR_CTRL_PWMD_EN	(0x1 << 11)
+#define	ASPEED_PTCR_CTRL_PWMC_EN	(0x1 << 10)
+#define	ASPEED_PTCR_CTRL_PWMB_EN	(0x1 << 9)
+#define	ASPEED_PTCR_CTRL_PWMA_EN	(0x1 << 8)
+
+/*0:24Mhz, 1:MCLK */
+#define	ASPEED_PTCR_CTRL_CLK_SRC	0x2
+#define	ASPEED_PTCR_CTRL_CLK_EN		0x1
+
+/* ASPEED_PTCR_CLK_CTRL : 0x04 - Clock Control Register */
+/* TYPE N */
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT		24
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT_MASK	(0xff << 24)
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_H		20
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_H_MASK	(0xf << 20)
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_L		16
+#define ASPEED_PTCR_CLK_CTRL_TYPEN_L_MASK	(0xf << 16)
+/* TYPE M */
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT		8
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT_MASK	(0xff << 8)
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_H		4
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_H_MASK	(0xf << 4)
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_L		0
+#define ASPEED_PTCR_CLK_CTRL_TYPEM_L_MASK	0xf
+
+/* ASPEED_PTCR_CTRL_EXT : 0x40 - General Control Extension #1 Register */
+#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART1	15
+#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART2	6
+#define ASPEED_PTCR_CTRL_SET_PWMH_TYPE_MASK	(BIT(7) | BIT(15))
+
+#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART1	14
+#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART2	5
+#define ASPEED_PTCR_CTRL_SET_PWMG_TYPE_MASK	(BIT(6) | BIT(14))
+
+
+#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART1	13
+#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART2	4
+#define ASPEED_PTCR_CTRL_SET_PWMF_TYPE_MASK	(BIT(5) | BIT(13))
+
+#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART1	12
+#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART2	3
+#define ASPEED_PTCR_CTRL_SET_PWME_TYPE_MASK	(BIT(4) | BIT(12))
+
+#define	ASPEED_PTCR_CTRL_PWMH_EN	(0x1 << 11)
+#define	ASPEED_PTCR_CTRL_PWMG_EN	(0x1 << 10)
+#define	ASPEED_PTCR_CTRL_PWMF_EN	(0x1 << 9)
+#define	ASPEED_PTCR_CTRL_PWME_EN	(0x1 << 8)
+
+/* ASPEED_PTCR_CLK_EXT_CTRL : 0x44 - Clock Control Extension #1 Register */
+/* TYPE O */
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT		8
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT_MASK	(0xff << 8)
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_H		4
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_H_MASK	(0xf << 4)
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_L		0
+#define ASPEED_PTCR_CLK_CTRL_TYPEO_L_MASK	0xf
+
+#define PWM_MAX 255
+
+#define MAX_HIGH_LOW_BIT 15
+
+struct aspeed_pwm_port_data {
+	u8 pwm_port;
+	u8 pwm_enable;
+	u8 pwm_type;
+	u8 pwm_fan_ctrl;
+	void __iomem *base;
+};
+
+enum pwm_clock_type { TYPEM, TYPEN, TYPEO };
+
+struct pwm_clock_type_params {
+	u32 l_value;
+	u32 l_mask;
+	u32 h_value;
+	u32 h_mask;
+	u32 unit_value;
+	u32 unit_mask;
+	u32 ctrl_reg_offset;
+};
+
+static const struct pwm_clock_type_params pwm_clock_type_params[] = {
+	[TYPEM] = {
+		.l_value = ASPEED_PTCR_CLK_CTRL_TYPEM_L,
+		.l_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_L_MASK,
+		.h_value = ASPEED_PTCR_CLK_CTRL_TYPEM_H,
+		.h_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_H_MASK,
+		.unit_value = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT,
+		.unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT_MASK,
+		.ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
+	},
+	[TYPEN] = {
+		.l_value = ASPEED_PTCR_CLK_CTRL_TYPEN_L,
+		.l_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_L_MASK,
+		.h_value = ASPEED_PTCR_CLK_CTRL_TYPEN_H,
+		.h_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_H_MASK,
+		.unit_value = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT,
+		.unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT_MASK,
+		.ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
+	},
+	[TYPEO] = {
+		.l_value = ASPEED_PTCR_CLK_CTRL_TYPEO_L,
+		.l_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_L_MASK,
+		.h_value = ASPEED_PTCR_CLK_CTRL_TYPEO_H,
+		.h_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_H_MASK,
+		.unit_value = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT,
+		.unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT_MASK,
+		.ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL_EXT,
+	}
+};
+
+enum pwm_port { PWMA, PWMB, PWMC, PWMD, PWME, PWMF, PWMG, PWMH };
+
+struct pwm_port_params {
+	u32 pwm_en;
+	u32 ctrl_reg_offset;
+	u32 pwm_type_part1;
+	u32 pwm_type_part2;
+	u32 pwm_type_mask;
+	u32 duty_ctrl_rise_point;
+	u32 duty_ctrl_fall_point;
+	u32 duty_ctrl_reg_offset;
+	u8 duty_ctrl_calc_type;
+};
+
+static const struct pwm_port_params pwm_port_params[] = {
+	[PWMA] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMA_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY0_CTRL,
+		.duty_ctrl_calc_type = 0,
+	},
+	[PWMB] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMB_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMB_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMB_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM2_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM2_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY0_CTRL,
+		.duty_ctrl_calc_type = 1,
+	},
+	[PWMC] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMC_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMC_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMC_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY1_CTRL,
+		.duty_ctrl_calc_type = 0,
+	},
+	[PWMD] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMD_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMD_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMD_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM2_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM2_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY1_CTRL,
+		.duty_ctrl_calc_type = 1,
+	},
+	[PWME] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWME_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL_EXT,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWME_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWME_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY2_CTRL,
+		.duty_ctrl_calc_type = 0,
+	},
+	[PWMF] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMF_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL_EXT,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMF_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMF_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM2_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM2_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY2_CTRL,
+		.duty_ctrl_calc_type = 1,
+	},
+	[PWMG] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMG_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL_EXT,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMG_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMG_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY3_CTRL,
+		.duty_ctrl_calc_type = 0,
+	},
+	[PWMH] = {
+		.pwm_en = ASPEED_PTCR_CTRL_PWMH_EN,
+		.ctrl_reg_offset = ASPEED_PTCR_CTRL_EXT,
+		.pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART1,
+		.pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMH_TYPE_PART2,
+		.pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMH_TYPE_MASK,
+		.duty_ctrl_rise_point = DUTY_CTRL_PWM2_RISE_POINT,
+		.duty_ctrl_fall_point = DUTY_CTRL_PWM2_FALL_POINT,
+		.duty_ctrl_reg_offset = ASPEED_PTCR_DUTY3_CTRL,
+		.duty_ctrl_calc_type = 1,
+	}
+};
+
+static inline void
+aspeed_pwm_write(void __iomem *base, u32 val, u32 reg)
+{
+	writel(val, base + reg);
+}
+
+static inline u32
+aspeed_pwm_read(void __iomem *base, u32 reg)
+{
+	u32 val = readl(base + reg);
+	return val;
+}
+
+static void
+aspeed_set_pwm_clock_enable(void __iomem *base, bool val)
+{
+	u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
+
+	if (val)
+		reg_value |= ASPEED_PTCR_CTRL_CLK_EN;
+	else
+		reg_value &= ~ASPEED_PTCR_CTRL_CLK_EN;
+
+	aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
+}
+
+static void
+aspeed_set_pwm_clock_source(void __iomem *base, bool val)
+{
+	u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
+
+	if (val)
+		reg_value |= ASPEED_PTCR_CTRL_CLK_SRC;
+	else
+		reg_value &= ~ASPEED_PTCR_CTRL_CLK_SRC;
+
+	aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
+}
+
+static void
+aspeed_set_pwm_clock_division_h(void __iomem *base, u8 pwm_clock_type,
+		u8 div_high)
+{
+	u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(base, reg_offset);
+
+	reg_value &= ~pwm_clock_type_params[pwm_clock_type].h_mask;
+	reg_value |= div_high << pwm_clock_type_params[pwm_clock_type].h_value;
+
+	aspeed_pwm_write(base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_clock_division_l(void __iomem *base, u8 pwm_clock_type,
+		u8 div_low)
+{
+	u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(base, reg_offset);
+
+	reg_value &= ~pwm_clock_type_params[pwm_clock_type].l_mask;
+	reg_value |= div_low << pwm_clock_type_params[pwm_clock_type].l_value;
+
+	aspeed_pwm_write(base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_clock_unit(void __iomem *base, u8 pwm_clock_type,
+		u8 unit)
+{
+	u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(base, reg_offset);
+
+	reg_value &= ~pwm_clock_type_params[pwm_clock_type].unit_mask;
+	reg_value |= unit << pwm_clock_type_params[pwm_clock_type].unit_value;
+
+	aspeed_pwm_write(base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_enable(struct aspeed_pwm_port_data *priv, bool enable)
+{
+	u8 pwm_port = priv->pwm_port;
+
+	u32 reg_offset = pwm_port_params[pwm_port].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(priv->base, reg_offset);
+
+	if (enable)
+		reg_value |= pwm_port_params[pwm_port].pwm_en;
+	else
+		reg_value &= ~pwm_port_params[pwm_port].pwm_en;
+
+	aspeed_pwm_write(priv->base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_type(struct aspeed_pwm_port_data *priv, u8 type)
+{
+	u8 pwm_port = priv->pwm_port;
+
+	u32 reg_offset = pwm_port_params[pwm_port].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(priv->base, reg_offset);
+
+	reg_value &= ~pwm_port_params[pwm_port].pwm_type_mask;
+	reg_value |= (type & 0x1) <<
+		     pwm_port_params[pwm_port].pwm_type_part1;
+	reg_value |= (type & 0x2) <<
+		     pwm_port_params[pwm_port].pwm_type_part2;
+
+	aspeed_pwm_write(priv->base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_duty_rising(struct aspeed_pwm_port_data *priv, u8 rising)
+{
+	u8 pwm_port = priv->pwm_port;
+
+	u32 reg_offset = pwm_port_params[pwm_port].duty_ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(priv->base, reg_offset);
+
+	reg_value &= ~(0xFF << pwm_port_params[pwm_port].duty_ctrl_rise_point);
+
+	if (pwm_port_params[pwm_port].duty_ctrl_calc_type == 0) {
+		reg_value |= rising;
+	} else if (pwm_port_params[pwm_port].duty_ctrl_calc_type == 1) {
+		reg_value |= (rising <<
+			     pwm_port_params[pwm_port].duty_ctrl_rise_point);
+	}
+
+	aspeed_pwm_write(priv->base, reg_value, reg_offset);
+}
+
+static void
+aspeed_set_pwm_duty_falling(struct aspeed_pwm_port_data *priv, u8 falling)
+{
+	u8 pwm_port = priv->pwm_port;
+
+	u32 reg_offset = pwm_port_params[pwm_port].duty_ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(priv->base, reg_offset);
+
+	reg_value &= ~(0xFF << pwm_port_params[pwm_port].duty_ctrl_fall_point);
+	reg_value |= (falling <<
+		     pwm_port_params[pwm_port].duty_ctrl_fall_point);
+
+	aspeed_pwm_write(priv->base, reg_value, reg_offset);
+}
+
+static u8
+aspeed_get_pwm_clock_unit(struct aspeed_pwm_port_data *priv, u8 pwm_clock_type)
+{
+	u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
+	u32 reg_value = aspeed_pwm_read(priv->base, reg_offset);
+	u8 period;
+
+	reg_value &= pwm_clock_type_params[pwm_clock_type].unit_mask;
+	period = reg_value >> pwm_clock_type_params[pwm_clock_type].unit_value;
+
+	return period;
+}
+
+static void
+aspeed_set_pwm_fan_ctrl(struct aspeed_pwm_port_data *priv, u8 fan_ctrl)
+{
+	u16 period;
+	u16 dc_time_on;
+
+	period = aspeed_get_pwm_clock_unit(priv, priv->pwm_type);
+	period += 1;
+	dc_time_on = (fan_ctrl * period) / PWM_MAX;
+
+	if (dc_time_on == 0) {
+		aspeed_set_pwm_enable(priv, 0);
+	} else {
+		if (dc_time_on == period)
+			dc_time_on = 0;
+
+		aspeed_set_pwm_duty_rising(priv, 0);
+		aspeed_set_pwm_duty_falling(priv, dc_time_on);
+		aspeed_set_pwm_enable(priv, 1);
+	}
+}
+
+static ssize_t
+set_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
+		size_t count)
+{
+	struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
+	u8 fan_ctrl;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &fan_ctrl);
+	if (ret)
+		return -EINVAL;
+
+	if (fan_ctrl < 0 || fan_ctrl > PWM_MAX)
+		return -EINVAL;
+
+	if (priv->pwm_fan_ctrl == fan_ctrl)
+		return count;
+
+	priv->pwm_fan_ctrl = fan_ctrl;
+	aspeed_set_pwm_fan_ctrl(priv, fan_ctrl);
+
+	return count;
+}
+
+static ssize_t
+show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", priv->pwm_fan_ctrl);
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
+static int
+aspeed_create_pwm_port(struct device *dev, struct device_node *child,
+		void __iomem *base)
+{
+	struct device *hwmon;
+	u8 val;
+	struct aspeed_pwm_port_data *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	hwmon = devm_hwmon_device_register_with_groups(dev, "aspeed_pwm",
+						      priv, pwm_dev_groups);
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
+	aspeed_set_pwm_enable(priv, val);
+
+	of_property_read_u8(child, "pwm_type", &val);
+	priv->pwm_type = val;
+	aspeed_set_pwm_type(priv, val);
+
+	of_property_read_u8(child, "pwm_fan_ctrl", &val);
+	priv->pwm_fan_ctrl = val;
+	aspeed_set_pwm_fan_ctrl(priv, val);
+
+	return 0;
+}
+
+/*
+ * If the clock type is type M then :
+ * The PWM frequency = 24MHz / (type M clock division L bit *
+ * type M clock division H bit * (type M PWM period bit + 1))
+ * Calculate type M clock division L bit and H bits given the other values
+ */
+static bool
+set_clock_values(u32 pwm_frequency, u32 period, u8 type, void __iomem *base)
+{
+	u32 src_frequency = 24000000;
+	u32 divisor = src_frequency / pwm_frequency;
+	u32 clock_divisor = divisor / (period + 1);
+	u32 tmp_clock_divisor;
+	u8 low;
+	u8 high;
+	u32 calc_high;
+	u32 calc_low;
+
+	for (high = 0; high <= MAX_HIGH_LOW_BIT; high += 1) {
+		for (low = 0; low <= MAX_HIGH_LOW_BIT; low += 1) {
+			calc_high = 0x1 << high;
+			calc_low = (low == 0 ? 1 : (2 * low));
+			tmp_clock_divisor = calc_high * calc_low;
+			if (tmp_clock_divisor >= clock_divisor)
+				goto set_value;
+		}
+	}
+
+	return false;
+
+set_value:
+	aspeed_set_pwm_clock_division_h(base, type, high);
+	aspeed_set_pwm_clock_division_l(base, type, low);
+	aspeed_set_pwm_clock_unit(base, type, period);
+
+	return true;
+}
+
+static int
+aspeed_pwm_probe(struct platform_device *pdev)
+{
+	u32 period;
+	struct device_node *np, *child;
+	struct resource *res;
+	void __iomem *base;
+	bool success;
+	struct clk *typem_clk, *typen_clk, *typeo_clk;
+	u32 pwm_typem_freq, pwm_typen_freq, pwm_typeo_freq;
+	int err;
+
+	np = pdev->dev.of_node;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL)
+		return -ENOENT;
+
+	base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!base)
+		return -ENOMEM;
+
+	/* Enable PWM clock */
+	aspeed_set_pwm_clock_enable(base, 1);
+	/* Select clock source as 24MHz */
+	aspeed_set_pwm_clock_source(base, 0);
+
+	typem_clk = of_clk_get(np, 0);
+	if (!IS_ERR(typem_clk))
+		pwm_typem_freq = clk_get_rate(typem_clk);
+	else
+		return -EINVAL;
+
+	typen_clk = of_clk_get(np, 1);
+	if (!IS_ERR(typen_clk))
+		pwm_typen_freq = clk_get_rate(typen_clk);
+
+	typeo_clk = of_clk_get(np, 2);
+	if (!IS_ERR(typeo_clk))
+		pwm_typeo_freq = clk_get_rate(typeo_clk);
+
+	err = of_property_read_u32(np, "pwm_typem_period", &period);
+	if (!err) {
+		success = set_clock_values(pwm_typem_freq, period, TYPEM, base);
+		if (!success)
+			return -EINVAL;
+	} else {
+		return -EINVAL;
+	}
+
+	err = of_property_read_u32(np, "pwm_typen_period", &period);
+	if (!err) {
+		success = set_clock_values(pwm_typen_freq, period, TYPEN, base);
+		if (!success)
+			return -EINVAL;
+	}
+
+	err = of_property_read_u32(np, "pwm_typeo_period", &period);
+	if (!err) {
+		success = set_clock_values(pwm_typeo_freq, period, TYPEO, base);
+		if (!success)
+			return -EINVAL;
+	}
+
+	for_each_child_of_node(np, child) {
+		aspeed_create_pwm_port(&pdev->dev,
+				child, base);
+		of_node_put(child);
+	}
+	of_node_put(np);
+
+	return 0;
+}
+
+static const struct of_device_id of_pwm_match_table[] = {
+	{ .compatible = "aspeed,ast2400-pwm", },
+	{ .compatible = "aspeed,ast2500-pwm", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_match_table);
+
+static struct platform_driver aspeed_pwm_driver = {
+	.probe		= aspeed_pwm_probe,
+	.driver		= {
+		.name	= "aspeed_pwm",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_pwm_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pwm_driver);
+
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("ASPEED PWM device driver");
+MODULE_LICENSE("GPL");
--
2.8.0.rc3.226.g39d4020
