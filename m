Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405ZDg4tPpzF1Zv;
 Wed, 21 Mar 2018 13:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="CUQjXHlu"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405ZDf65gkz9s0W; Wed, 21 Mar 2018 13:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521600946; bh=Le4vV5w0IrSmHwWEsMPfIKMowxE3uI3FfFDpZcvSdYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CUQjXHluld+XhU1v2vbipGg6gHdA2/MMzWQVGCBuyrTYa1F5U4ndtQKQuVvuQyaS2
 qEFuUHGWsUxffVHmF3P3yig/MkG4pkS9aco3UzooGsZhvmm5zYZXML4cqDOTaUy+ty
 QDPU7hCLHbcJngSdFnDch3NMwqO22RJhPZLgScO73zWTjhC0TjtF3BWKNitMzHuPmV
 wRBIH6MsifUu4ymZ7MPUk7MZ8sbePO5AA1AJOxfPpKMUT4nchtKrUDRFnpr7RNybRx
 pFZVWeTdET9Tp9KT0ClOJDrRElm4Uk66oksB0I6YJNvxRYPeqJeXwcV6O6UdK7IlyN
 DDdB8tWj+IihQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 4/5] serial/aspeed-vuart: Implement rx throttling
Date: Wed, 21 Mar 2018 10:52:40 +0800
Message-Id: <20180321025241.19785-5-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180321025241.19785-1-jk@ozlabs.org>
References: <20180321025241.19785-1-jk@ozlabs.org>
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
X-List-Received-Date: Wed, 21 Mar 2018 02:55:48 -0000

The aspeed VUART runs at LPC bus frequency, rather than being restricted
to a typical UART baud rate. This means that the VUART can receive a lot
of data, which can overrun tty flip buffers, and/or cause a large amount
of interrupt traffic.

This change implements the uart_port->throttle & unthrottle callbacks,
implemented by disabling the receiver line status & received data
available IRQs.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 33a801353114..50c082b4a1ac 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -183,6 +183,30 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
 	serial8250_do_shutdown(uart_port);
 }
 
+static void aspeed_vuart_set_throttle(struct uart_port *port, bool throttle)
+{
+	unsigned char irqs = UART_IER_RLSI | UART_IER_RDI;
+	struct uart_8250_port *up = up_to_u8250p(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	up->ier &= ~irqs;
+	if (!throttle)
+		up->ier |= irqs;
+	serial_out(up, UART_IER, up->ier);
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void aspeed_vuart_throttle(struct uart_port *port)
+{
+	aspeed_vuart_set_throttle(port, true);
+}
+
+static void aspeed_vuart_unthrottle(struct uart_port *port)
+{
+	aspeed_vuart_set_throttle(port, false);
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port port;
@@ -212,6 +236,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	port.port.mapsize = resource_size(res);
 	port.port.startup = aspeed_vuart_startup;
 	port.port.shutdown = aspeed_vuart_shutdown;
+	port.port.throttle = aspeed_vuart_throttle;
+	port.port.unthrottle = aspeed_vuart_unthrottle;
+	port.port.status = UPSTAT_SYNC_FIFO;
 	port.port.dev = &pdev->dev;
 
 	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
-- 
2.14.1
