Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyXLL1jw2zDqH6
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 14:05:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CfnPjP5P"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n11so308482pfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 21:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G2nSPwbs8cI5H5NfsY4TrCLlKQZ6Q+Idx3xuEj4wz7w=;
 b=CfnPjP5PS4Meg9R3+8xFg+j1SNJFvLK9K3epZKmSVVQXnl014CmVUj05x0hsBk7+Cg
 cpJz17Z1zJSfl3Ytz5nFnNqAsRhyTjc6+uS2taYxwVeAR1uMqhY2TlGF6p03CeRvDJkh
 66NSsTuThVTRy1tZM4QZYo3/sVn0O8QKmoClOpgptkLzkXRwilBvlDZ9Yf5GxsfxWUTa
 oPyGmvz8IjIByo+HkaAdxkX2B5vaZNqVe7ahmQZlSbZsZ3RnF6Mmw60kQs9rR562gArp
 HuDNwAHhz5eU34jC3A7bDYhdI61OdDLGjlNLN7Y42hdkWZ7caQfnCynAMYZAViOSKeZD
 Jucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=G2nSPwbs8cI5H5NfsY4TrCLlKQZ6Q+Idx3xuEj4wz7w=;
 b=Fio0Z7wwX1AIhRps3xKmw5sJpAdGVkuG5f12f0iX/1rLqHLTg6KgJzlSczssHpuBe1
 /wlaWBzze2Npzmv98bhB1NjxiDwHe/S0Vb4n5BvjDTHVKJKd6Kusr4G4kyND1891tsNE
 1yR4gdZiVnOqWYU7n2d/tLNNwQ8MA+RpVs7MH0XYZMuD28Nf3C5OqbewwGTrG0y/z3zs
 Td9RHraj2gIqYDy/Hilfxg/hfYVhg56X085ln2fY6a7hvZpQt6IRoxuTUUcQ4CoYjTVq
 bRGAtBGhM9kfoqBxQWnlFeOO7lmP7lplahWSjriTgX9Mjn25BTzadLKGJtd3J5xefpr8
 InLw==
X-Gm-Message-State: AFeK/H1B/Hv7LLo3s9GJNrhLbXOUmX5rqgOMnvV8rYthkp9EtBXnjG6arvwluLfuYHEabQ==
X-Received: by 10.98.217.67 with SMTP id s64mr27199798pfg.119.1491365110311;
 Tue, 04 Apr 2017 21:05:10 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id i15sm34250314pfj.51.2017.04.04.21.05.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 04 Apr 2017 21:05:09 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 05 Apr 2017 13:35:00 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/2] serial: 8250: Add flag so drivers can avoid THRE probe
Date: Wed,  5 Apr 2017 13:33:51 +0930
Message-Id: <20170405040352.5661-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170405040352.5661-1-joel@jms.id.au>
References: <20170405040352.5661-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 05 Apr 2017 04:05:14 -0000

The probing of THRE irq behaviour assumes the other end will be reading
bytes out of the buffer in order to probe the port at driver init. In
some cases the other end cannot be relied upon to read these bytes, so
provide a flag for them to skip this step.

Bit 16 was chosen as the flags are a int and the top bits are taken.

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/tty/serial/8250/8250_port.c | 2 +-
 include/linux/serial_core.h         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 6119516ef5fc..60a6c247340f 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2229,7 +2229,7 @@ int serial8250_do_startup(struct uart_port *port)
 		}
 	}
 
-	if (port->irq) {
+	if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
 		unsigned char iir1;
 		/*
 		 * Test for UARTs that do not reassert THRE when the
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 58484fb35cc8..260245deec94 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -195,6 +195,7 @@ struct uart_port {
 #define UPF_NO_TXEN_TEST	((__force upf_t) (1 << 15))
 #define UPF_MAGIC_MULTIPLIER	((__force upf_t) ASYNC_MAGIC_MULTIPLIER /* 16 */ )
 
+#define UPF_NO_THRE_TEST	((__force upf_t) (1 << 19))
 /* Port has hardware-assisted h/w flow control */
 #define UPF_AUTO_CTS		((__force upf_t) (1 << 20))
 #define UPF_AUTO_RTS		((__force upf_t) (1 << 21))
-- 
2.11.0
