Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409HBd1CP1zF271;
 Tue, 27 Mar 2018 14:51:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="sjcnbGkh"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 409HBb51Xjz9s1x; Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522122711; bh=Ol83ISfgJHoZWMqc9JOCQYpWdWDkX1x8WOl12MdXEA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjcnbGkhm55cD/9SxrjAXAMGrz3LyJ1xl4w+U34aOObB+q8jZHl1XjSHKcEv958Ne
 wy/4YaFRyEushwds2sLoGRaYCQgZ+vte7ZnF4KeBs1bjUWBCoPSXp8awi/f7LFZlcb
 2hAow6rafOsyL4j0foXP9qxBUa9G+Hxirng6JFKy5gqVTCck4m6HXGUhCd+kyZ2pl3
 07QF+9u2wk1V4CVNubuC1boAy5MsL/tuSVYobFCHlniFs2I8+7iFjJpbrPxMUW1hnH
 VE+n/MQ5De0+eGUn0lF0EC1dCPpkg0aqHrVgjMtY+i+JEL5XZ9fc02RsVKmhBsw1Kv
 mPAF4THNr98yA==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 2/4] serial/8250: export serial8250_read_char
Date: Tue, 27 Mar 2018 11:48:25 +0800
Message-Id: <20180327034827.20773-3-jk@ozlabs.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 03:51:53 -0000

Currently, we export serial8250_rx_chars, which does a whole bunch of
reads from the 8250 data register, without any form of flow control
between reads.

An upcoming change to the aspeed vuart driver implements more
fine-grained flow control in the interrupt handler, requiring
character-at-a-time control over the rx path.

This change exports serial8250_read_char to allow this.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Tested-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 include/linux/serial_8250.h         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 95833cbc4338..8fbd5fbeb318 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1680,7 +1680,7 @@ static void serial8250_enable_ms(struct uart_port *port)
 	serial8250_rpm_put(up);
 }
 
-static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
+void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
 {
 	struct uart_port *port = &up->port;
 	unsigned char ch;
@@ -1740,6 +1740,7 @@ static void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
 
 	uart_insert_char(port, lsr, UART_LSR_OE, ch, flag);
 }
+EXPORT_SYMBOL_GPL(serial8250_read_char);
 
 /*
  * serial8250_rx_chars: processes according to the passed in LSR
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index a27ef5f56431..76b9db71e489 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -163,6 +163,7 @@ extern void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl);
 extern int fsl8250_handle_irq(struct uart_port *port);
 int serial8250_handle_irq(struct uart_port *port, unsigned int iir);
 unsigned char serial8250_rx_chars(struct uart_8250_port *up, unsigned char lsr);
+void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr);
 void serial8250_tx_chars(struct uart_8250_port *up);
 unsigned int serial8250_modem_status(struct uart_8250_port *up);
 void serial8250_init_port(struct uart_8250_port *up);
-- 
2.14.1
