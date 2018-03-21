Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405ZDh3vxYzF1Zv;
 Wed, 21 Mar 2018 13:55:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ZPyuUYtx"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405ZDh0Wx7z9s1c; Wed, 21 Mar 2018 13:55:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521600948; bh=YWvCm9vfNybsF6T2DBiOuTu306t7bmW50RSYwIpP9DY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZPyuUYtxIkYEprkA6/+oDC1DC5IGbTzZ/iZb2FNmphSsyw1RSPtf6kejwcmfx0Hv4
 8d+34kS5JzbHHSxD2QMc/aGFvgRGAWgY+UXaNlSpAz7j3X1ZMjw1RR7mfjL6CCZrUq
 FrSNFiYkaKWpISUK1vWKXiYMlGcELE/K113DswQILBBZlNQtPnHHaTRaydoZqdl49k
 rDhQ3wbbCZi7nlJylWupRw0F1AMDyDv961C4IbKYniQgyP1p3eLjkilCDmBFPecZBw
 WYbdCIV0MBWXiLwY92w/zkZHdnKK3THZyYp3U2nm60xeR6TJSo0jVF4bJims3qejA8
 gA1hxBmTdmEeQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 3/5] serial/8250: export serial8250_read_char
Date: Wed, 21 Mar 2018 10:52:39 +0800
Message-Id: <20180321025241.19785-4-jk@ozlabs.org>
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

Currently, we export serial8250_rx_chars, which does a whole bunch of
reads from the 8250 data register, without any form of flow control
between reads.

An upcoming change to the aspeed vuart driver implements more
fine-grained flow control in the interrupt handler, requiring
character-at-a-time control over the rx path.

This change exports serial8250_read_char to allow this.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 include/linux/serial_8250.h         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index a5fe0e66c607..ea435406936c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1650,7 +1650,7 @@ static void serial8250_enable_ms(struct uart_port *port)
 	serial8250_rpm_put(up);
 }
 
-static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
+void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
 {
 	struct uart_port *port = &up->port;
 	unsigned char ch;
@@ -1710,6 +1710,7 @@ static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
 
 	uart_insert_char(port, lsr, UART_LSR_OE, ch, flag);
 }
+EXPORT_SYMBOL_GPL(serial8250_read_char);
 
 /*
  * serial8250_rx_chars: processes according to the passed in LSR
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 61fbb440449c..4639a3608614 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -162,6 +162,7 @@ extern void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl);
 extern int fsl8250_handle_irq(struct uart_port *port);
 int serial8250_handle_irq(struct uart_port *port, unsigned int iir);
 unsigned char serial8250_rx_chars(struct uart_8250_port *up, unsigned char lsr);
+void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr);
 void serial8250_tx_chars(struct uart_8250_port *up);
 unsigned int serial8250_modem_status(struct uart_8250_port *up);
 void serial8250_init_port(struct uart_8250_port *up);
-- 
2.14.1
