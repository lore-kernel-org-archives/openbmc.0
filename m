Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409HBZ3r26zF278;
 Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="J5paSKuk"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 409HBZ1z4Yz9s0p; Tue, 27 Mar 2018 14:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522122710; bh=hshgLVxxPzKdI2kd3QYirG45Zfghs4of6AMswyRQetU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J5paSKuks+7CqspoCfp8tYLqqSRunHOAy9bDWQ8p4IZwP2gcs2I1seErYQCUqmksn
 8lWGIsq8125B0lnVcdYmv35GNM/y6GBrwyZ1ytGUl14M4JLC8wE5PzNIeNAQGRSK9L
 Wz/Yf27r/gGBggGS9WY88s36jNSADwHb9zJzNTFxjIHP9ss2opkw+YwXGIGndrVpRk
 h3+yDTLEcuJOeS0BN4330PpGTsMrYRwWAhbKJtmkkjZKApTKoauHWy/wQt4klZQigv
 xiZB35NPg1SNASO7Vq1WlJNoVoncFKJTyCc63KRBF5ZHQcgZ1fXbpRd97Pt0/FIXxM
 Nzw1THRegvtwQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 1/4] serial: Introduce UPSTAT_SYNC_FIFO for synchronised
 FIFOs
Date: Tue, 27 Mar 2018 11:48:24 +0800
Message-Id: <20180327034827.20773-2-jk@ozlabs.org>
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

This change adds a flag to indicate that a UART is has an external means
of synchronising its FIFO, without needing CTSRTS or XON/XOFF.

This allows us to use the throttle/unthrottle callbacks, without having
to claim other methods of flow control.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

--
v2:
 - simplify status mask checks
---
 drivers/tty/serial/serial_core.c | 4 ++--
 include/linux/serial_core.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 0466f9f08a91..c47158c93202 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -674,8 +674,8 @@ static void uart_send_xchar(struct tty_struct *tty, char ch)
 static void uart_throttle(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
+	upstat_t mask = UPSTAT_SYNC_FIFO;
 	struct uart_port *port;
-	upstat_t mask = 0;
 
 	port = uart_port_ref(state);
 	if (!port)
@@ -703,8 +703,8 @@ static void uart_throttle(struct tty_struct *tty)
 static void uart_unthrottle(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
+	upstat_t mask = UPSTAT_SYNC_FIFO;
 	struct uart_port *port;
-	upstat_t mask = 0;
 
 	port = uart_port_ref(state);
 	if (!port)
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 1d356105f25a..d224961e1346 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -233,6 +233,7 @@ struct uart_port {
 #define UPSTAT_AUTORTS		((__force upstat_t) (1 << 2))
 #define UPSTAT_AUTOCTS		((__force upstat_t) (1 << 3))
 #define UPSTAT_AUTOXOFF		((__force upstat_t) (1 << 4))
+#define UPSTAT_SYNC_FIFO	((__force upstat_t) (1 << 5))
 
 	int			hw_stopped;		/* sw-assisted CTS flow state */
 	unsigned int		mctrl;			/* current modem ctrl settings */
-- 
2.14.1
