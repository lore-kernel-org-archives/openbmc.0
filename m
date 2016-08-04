Return-Path: <xow@google.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s52Cr0cBpzDqTm
 for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2016 06:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=MfeSqmrR; 
 dkim-atps=neutral
Received: by mail-pa0-x22c.google.com with SMTP id pp5so85790399pac.3
 for <openbmc@lists.ozlabs.org>; Thu, 04 Aug 2016 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gkhNZ4odsXfwNiw1q3TW2kizV92Q1LmcyhtDZf4PiUk=;
 b=MfeSqmrRT/OJex/OXzX8Uu5I4HjBbQIGXgGJTo6knYe5Kvn0jSK0VtiTpF9CNEjNz4
 qG3MvIABP5UDGwYKVIOkdLGFYYVAxPOm8ebMd5YrRC0JUjb0FUlo/gGGzWxEwHMDFA+R
 Uo5sWSn4DqW8b+pBYXZaML7Xu+A/RY5SqYK4shFg98XU8izaYf3AQT5coWpBnUOb51Fq
 msiHt1a7yIKsGZYG24VtoAiFFYAB1NDmJNoZ1DYFBU1pylJSnSV1S1GFu3Px91vEpum0
 7c+1PLSxjZ1tjuIbzOOZ9CLTx7izy4lWY14BFCON5dtN4tCXqq6/hHT4hLMsOXSVVan2
 PNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gkhNZ4odsXfwNiw1q3TW2kizV92Q1LmcyhtDZf4PiUk=;
 b=NNlwBYv+g0y7kbbBLUglolgZ+wtUL2Z33PqpmwXSaT/UOCCU//VRXZLpv/X8taDDjf
 6aQqn3fap8AbcarB6S4zqGWhETFW6la69d9OkzhOB2hE3Z0eRrvghkwMtYWY0HBnYtwp
 YiwQLXtnVc3mScwtQXwQGVotbCmARyk1RGW4+LA6T/J+FXmM/tY5iAa1WY7w8Yq9Epdf
 0pDAekzpGr2V50bKv0OXu78qJdxNagR3MgslBnd8VACmwIQ1gcaH7hL07KCxMJ+oYea4
 E+u2WTYarXCVRXD7C64UqtfsBAlVP+ShT2K9yEGd/O3rn0p41zM6d14NsuKzFFdUdt9C
 HJwQ==
X-Gm-Message-State: AEkoousMnnG2LQOZ/x1dg6Efrz4K0xMv8KE++0FC3Wkd0NVWmETMA9XzEeTxgVMCVy3AxL3w
X-Received: by 10.66.235.100 with SMTP id ul4mr24989280pac.50.1470343877102;
 Thu, 04 Aug 2016 13:51:17 -0700 (PDT)
Received: from pewter.mtv.corp.google.com ([172.18.64.22])
 by smtp.gmail.com with ESMTPSA id c125sm22453495pfc.40.2016.08.04.13.51.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Aug 2016 13:51:16 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Xo Wang <xow@google.com>
Subject: [PATCH linux 1/2] drivers/serial: Add driver for Aspeed virtual UART
Date: Thu,  4 Aug 2016 13:51:02 -0700
Message-Id: <1470343863-81892-2-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1470343863-81892-1-git-send-email-xow@google.com>
References: <1470343863-81892-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2016 20:51:21 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds a driver for the 16550-based Aspeed virtual UART
device. We use a similar process to the of_serial driver for device
probe, but expose some VUART-specific functions through sysfs too.

If host TX discard mode is enabled, we don't see the LSR[RBR} bit
getting set on new characters written on the host side. This makes the
VUART a little useless.

OpenPOWER firmware doesn't like it when the host-side of the VUART's
FIFO is not drained. This change only disables host TX discard mode when
the port is in use. We set the VUART enabled bit when we bind to the
device, and clear it on unbind.

