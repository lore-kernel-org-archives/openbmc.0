Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409HBZ4XpKzF27D;
 Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="i9yl5NGI"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 409HBZ39xTz9s0m; Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522122710; bh=sbV+YJXufT1d/kj+y6I5W1MlNAOGyfh0X2k8CqeHdZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i9yl5NGIJWTQoP4G6EjmRFbjCp0EwgKG7oN2w7EPL0zu0OoqH3erfNNA47cKwhpwE
 jF8VnFKtH468JB65xi3KzwRnm4E2gOfp3oaO+GljEZ5USJvd1fkkkXHl+qZqL2Kj7s
 7WCfL4tTA6v8ZngEH/sNV5f3bHn1wUpfIwSKEKt/XSNVn3wp0QU8tuDCZ+Yo0xS6nN
 AdK9wGdMBWa7KbEkVkHO17KJL4dSDXdeQep+1nUH5Vlgo4i2U1QoWckgKdZwUBrcld
 1kRFimVokCVD1hPOOwNbAnAZJ9F1izW/+mGMpjRtslLluWi8QMahXttLLjhH49gnj/
 sGuXKNR39yuDg==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 3/4] serial/aspeed-vuart: Implement rx throttling
Date: Tue, 27 Mar 2018 11:48:26 +0800
Message-Id: <20180327034827.20773-4-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180327034827.20773-1-jk@ozlabs.org>
References: <20180323155116.GA31423@kroah.com>
 <20180327034827.20773-1-jk@ozlabs.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 03:51:51 -0000

The aspeed VUART runs at LPC bus frequency, rather than being restricted
to a typical UART baud rate. This means that the VUART can receive a lot
of data, which can overrun tty flip buffers, and/or cause a large amount
of interrupt traffic.

This change implements the uart_port->throttle & unthrottle callbacks,
implemented by disabling the receiver line status & received data
available IRQs.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Tested-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 74a408d9db24..cd1bb49dadfe 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -179,6 +179,30 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
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
@@ -208,6 +232,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
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
