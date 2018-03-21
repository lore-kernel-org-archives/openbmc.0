Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405ZDg1y23zF1Zk;
 Wed, 21 Mar 2018 13:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="BzwFBisi"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405ZDg0Ll9z9s16; Wed, 21 Mar 2018 13:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521600947; bh=t/Xx6xq47cCweFWjVlDpDlMcGm8cYsBP3OHU0r8Sbwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BzwFBisimno/juqfABiZyfvoN3lLYqc/RVKsJchyizroB0F10QNMHwtfjSBX41Gi/
 +93bLCQeFdwml79ZuZEd0g/q7Q6hxo/VG5Bi9uAmkU28sCMfTJYh4bvS5ulfJIoUx+
 I0G6w9UWtm0IC5keGBqLAPReM1jVTa6bgRJQfxb9lrv621SAkRaT+TOrDvmaCqz4y3
 5LlLM9tjY57AFVcCEBf9bmS/+SyvDhTK1Y8E2XlGIO3rziDvC6F8iL8mdhsod0RpKm
 FY+1hyT+OtN5bsNTpO3QcjLrTU8qBHW8FEuOHonimDzGCah/FvQHrYNHLeQ7YF0QsX
 g6JgH0Pkb3UGQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 1/5] serial: Introduce UPSTAT_SYNC_FIFO for synchronised FIFOs
Date: Wed, 21 Mar 2018 10:52:37 +0800
Message-Id: <20180321025241.19785-2-jk@ozlabs.org>
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

This change adds a flag to indicate that a UART is has an external means
of synchronising its FIFO, without needing CTSRTS or XON/XOFF.

This allows us to use the throttle/unthrottle callbacks, without having
to claim other methods of flow control.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/serial_core.c | 4 ++--
 include/linux/serial_core.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index f534a40aebde..8f3dfc8b5307 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -678,7 +678,7 @@ static void uart_throttle(struct tty_struct *tty)
 	if (C_CRTSCTS(tty))
 		mask |= UPSTAT_AUTORTS;
 
-	if (port->status & mask) {
+	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
 		port->ops->throttle(port);
 		mask &= ~port->status;
 	}
@@ -707,7 +707,7 @@ static void uart_unthrottle(struct tty_struct *tty)
 	if (C_CRTSCTS(tty))
 		mask |= UPSTAT_AUTORTS;
 
-	if (port->status & mask) {
+	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
 		port->ops->unthrottle(port);
 		mask &= ~port->status;
 	}
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 1775500294bb..bf600ae0290d 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -232,6 +232,7 @@ struct uart_port {
 #define UPSTAT_AUTORTS		((__force upstat_t) (1 << 2))
 #define UPSTAT_AUTOCTS		((__force upstat_t) (1 << 3))
 #define UPSTAT_AUTOXOFF		((__force upstat_t) (1 << 4))
+#define UPSTAT_SYNC_FIFO	((__force upstat_t) (1 << 5))
 
 	int			hw_stopped;		/* sw-assisted CTS flow state */
 	unsigned int		mctrl;			/* current modem ctrl settings */
-- 
2.14.1
