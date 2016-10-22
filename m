Return-Path: <kunyi@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t13l54jHHzDvd2
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 11:46:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=NR7KR6xY; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id s8so65251918pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2iS80TzsOrF49vSea82HWdXf4AwuWhM8boJNyVfHTHo=;
 b=NR7KR6xYmm40SUoPtjxrXxzMZ+tM95qF8js7jF9CGcC4yhAPt/iNF6JO4PLi58NKDY
 NDn+7L5UVobXif/91wDaG06f7mDq4gyOJdGBa9RAMWRjTGP06RgAb1XScMUeV2pL86o4
 TMMretW1/bL1+o483DsClogF52VuKSKouWeqeT++nHEE6fHXMJfZpr+oEFmCP32sU7JR
 Eeiyw+vdaiwfY2H7UVtP3SzFQa4K9U6VRC1qETIRSLDp6myugR/76x6tCi6WPJMUshgj
 GQsaa7NGokVrEUWkyT9m6V8n6hjue8pzWecGIHG4EZ7HVGj69VqrDgG9A90xdlX/vR1U
 Nahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2iS80TzsOrF49vSea82HWdXf4AwuWhM8boJNyVfHTHo=;
 b=OfrR41NNB67hhYgRz0R65vY0jomaYDlTJnFtjW1pPxZH1UtJxQMmJwQT6e7vjIYq2e
 dvSSx6tIft0clmpyks0ZqSHVcJH4oVS+eJ/aznZDWfZ37j2ENhOkAocUhLmnBPAMkMn/
 6S8nweOJkvF1ZWLpHkpTFmX6AVLl7wUKDNJ+w85Z56da3SEhwk3U/o7axzUJ2tLHKYwC
 rblLZQCbbi7OFXYKBSF/aROdPZXKuzQIy6YkvNvQP8W47IG853pC9CBg3yAGtauvUCdd
 Y0XUY2qySCHu71jCKm5RBQQ/uoPNb9ijDexUh6FaIaP/Y7gs3uHffRKoo+uxbG/5G89r
 zSOw==
X-Gm-Message-State: ABUngvfe8B9quyVy9y0Lo6GW4XNO4pNdQveBrQ3HWFhyjNQaNrfQlT8tzK/BhAvj8IPAjpJY
X-Received: by 10.99.110.201 with SMTP id j192mr5372146pgc.133.1477097183847; 
 Fri, 21 Oct 2016 17:46:23 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id yk6sm7682599pab.43.2016.10.21.17.46.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Oct 2016 17:46:23 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org
Cc: kunyi@google.com,
	brendanhiggins@google.com,
	clg@kaod.org
Subject: [RFC 1/2] spi: aspeed: ASPEED 24XX/25XX SPI1
 disable/passthrough/master mode control
Date: Fri, 21 Oct 2016 17:45:57 -0700
Message-Id: <1477097158-139095-2-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477097158-139095-1-git-send-email-kunyi@google.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
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
X-List-Received-Date: Sat, 22 Oct 2016 00:46:26 -0000

Simple driver that exposes userspace sysfs to control SPI1 mode. It also
optionally override initial SPI mode if given "start_mode" parameter in
the device tree.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/misc/Kconfig           |   6 ++
 drivers/misc/Makefile          |   1 +
 drivers/misc/aspeed-spi-mode.c | 191 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 drivers/misc/aspeed-spi-mode.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4617ddc..ea9b713 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -809,6 +809,12 @@ config ASPEED_BT_IPMI_HOST
 	help
 	  Support for the Aspeed BT ipmi host.
 
