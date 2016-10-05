Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M92G2kzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gLPoDs04; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id o93so4737408oik.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dVJsf7fKWb8n5QOFTK7QZljY2n0Ikn1p/l/KJnrKUpo=;
 b=gLPoDs04pMBog35dDtCCG4FtdMiPLe8hmtLsn+Iv9T7SMifIeMLGGKt647ULSxuFJa
 3tFr3mWVLnieeI6ZA3zJ0vzz7PHUr+XpL1GwffXJlU6VfxYOJ8uwk/uxBs+DsPgC42Y4
 IMSZDEJyZCSrPT+L4ru33QecJu43y7ZPKuL6jJAtIaPryzO8GxJQ5iaLiiIg81RQmR4s
 RCbxtUF1YpBNPqb3hIQqI13ozU5K1k9DQoX9CcuMykrnK28D3OxlpwwK1my/PYDXkJE4
 QCCBgUN1T6QGqHTBrDOfBKheMTX00nTheoJZ6B+lL31/sgG3swmZJMaD7oEmv4+a5F7/
 LjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dVJsf7fKWb8n5QOFTK7QZljY2n0Ikn1p/l/KJnrKUpo=;
 b=Hbcrd6IOkzE9qKxK0YJvf7hRcdOsQVXEX0X7O4Kf2SXS9on4X9QMtIkmtVhtXokQZv
 5jL+qz1NnrA1rGYALjhT7ygUI4BSXE3/kj391L/hDU8XNa7mINMmF/JmhnW1SGcXUrYO
 GRjvrQiwNEhPfH4S374B8an8o44RO4iAMLKitw7m17WDqPmZ49+TV24ZEpArmXEtLQZo
 MQ+R/kpLI0s9jw4XYPKFbEyRKUCw95HsipQ0Qqb0RW9Ce/xI01qTRRm9p4OHJ6awZVYy
 pdEck6bWhkEPnlLx862jQl4KX3A7HNjpoRbbQTdTCG+P4oxzWZ0d3MK+INC6zkX4ZVx3
 MUBw==
X-Gm-Message-State: AA6/9RkQj+CcVQhzi0lp2rJSsfkE95mPY4cTwkns7ApC957S6oI73cmbIYCbk/UDf6Kqog==
X-Received: by 10.202.225.215 with SMTP id y206mr8820090oig.66.1475700883596; 
 Wed, 05 Oct 2016 13:54:43 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:43 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 13/15] fsi: Add GPIO master driver
Date: Wed,  5 Oct 2016 15:54:26 -0500
Message-Id: <1475700868-75737-14-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:45 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  8 ++
 drivers/fsi/Kconfig                                |  7 ++
 drivers/fsi/Makefile                               |  1 +
 drivers/fsi/fsi-master-gpio.c                      | 92 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/fsi-master-gpio.c

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
new file mode 100644
index 0000000..44762a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -0,0 +1,8 @@
+Device-tree bindings for gpio-based FSI master driver
+-----------------------------------------------------
+
+fsi-master {
+	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+	clk-gpio = <&gpio 0>;
+	data-gpio = <&gpio 1>;
+}
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index f065dbe..69e7ee8 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -17,6 +17,13 @@ config FSI_MASTER_FAKE
 	depends on FSI
 	---help---
 	This option enables a fake FSI master driver for debugging.
+
+config FSI_MASTER_GPIO
+	tristate "GPIO-based FSI master"
+	depends on FSI
+	select GPIO_DEVRES
+	---help---
+	This option enables a FSI master driver, using GPIO lines directly.
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 847c00c..2021ce5 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -1,3 +1,4 @@
 
 obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
+obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
new file mode 100644
index 0000000..3855829
--- /dev/null
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -0,0 +1,92 @@
+/*
+ * A FSI master controller, using a simple GPIO bit-banging interface
+ */
+
+#include <linux/platform_device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+
+#include "fsi-master.h"
+
+struct fsi_master_gpio {
+	struct fsi_master	master;
+	struct gpio_desc	*gpio_clk;
+	struct gpio_desc	*gpio_data;
+};
+
+#define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
+
+struct fsi_gpio_msg {
+	uint64_t	msg;
+	uint8_t		bits;
+};
+
+static int fsi_master_gpio_read(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, void *val, size_t size)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: format read into a message, send, poll for response */
+	(void)master;
+
+
+	return 0;
+}
+
+static int fsi_master_gpio_write(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, const void *val, size_t size)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: format write into a message, send, poll for response */
+	(void)master;
+
+	return 0;
+}
+
+static int fsi_master_gpio_probe(struct platform_device *pdev)
+{
+	struct fsi_master_gpio *master;
+	struct gpio_desc *gpio;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	gpio = devm_gpiod_get(&pdev->dev, "clk", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_clk = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "data", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_data = gpio;
+
+	master->master.read = fsi_master_gpio_read;
+	master->master.write = fsi_master_gpio_write;
+
+	return fsi_master_register(&master->master);
+}
+
+static const struct of_device_id fsi_master_gpio_match[] = {
+	{ .compatible = "ibm,fsi-master-gpio" },
+	{ },
+};
+
+static struct platform_driver fsi_master_gpio_driver = {
+	.driver = {
+		.name		= "fsi-master-gpio",
+		.of_match_table	= fsi_master_gpio_match,
+	},
+	.probe	= fsi_master_gpio_probe,
+};
+
+module_platform_driver(fsi_master_gpio_driver);
+
-- 
1.8.2.2
