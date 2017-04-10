Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w1c58499YzDqNq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 14:04:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8UZurvS"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 79so24126088pgf.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Apr 2017 21:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/6FptG3edBWFcbQmsVmfHMBu0LRcGP6Q5ecvfDKmiEQ=;
 b=X8UZurvSmKjvaIqcRUb2a34FGrta61JqKfmqRRYWUTyGIwzirnHjKs3lr59QxW+c0F
 OFpdxdC2SiHIC2LAz/jbE37DxpQpzSlCnqIohlxxwE61i7EmRnILUw0mB9bpteF2CW4d
 oDUg8f4DKr4I8lVlasMmpp+UPbKOJKs/MhKL5rFO4E4qkGsNcb08Lu0+pIGnk/9zUcXC
 vMbvZKVkKtvfQinP+Rz2Kq7jJp5HrYOiP29RSQo1ULPb/Bm4sk991Ri4u/of/EiGdvqY
 R8+K/PPL3MOUpby/TXBp0H3KLCoLKq96pfFEOouia8s20sgmwQzXVyKcqhZSMHQxVEGu
 qRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=/6FptG3edBWFcbQmsVmfHMBu0LRcGP6Q5ecvfDKmiEQ=;
 b=BGZ5ZPkzT9iPJgI1aKfIUN2AZmre0KpCmg9X+Zz5GhrmQjcyHu4cDAWOQrHYViflLb
 0UhzdxBdU8LWmcaki+z5pr8ceR816fcql/IE1gKEMXsuoTIMvYsfQePWx025qmaO8IGL
 woBin8TIjaA0HSWR/k6h8ldTyhgMwZNA9+mN3A5DZZucUDVNl9lCJTNQqG8XJs7S0TaC
 TvjEeIPbzwIdfYjRwsUj+ge1T/XF/Npo1y6c7jvtlVUjEXQWALnEUs9lzQlYhpqGtSa7
 X8LruQzlQburjpgLe7Ds7oa3S2CAiZr9hFDY1qnv6JgjlmRClJ+XbKa9VYZLyoxqMKjg
 HJ+g==
X-Gm-Message-State: AFeK/H0KIxU0wFLwIzwa0n03xt13hkeCmzL4jsyjYuHYQaYe3Tj23CjOubZGY0lruaHErA==
X-Received: by 10.99.44.140 with SMTP id s134mr53217701pgs.178.1491797066846; 
 Sun, 09 Apr 2017 21:04:26 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id q64sm21252572pga.56.2017.04.09.21.04.21
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 09 Apr 2017 21:04:26 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 10 Apr 2017 13:34:18 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/2] serial: 8250: Add flag so drivers can avoid THRE probe
Date: Mon, 10 Apr 2017 13:33:59 +0930
Message-Id: <20170410040400.5509-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170410040400.5509-1-joel@jms.id.au>
References: <20170410040400.5509-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 10 Apr 2017 04:04:29 -0000

The probing of THRE irq behaviour assumes the other end will be reading
bytes out of the buffer in order to probe the port at driver init. In
some cases the other end cannot be relied upon to read these bytes, so
provide a flag for them to skip this step.

Bit 19 was chosen as the flags are a int and the top bits are taken.

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>

---
v3:
 - Correct the bit number in the changelog

v2:
 - No change

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
