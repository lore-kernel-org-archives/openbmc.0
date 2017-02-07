Return-Path: <jaghu@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHW1P68jQzDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 15:04:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rpMOkGcP"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id f144so29392376pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 20:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hsWDKqcZCp6+T9frJvTNx2sj+zaAOid//2SB0OnrWso=;
 b=rpMOkGcPZcrk871wjkdY+4iXrpy7Tzb6Q2TKM7dCnIaL36nRdO3rR8CQniMSkn5eFF
 hS1Jh8Ht4fbHXgnXXuyukmd1OPsd7qyHCtEK82C5rlfw+tINqPgzmVBjBiOwakuDxSZl
 VGh5i6IsLciDhv3mX7AQ4pJAcyRxV5G0nKaXY+m51je1ukZ2TPF/E/Amu0BCGgMrydSa
 bMnWmtxhhJwT5LoqsAKHPggDDloWc3XSAblXz+M2RvF7Z1x3oVL0two0GOF72PgNgnrb
 8n27LSWgCLcicC2vF7+eaPIqWTSXu3yqVp6u1kcyFOADkbSEVHUVd1dTp4ip4M80ZKTg
 4jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hsWDKqcZCp6+T9frJvTNx2sj+zaAOid//2SB0OnrWso=;
 b=LFE4fUkU9ZLXnRVERkQKpDkQ0L2YbqtpHl41P2kX16IK9V4VMI0RZwLiZA/4tcBig/
 9rfDR3XGXpQd90OuokE8aRmZlPvmExlV9G9XtEW1wcHezfkc7dMnYhTWQwRJB4UnyEK4
 6QykODTR/rNHSEi8G+CsGR4WjJ6TAQ3qABXqLJJRH3YFud59dF91Ei83VSu56F+bkQX/
 QtzLVGqfPwQSkWQz0lFujRnXemW5nE3u5d90yBGUFjMh2s2qTS9ze4Cr1MGyXm2Zva4Z
 7KfWUo8qaukuz16vVLLTKF0kYzLgHYoyRpofDGwTiYwDksndWXc+0UUtCJeB5HkZHofW
 vZpQ==
X-Gm-Message-State: AIkVDXLkPqtTOWpEvN5JVpb5ihEozUE1ypX0/G+Jr2wap9fikWjvZERwyYfSNUpkWeKEsW2q
X-Received: by 10.98.10.69 with SMTP id s66mr17276381pfi.146.1486440247028;
 Mon, 06 Feb 2017 20:04:07 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p25sm6289384pfd.0.2017.02.06.20.04.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 Feb 2017 20:04:05 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 3/4] drivers: misc: Platform driver for seven segment
 display support
Date: Mon,  6 Feb 2017 20:03:55 -0800
Message-Id: <20170207040356.9891-4-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
In-Reply-To: <20170207040356.9891-1-jaghu@google.com>
References: <20170207040356.9891-1-jaghu@google.com>
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
X-List-Received-Date: Tue, 07 Feb 2017 04:04:10 -0000

Platform device driver which provides an API for displaying on two
7-segment displays, and implements the required bit-banging.
The hardware assumed is 74HC164 wired to two 7-segment displays.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/misc/Kconfig          |   8 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/seven_seg_gpio.c | 206 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 drivers/misc/seven_seg_gpio.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4a221c1667c1..c2914476e49e 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -820,6 +820,14 @@ config ASPEED_LPC_CTRL
 	  through ioctl()s, the driver aso provides a read/write interface to a
 	  BMC ram region where host LPC read/write region can be buffered.

+config SEVEN_SEGMENT_GPIO
+        tristate "Platform driver to update seven segment display"
+        depends on SEVEN_SEGMENT_DISPLAY
+        help
+          Platform device driver which provides an API for displaying on two
+          7-segment displays, and implements the required bit-banging.
+          The hardware assumed is 74HC164 wired to two 7-segment displays.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 5ac8b2637174..463798e395f1 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
 obj-$(CONFIG_SEVEN_SEGMENT_DISPLAY)     += seven_seg_disp.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
