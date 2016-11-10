Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDlxn0qV2zDvg1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UuWvNsgx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WjvAU3m+"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 582CE20B67;
 Wed,  9 Nov 2016 20:36:09 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 09 Nov 2016 20:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=gnR
 DyAxf78481mSzlXviZm4sPp8=; b=UuWvNsgx78r5M09IJlwKXPyKpGYC3MJ/b08
 CDHIVnBGkxSkJTAQxOYtRyObHDxdKDmZYy6AVCwkKl36Rk/9ury5WeYNAAZvSDuM
 6fEcZCvrKHH9PVN/slDPFLoqipPYyIhRCIFEce2+YsFr2vEJeIW3lg7PU5vOvNzf
 wUmxmwl0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=gnRDyAxf78481mSzlXviZm4sPp8=; b=WjvAU
 3m+21LioRsRmpnJPdZmXuJ4jUafiOMskE0IqNAriYj6rbBYSuNjpTdIm11VEUKil
 gu9OHiArJGeZBURreXRRi8JFZIXHz0Zm8+rVR2r6W/dnncmdVoagxni7kqgos3e5
 X9Lt793J7KNfd3kUJjuOkK5zUcHvEm5Kg7D/aQ=
X-ME-Sender: <xms:Cc8jWL2rvHHCO9jeRhiguITm2f1tuI_fn2l77TIDW-y6vRbat5GtcA>
X-Sasl-enc: fPaWTu52xDXF52B4Th0DYFsSNU8IJp5pNu1XoYcKAw5/ 1478741768
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA001F29CD;
 Wed,  9 Nov 2016 20:36:07 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 1/4] misc: Expose Aspeed SuperIO scratch
 registers (SCRxSIO)
Date: Thu, 10 Nov 2016 12:05:53 +1030
Message-Id: <20161110013556.8542-2-andrew@aj.id.au>
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

Exposes a sysfs interface to manipulate the SuperIO scratch registers
present in the LPC controller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/misc/Kconfig         |   7 +++
 drivers/misc/Makefile        |   1 +
 drivers/misc/aspeed-scrsio.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)
 create mode 100644 drivers/misc/aspeed-scrsio.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4617ddc3c538..27327f44a709 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -51,6 +51,13 @@ config AD525X_DPOT_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called ad525x_dpot-spi.
 
+config ASPEED_SCRSIO
+	bool "Support for Aspeed SuperIO scratch registers"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	help
+	  Select this if you wish to expose to userspace the SuperIO scratch
+	  registers in the LPC control space on an Aspeed BMC SoC.
+
 config ATMEL_TCLIB
 	bool "Atmel AT32/AT91 Timer/Counter Library"
 	depends on (AVR32 || ARCH_AT91)
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 724861b7f291..0bcd6ff61a12 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_IBM_ASM)		+= ibmasm/
 obj-$(CONFIG_AD525X_DPOT)	+= ad525x_dpot.o
 obj-$(CONFIG_AD525X_DPOT_I2C)	+= ad525x_dpot-i2c.o
 obj-$(CONFIG_AD525X_DPOT_SPI)	+= ad525x_dpot-spi.o
+obj-$(CONFIG_ASPEED_SCRSIO)	+= aspeed-scrsio.o
 obj-$(CONFIG_INTEL_MID_PTI)	+= pti.o
 obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
 obj-$(CONFIG_ATMEL_TCLIB)	+= atmel_tclib.o
diff --git a/drivers/misc/aspeed-scrsio.c b/drivers/misc/aspeed-scrsio.c
new file mode 100644
index 000000000000..8d097b35612e
--- /dev/null
+++ b/drivers/misc/aspeed-scrsio.c
@@ -0,0 +1,141 @@
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
+#define LPC_SCR0SIO	0x0
+#define LPC_SCR1SIO	0x4
+#define LPC_SCR2SIO	0x8
+#define LPC_SCR3SIO	0xc
+
+struct aspeed_scrsio {
+	void __iomem *base;
+};
+
+static ssize_t scrsio_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t len, int reg)
+{
+	struct aspeed_scrsio *scrsio = dev_get_drvdata(dev);
+	int r;
+	u32 value;
+
+	r = kstrtou32(buf, 0, &value);
+	if (r)
+		return r;
+
+	iowrite32(value, scrsio->base + reg);
+
+	return len;
+}
+
+ssize_t scrsio_show(struct device *dev, struct device_attribute *attr,
+		    char *buf, int reg)
+{
+	struct aspeed_scrsio *scrsio = dev_get_drvdata(dev);
+	u32 value;
+
+	value = ioread32(scrsio->base + reg);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%08x\n", value);
+}
+
+static ssize_t scr0sio_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	return scrsio_store(dev, attr, buf, len, LPC_SCR0SIO);
+}
+
+static ssize_t scr0sio_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return scrsio_show(dev, attr, buf, LPC_SCR0SIO);
+}
+DEVICE_ATTR_RW(scr0sio);
+
+static ssize_t scr1sio_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
+{
+	return scrsio_store(dev, attr, buf, len, LPC_SCR1SIO);
+}
+
+static ssize_t scr1sio_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return scrsio_show(dev, attr, buf, LPC_SCR1SIO);
+}
+DEVICE_ATTR_RW(scr1sio);
+
+static ssize_t scr2sio_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return scrsio_show(dev, attr, buf, LPC_SCR2SIO);
+}
+DEVICE_ATTR_RO(scr2sio);
+
+static ssize_t scr3sio_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return scrsio_show(dev, attr, buf, LPC_SCR3SIO);
+}
+DEVICE_ATTR_RO(scr3sio);
+
+static struct attribute *sio_attrs[] = {
+	&dev_attr_scr0sio.attr,
+	&dev_attr_scr1sio.attr,
+	&dev_attr_scr2sio.attr,
+	&dev_attr_scr3sio.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(sio);
+
+static const struct attribute_group sio_attr_group = {
+	.attrs = sio_attrs,
+};
+
+static int __init aspeed_scrsio_probe(struct platform_device *pdev)
+{
+	struct aspeed_scrsio *scrsio;
+	struct resource *res;
+
+	scrsio = devm_kzalloc(&pdev->dev, sizeof(*scrsio), GFP_KERNEL);
+	if (!scrsio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	scrsio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(scrsio->base))
+		return PTR_ERR(scrsio->base);
+
+	dev_set_drvdata(&pdev->dev, scrsio);
+
+	return sysfs_create_groups(&pdev->dev.kobj, sio_groups);
+};
+
+static const struct of_device_id aspeed_scrsio_of_match[] = {
+	{ .compatible = "aspeed,ast2400-scrsio"},
+	{ .compatible = "aspeed,ast2500-scrsio"},
+};
+
+static struct platform_driver aspeed_scrsio_driver = {
+	.driver = {
+		.name = "aspeed_scrsio",
+		.of_match_table = aspeed_scrsio_of_match,
+	},
+};
+module_platform_driver_probe(aspeed_scrsio_driver, aspeed_scrsio_probe);
+
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Aspeed SuperIO scratch registers");
-- 
2.9.3
