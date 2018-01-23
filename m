Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQsN76wHFzDrDJ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 02:16:52 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0NEwiW3011921;
 Tue, 23 Jan 2018 16:58:44 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 4C8065A963; Tue, 23 Jan 2018 17:16:43 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 2/2] serial: npcm: add NPCM UART driver
Date: Tue, 23 Jan 2018 17:16:40 +0200
Message-Id: <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 15:16:56 -0000

Add Nuvoton BMC NPCM UART driver.

The NPCM7xx BMC contains four UART blocks and accessory logic.

NPCM UART based on 8250 driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/tty/serial/8250/8250_npcm.c | 280 ++++++++++++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig     |  10 ++
 drivers/tty/serial/8250/Makefile    |   1 +
 3 files changed, 291 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_npcm.c

diff --git a/drivers/tty/serial/8250/8250_npcm.c b/drivers/tty/serial/8250/8250_npcm.c
new file mode 100644
index 000000000000..e87951b4ab6f
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_npcm.c
@@ -0,0 +1,280 @@
+/*
+ * Copyright (c) 2018 Nuvoton Technology corporation.
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/serial_8250.h>
+#include <linux/serial_reg.h>
+
+#include "8250.h"
+
+#define MSB(parm16)	((u8)((u16)(parm16) >> 8))
+#define LSB(parm16)	((u8)(parm16))
+
+#define UART_TOR 7
+#define NPCM_SERIAL_RX_TIMEOUT       0x20
+#define NPCM_SERIAL_RX_TIMEOUT_EN    0x80
+
+/* Common baudrate definitions */
+typedef enum {
+	NPCM_UART_BAUDRATE_110       = 110,
+	NPCM_UART_BAUDRATE_300       = 300,
+	NPCM_UART_BAUDRATE_600       = 600,
+	NPCM_UART_BAUDRATE_1200      = 1200,
+	NPCM_UART_BAUDRATE_2400      = 2400,
+	NPCM_UART_BAUDRATE_4800      = 4800,
+	NPCM_UART_BAUDRATE_9600      = 9600,
+	NPCM_UART_BAUDRATE_14400     = 14400,
+	NPCM_UART_BAUDRATE_19200     = 19200,
+	NPCM_UART_BAUDRATE_38400     = 38400,
+	NPCM_UART_BAUDRATE_57600     = 57600,
+	NPCM_UART_BAUDRATE_115200    = 115200,
+	NPCM_UART_BAUDRATE_230400    = 230400,
+	NPCM_UART_BAUDRATE_380400    = 380400,
+	NPCM_UART_BAUDRATE_460800    = 460800,
+} NPCM_UART_BAUDRATE_T;
+
+struct npcm_data {
+	int			line;
+	struct clk		*uart_clk;
+};
+
+static int npcm_uart_set_baud_rate(struct uart_port *port,
+				      NPCM_UART_BAUDRATE_T baudrate)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	int divisor     = 0;
+	int ret         = 0;
+	unsigned long flags;
+
+	divisor = ((int)port->uartclk / ((int)baudrate * 16)) - 2;
+
+	/* since divisor is rounded down check
+	 * if it is better when rounded up
+	 */
+	if (((int)port->uartclk / (16 * (divisor + 2)) - (int)baudrate) >
+		((int)baudrate -
+		 (int)port->uartclk / (16 * ((divisor + 1) + 2))))
+		divisor++;
+
+	if (divisor < 0) {
+		divisor = 0;
+		ret = EINVAL;
+	}
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	/* Set baud rate to baudRate bps */
+	serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
+	serial_port_out(port, UART_DLL, LSB(divisor));
+	serial_port_out(port, UART_DLM, MSB(divisor));
+	serial_port_out(port, UART_LCR, up->lcr);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return ret;
+}
+
+static void npcm_set_termios(struct uart_port *port, struct ktermios *termios,
+			     struct ktermios *old)
+{
+	unsigned int baud   = 0;
+
+	serial8250_do_set_termios(port, termios, old);
+
+	switch (termios->c_cflag & CBAUD) {
+	case  B110:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_110);
+		baud = 110;
+		break;
+	case  B300:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_300);
+		baud = 300;
+		break;
+	case  B600:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_600);
+		baud = 600;
+		break;
+	case  B1200:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_1200);
+		baud = 1200;
+		break;
+	case  B2400:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_2400);
+		baud = 2400;
+		break;
+	case  B4800:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_4800);
+		baud = 4800;
+		break;
+	case  B9600:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_9600);
+		baud = 9600;
+		break;
+	case  B19200:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_19200);
+		baud = 19200;
+		break;
+	case  B38400:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_38400);
+		baud = 38400;
+		break;
+	case  B57600:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_57600);
+		baud = 57600;
+		break;
+	default:
+	case  B115200:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_115200);
+		baud = 115200;
+		break;
+	case  B230400:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_230400);
+		baud = 230400;
+		break;
+	case  B460800:
+		npcm_uart_set_baud_rate(port, NPCM_UART_BAUDRATE_460800);
+		baud = 460800;
+		break;
+	}
+
+	pr_info("NPCM Serial: Baudrate %d\n", baud);
+
+	if (tty_termios_baud_rate(termios))
+		tty_termios_encode_baud_rate(termios, baud, baud);
+}
+
+static int npcm_serial_startup(struct uart_port *port)
+{
+	int rc;
+
+	rc = serial8250_do_startup(port);
+	if (rc)
+		return rc;
+
+	serial_port_out(port, UART_TOR, NPCM_SERIAL_RX_TIMEOUT |
+			NPCM_SERIAL_RX_TIMEOUT_EN);
+
+	return 0;
+}
+
+static int npcm_probe_of(struct platform_device *pdev, struct uart_port *p,
+			   struct npcm_data *data)
+{
+	u32 clk_rate, prop;
+	struct device_node *np;
+	u32 ret;
+
+	np = pdev->dev.of_node;
+
+	data->uart_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(data->uart_clk)) {
+		ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
+		if (ret)
+			return ret;
+	} else {
+		clk_prepare_enable(data->uart_clk);
+		clk_rate = clk_get_rate(data->uart_clk);
+	}
+
+	p->uartclk = clk_rate;
+
+	/* Check for registers offset within the devices address range */
+	if (of_property_read_u32(np, "reg-shift", &prop) == 0)
+		p->regshift = prop;
+	else
+		p->regshift = 2;
+
+	/* Check for fifo size */
+	if (of_property_read_u32(np, "fifo-size", &prop) == 0)
+		p->fifosize = prop;
+	else
+		p->fifosize = 1;
+
+	return 0;
+}
+
+static int npcm_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port uart = {};
+	struct device_node *np = pdev->dev.of_node;
+	struct resource *regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	struct npcm_data *data;
+	int err;
+
+	if (!regs) {
+		dev_err(&pdev->dev, "no registers defined\n");
+		return -EINVAL;
+	}
+
+	uart.port.membase = devm_ioremap(&pdev->dev, regs->start,
+					 resource_size(regs));
+	if (!uart.port.membase)
+		return -ENOMEM;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	err = npcm_probe_of(pdev, &uart.port, data);
+	if (err)
+		return err;
+
+	uart.port.mapbase = regs->start;
+	uart.port.mapsize = resource_size(regs);
+	uart.port.irq = irq_of_parse_and_map(np, 0);
+	uart.port.type = PORT_16550;
+	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE;
+	uart.port.dev = &pdev->dev;
+	uart.port.iotype = UPIO_MEM;
+	uart.port.private_data = data;
+	uart.port.set_termios = npcm_set_termios;
+	uart.port.startup = npcm_serial_startup;
+
+	platform_set_drvdata(pdev, data);
+
+	data->line = serial8250_register_8250_port(&uart);
+
+	if (data->line < 0)
+		return data->line;
+
+	return 0;
+}
+
+static int npcm_remove(struct platform_device *pdev)
+{
+	struct npcm_data *data = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(data->line);
+
+	return 0;
+}
+
+static const struct of_device_id npcm_of_match[] = {
+	{ .compatible = "nuvoton,npcm750-uart" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, npcm_of_match);
+
+static struct platform_driver npcm_platform_driver = {
+	.driver = {
+		.name		= "npcm750-uart",
+		.of_match_table	= npcm_of_match,
+	},
+	.probe			= npcm_probe,
+	.remove			= npcm_remove,
+};
+module_platform_driver(npcm_platform_driver);
+
+MODULE_AUTHOR("Tomer Maimon");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Driver for Nuvoton device based on 16550 serial driver");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index a1161ec0256f..2e15bf51a0f9 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -468,6 +468,16 @@ config SERIAL_8250_PXA
 	  applicable to both devicetree and legacy boards, and early console is
 	  part of its support.
 
+config SERIAL_8250_NPCM
+	tristate "NPCM tty serial support"
+	depends on SERIAL_8250
+	help
+	  Say Y here if you have a NPCM tty serial support.
+	  If unsure, say N.
+
+	  This driver can also be built as a module. The module will be called
+	  8250_nuvoton. If you want to do that, say M here.
+
 config SERIAL_OF_PLATFORM
 	tristate "Devicetree based probing for 8250 ports"
 	depends on SERIAL_8250 && OF
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index a44a99a3e623..7826eb6c660d 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_SERIAL_8250_LPSS)		+= 8250_lpss.o
 obj-$(CONFIG_SERIAL_8250_MID)		+= 8250_mid.o
 obj-$(CONFIG_SERIAL_8250_MOXA)		+= 8250_moxa.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
+obj-$(CONFIG_SERIAL_8250_NPCM)		+= 8250_npcm.o
 obj-$(CONFIG_SERIAL_OF_PLATFORM)	+= 8250_of.o
 
 CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
-- 
2.14.1