+obj-$(CONFIG_SEVEN_SEGMENT_GPIO)        += seven_seg_gpio.o
diff --git a/drivers/misc/seven_seg_gpio.c b/drivers/misc/seven_seg_gpio.c
new file mode 100644
index 000000000000..3dcb9034e263
--- /dev/null
+++ b/drivers/misc/seven_seg_gpio.c
@@ -0,0 +1,206 @@
+/*
+ * Copyright (C) 2016 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or later as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/sizes.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/uaccess.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/gpio/consumer.h>
+
+#include "seven_seg_disp.h"
+
+#define DELAY_INTVL_US 1
+
+#define CLOCK_GPIO_NAME "clock"
+#define DATA_GPIO_NAME "data"
+#define CLEAR_GPIO_NAME "clear"
+
+struct seven_seg_gpio_info {
+	u16 curr_disp_value;
+	u16 refresh_interval;
+	struct timer_list update_timer;
+	struct gpio_desc *clock_gpio;
+	struct gpio_desc *data_gpio;
+	struct gpio_desc *clear_gpio;
+};
+
+static void update_seven_seg_gpio_data(struct device *dev, u16 data)
+{
+	struct platform_device *pdev;
+	struct seven_seg_gpio_info *gpio_info;
+
+	pdev = container_of(dev, struct platform_device, dev);
+	if (pdev == NULL) {
+		pr_err("invalid NULL platform_device\n");
+		return;
+	}
+
+	gpio_info = platform_get_drvdata(pdev);
+	if (gpio_info == NULL) {
+		pr_err("invalid NULL gpio_info\n");
+		return;
+	}
+
+	gpio_info->curr_disp_value = data;
+}
+
+static void clear_seven_seg_gpio_data(struct device *dev, u16 data)
+{
+	struct platform_device *pdev;
+	struct seven_seg_gpio_info *gpio_info;
+
+	pdev = container_of(dev, struct platform_device, dev);
+	if (pdev == NULL) {
+		pr_err("invalid NULL platform_device\n");
+		return;
+	}
+
+	gpio_info = platform_get_drvdata(pdev);
+	if (gpio_info == NULL) {
+		pr_err("invalid NULL gpio_info\n");
+		return;
+	}
+
+	gpio_info->curr_disp_value = 0;
+}
+
+static void send_seven_seg_gpio_data(u16 disp_data,
+		struct seven_seg_gpio_info *gpio_info)
+{
+	int i;
+
+	gpiod_set_value(gpio_info->clear_gpio, 0);
+	udelay(DELAY_INTVL_US);
+	gpiod_set_value(gpio_info->clear_gpio, 1);
+	udelay(DELAY_INTVL_US);
+
+	for (i = 0; i < 16; i++) {
+		if (disp_data & 0x01)
+			gpiod_set_value(gpio_info->data_gpio, 1);
+		else
+			gpiod_set_value(gpio_info->data_gpio, 0);
+
+		udelay(DELAY_INTVL_US);
+
+		gpiod_set_value(gpio_info->clock_gpio, 0);
+		udelay(DELAY_INTVL_US);
+		gpiod_set_value(gpio_info->clock_gpio, 1);
+		udelay(DELAY_INTVL_US);
+
+		disp_data >>= 1;
+	}
+}
+
+static void disp_refresh_timer_handler(unsigned long data)
+{
+	u16 disp_data;
+	struct seven_seg_gpio_info *gpio_info =
+		(struct seven_seg_gpio_info *)data;
+	disp_data = gpio_info->curr_disp_value;
+
+	send_seven_seg_gpio_data(disp_data, gpio_info);
+	mod_timer(&gpio_info->update_timer,
+		jiffies + msecs_to_jiffies(gpio_info->refresh_interval));
+}
+
+static const struct of_device_id of_seven_seg_gpio_match[] = {
+		{ .compatible = "seven-seg-gpio-dev" },
+		{},
+};
+
+MODULE_DEVICE_TABLE(of, of_seven_seg_gpio_match);
+
+static int seven_seg_gpio_probe(struct platform_device *pdev)
+{
+	u16 interval;
+	int result;
+	struct seven_seg_gpio_info *gpio_info;
+	struct device *dev = &pdev->dev;
+	struct seven_seg_disp_dev *disp_dev;
+
+	gpio_info = devm_kzalloc(dev,
+			sizeof(struct seven_seg_gpio_info),
+			GFP_KERNEL);
+	if (gpio_info == NULL)
+		return -ENOMEM;
+
+	/* Requesting the clock gpio */
+	gpio_info->clock_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio_info->clock_gpio))
+		return PTR_ERR(gpio_info->clock_gpio);
+
+	/* Requesting the data gpio */
+	gpio_info->data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio_info->data_gpio))
+		return PTR_ERR(gpio_info->data_gpio);
+
+	/* Requesting the clear gpio */
+	gpio_info->clear_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio_info->clear_gpio))
+		return PTR_ERR(gpio_info->clear_gpio);
+
+	result = of_property_read_u16(pdev->dev.of_node,
+		"refresh-interval-ms", &interval);
+	gpio_info->refresh_interval = result ? DEFAULT_REFRESH_INTERVAL_MS :
+		interval;
+
+	/* Start timer to update seven segment display every second */
+	setup_timer(&gpio_info->update_timer, disp_refresh_timer_handler,
+			(unsigned long)gpio_info);
+	result = mod_timer(&gpio_info->update_timer,
+			jiffies +
+			msecs_to_jiffies(gpio_info->refresh_interval));
+	if (result)
+		return result;
+
+	gpio_info->curr_disp_value = 0;
+
+	platform_set_drvdata(pdev, gpio_info);
+
+	disp_dev = devm_kzalloc(dev, sizeof(struct seven_seg_disp_dev),
+				GFP_KERNEL);
+	disp_dev->parent = *dev;
+	seven_seg_setup_cdev(disp_dev, &update_seven_seg_gpio_data);
+	return 0;
+}
+
+static int seven_seg_gpio_remove(struct platform_device *pdev)
+{
+	struct seven_seg_gpio_info *gpio_info = platform_get_drvdata(pdev);
+	struct seven_seg_disp_dev *disp_dev =
+				container_of(&pdev->dev,
+				struct seven_seg_disp_dev, parent);
+	seven_seg_rem_cdev(disp_dev);
+	del_timer_sync(&gpio_info->update_timer);
+	platform_set_drvdata(pdev, NULL);
+	return 0;
+}
+
+static struct platform_driver seven_seg_gpio_driver = {
+	.probe		= seven_seg_gpio_probe,
+	.remove		= seven_seg_gpio_remove,
+	.driver		= {
+		.name	= "seven-seg-gpio",
+		.of_match_table = of_seven_seg_gpio_match,
+	},
+};
+
+module_platform_driver(seven_seg_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("Seven segment display driver using GPIO config");
--
2.11.0.483.g087da7b7c-goog
