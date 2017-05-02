Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHCyj5LZkzDqG2
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ifhPDZvb"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id b23so15355456pfc.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RbjK1naKg9qny6dfTUh8BrGAzlrbv+T7rn4MOuvFKlM=;
 b=ifhPDZvbK4cdCRQsyEaeguM2cRPX9vLae6zwMi94bTWBV+Mxjj4cLpk/g6JwuFIvSA
 IqX0gDdaBcz9xqc1Ou/OYfzxAe3j0e1sO2Dxp6wfBbG9rMXDxB09OJeWvIoVGWZ/Ndc/
 NljFVxIGcI3zU6CGvFG5/kz2R5HCVOyfAVCaa3Gs3REy6fF2PqgU1uGQg0WP3XysvSmZ
 Spbgu2msADURyp1MCqhma875bxiEkNYv169SzPMe4tLAH3wUphsSfRce2ZD19SqqSYap
 5tFMOUzdfwLQ/H8jjvjfFrBBuUA3LTxJBlRgrZsm3zOzz3R1IOk+BVNwfSjDYb7izKGl
 huIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=RbjK1naKg9qny6dfTUh8BrGAzlrbv+T7rn4MOuvFKlM=;
 b=t8vfgRBwpSTxtY7mXGatLRltwjGJ6RsLu1nxpfctUhUcLm23KWcWIA+3vkcJ6hydgG
 O07DXfD39YEYVGkUjoHl9V7JuUNfZe0Q5zQDGAKFI+0g9Kb85QaebtlTV8j60OmjsPCe
 ZX9x0v7LtVnrURsZLVilFBErYMyF/fsrrv8leMoAmAsvYrCyP0dPlqIAIC729LnIn2LL
 jabUocdjNP3swCiTmyQhjRF+ra/S6gCVjoJ02ld+INtS2YUMA/DPn50PYvQZpCDJIqAe
 mj4Rp5Pj53yPAkTSSBQlnhmKJwfn65iN91jkIFfcoAp/W0C+cruGHJPJ9/KK7+dt+adG
 hz+Q==
X-Gm-Message-State: AN3rC/7E+lbACmIQ7Ik+q9pgBGMF2Bqc084MeV3zFvzJJhTF1TLiB8G8
 4fxiyV9VQWW4gA==
X-Received: by 10.84.253.15 with SMTP id z15mr23808658pll.186.1493711163974;
 Tue, 02 May 2017 00:46:03 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s65sm25547361pgb.34.2017.05.02.00.45.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 02 May 2017 00:46:03 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 17:15:55 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/2] serial: 8250: Add flag so drivers can avoid THRE probe
Date: Tue,  2 May 2017 17:15:42 +0930
Message-Id: <20170502074543.1380-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502074543.1380-1-joel@jms.id.au>
References: <20170502074543.1380-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 02 May 2017 07:46:06 -0000

The probing of THRE irq behaviour assumes the other end will be reading
bytes out of the buffer in order to probe the port at driver init. In
some cases the other end cannot be relied upon to read these bytes, so
provide a flag for them to skip this step.

Bit 19 was chosen as the flags are a int and the top bits are taken.

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>

---
v3:
 - No change

v3:
 - Correct the bit number in the changelog

v2:
 - No change

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