+config SPI_MODECTRL_ASPEED
+        tristate "Support for SPI1 host flash mode change on Aspeed 24xx/25xx"
+        ---help---
+          Support for the Aspeed 24xx/25xx sysfs control toggle between
+	  disabled/master/pass-through modes.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 724861b..0cce3d6 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -58,3 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
+obj-$(CONFIG_SPI_MODECTRL_ASPEED)	+= aspeed-spi-mode.o
diff --git a/drivers/misc/aspeed-spi-mode.c b/drivers/misc/aspeed-spi-mode.c
new file mode 100644
index 0000000..20f7754
--- /dev/null
+++ b/drivers/misc/aspeed-spi-mode.c
@@ -0,0 +1,191 @@
+/*
+ * ASPEED host flash SPI1 mode controller driver.
+ *
+ * Copyright (c) 2016 Google Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+
+struct aspeed_spi_mode_controller {
+	struct mutex mutex;			/* controller access mutex */
+	void __iomem *hwstrap_regs;		/* controller registers */
+	void __iomem *hwstrap_reset;		/* scu reset registers */
+};
+
+/* SPI mode definitions. MODE_DEBUG is reserved on AST2500. */
+#define SPI_MODE_DISABLED	0
+#define SPI_MODE_MASTER		1
+#define SPI_MODE_DEBUG		2
+#define SPI_MODE_PASSTHROUGH	3
+/* SPI mode control bits in HW strap register */
+#define SPI_MODE_OFFSET		(12)
+#define SPI_MODE_MASK		(BIT(12) | BIT(13))
+/* Extract SPI mode from register value */
+#define SPI_MODE(reg)		((reg & SPI_MODE_MASK) >> SPI_MODE_OFFSET)
+
+static int aspeed_get_spi_mode(struct aspeed_spi_mode_controller *controller)
+{
+	u32 reg;
+
+	mutex_lock(&controller->mutex);
+	reg = readl(controller->hwstrap_regs);
+	mutex_unlock(&controller->mutex);
+
+	return SPI_MODE(reg);
+}
+
+/*
+ * Set SPI1 interface to given mode.
+ * Note SCU70 reg bits cannot be set to 0. Need to write to SCU7C in order to
+ * clear bits in SCU70.
+ */
+static int aspeed_set_spi_mode(struct aspeed_spi_mode_controller *controller,
+			       unsigned int mode)
+{
+
+	if (mode != SPI_MODE_DISABLED &&
+	    mode != SPI_MODE_MASTER &&
+	    mode != SPI_MODE_PASSTHROUGH) {
+		return -EPERM;
+	}
+
+	void __iomem *regs;
+	void __iomem *regs_reset;
+	u32 val;
+
+	regs = controller->hwstrap_regs;
+	regs_reset = controller->hwstrap_reset;
+	mutex_lock(&controller->mutex);
+	val = readl(regs);
+
+	if (SPI_MODE(val) == mode)
+		goto finish;
+
+	/* Reset bit 13:12 and set to new value */
+	writel(SPI_MODE_MASK, regs_reset);
+	val &= ~SPI_MODE_MASK;
+	val |= (mode << SPI_MODE_OFFSET);
+	writel(val, regs);
+
+	pr_debug("HW strap register set to 0x%x\n", readl(regs));
+
+finish:
+	mutex_unlock(&controller->mutex);
+	return 0;
+}
+
+static ssize_t aspeed_spi_mode_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct aspeed_spi_mode_controller *controller;
+
+	controller = dev_get_drvdata(dev);
+	return scnprintf(buf, PAGE_SIZE, "%d\n",
+			 aspeed_get_spi_mode(controller));
+}
+
+static ssize_t aspeed_spi_mode_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct aspeed_spi_mode_controller *controller = dev_get_drvdata(dev);
+	unsigned long mode;
+	int err;
+
+	err = kstrtoul(buf, 10, &mode);
+	if (err)
+		return err;
+
+	err = aspeed_set_spi_mode(controller, mode);
+
+	if (err) {
+		dev_err(dev, "Support disabled(0) master(1) pass-through(3)");
+		return err;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(spi_mode, S_IRUSR | S_IWUSR, aspeed_spi_mode_show,
+		   aspeed_spi_mode_store);
+
+
+static const struct of_device_id aspeed_spi_mode_match[] = {
+	{ .compatible = "aspeed,aspeed_spi_mode" },
+	{},
+}
+MODULE_DEVICE_TABLE(of, aspeed_spi_mode_match);
+
+static int aspeed_spi_mode_probe(struct platform_device *pdev)
+{
+	struct aspeed_spi_mode_controller *controller;
+	struct resource *r;
+	void __iomem *regs, *regs_reset;
+	u32 mode;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	regs_reset = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(regs_reset))
+		return PTR_ERR(regs_reset);
+
+	controller = devm_kzalloc(&pdev->dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, controller);
+	controller->hwstrap_regs = regs;
+	controller->hwstrap_reset = regs_reset;
+	mutex_init(&controller->mutex);
+
+	if (!of_property_read_u32(pdev->dev.of_node, "start_mode", &mode)) {
+		int err;
+
+		err = aspeed_set_spi_mode(controller, mode);
+		if (!err)
+			dev_info(&pdev->dev, "Set SPI mode to %d\n", mode);
+	}
+
+	if (device_create_file(&pdev->dev, &dev_attr_spi_mode) != 0)
+		dev_err(&pdev->dev, "Sysfs attribute creation failed");
+
+	dev_info(&pdev->dev, "ASPEED spi mode controller initialized");
+
+	return 0;
+}
+
+static int aspeed_spi_mode_remove(struct platform_device *pdev)
+{
+	device_remove_file(&pdev->dev, &dev_attr_spi_mode);
+	return 0;
+}
+
+static struct platform_driver aspeed_spi_mode_driver = {
+	.probe = aspeed_spi_mode_probe,
+	.remove = aspeed_spi_mode_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_spi_mode_match,
+	}
+};
+
+module_platform_driver(aspeed_spi_mode_driver);
+
+MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
+MODULE_DESCRIPTION("ASPEED SPI mode controller");
+MODULE_LICENSE("GPL v2");
-- 
2.8.0.rc3.226.g39d4020
