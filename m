Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QbWfISz6"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXkV55WsszDr8j
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 15:27:25 +1100 (AEDT)
Received: by mail-pf0-x244.google.com with SMTP id k5so645015pff.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2018 20:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=1BEhEoEl8o7FK2VGUukYbpdLHbz40opIIUkqIilhCZ8=;
 b=QbWfISz6hdk7OLiuyn2rsGCoz1gTh8CDxMnGYcOOJrvz9jp4zDxXQhCHAoE92KwFdd
 QlUwgUMruW+D51roo9T2ym6EFoj7TKiAqajh00YQOoEmIqoUMzZHwzAqBO1FCzD/P5fz
 LnGrWHFDIqpN+zu0V59HCSWSm50wTBJQ4ERLXfqqA4OZ+bK6L23JLJ+VfGTsNEuLIekn
 v6qoATmvo5+tbta1UtPIRrGQr4I7XedxrWKuU2++ldmo1qJzNgySa1HI9lT265OF5x+P
 DbcayrTenmLoy3/HJ59sJAzvpKNwT4cYTUuQEf2r1woerLSRE1VA0AS1mbkfrzJKIH4h
 sCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=1BEhEoEl8o7FK2VGUukYbpdLHbz40opIIUkqIilhCZ8=;
 b=XBT0BoNjAKKs/ARk9cY9Tdv73qVzBq1QI8QFIABJUMlAmOie6HoTEN4oZHrd8eshZ7
 2X4NsBEFVIR8oxF0LM+TNy+wUp++EEq366uVRiMwTy8ztzP8zCSlOLTaDw5Xsc8JsntN
 kAPkuh2osPzMXZ9z033nQOG7LWWXGSjqDRJcBaSWKjDDwH3KagrRU6bKB5eOz9JquOvi
 yc2k0MkiikjSiDY9o7ah2jX4TFRK3GAIcGdWXfEiU2cJxUdsbp7b/knnx/ADDWU2pjsN
 g3wuG0MJbKwDBsSqOUCIAEBtMIRPdVsG1cDM/Sp2NWExDkoBYQYZsQt05DNyV5h8ulWl
 mZvA==
X-Gm-Message-State: AKwxytcA2Bn8hQdgGoMBjqRPb23hsWFcFe+coz7IyR8UH2LwTmWXZJdi
 UgYEpGauKLgmX6wTi68dn2g=
X-Google-Smtp-Source: AH8x225+LY+v9mN8M80G9ozdLThS6F7gqZ7cBYMuqKplBY4spvjcfaPqQnRD+B7rlrnqWYLRdPD8yw==
X-Received: by 10.98.93.65 with SMTP id r62mr38845066pfb.55.1517545641426;
 Thu, 01 Feb 2018 20:27:21 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r84sm1322014pfk.92.2018.02.01.20.27.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Feb 2018 20:27:20 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 02 Feb 2018 14:57:13 +1030
From: Joel Stanley <joel@jms.id.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
Date: Fri,  2 Feb 2018 14:57:09 +1030
Message-Id: <20180202042709.21627-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Fri, 02 Feb 2018 04:27:26 -0000

From: Tomer Maimon <tmaimon77@gmail.com>

The Nuvoton UART is almost compatible with the 8250 driver when probed
via the 8250_of driver, however it requires some extra configuration
at startup.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/serial/8250.txt |  1 +
 drivers/tty/serial/8250/8250_of.c                 |  1 +
 drivers/tty/serial/8250/8250_port.c               | 30 +++++++++++++++++++++++
 include/uapi/linux/serial_core.h                  |  3 +++
 include/uapi/linux/serial_reg.h                   |  5 ++++
 5 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 419ff6c0a47f..e8d921bae665 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -22,6 +22,7 @@ Required properties:
 	- "ti,da830-uart"
 	- "aspeed,ast2400-vuart"
 	- "aspeed,ast2500-vuart"
+	- "nuvoton,npcm750-uart"
 	- "serial" if the port type is unknown.
 - reg : offset and length of the register set for the device.
 - interrupts : should contain uart interrupt.
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 0cf95fddccfc..a947e1e36930 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -298,6 +298,7 @@ static const struct of_device_id of_platform_serial_table[] = {
 	{ .compatible = "mrvl,mmp-uart",
 		.data = (void *)PORT_XSCALE, },
 	{ .compatible = "ti,da830-uart", .data = (void *)PORT_DA830, },
+	{ .compatible = "nuvoton,npcm750-uart", .data = (void *)PORT_NPCM, },
 	{ /* end of list */ },
 };
 MODULE_DEVICE_TABLE(of, of_platform_serial_table);
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index a5fe0e66c607..df52f9ddbb99 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -289,6 +289,16 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 4, 8, 14},
 		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
 	},
+	[PORT_NPCM] = {
+		.name		= "Nuvoton 16550",
+		.fifo_size	= 16,
+		.tx_loadsz	= 16,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
+				  UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
+		.rxtrig_bytes	= {1, 4, 8, 14},
+		.flags		= UART_CAP_FIFO,
+
+	},
 };
 
 /* Uart divisor latch read */
@@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
 				UART_DA830_PWREMU_MGMT_FREE);
 	}
 
+	if (port->type == PORT_NPCM) {
+		/*
+		 * Nuvoton calls the scratch register 'UART_TOR' (timeout
+		 * register). Enable it, and set TIOC (timeout interrupt
+		 * comparator) to be 0x20 for correct operation.
+		 */
+		serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
+	}
+
 #ifdef CONFIG_SERIAL_8250_RSA
 	/*
 	 * If this is an RSA port, see if we can kick it up to the
@@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
 	return quot_16 >> 4;
 }
 
+/* Nuvoton NPCM UARTs have a custom divisor calculation */
+static unsigned int npcm_get_divisor(struct uart_8250_port *up,
+		unsigned int baud)
+{
+	struct uart_port *port = &up->port;
+
+	return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
+}
+
 static unsigned int serial8250_get_divisor(struct uart_8250_port *up,
 					   unsigned int baud,
 					   unsigned int *frac)
@@ -2485,6 +2513,8 @@ static unsigned int serial8250_get_divisor(struct uart_8250_port *up,
 		quot = 0x8002;
 	else if (up->port.type == PORT_XR17V35X)
 		quot = xr17v35x_get_divisor(up, baud, frac);
+	else if (up->port.type == PORT_NPCM)
+		quot = npcm_get_divisor(up, baud);
 	else
 		quot = uart_get_divisor(port, baud);
 
diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
index c34a2a3eeff5..4807dca14ea2 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -271,4 +271,7 @@
 /* MPS2 UART */
 #define PORT_MPS2UART	116
 
+/* Nuvton UART */
+#define PORT_NPCM	117
+
 #endif /* _UAPILINUX_SERIAL_CORE_H */
diff --git a/include/uapi/linux/serial_reg.h b/include/uapi/linux/serial_reg.h
index 5db76880b4ad..50fc96431eb5 100644
--- a/include/uapi/linux/serial_reg.h
+++ b/include/uapi/linux/serial_reg.h
@@ -374,5 +374,10 @@
 #define UART_ALTR_EN_TXFIFO_LW	0x01	/* Enable the TX FIFO Low Watermark */
 #define UART_ALTR_TX_LOW	0x41	/* Tx FIFO Low Watermark */
 
+
+/* Nuvoton NPCM timeout register */
+#define UART_NPCM_TOR		7
+#define UART_NPCM_TOIE		BIT(7)	/* Timeout Interrupt Enable */
+
 #endif /* _LINUX_SERIAL_REG_H */
 
-- 
2.15.1
