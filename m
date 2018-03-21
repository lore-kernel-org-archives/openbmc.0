Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405cSj36fPzF1bH;
 Wed, 21 Mar 2018 15:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="VS3D8THq"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405cSj1V4Dz9s16; Wed, 21 Mar 2018 15:36:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521606981; bh=n6nhU7mV4xDWo33/VB+oGXlypy0eHHEKJ/ZkQketqEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VS3D8THqWruSQbZCsUr4pSL1EyF2ikBy8s3aq53S+D5GezwC5v1Bt/+kWcxKrUlWF
 z7iH/3NarCWNoP2gvHebJ/T5ST1aaOm/d2Je8Y9S8KnhO7oS89ETK/n2uUhsISSFqr
 k8IhBw7TxGuguPmaC+zRuTPK4N09bUzoT9PH8zPYVQLn0yiLHzHgQ1z8dTwL/DIfCN
 /Viag4f2jEG+KI4h+G8mtgRSLPEprzAqH7Rw9V9TnoPYz+5yBXKT0zUY+fTLGp0YmA
 ne6EXa7+S+650VrpUB1Q5fOzY6uFYL5x0div4jZykxW449+JTxWtSEaoYfYPlZ5zZD
 O9Ia1upMtfxHA==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 5/5] serial/aspeed-vuart: Implement quick throttle mechanism
Date: Wed, 21 Mar 2018 12:36:04 +0800
Message-Id: <20180321043604.14841-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180321025241.19785-6-jk@ozlabs.org>
References: <20180321025241.19785-6-jk@ozlabs.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 04:36:21 -0000

Although we populate the ->throttle and ->unthrottle UART operations,
these may not be called until the ldisc has had a chance to schedule and
check buffer space. This means that we may overflow the flip buffers
without ever hitting the ldisc's throttle threshold.

This change implements an interrupt-based throttle, where we check for
space in the flip buffers before reading characters from the UART's
FIFO. If there's no space available, we disable the RX interrupt and
schedule a timer to check for space later.

For this, we need an unlocked version of the set_throttle function to be
able to change throttle state from the irq_handler, which already holds
port->lock.

This prevents a case where we drop characters under heavy RX load.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
v2: Use updated timer API, fix text wrap
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 105 ++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index cd1bb49dadfe..023db3266757 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -10,6 +10,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/tty.h>
+#include <linux/tty_flip.h>
 #include <linux/clk.h>
 
 #include "8250.h"
@@ -28,8 +30,17 @@ struct aspeed_vuart {
 	void __iomem		*regs;
 	struct clk		*clk;
 	int			line;
+	struct timer_list	unthrottle_timer;
+	struct uart_8250_port	*port;
 };
 
+/*
+ * If we fill the tty flip buffers, we throttle the data ready interrupt
+ * to prevent dropped characters. This timeout defines how long we wait
+ * to (conditionally, depending on buffer state) unthrottle.
+ */
+static const int unthrottle_timeout = HZ/10;
+
 /*
  * The VUART is basically two UART 'front ends' connected by their FIFO
  * (no actual serial line in between). One is on the BMC side (management
@@ -179,17 +190,23 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
 	serial8250_do_shutdown(uart_port);
 }
 
-static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
+static void __aspeed_vuart_set_throttle(struct uart_8250_port *up,
+		bool throttle)
 {
 	unsigned char irqs = UART_IER_RLSI | UART_IER_RDI;
-	struct uart_8250_port *up = up_to_u8250p(port);
-	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
 	up->ier &= ~irqs;
 	if (!throttle)
 		up->ier |= irqs;
 	serial_out(up, UART_IER, up->ier);
+}
+static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	__aspeed_vuart_set_throttle(up, throttle);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
@@ -203,6 +220,83 @@ static void aspeed_vuart_unthrottle(struct uart_port *port)
 	aspeed_vuart_set_throttle(port, false);
 }
 
+static void aspeed_vuart_unthrottle_exp(struct timer_list *timer)
+{
+	struct aspeed_vuart *vuart = from_timer(vuart, timer, unthrottle_timer);
+	struct uart_8250_port *up = vuart->port;
+
+	if (!tty_buffer_space_avail(&up->port.state->port)) {
+		mod_timer(&vuart->unthrottle_timer, unthrottle_timeout);
+		return;
+	}
+
+	aspeed_vuart_unthrottle(&up->port);
+}
+
+/*
+ * Custom interrupt handler to manage finer-grained flow control. Although we
+ * have throttle/unthrottle callbacks, we've seen that the VUART device can
+ * deliver characters faster than the ldisc has a chance to check buffer space
+ * against the throttle threshold. This results in dropped characters before
+ * the throttle.
+ *
+ * We do this by checking for flip buffer space before RX. If we have no space,
+ * throttle now and schedule an unthrottle for later, once the ldisc has had
+ * a chance to drain the buffers.
+ */
+static int aspeed_vuart_handle_irq(struct uart_port *port)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	unsigned int iir, lsr;
+	unsigned long flags;
+	int space, count;
+
+	iir = serial_port_in(port, UART_IIR);
+
+	if (iir & UART_IIR_NO_INT)
+		return 0;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	lsr = serial_port_in(port, UART_LSR);
+
+	if (lsr & (UART_LSR_DR | UART_LSR_BI)) {
+		space = tty_buffer_space_avail(&port->state->port);
+
+		if (!space) {
+			/* throttle and schedule an unthrottle later */
+			struct aspeed_vuart *vuart = port->private_data;
+			__aspeed_vuart_set_throttle(up, true);
+
+			if (!timer_pending(&vuart->unthrottle_timer)) {
+				vuart->port = up;
+				mod_timer(&vuart->unthrottle_timer,
+						unthrottle_timeout);
+			}
+
+		} else {
+			count = min(space, 256);
+
+			do {
+				serial8250_read_char(up, lsr);
+				lsr = serial_in(up, UART_LSR);
+				if (--count == 0)
+					break;
+			} while (lsr & (UART_LSR_DR | UART_LSR_BI));
+
+			tty_flip_buffer_push(&port->state->port);
+		}
+	}
+
+	serial8250_modem_status(up);
+	if (lsr & UART_LSR_THRE)
+		serial8250_tx_chars(up);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return 1;
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port port;
@@ -219,6 +313,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vuart->dev = &pdev->dev;
+	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	vuart->regs = devm_ioremap_resource(&pdev->dev, res);
@@ -280,6 +375,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	port.port.irq = irq_of_parse_and_map(np, 0);
 	port.port.irqflags = IRQF_SHARED;
+	port.port.handle_irq = aspeed_vuart_handle_irq;
 	port.port.iotype = UPIO_MEM;
 	port.port.type = PORT_16550A;
 	port.port.uartclk = clk;
@@ -319,6 +415,7 @@ static int aspeed_vuart_remove(struct platform_device *pdev)
 {
 	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
 
+	del_timer_sync(&vuart->unthrottle_timer);
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->line);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
-- 
2.14.1
