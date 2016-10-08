Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt64RmfzDrWs
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GNKGRk2q; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so3748926oia.0
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dVJsf7fKWb8n5QOFTK7QZljY2n0Ikn1p/l/KJnrKUpo=;
 b=GNKGRk2q3SRZryuCExm/CGPoJ9dgSuQX/j9dK74XiBTQihMVEdcgshIpZvEuOT4wIx
 MWJiIzvQxLLtvvfIS9F6bODjtPgt1aUSr0oTd2FOmJH7Nx3SXHMIOjXbkOKDQO4ADNmR
 1fL8o0HayvenioSJdSadU9fmoBL8Cxf+5DMM0JU2WrUGeuS/RqA4iJo0k3QVaRVz6d7o
 FeotG4ND4/Urf0TpUquGfVfnAWNkv+yH0oddGJPoVcu2/MXrzzTvY0aFcbQXecmtX2ne
 5KfJqgJsflwOcN3tiegTsCjSBjQfjiOsJjM67xDLFAlCYUUcSjWlmw+GDLYcFEsyay7n
 QMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dVJsf7fKWb8n5QOFTK7QZljY2n0Ikn1p/l/KJnrKUpo=;
 b=flSTHOBySjHTgSpy5upJoFwHfYkGamsjTU5Rr09P114UoJETv5Dhwoe/H712AnsAwG
 4YU23WC1G5vVC39nrKnKwQ0mT+jTjRUa50AGCHqHujfw7miqEAppyMAo0pWu33mu13eb
 p8H1uigMrQALzNmgHu6x3S1vBzQHFB7lV5gJSqa+PrctmnqtnvvwG88yRVMrMAhKusvk
 OLvy3/x61Sr6ZN3NiPIS3MV+jiieHO4cGU5273+iuBC05BxbyKLM1D6yYpy9KvuqfAM1
 IqHhcnxlPmSuoLrgvC2sT3p0l/Y37moM6UsI3cGM/NY8BPPmYKqQNBf7f3gLj22yJZ5X
 mYDg==
X-Gm-Message-State: AA6/9RnbBDSxUGoClS2YWeUsJeODJ0Dnm9E7oR+pGMkOhV1T9AcNTykFxNaMvp7cVfJvWg==
X-Received: by 10.157.11.49 with SMTP id a46mr14855224ota.184.1475948348951;
 Sat, 08 Oct 2016 10:39:08 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.08
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:08 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 13/17] fsi: Add GPIO master driver
Date: Sat,  8 Oct 2016 12:38:49 -0500
Message-Id: <1475948333-55960-14-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:11 -0000

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
