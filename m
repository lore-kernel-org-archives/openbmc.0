Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfxw1yHWzDqf4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:45:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MUPLB3vX"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 79so18621987pgf.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C9cqKzd+Ohp19RHS1BUoz9kZlP7kAAeoadi1/sXbF+M=;
 b=MUPLB3vX9JftsKg4KN/6CCuAGspoMpGmKPG9vHDfQLHWhUmVj066axMoGDnFZjCut8
 Fi0lgK/fx1xZnnpxpDkF9A19BWvg/PqjKVtGKvcZW7mSeQn8GOFGRupCnKfkbUZmd9vl
 Q833cU3Mrm9/LktBMtRe7Pa2o5Biz5XjHLLzSm/NEujXpJhWlZ9LAGNus7W/wCxI7n4K
 +ZMfDV2RQDfmt137Vz/DRH0pp/tFa380d4lClB590RG7nT2g++rQqQ0JqeSF1Fmn8rhm
 dfpxeTmMFQ+/4+xDvXr1IHTpbNtvHOnvisdszDUoNUeXfC83oX0cSzXmVPvcSec9lsJW
 przQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=C9cqKzd+Ohp19RHS1BUoz9kZlP7kAAeoadi1/sXbF+M=;
 b=mnN4O6JSWPIRIFlh4bzhTZ3flHJnf5hYX38VqW4y8hu4Y89f4kws29T+ZDfipnCTuW
 uGLyUkCKhCKQqvQi5PyV4bH0U5/a95wK6e7c7A8rCXKIAi0ywq6sS6S4GSdJcGjfxa3I
 Gwc60Fk6Ps2d9DSIG3tOgLIeU+/wbaxxsE1/iiK0+5hGmgPtNG5I0JNhY0Z1KGIhdcWj
 EjJkJI1zfMbEBbhQvk7kwltqx5ce1fb7v7qVFEn2VbVGiCfc8Uy1OYKhPEzoo3Mm9DsB
 bHpFmLYxGJ0KPNs7k0s+UbNK07G7/7LmfMhsvokJZLckmi6OpNFGHb4OiaAA7O+lties
 3iwQ==
X-Gm-Message-State: AFeK/H0CZNmMSkPTTp0WQ6CyJAA/65qmpDGlAX4pOKc6Ah4jb4CxnxO/HGybrG7vuDVa9A==
X-Received: by 10.84.254.4 with SMTP id b4mr19200297plm.179.1490679938505;
 Mon, 27 Mar 2017 22:45:38 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id g5sm4526488pfe.12.2017.03.27.22.45.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:45:37 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 28 Mar 2017 16:15:22 +1030
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 1/2] serial: 8250: Add flag so drivers can avoid THRE probe
Date: Tue, 28 Mar 2017 16:14:57 +1030
Message-Id: <20170328054458.29341-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170328054458.29341-1-joel@jms.id.au>
References: <20170328054458.29341-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:45:40 -0000

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
index fe4399b41df6..f4c6da107dec 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2205,7 +2205,7 @@ int serial8250_do_startup(struct uart_port *port)
 		}
 	}
 
-	if (port->irq) {
+	if (port->irq && !(up->port.flags & UPF_NO_THRE_TEST)) {
 		unsigned char iir1;
 		/*
 		 * Test for UARTs that do not reassert THRE when the
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 5def8e830fb0..f9e1fa39f553 100644
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
