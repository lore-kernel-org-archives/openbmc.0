Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1c5L5YdzzDqNx
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 14:04:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKdmuaBf"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id g2so24063717pge.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Apr 2017 21:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MLbRYMyVXTrLcVoRtaD0+jXKrROkE/LwhIh9roJ10O4=;
 b=VKdmuaBf2bMW5VkqKvnK+QtQFJjaZEY5PH4pMd3xLJwZcmwHEQoo5AjX3hXw+LAYhO
 Qup7r01uruUrRs25PTQhc4yanhg/kzVWgNRwfL7agd33qrLoUr995zvLxbwlB+mMEA1y
 jvttpWkbzUrTjui5uVkwbj+9Wkgd2ZERn3cfL651Zds3xMkVXULHGHElzYzqgYoZQt2/
 4Qn+AVeLaFo3zglP/V9m195tGteBvsHuru8FZlyRoZwqhqbtVGa7l54d24w8kUk9G11H
 UqFDuVpOeIuAYda+TmfeY7jNV2WVpdV7GmjGPM75zbM6brvFR2Mb+vaq9wwpwwiuSEhE
 3zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=MLbRYMyVXTrLcVoRtaD0+jXKrROkE/LwhIh9roJ10O4=;
 b=mU1cjQ1iruF8PWo//oQDQ3YwC9O4QTNfDryEUX9vElfK4HYQ/sHGfEEginOlaTi+Aj
 ZJeTtYoPUjUBQ9PFChHXdhEgiEws+hcNn62P6FzpIvooqMvUIoHSXN6TglJdCrFGBsOo
 hz+uroP6Of4a40TL2G8HiW93OZjzHVDtVfqW8ydImPtZ+6TdQCycFo5gs+o4d18e1A6O
 SyhNNJcD+B8kOpHrY1DZYbJdCInLUey3ty7ovw0zAa25FTZyiHC4bPUy2m7uU6cOybiL
 DKLYl9/Whyj7b0dLwUwz3GyeY1BEh2wBIqC12HT2xMNktlQJCqmdBxXwZE0zOl9xA2Kt
 5ecw==
X-Gm-Message-State: AN3rC/4w3tHR4mkl+591c1rgsZH3dYboas6lEeVgqi00zjUUHbBIjPZbRZslvJk7ZkMPqw==
X-Received: by 10.84.238.141 with SMTP id v13mr16714848plk.13.1491797076755;
 Sun, 09 Apr 2017 21:04:36 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u14sm6862027pfd.67.2017.04.09.21.04.31
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 09 Apr 2017 21:04:36 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 10 Apr 2017 13:34:28 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/2] drivers/serial: Add driver for Aspeed virtual UART
Date: Mon, 10 Apr 2017 13:34:00 +0930
Message-Id: <20170410040400.5509-3-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170410040400.5509-1-joel@jms.id.au>
References: <20170410040400.5509-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 10 Apr 2017 04:04:39 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds a driver for the 16550-based Aspeed virtual UART
device. We use a similar process to the of_serial driver for device
probe, but expose some VUART-specific functions through sysfs too.

The VUART is two UART 'front ends' connected by their FIFO (no actual
serial line in between). One is on the BMC side (management controller)
and one is on the host CPU side.

This driver is for the BMC side. The sysfs files allow the BMC
userspace, which owns the system configuration policy, to specify at
what IO port and interrupt number the host side will appear to the host
on the Host <-> BMC LPC bus. It could be different on a different system
(though most of them use 3f8/4).

OpenPOWER host firmware doesn't like it when the host-side of the
VUART's FIFO is not drained. This driver only disables host TX discard
mode when the port is in use. We set the VUART enabled bit when we bind
to the device, and clear it on unbind.

We don't want to do this on open/release, as the host may be using this
bit to configure serial output modes, which is independent of whether
the devices has been opened by BMC userspace.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Rob Herring <robh@kernel.org>

---
v3:
 - remove whitespace in header
 - reformat comment
 - don't check for reg-io-width property; we don't need any special
   accessors for reading/writing bytes
 - move file to 8250_aspeed_vuart.c

