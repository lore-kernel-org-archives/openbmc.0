Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq7wC17fFzDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 14:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1tLYJ20"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id w20so529732pgc.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 20:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Psu+2PRyo+3kJL408Bjb0YWFD95VfUuJuGnFEoaLOKo=;
 b=Q1tLYJ201nExvpUfRoOilHBdJj3cmakXE6Pt6W2J13oWYfvC+tMi3tM2Kzbug+6JxH
 CJU9TpxFAMrvez7xgc3XmC59D+Qnqt56pZDr3athg8/CNl+qeEMvusW4IFcZKWfxjfB/
 oeZvMTv4uvNGz8NNs5T0LjfnlCTexwFyUW73tu2t8EAmsCfp2eCogE2G2gQDv2difaJq
 WEZE5isgNr0zmkscEF3Mx7xXemqDXKUWKuwpdUMbB6bWaNNJDt2U5F4CDwaPAxBDD8z+
 JkvEC+IhlK1pvVkCQmDa7JUq9iZ0cDX0IW/6wSh3CYphY7HZvrkIzOGK8XLFPB6cHtd/
 IdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Psu+2PRyo+3kJL408Bjb0YWFD95VfUuJuGnFEoaLOKo=;
 b=pTXsEumsr6r40rj4nXzVLG2244qqR8IA+d+EmX+a5O+ekWGUydWg5kuewFM8JohjOE
 JVWq7BkWkSQnIzGbXGM8dA+h3e2Mt1GBgUMwAME7FdyBgOjuICGctaFpB4UqI8SFZJt1
 oH/J2WWwFD+iIPamfiCIugNn2LcyVUk5DHS9rZVxBSCWLEkkJvfBWBQ+tnj5PD4Jp0ag
 Jjgg8eTL9aTCM93LwhQ1gXW5TpbNiygByvvKKnyX8ARooMpk4LaQcXyZTYsw0Hpb2y0w
 0vDmUjtYuFlPXub4EDqzgDQE0lA4P9o+LVInZqq7YeuSIZ+eopzhNRQjyRXcDFSTaJg8
 mC2w==
X-Gm-Message-State: AFeK/H0QU/ftyZoSsMwmboSW/6purhlbn4cg00G85SGnjUDMBiSDPlnGcRHFy91Q8pIA8g==
X-Received: by 10.99.38.196 with SMTP id m187mr6272689pgm.195.1490325624661;
 Thu, 23 Mar 2017 20:20:24 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id g75sm903408pfj.107.2017.03.23.20.20.20
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 23 Mar 2017 20:20:23 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 24 Mar 2017 13:50:16 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] serial: 8250: Add flag so drivers can avoid probe
Date: Fri, 24 Mar 2017 13:50:15 +1030
Message-Id: <20170324032015.1194-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 24 Mar 2017 03:20:27 -0000

The probe assumes the other end will be reading bytes out of the buffer
in order to probe the port at driver init. In some cases the other
end cannot be relied upon to read these bytes, so provide a flag for
them to skip this step.

Bit 16 was chosen as the flags are a int and the top bits are taken.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/tty/serial/8250/8250_port.c | 2 +-
 drivers/tty/serial/aspeed-vuart.c   | 2 +-
 include/linux/serial_core.h         | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 427dd789c0e5..90994e0389df 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2167,7 +2167,7 @@ int serial8250_do_startup(struct uart_port *port)
 		serial_port_out(port, UART_LCR, 0);
 	}
 
-	if (port->irq) {
+	if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
 		unsigned char iir1;
 		/*
 		 * Test for UARTs that do not reassert THRE when the
diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
index 42ccb380af41..b9559025d710 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -260,7 +260,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
 	port.port.type = PORT_16550A;
 	port.port.uartclk = clk;
 	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
-		| UPF_FIXED_PORT | UPF_FIXED_TYPE;
+		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
 
 	if (of_find_property(np, "no-loopback-test", NULL))
 		port.port.flags |= UPF_SKIP_TEST;
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index a3d7c0d4a03e..2d1fb7423999 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -193,6 +193,7 @@ struct uart_port {
 #define UPF_NO_TXEN_TEST	((__force upf_t) (1 << 15))
 #define UPF_MAGIC_MULTIPLIER	((__force upf_t) ASYNC_MAGIC_MULTIPLIER /* 16 */ )
 
+#define UPF_NO_THRE_TEST	((__force upf_t) (1 << 19))
 /* Port has hardware-assisted h/w flow control */
 #define UPF_AUTO_CTS		((__force upf_t) (1 << 20))
 #define UPF_AUTO_RTS		((__force upf_t) (1 << 21))
-- 
2.11.0
