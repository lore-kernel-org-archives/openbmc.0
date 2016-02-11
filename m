Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2AA371A003C
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 19:26:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 16CC0140157; Thu, 11 Feb 2016 19:26:24 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] serial/aspeed-vuart: Only disable host tx discard when
 serial port is in use
Date: Thu, 11 Feb 2016 16:26:04 +0800
Message-Id: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 08:26:24 -0000

OpenPOWER firmware doesn't like it when the host-side of the VUART's
FIFO is not drained. This change shifts only disables host TX discard
mode when the port has been opened.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/aspeed-vuart.c | 40 +++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
index f34884a..73bb0e7 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -144,16 +144,45 @@ static ssize_t ast_vuart_set_sirq(struct device *dev,
 static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
 		ast_vuart_show_sirq, ast_vuart_set_sirq);
 
-static void ast_vuart_setup(struct ast_vuart *vuart)
+static void ast_vuart_set_host_tx_discard(struct ast_vuart *vuart, bool discard)
 {
 	u8 reg;
 
-	/* disable TX discard mode */
 	reg = readb(vuart->regs + AST_VUART_GCRA);
-	reg |= AST_VUART_GCRA_HOST_TX_DISCARD;
+
+	/* if the HOST_TX_DISCARD bit is set, discard is *disabled* */
+	reg &= ~AST_VUART_GCRA_HOST_TX_DISCARD;
+	if (!discard)
+		reg |= AST_VUART_GCRA_HOST_TX_DISCARD;
+
 	writeb(reg, vuart->regs + AST_VUART_GCRA);
 }
 
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
 
 /**
  * The device tree parsing code here is heavily based on that of the of_serial
@@ -190,9 +219,12 @@ static int ast_vuart_probe(struct platform_device *pdev)
 	}
 
 	memset(&port, 0, sizeof(port));
+	port.port.private_data = vuart;
 	port.port.membase = vuart->regs;
 	port.port.mapbase = resource.start;
 	port.port.mapsize = resource_size(&resource);
+	port.port.startup = ast_vuart_startup;
+	port.port.shutdown = ast_vuart_shutdown;
 
 	if (of_property_read_u32(np, "clock-frequency", &clk)) {
 		vuart->clk = devm_clk_get(&pdev->dev, NULL);
@@ -272,8 +304,8 @@ static int ast_vuart_probe(struct platform_device *pdev)
 
 
 	vuart->line = rc;
+	ast_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
-	ast_vuart_setup(vuart);
 
 	/* extra sysfs control */
 	rc = device_create_file(&pdev->dev, &dev_attr_lpc_address);
-- 
2.5.0