v2:
 - Use attribute groups and DEVICE_ATTR_RW
 - Use platform_get_resource/devm_ioremap_resource
 - of_find_property -> of_property_read_bool
 - Drop unncessary 0xff mask
 - Fix comment style
 - Use BIT and GENMASK where pssible
 - Move to 8250 directory
 - Rename ast -> aspeed to match other Aspeed drivers
 - Add documentation of sysfs file
 - Add detail to the commit message

 Documentation/ABI/stable/sysfs-driver-aspeed-vuart |  15 +
 Documentation/devicetree/bindings/serial/8250.txt  |   2 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c        | 323 +++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig                    |  10 +
 drivers/tty/serial/8250/Makefile                   |   1 +
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-vuart
 create mode 100644 drivers/tty/serial/8250/8250_aspeed_vuart.c

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
new file mode 100644
index 000000000000..8062953ce77b
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
@@ -0,0 +1,15 @@
+What:		/sys/bus/platform/drivers/aspeed-vuart/*/lpc_address
+Date:		April 2017
+Contact:	Jeremy Kerr <jk@ozlabs.org>
+Description:	Configures which IO port the host side of the UART
+		will appear on the host <-> BMC LPC bus.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-vuart*/sirq
+Date:		April 2017
+Contact:	Jeremy Kerr <jk@ozlabs.org>
+Description:	Configures which interrupt number the host side of
+		the UART will appear on the host <-> BMC LPC bus.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 10276a46ecef..656733949309 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -20,6 +20,8 @@ Required properties:
 	- "fsl,16550-FIFO64"
 	- "fsl,ns16550"
 	- "ti,da830-uart"
