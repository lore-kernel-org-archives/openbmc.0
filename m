Return-Path: <jaghu@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7B0g70rhzDvNS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 10:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=cKtZr/xu; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id 189so30973245pfz.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bK23gnYWMnlZ4ggAVA3zAjcWEmLR6tS+3QKZnaW7yMs=;
 b=cKtZr/xuNZFSMUpjYmahjl2JSYhREGbhcIRJiqJiYxL0G0ivi0/IculqsxXG+4VSmL
 aJj4lNFRbNA613UQTSMmBox/NC+3RtXWoX7ckxNOEVUZ7yxcGT/esGm179FQ0ReGcpE+
 AZWEW8LO7c/asN9X3wZPIx3Jr6vypNlFKs6E+kWmqmsVJdJOSO28BCAF+JvClrikGnXR
 D54uVyij2Gu08cfQXbJPd2CMdumuXHfFNV4WQfwBatAP8SKWtb3YzXDyJAgCGidWlfLx
 Ifw44W8S1O1o2Drqwb2Yq9En1ACgwe9gsz2piGC6F1S9rfEZVVLvTtSjeDs7KFMG0+kg
 crmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bK23gnYWMnlZ4ggAVA3zAjcWEmLR6tS+3QKZnaW7yMs=;
 b=a+hBcoMoPXH3MLUMIEZnms+fArZgyXyYZpTUXiFCNJ42kePNKtvBmK+yTWWBc6WLVY
 O5Fi9hElkwM8deju+/E2xX+DxaUSqG1j09nkFHJEdyIs/ayMLXe2vOcJCTCmhvg5vBd2
 ZbCFBpWQ+tD6mOMKnM39oO/oR0JidrZ68CEE6GK/JhdBKWFdN7REPPzzNYLV09jPfoJx
 s1yiprEw3AMIvAHeHPz8FV/pX4UBASWfMW72Y86LYw42DAiicBAnTRHeA7a60pEoHwvf
 7U3+Tjdt+eF3/sb5kVJSrfPzpo2ov/kqx49oHsEu7LfWc7R+pAcBvh74+DuT/raU1fI8
 xnOw==
X-Gm-Message-State: ABUngvd5MhT121EJwURyznjbo5edTGIP3uIUNQdgdrv4yFkhDXQ306rSjqPUkykrmgH2FPgC
X-Received: by 10.98.37.198 with SMTP id l189mr53896839pfl.39.1477957762141;
 Mon, 31 Oct 2016 16:49:22 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v84sm37824374pfd.91.2016.10.31.16.49.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 31 Oct 2016 16:49:21 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 2/3] drivers: misc: Platform driver for seven segment
 display
Date: Mon, 31 Oct 2016 16:49:11 -0700
Message-Id: <1477957752-4831-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477957752-4831-1-git-send-email-jaghu@google.com>
References: <1477957752-4831-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 23:49:24 -0000

Platform driver provides an API for displaying on a 7-segment display,
and implements the required bit-banging.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../bindings/misc/seven_segment_disp.txt           |  23 +++
 drivers/misc/Kconfig                               |   7 +
 drivers/misc/Makefile                              |   2 +
 drivers/misc/seven_seg_gpio.c                      | 225 +++++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven_segment_disp.txt
 create mode 100644 drivers/misc/seven_seg_gpio.c

diff --git a/Documentation/devicetree/bindings/misc/seven_segment_disp.txt b/Documentation/devicetree/bindings/misc/seven_segment_disp.txt
new file mode 100644
index 0000000..9c01b97
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/seven_segment_disp.txt
@@ -0,0 +1,23 @@
+Seven segment display support connected to GPIO lines
+
+Required properties:
+- compatible : should be "seven-seg-gpio-dev".
+- clock-gpios :  Should specify the GPIO pin connected to the Clock line on the hardware.
+- data-gpios : Should specify the GPIO pin connected to Data line on the hardware.
+- clear-gpios : Should specify the GPIO pin connected to Clear line on the hardware.
+
+Optional properties:
+- refresh-interval-ms : The interval at which to refresh the display.
+  If this property is not present, the default value is 1000.
+
+Examples:
+
+#include <dt-bindings/gpio/gpio.h>
+
+seven-seg-disp {
+	compatible = "seven-seg-gpio-dev";
+	refresh-interval-ms = "1000";
+	clock-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+	data-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+	clear-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+};
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index cf07817..7adb9e3 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -814,6 +814,13 @@ config ASPEED_BT_IPMI_HOST
 	help
 	  Support for the Aspeed BT ipmi host.

+config SEVEN_SEGMENT_GPIO
+	tristate "Platform driver to update seven segment display"
+	depends on SEVEN_SEGMENT_DISPLAY
+	help
+	  Support to periodically update display on two seven segment displays.
+	  The hardware assumed is 74HC164 wired to two seven segment displays.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index f2072b1..dddde19 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,5 @@ obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
 obj-$(SEVEN_SEGMENT_DISPLAY)	+= seven_seg_disp.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
+obj-$(SEVEN_SEGMENT_GPIO)	+= seven_seg_gpio.o
+
diff --git a/drivers/misc/seven_seg_gpio.c b/drivers/misc/seven_seg_gpio.c
new file mode 100644
index 0000000..e4c9ac6
--- /dev/null
+++ b/drivers/misc/seven_seg_gpio.c
@@ -0,0 +1,225 @@
+/*
+ * Platform driver to periodically update two 7-segment LED
+ *  * displays. Hardware assumed is 74HC164 shift register wired to two
+ *  * 7-segment LED displays.
+ *  *
+ *  * Copyright (C) 2016 Google, Inc
+ *  *
+ *  * This program is free software; you can redistribute it and/or modify
+ *  * it under the terms of the GNU General Public License version 2 as
+ *  * published by the Free Software Foundation.
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
+	u8 disp_data_valid;
+	u16 curr_disp_value;
+	u16 refresh_interval;
+	struct mutex mutex;
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
+		pr_err("invalid NULL vpu_subdev_data\n");
+		return;
+	}
+
+	mutex_lock(&gpio_info->mutex);
+	gpio_info->curr_disp_value = data;
+	gpio_info->disp_data_valid = 1;
+	mutex_unlock(&gpio_info->mutex);
+
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
+		pr_err("invalid NULL vpu_subdev_data\n");
+		return;
+	}
+	mutex_lock(&gpio_info->mutex);
+	gpio_info->disp_data_valid = 0;
+	mutex_unlock(&gpio_info->mutex);
+
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
+		if (disp_data & 0x01) {
+			gpiod_set_value(gpio_info->data_gpio, 1);
+		} else {
+			gpiod_set_value(gpio_info->data_gpio, 0);
+		}
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
+	u8 valid = 0;
+	u16 disp_data;
+	struct seven_seg_gpio_info *gpio_info =
+		(struct seven_seg_gpio_info *)data;
+	mutex_lock(&gpio_info->mutex);
+	if (gpio_info->disp_data_valid) {
+		valid = 1;
+		disp_data = gpio_info->curr_disp_value;
+	}
+	mutex_unlock(&gpio_info->mutex);
+
+	if (valid)
+		send_seven_seg_gpio_data(disp_data, gpio_info);
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
+	gpio_info->refresh_interval = result ? DEFAULT_REFRESH_INTERVAL :
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
+	mutex_init(&gpio_info->mutex);
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