We don't want to do this on open/release, as the host may be using this
bit to configure serial output modes, which is independent of whether
the devices has been opened by BMC userspace.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Xo Wang <xow@google.com>
---
 Documentation/devicetree/bindings/serial/8250.txt |   1 +
 drivers/tty/serial/Kconfig                        |  10 +
 drivers/tty/serial/Makefile                       |   1 +
 drivers/tty/serial/aspeed-vuart.c                 | 333 ++++++++++++++++++++++
 4 files changed, 345 insertions(+)
 create mode 100644 drivers/tty/serial/aspeed-vuart.c

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 936ab5b..ee6b3e8 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -19,6 +19,7 @@ Required properties:
 	- "altr,16550-FIFO128"
 	- "fsl,16550-FIFO64"
 	- "fsl,ns16550"
+	- "aspeed,vuart"
 	- "serial" if the port type is unknown.
 - reg : offset and length of the register set for the device.
 - interrupts : should contain uart interrupt.
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 13d4ed6..db6c677 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1093,6 +1093,16 @@ config SERIAL_NETX_CONSOLE
 	  If you have enabled the serial port on the Hilscher NetX SoC
 	  you can make it the console by answering Y to this option.
 
+config SERIAL_ASPEED_VUART
+	tristate "Aspeed Virtual UART"
+	depends on OF
+	depends on SERIAL_8250
+	help
+	  If you want to use the virtual UART (VUART) device on Aspeed
+	  BMC platforms, enable this option. This enables the 16550A-
+	  compatible device on the local LPC bus, giving a UART device
+	  with no physical RS232 connections.
+
 config SERIAL_OMAP
 	tristate "OMAP serial port support"
 	depends on ARCH_OMAP2PLUS
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index 8c261ad..5c8f2c73 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_SERIAL_ATMEL) += atmel_serial.o
 obj-$(CONFIG_SERIAL_UARTLITE) += uartlite.o
 obj-$(CONFIG_SERIAL_MSM) += msm_serial.o
 obj-$(CONFIG_SERIAL_NETX) += netx-serial.o
+obj-$(CONFIG_SERIAL_ASPEED_VUART) += aspeed-vuart.o
 obj-$(CONFIG_SERIAL_KGDB_NMI) += kgdb_nmi.o
 obj-$(CONFIG_SERIAL_KS8695) += serial_ks8695.o
 obj-$(CONFIG_SERIAL_OMAP) += omap-serial.o
diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
new file mode 100644
index 0000000..020c815
--- /dev/null
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -0,0 +1,333 @@
+/*
+ *  Serial Port driver for Aspeed VUART device
+ *
+ *    Copyright (C) 2016 Jeremy Kerr <jk@ozlabs.org>, IBM Corp.
+ *    Copyright (C) 2006 Arnd Bergmann <arnd@arndb.de>, IBM Corp.
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU General Public License
+ *  as published by the Free Software Foundation; either version
+ *  2 of the License, or (at your option) any later version.
+ *
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/clk.h>
+
+#include "8250/8250.h"
+
+#define AST_VUART_GCRA		0x20
+#define AST_VUART_GCRA_VUART_EN		0x01
+#define AST_VUART_GCRA_HOST_TX_DISCARD	0x20
+#define AST_VUART_GCRB		0x24
+#define AST_VUART_GCRB_HOST_SIRQ_MASK	0xf0
+#define AST_VUART_GCRB_HOST_SIRQ_SHIFT	4
+#define AST_VUART_ADDRL		0x28
+#define AST_VUART_ADDRH		0x2c
+
+struct ast_vuart {
+	struct platform_device *pdev;
+	void __iomem		*regs;
+	struct clk		*clk;
+	int			line;
+};
+
+static ssize_t ast_vuart_show_addr(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ast_vuart *vuart = dev_get_drvdata(dev);
+	u16 addr;
+
+	addr = (readb(vuart->regs + AST_VUART_ADDRH) << 8) |
+		(readb(vuart->regs + AST_VUART_ADDRL));
+
+	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
+}
+
+static ssize_t ast_vuart_set_addr(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct ast_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	writeb((val >> 8) & 0xff, vuart->regs + AST_VUART_ADDRH);
+	writeb((val >> 0) & 0xff, vuart->regs + AST_VUART_ADDRL);
+
+	return count;
+}
+
+static DEVICE_ATTR(lpc_address, S_IWUSR | S_IRUGO,
+		ast_vuart_show_addr, ast_vuart_set_addr);
+
+static ssize_t ast_vuart_show_sirq(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ast_vuart *vuart = dev_get_drvdata(dev);
+	u8 reg;
+
+	reg = readb(vuart->regs + AST_VUART_GCRB);
+	reg &= AST_VUART_GCRB_HOST_SIRQ_MASK;
+	reg >>= AST_VUART_GCRB_HOST_SIRQ_SHIFT;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
+}
+
+static ssize_t ast_vuart_set_sirq(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct ast_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+	u8 reg;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	val <<= AST_VUART_GCRB_HOST_SIRQ_SHIFT;
+	val &= AST_VUART_GCRB_HOST_SIRQ_MASK;
+
+	reg = readb(vuart->regs + AST_VUART_GCRB);
+	reg &= ~AST_VUART_GCRB_HOST_SIRQ_MASK;
+	reg |= val;
+	writeb(reg, vuart->regs + AST_VUART_GCRB);
+
+	return count;
+}
+
+static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
+		ast_vuart_show_sirq, ast_vuart_set_sirq);
+
+static void ast_vuart_set_enabled(struct ast_vuart *vuart, bool enabled)
+{
+	u8 reg;
+
+	reg = readb(vuart->regs + AST_VUART_GCRA);
+	reg &= ~AST_VUART_GCRA_VUART_EN;
+	if (enabled)
+		reg |= AST_VUART_GCRA_VUART_EN;
+	writeb(reg, vuart->regs + AST_VUART_GCRA);
+}
+
+static void ast_vuart_set_host_tx_discard(struct ast_vuart *vuart, bool discard)
+{
+	u8 reg;
+
+	reg = readb(vuart->regs + AST_VUART_GCRA);
+
+	/* if the HOST_TX_DISCARD bit is set, discard is *disabled* */
+	reg &= ~AST_VUART_GCRA_HOST_TX_DISCARD;
+	if (!discard)
+		reg |= AST_VUART_GCRA_HOST_TX_DISCARD;
+
+	writeb(reg, vuart->regs + AST_VUART_GCRA);
+}
+
+static int ast_vuart_startup(struct uart_port *uart_port)
+{
+	struct uart_8250_port *uart_8250_port = up_to_u8250p(uart_port);
+	struct ast_vuart *vuart = uart_8250_port->port.private_data;
+	int rc;
+
+	rc = serial8250_do_startup(uart_port);
+	if (rc)
+		return rc;
+
+	ast_vuart_set_host_tx_discard(vuart, false);
+
+	return 0;
+}
+
+static void ast_vuart_shutdown(struct uart_port *uart_port)
+{
+	struct uart_8250_port *uart_8250_port = up_to_u8250p(uart_port);
+	struct ast_vuart *vuart = uart_8250_port->port.private_data;
+
+	ast_vuart_set_host_tx_discard(vuart, true);
+
+	serial8250_do_shutdown(uart_port);
+}
+
+
+/**
+ * The device tree parsing code here is heavily based on that of the of_serial
+ * driver, but we have a few core differences, as we need to use our own
+ * ioremapping for extra register support
+ */
+static int ast_vuart_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port port;
+	struct resource resource;
+	struct ast_vuart *vuart;
+	struct device_node *np;
+	u32 clk, prop;
+	int rc;
+
+	np = pdev->dev.of_node;
+
+	vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
+	if (!vuart)
+		return -ENOMEM;
+
+	vuart->pdev = pdev;
+	rc = of_address_to_resource(np, 0, &resource);
+	if (rc) {
+		dev_warn(&pdev->dev, "invalid address\n");
+		return rc;
+	}
+
+	/* create our own mapping for VUART-specific registers */
+	vuart->regs = devm_ioremap_resource(&pdev->dev, &resource);
+	if (IS_ERR(vuart->regs)) {
+		dev_warn(&pdev->dev, "failed to map registers\n");
+		return PTR_ERR(vuart->regs);
+	}
+
+	memset(&port, 0, sizeof(port));
+	port.port.private_data = vuart;
+	port.port.membase = vuart->regs;
+	port.port.mapbase = resource.start;
+	port.port.mapsize = resource_size(&resource);
+	port.port.startup = ast_vuart_startup;
+	port.port.shutdown = ast_vuart_shutdown;
+
+	if (of_property_read_u32(np, "clock-frequency", &clk)) {
+		vuart->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(vuart->clk)) {
+			dev_warn(&pdev->dev,
+				"clk or clock-frequency not defined\n");
+			return PTR_ERR(vuart->clk);
+		}
+
+		rc = clk_prepare_enable(vuart->clk);
+		if (rc < 0)
+			return rc;
+
+		clk = clk_get_rate(vuart->clk);
+	}
+
+	/* If current-speed was set, then try not to change it. */
+	if (of_property_read_u32(np, "current-speed", &prop) == 0)
+		port.port.custom_divisor = clk / (16 * prop);
+
+	/* Check for shifted address mapping */
+	if (of_property_read_u32(np, "reg-offset", &prop) == 0)
+		port.port.mapbase += prop;
+
+	/* Check for registers offset within the devices address range */
+	if (of_property_read_u32(np, "reg-shift", &prop) == 0)
+		port.port.regshift = prop;
+
+	/* Check for fifo size */
+	if (of_property_read_u32(np, "fifo-size", &prop) == 0)
+		port.port.fifosize = prop;
+
+	/* Check for a fixed line number */
+	rc = of_alias_get_id(np, "serial");
+	if (rc >= 0)
+		port.port.line = rc;
+
+	port.port.irq = irq_of_parse_and_map(np, 0);
+	port.port.iotype = UPIO_MEM;
+	if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
+		switch (prop) {
+		case 1:
+			port.port.iotype = UPIO_MEM;
+			break;
+		case 4:
+			port.port.iotype = of_device_is_big_endian(np) ?
+				       UPIO_MEM32BE : UPIO_MEM32;
+			break;
+		default:
+			dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
+				 prop);
+			rc = -EINVAL;
+			goto err_clk_disable;
+		}
+	}
+
+	port.port.type = PORT_16550A;
+	port.port.uartclk = clk;
+	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
+		| UPF_FIXED_PORT | UPF_FIXED_TYPE;
+
+	if (of_find_property(np, "no-loopback-test", NULL))
+		port.port.flags |= UPF_SKIP_TEST;
+
+	port.port.dev = &pdev->dev;
+
+	if (port.port.fifosize)
+		port.capabilities = UART_CAP_FIFO;
+
+	if (of_property_read_bool(pdev->dev.of_node,
+				  "auto-flow-control"))
+		port.capabilities |= UART_CAP_AFE;
+
+	rc = serial8250_register_8250_port(&port);
+	if (rc < 0)
+		goto err_clk_disable;
+
+
+	vuart->line = rc;
+	ast_vuart_set_enabled(vuart, true);
+	ast_vuart_set_host_tx_discard(vuart, true);
+	platform_set_drvdata(pdev, vuart);
+
+	/* extra sysfs control */
+	rc = device_create_file(&pdev->dev, &dev_attr_lpc_address);
+	if (rc)
+		dev_warn(&pdev->dev, "can't create lpc_address file\n");
+	rc = device_create_file(&pdev->dev, &dev_attr_sirq);
+	if (rc)
+		dev_warn(&pdev->dev, "can't create sirq file\n");
+
+	return 0;
+
+err_clk_disable:
+	if (vuart->clk)
+		clk_disable_unprepare(vuart->clk);
+
+	irq_dispose_mapping(port.port.irq);
+	return rc;
+}
+
+static int ast_vuart_remove(struct platform_device *pdev)
+{
+	struct ast_vuart *vuart = platform_get_drvdata(pdev);
+
+	ast_vuart_set_enabled(vuart, false);
+
+	if (vuart->clk)
+		clk_disable_unprepare(vuart->clk);
+	return 0;
+}
+
+static const struct of_device_id ast_vuart_table[] = {
+	{ .compatible = "aspeed,vuart" },
+	{ },
+};
+
+static struct platform_driver ast_vuart_driver = {
+	.driver = {
+		.name = "aspeed-vuart",
+		.of_match_table = ast_vuart_table,
+	},
+	.probe = ast_vuart_probe,
+	.remove = ast_vuart_remove,
+};
+
+module_platform_driver(ast_vuart_driver);
+
+MODULE_AUTHOR("Jeremy Kerr <jk@ozlabs.org>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Driver for Aspeed VUART device");
-- 
2.8.0.rc3.226.g39d4020
