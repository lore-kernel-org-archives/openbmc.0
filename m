Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDlxn3D5WzDvhY
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ETTaG1uD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QSsLclpI"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6329120B61;
 Wed,  9 Nov 2016 20:36:11 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 09 Nov 2016 20:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=NaZ
 vBW0q2R6JAviEvUmjHn/ecI0=; b=ETTaG1uDDPPzHM0cwEDB6Rava9C1FOmYDbM
 n6lxCbdfcKDH6sbP2AO/37Eil6D++M1J4VOlzQZnjJjLQRznJRK/LJhx/YI2J2qp
 Er6bcpaNbBaWX8W4Quyi7KRuDStLum52iV+/HTh5HUwqv3Bi2XVyHiGRyH0DIoNt
 A0XFQfCY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=NaZvBW0q2R6JAviEvUmjHn/ecI0=; b=QSsLc
 lpISgkHtekpYDexWQuk4D1gdcgQAfkOcVVD8tQMvYA9ouhI+XJGfLuJqwK16bPv/
 ODJpueWxklAbPuIzkR2gChIlyPAADGL4Cvq7ZSoyhw8K4G/g23v2oRfi5LrNcKwA
 zNBVOw2timoAVluFQM+ZFZl4FN/42t/Qog7PaM=
X-ME-Sender: <xms:C88jWOWuolE66jlhU4iWhvOL9wK-bsgQ59pgn2QCrElMI-V6sfUHOw>
X-Sasl-enc: rhv24FVQfJK9487zhQWBRdJj4epfomrcr9wdT3y2dnE+ 1478741770
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B59C5F29CD;
 Wed,  9 Nov 2016 20:36:09 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 2/4] misc: Add partial Aspeed LPC Host Interface
 Control (HIC) driver
Date: Thu, 10 Nov 2016 12:05:54 +1030
Message-Id: <20161110013556.8542-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161110013556.8542-1-andrew@aj.id.au>
References: <20161110013556.8542-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Nov 2016 01:36:14 -0000

Exposes some of the LPC controller's host interface control registers in
sysfs, specifically HICR5-HICR8, HICR9-HICRA.  At the moment the
resource range also covers the SNPWADR and SNPWDR (LPC Snoop registers),
but they are not exposed in sysfs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/misc/Kconfig      |   7 ++
 drivers/misc/Makefile     |   1 +
 drivers/misc/aspeed-hic.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/misc/aspeed-hic.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 27327f44a709..1c5b9b2b26aa 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -58,6 +58,13 @@ config ASPEED_SCRSIO
 	  Select this if you wish to expose to userspace the SuperIO scratch
 	  registers in the LPC control space on an Aspeed BMC SoC.
 
+config ASPEED_HIC
+	bool "Support for Aspeed LPC Host Interface Control Registers"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	help
+	  Select this if you wish to expose to userspace the LPC Host Interface
+	  Control Registers on an Aspeed BMC SoC.
+
 config ATMEL_TCLIB
 	bool "Atmel AT32/AT91 Timer/Counter Library"
 	depends on (AVR32 || ARCH_AT91)
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 0bcd6ff61a12..b49051932471 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_IBM_ASM)		+= ibmasm/
 obj-$(CONFIG_AD525X_DPOT)	+= ad525x_dpot.o
 obj-$(CONFIG_AD525X_DPOT_I2C)	+= ad525x_dpot-i2c.o
 obj-$(CONFIG_AD525X_DPOT_SPI)	+= ad525x_dpot-spi.o
+obj-$(CONFIG_ASPEED_HIC)	+= aspeed-hic.o
 obj-$(CONFIG_ASPEED_SCRSIO)	+= aspeed-scrsio.o
 obj-$(CONFIG_INTEL_MID_PTI)	+= pti.o
 obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
diff --git a/drivers/misc/aspeed-hic.c b/drivers/misc/aspeed-hic.c
new file mode 100644
index 000000000000..d26b9daab126
--- /dev/null
+++ b/drivers/misc/aspeed-hic.c
@@ -0,0 +1,198 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define LPC_HICR5		0x0
+#define LPC_HICR6		0x4
+#define LPC_HICR7		0x8
+#define LPC_HICR8		0xc
+#define LPC_HICR9		0x18
+#define LPC_HICRA		0x1c
+
+struct aspeed_hic {
+	void __iomem *hicr5;
+};
+
+static ssize_t hic_store(void __iomem *base, int reg, const char *buf,
+		size_t len)
+{
+	int r;
+	u32 value;
+
+	r = kstrtou32(buf, 0, &value);
+	if (r)
+		return r;
+
+	iowrite32(value, base + reg);
+
+	return len;
+}
+
+ssize_t hic_show(void __iomem *base, int reg, char *buf)
+{
+	u32 value = ioread32(base + reg);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%08x\n", value);
+}
+
+static ssize_t hicr5_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICR5, buf, len);
+}
+
+static ssize_t hicr5_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICR5, buf);
+}
+DEVICE_ATTR_RW(hicr5);
+
+static ssize_t hicr6_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICR6, buf, len);
+}
+
+static ssize_t hicr6_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICR6, buf);
+}
+DEVICE_ATTR_RW(hicr6);
+
+static ssize_t hicr7_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICR7, buf, len);
+}
+
+static ssize_t hicr7_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICR7, buf);
+}
+DEVICE_ATTR_RW(hicr7);
+
+static ssize_t hicr8_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICR8, buf, len);
+}
+
+static ssize_t hicr8_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICR8, buf);
+}
+DEVICE_ATTR_RW(hicr8);
+
+static ssize_t hicr9_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICR9, buf, len);
+}
+
+static ssize_t hicr9_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICR9, buf);
+}
+DEVICE_ATTR_RW(hicr9);
+
+static ssize_t hicra_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_store(hic->hicr5, LPC_HICRA, buf, len);
+}
+
+static ssize_t hicra_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct aspeed_hic *hic = dev_get_drvdata(dev);
+
+	return hic_show(hic->hicr5, LPC_HICRA, buf);
+}
+DEVICE_ATTR_RW(hicra);
+
+static struct attribute *hic_attrs[] = {
+	&dev_attr_hicr5.attr,
+	&dev_attr_hicr6.attr,
+	&dev_attr_hicr7.attr,
+	&dev_attr_hicr8.attr,
+	&dev_attr_hicr9.attr,
+	&dev_attr_hicra.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(hic);
+
+static int __init aspeed_hic_probe(struct platform_device *pdev)
+{
+	struct aspeed_hic *hic;
+	struct resource *res;
+
+	hic = devm_kzalloc(&pdev->dev, sizeof(*hic), GFP_KERNEL);
+	if (!hic)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hic->hicr5 = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(hic->hicr5))
+		return PTR_ERR(hic->hicr5);
+
+	dev_set_drvdata(&pdev->dev, hic);
+
+	return sysfs_create_groups(&pdev->dev.kobj, hic_groups);
+}
+
+static const struct of_device_id aspeed_hic_of_match[] = {
+	{ .compatible = "aspeed,ast2400-hic"},
+	{ .compatible = "aspeed,ast2500-hic"},
+};
+
+static struct platform_driver aspeed_hic_driver = {
+	.driver = {
+		.name = "aspeed_hic",
+		.of_match_table = aspeed_hic_of_match,
+	},
+};
+module_platform_driver_probe(aspeed_hic_driver, aspeed_hic_probe);
+
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Aspeed LPC Host Interface Controller");
-- 
2.9.3
