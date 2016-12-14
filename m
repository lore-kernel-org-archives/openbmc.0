Return-Path: <jaghu@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdpmX1NtQzDw4y
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 18:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l5lbggBt"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id x23so5574889pgx.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 23:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7e7jcY3E9DPzBqT1R4QxMZ0VGbnZf6MA65dDooa6HEc=;
 b=l5lbggBt5xCw79HNPk/VZ53rzZlR7BOuvrqSizPf/xrL+fyZ8F/h3jKpdadNSJMDKB
 bRbVE9Z7HAPelCxcuS112WagSxKT+7beKKdxo6WWmUnXaVzEiWMSZnbKDj4+TXd7wqWK
 HqXQdiGsfNWmiO3Sw/rN7rnRuFoyRlXr+6z6JS2C7EE3IROBdkRxN1TMM/FxGO2M6+8R
 LfnlBwanMnsx8NMCmSPXJt66UjcCnsx6R/UAipnGygA3IhqP8Q/dKarokB+iWYdQOpni
 QzB4YFnoBBe0hSGVDt+w5lkDuJfoeCSI2WQkeV+OuJ7gaNn+h02BSb7K4byvIr3JsbQ1
 5QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7e7jcY3E9DPzBqT1R4QxMZ0VGbnZf6MA65dDooa6HEc=;
 b=QWvaaSypjjd+Djx1RmauKK1IsaWKNXujBZZue26oQlqDEg85gUrjvt1e14b96Jny11
 0RslZLNf9CL1ghDSSkVL9ys8eF64mHvyOmwH9r6lnT3svbvogIazh2Uq6a8MkE+DWwGp
 TkSVMkpGl54/aQVEPqhXjwmx4Ecc+M8td3nU3pn7Vf2rPsS+dFH3p3cfgYXX6hF4h/Jz
 UdYhTtQI3Qxbj1FjO0+l7F5LnCjQQU4Ok5LMK/Slxfd3XvO7WKRwxhqh/mLQg6BKQuYl
 bryC1ru4GZSsIaeU9xCJYDcqzv8Nggms1Bcm0OEfdV/Knk2CQMNLOOII2y+I0YXV+Rk9
 dTTg==
X-Gm-Message-State: AKaTC01bvdd2UN59CSvLN/v7ttbYLGVor1BALPXuECeCN7XTqAi++Rarfn0WuoOsFTvUrWyp
X-Received: by 10.84.216.10 with SMTP id m10mr205502894pli.131.1481702170392; 
 Tue, 13 Dec 2016 23:56:10 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y134sm84845071pfg.81.2016.12.13.23.56.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Dec 2016 23:56:09 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: [PATCH linux v1 3/4] drivers: misc: Platform driver for seven segment
 display support
Date: Tue, 13 Dec 2016 23:55:03 -0800
Message-Id: <1481702104-8617-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 14 Dec 2016 07:56:12 -0000

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
index a21aec1..6508108 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -812,6 +812,14 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.

+config SEVEN_SEGMENT_GPIO
+	tristate "Platform driver to update seven segment display"
+	depends on SEVEN_SEGMENT_DISPLAY
+	help
+	  Platform device driver which provides an API for displaying on two
+	  7-segment displays, and implements the required bit-banging.
+	  The hardware assumed is 74HC164 wired to two 7-segment displays.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c2defbd..d9c0d20 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -58,3 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_SEVEN_SEGMENT_DISPLAY)	+= seven_seg_disp.o
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_SEVEN_SEGMENT_GPIO)	+= seven_seg_gpio.o
diff --git a/drivers/misc/seven_seg_gpio.c b/drivers/misc/seven_seg_gpio.c
new file mode 100644
index 0000000..3dcb903
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
2.8.0.rc3.226.g39d4020
