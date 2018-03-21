Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405ZDh12c3zF1bT;
 Wed, 21 Mar 2018 13:55:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Y+R3Rp3C"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 405ZDg5zxXz9s02; Wed, 21 Mar 2018 13:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521600947; bh=PE5IOMnQR4fNaptlpqlDri4hA0/3384Cfz3j8Gz6plo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y+R3Rp3CCWZ0m29gn6ge+jI8q0Cor9FvIdJOA0OqexOTnElmKIgrThSdYAmFuB8it
 /J+7in3RAhuuZaZr9wh+Xjc5b3P9JOco0ureGUHcsPv6O1GRwuWkg0wL/H2nRgf1fe
 1F9C5+G8UbezEs9zhV7UyNrxjE/cFO+q/fFUC9XYaV4BD0VGbMs2jQs6u+uBDFaRi1
 LlBfeGzwkU6kueSG/5IBrAJaxHNsx3YMyH0KB240uFimGoI0v7eIswGlp9/Tl9zViK
 7NP1iNS3sLkhVOLLPt+sgkiFkDSTcnz3CT+wkMQNeypYpPQYCm4sR8JZzvK99+25Q8
 frlE6OGfjC2Yw==
From: Jeremy Kerr <jk@ozlabs.org>
To: linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 2/5] serial: expose buf_overrun count through proc interface
Date: Wed, 21 Mar 2018 10:52:38 +0800
Message-Id: <20180321025241.19785-3-jk@ozlabs.org>
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

The buf_overrun count is only every written, and not exposed to
userspace anywhere. This means that dropped characters due to flip
buffer overruns are never visible to userspace.

The /proc/tty/driver/serial file exports a bunch of metrics (including
hardware overruns) already, so add the buf_overrun (as "bo:") to this
file.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/tty/serial/serial_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 8f3dfc8b5307..fc677534b510 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1780,6 +1780,8 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
 			seq_printf(m, " brk:%d", uport->icount.brk);
 		if (uport->icount.overrun)
 			seq_printf(m, " oe:%d", uport->icount.overrun);
+		if (uport->icount.buf_overrun)
+			seq_printf(m, " bo:%d", uport->icount.buf_overrun);
 
 #define INFOBIT(bit, str) \
 	if (uport->mctrl & (bit)) \
-- 
2.14.1
