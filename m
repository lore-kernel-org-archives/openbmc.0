Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq5gd6WflzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 12:39:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y9lP5N9j"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id p189so158083pfp.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 18:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=TW7n2PpQF2V1fnrecfqnFfcG5wORUBhTCQkfokV3rsQ=;
 b=Y9lP5N9jbHzb3oFsPop4t7OgjAPMJ2+YQ1OgoS0yXfGNMPmfTBtcjiYW7jhQaugZ0g
 mFwIlW+dYSIiPxdfLXJQTXYoxTJihq8CcE9+ZdBIFavxm4k/dNyvJ1a/UvGS3ulTRMVN
 /n7r3WLEFXiFw/az28N5By0FwuCuvRiuF26v0xakqsiUz2P8CoX/9rOsv6toJFGiyUHm
 yCoysaEQXIJYbP3SdrpkmXDtybek0sX0jqrDE3QVaeqnk6BVUoN77vpYJaG41DUuIFAD
 xtmIw9vQQrbFSHX+t4rqq+ksA5lVqs8/49ItsxgWdPEg1oNzxcFjzcjyxxvi0TlnzOHs
 W/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=TW7n2PpQF2V1fnrecfqnFfcG5wORUBhTCQkfokV3rsQ=;
 b=hS86ThXrOS6ZoHlXBqB8jxpiNh/RR9BX2tJ2i4e0RBj9cjiZomn5JDVJqM7zKtS7vm
 zunj0s4Nva5RkbPw9EuVV9uaNbiRp9/cSVicmp0N8bTQbOwm0wUn7nb8p09bg/Xfa1B8
 FtWSblVcNNr5AQCGAncuaXI5CeovpKD2o4stcfq+MzgLcXvovg6WlH5IopDitG+38N8O
 IJynQDGlr3P29VaXJpdduukdNyg4RoAqsuMOqtLTYsIJkgNFkeYpnb4f18SDwR+/Px87
 GVbcBAC5/HrC9fvl3uUykFYcHHnPF5fkwOVK1eH/4+1rI3nSS4BYtOiDy2jEQ9CWotIC
 +s+w==
X-Gm-Message-State: AFeK/H2MfMp4SALQQZ8gT7YPI2BEQKo3rLd4A7CQaSIr5YlAWCQQ3RtiP6NpolV00Lsu6Q==
X-Received: by 10.98.62.219 with SMTP id y88mr6111197pfj.62.1490319563434;
 Thu, 23 Mar 2017 18:39:23 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id a21sm418015pfc.36.2017.03.23.18.39.19
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 23 Mar 2017 18:39:22 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 24 Mar 2017 12:09:14 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] tty: aspeed-vuart: Add IRQF_SHARED to flags
Date: Fri, 24 Mar 2017 12:09:06 +1030
Message-Id: <20170324013906.24050-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 24 Mar 2017 01:39:26 -0000

All of the LPC devices share an IRQ line. When other LPC devices (such
as the BT) have enabled IRQs we receive them unexpectedly in the vuart
driver before it is ready.

And the IRQF_SHARED flag to the vuart driver so we ignore interrupts
until we are ready to handle them.

Reported-by: Anton Blanchard <anton@samba.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/tty/serial/aspeed-vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/aspeed-vuart.c b/drivers/tty/serial/aspeed-vuart.c
index 020c8159d25d..42ccb380af41 100644
--- a/drivers/tty/serial/aspeed-vuart.c
+++ b/drivers/tty/serial/aspeed-vuart.c
@@ -238,6 +238,7 @@ static int ast_vuart_probe(struct platform_device *pdev)
 		port.port.line = rc;
 
 	port.port.irq = irq_of_parse_and_map(np, 0);
+	port.port.irqflags = IRQF_SHARED;
 	port.port.iotype = UPIO_MEM;
 	if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
 		switch (prop) {
-- 
2.11.0