+	- "aspeed,ast2400-vuart"
+	- "aspeed,ast2500-vuart"
 	- "serial" if the port type is unknown.
 - reg : offset and length of the register set for the device.
 - interrupts : should contain uart interrupt.
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
new file mode 100644
index 000000000000..5db0023e0225
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -0,0 +1,323 @@
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
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/clk.h>
+
+#include "8250.h"
+
+#define ASPEED_VUART_GCRA		0x20
+#define ASPEED_VUART_GCRA_VUART_EN		BIT(0)
+#define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
+#define ASPEED_VUART_GCRB		0x24
+#define ASPEED_VUART_GCRB_HOST_SIRQ_MASK	GENMASK(7, 4)
+#define ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT	4
+#define ASPEED_VUART_ADDRL		0x28
+#define ASPEED_VUART_ADDRH		0x2c
+
+struct aspeed_vuart {
+	struct device		*dev;
+	void __iomem		*regs;
+	struct clk		*clk;
+	int			line;
+};
+
+/*
+ * The VUART is basically two UART 'front ends' connected by their FIFO
+ * (no actual serial line in between). One is on the BMC side (management
+ * controller) and one is on the host CPU side.
+ *
+ * It allows the BMC to provide to the host a "UART" that pipes into
+ * the BMC itself and can then be turned by the BMC into a network console
+ * of some sort for example.
+ *
+ * This driver is for the BMC side. The sysfs files allow the BMC
+ * userspace which owns the system configuration policy, to specify
+ * at what IO port and interrupt number the host side will appear
+ * to the host on the Host <-> BMC LPC bus. It could be different on a
+ * different system (though most of them use 3f8/4).
+ */
+
+static ssize_t lpc_address_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	u16 addr;
+
+	addr = (readb(vuart->regs + ASPEED_VUART_ADDRH) << 8) |
+		(readb(vuart->regs + ASPEED_VUART_ADDRL));
+
+	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
+}
+
+static ssize_t lpc_address_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	writeb(val >> 8, vuart->regs + ASPEED_VUART_ADDRH);
+	writeb(val >> 0, vuart->regs + ASPEED_VUART_ADDRL);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(lpc_address);
+
+static ssize_t sirq_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	u8 reg;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
+	reg &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
+	reg >>= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
+}
+
+static ssize_t sirq_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+	u8 reg;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	val <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
+	val &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRB);
+	reg &= ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
+	reg |= val;
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(sirq);
+
+static struct attribute *aspeed_vuart_attrs[] = {
+	&dev_attr_sirq.attr,
+	&dev_attr_lpc_address.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_vuart_attr_group = {
+	.attrs = aspeed_vuart_attrs,
+};
+
+static void aspeed_vuart_set_enabled(struct aspeed_vuart *vuart, bool enabled)
+{
+	u8 reg;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	reg &= ~ASPEED_VUART_GCRA_VUART_EN;
+	if (enabled)
+		reg |= ASPEED_VUART_GCRA_VUART_EN;
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+}
+
+static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
+					     bool discard)
+{
+	u8 reg;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+
+	/* If the DISABLE_HOST_TX_DISCARD bit is set, discard is disabled */
+	reg &= ~ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD;
+	if (!discard)
+		reg |= ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD;
+
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+}
+
+static int aspeed_vuart_startup(struct uart_port *uart_port)
+{
+	struct uart_8250_port *uart_8250_port = up_to_u8250p(uart_port);
+	struct aspeed_vuart *vuart = uart_8250_port->port.private_data;
+	int rc;
+
+	rc = serial8250_do_startup(uart_port);
+	if (rc)
+		return rc;
+
+	aspeed_vuart_set_host_tx_discard(vuart, false);
+
+	return 0;
+}
+
+static void aspeed_vuart_shutdown(struct uart_port *uart_port)
+{
+	struct uart_8250_port *uart_8250_port = up_to_u8250p(uart_port);
+	struct aspeed_vuart *vuart = uart_8250_port->port.private_data;
+
+	aspeed_vuart_set_host_tx_discard(vuart, true);
+
+	serial8250_do_shutdown(uart_port);
+}
+
+static int aspeed_vuart_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port port;
+	struct aspeed_vuart *vuart;
+	struct device_node *np;
+	struct resource *res;
+	u32 clk, prop;
+	int rc;
+
+	np = pdev->dev.of_node;
+
+	vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
+	if (!vuart)
+		return -ENOMEM;
+
+	vuart->dev = &pdev->dev;
+
+	/* The 8510 core creates the mapping, which we grab a reference to
+	 * for VUART-specific registers */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	vuart->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(vuart->regs))
+		return PTR_ERR(vuart->regs);
+
+	memset(&port, 0, sizeof(port));
+	port.port.private_data = vuart;
+	port.port.membase = vuart->regs;
+	port.port.mapbase = res->start;
+	port.port.mapsize = resource_size(res);
+	port.port.startup = aspeed_vuart_startup;
+	port.port.shutdown = aspeed_vuart_shutdown;
+	port.port.dev = &pdev->dev;
+
+	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
+	if (rc < 0)
+		return rc;
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
+	port.port.irqflags = IRQF_SHARED;
+	port.port.iotype = UPIO_MEM;
+	port.port.type = PORT_16550A;
+	port.port.uartclk = clk;
+	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
+		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
+
+	if (of_property_read_bool(np, "no-loopback-test"))
+		port.port.flags |= UPF_SKIP_TEST;
+
+	if (port.port.fifosize)
+		port.capabilities = UART_CAP_FIFO;
+
+	if (of_property_read_bool(np, "auto-flow-control"))
+		port.capabilities |= UART_CAP_AFE;
+
+	rc = serial8250_register_8250_port(&port);
+	if (rc < 0)
+		goto err_clk_disable;
+
+	vuart->line = rc;
+
+	aspeed_vuart_set_enabled(vuart, true);
+	aspeed_vuart_set_host_tx_discard(vuart, true);
+	platform_set_drvdata(pdev, vuart);
+
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(vuart->clk);
+	irq_dispose_mapping(port.port.irq);
+	return rc;
+}
+
+static int aspeed_vuart_remove(struct platform_device *pdev)
+{
+	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
+
+	aspeed_vuart_set_enabled(vuart, false);
+	serial8250_unregister_port(vuart->line);
+	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
+	clk_disable_unprepare(vuart->clk);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_vuart_table[] = {
+	{ .compatible = "aspeed,ast2400-vuart" },
+	{ .compatible = "aspeed,ast2500-vuart" },
+	{ },
+};
+
+static struct platform_driver aspeed_vuart_driver = {
+	.driver = {
+		.name = "aspeed-vuart",
+		.of_match_table = aspeed_vuart_table,
+	},
+	.probe = aspeed_vuart_probe,
+	.remove = aspeed_vuart_remove,
+};
+
+module_platform_driver(aspeed_vuart_driver);
+
+MODULE_AUTHOR("Jeremy Kerr <jk@ozlabs.org>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Driver for Aspeed VUART device");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index a65fb8197aec..fb217f02ec94 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -220,6 +220,16 @@ config SERIAL_8250_ACCENT
 	  To compile this driver as a module, choose M here: the module
 	  will be called 8250_accent.
 
+config SERIAL_8250_ASPEED_VUART
+	tristate "Aspeed Virtual UART"
+	depends on SERIAL_8250
+	depends on OF
+	help
+	  If you want to use the virtual UART (VUART) device on Aspeed
+	  BMC platforms, enable this option. This enables the 16550A-
+	  compatible device on the local LPC bus, giving a UART device
+	  with no physical RS232 connections.
+
 config SERIAL_8250_BOCA
 	tristate "Support Boca cards"
 	depends on SERIAL_8250 != n && ISA && SERIAL_8250_MANY_PORTS
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 2f30f9ecdb1b..a44a99a3e623 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_SERIAL_8250_EXAR)		+= 8250_exar.o
 obj-$(CONFIG_SERIAL_8250_HP300)		+= 8250_hp300.o
 obj-$(CONFIG_SERIAL_8250_CS)		+= serial_cs.o
 obj-$(CONFIG_SERIAL_8250_ACORN)		+= 8250_acorn.o
+obj-$(CONFIG_SERIAL_8250_ASPEED_VUART)	+= 8250_aspeed_vuart.o
 obj-$(CONFIG_SERIAL_8250_BCM2835AUX)	+= 8250_bcm2835aux.o
 obj-$(CONFIG_SERIAL_8250_CONSOLE)	+= 8250_early.o
 obj-$(CONFIG_SERIAL_8250_FOURPORT)	+= 8250_fourport.o
-- 
2.11.0
