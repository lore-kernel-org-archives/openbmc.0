Return-Path: <jaghu@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tM3Gz4MTkzDvs1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kHP77fOL"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id 3so118987634pgd.0
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UYCaiA14F4pp41My3jfrPlQrzj+fAapzw3u7uyV84U8=;
 b=kHP77fOLi8XR82mVQLftg66AamtRbmgxIL8BwMNyqd0EsWFf4WoCM7ztO2gzeqnARy
 IXN5Izl++n4t/Nx7LD+kjyRkdgT0LE5y232h5onKdpvgi90umJT2C33f2Ymh2wTzhEon
 09doFxtRvu2+mW+8jCde1r5Z5Im6lBDBAff8bFeW3pfCpTmiHSlF5533rag1ZsR9cQEJ
 7J1m8rAzQ1yVFl1klch9vEQ6/AjkoHTC5OjrzKMUPsRmrOHHcXkK/BuHBX30xJzCSF5i
 jSJdimEAcQQPCYdVvG1xXG83l9xs+zwt1HVke4txPcdUSB06L2GfkXw/Sz7ZZ/GB7uXb
 T7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UYCaiA14F4pp41My3jfrPlQrzj+fAapzw3u7uyV84U8=;
 b=fCmFuNmqfZ0K1/zhQphwbisbGSoLF2HhllLbOZIX1vaS144Wj4GVfyfS2V9T6zkkLm
 TMGQtTjObMSIGn9QkxJHVPvcVkpuvz8HavC/Q/74qwfj2aAEuKD27Q6fqsRs/dOIf3sj
 0mFwX4Ti2G+dUgGOP/ywlCw/9ySgZVW63+qiFYpdPTO9JCnaxE+pojCBHJIw8c4BBN6b
 x+gaw0hPd4P2lZelk4d/Tep5TKEFWigM9W/AbtCLRkJ4N34fL5RCMTmhHx/PFngd+oH9
 Zwfuhbo4ahv2n/jr6X0KhtgmsQNckEGC1MhhaRGWQvwsGJ3CsA9jwxMO1dg9IDSCbzcz
 xtbQ==
X-Gm-Message-State: AKaTC038F0lGEfHSTsnpAcSvObYElS1c3r2A4v6pSLVf2q4ATdP/fvqBJYvTKYD6KlOHvlPi
X-Received: by 10.99.196.70 with SMTP id m6mr18267307pgg.118.1479626872311;
 Sat, 19 Nov 2016 23:27:52 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id r2sm28825975pfi.67.2016.11.19.23.27.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 19 Nov 2016 23:27:51 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 3/4] drivers: misc: Platform driver for seven segment
 display support
Date: Sat, 19 Nov 2016 23:27:35 -0800
Message-Id: <1479626856-18511-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479626856-18511-1-git-send-email-jaghu@google.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Sun, 20 Nov 2016 07:27:56 -0000

Platform device driver which provides an API for displaying on two
7-segment displays, and implements the required bit-banging.
The hardware assumed is 74HC164 wired to two 7-segment displays.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Renamed driver as suggested by Rick, Xo, Joel
- Moved static data members to a struct and used platform_set_drvdata
-  to save the struct as suggested by Rick, Xo
- Moved the conversion logic(string to LED pattern) to the seven segment
-  display driver(character device driver) as suggested by Rick
- Included a device tree property for display refresh interval as suggested
-  by Xo
- Made the delay value used in udelay as a constant as suggested by Xo
- Included copyright header as suggested by Joel
- Corrected the style for multi-line comments as suggested by Joel
- Dropped the @param/@return annotations as suggested by Joel
- Removed obvious comments as suggested by Joel
- Used del_timer_sync as suggested by Joel

v3:
- Included API for clearing display as suggested by Rick

v4:
- Included changelog entry as suggested by Joel

v5:
- Corrected the style of multi-line comments as suggested by Joel
- Removed the name of driver from the top of file as suggested by Joel
- Added GPL version 2 or later as suggested by Joel
- Removed the variable which was used to indicate if
-  the user has given a valid display data; instead send data as 0(which
-  does not make the LED light up) before the user gives valid data;
-  after user gives valid data, send the valid data. Also removed the
-  mutex logic

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
