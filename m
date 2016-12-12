Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcTmq65ZdzDvtw
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 15:06:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vzE7cKOH"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 144so3688455pfv.0
 for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2016 20:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=JN2l6KPiqby+HzbOD7FAw8TGcZblDYLNZPDFeHZQmGk=;
 b=vzE7cKOHOZkOIDvejUxlWRUz/kNUBf35b0M7YFE6HQNUyiuPNLWs0T5b0F3zWBeAfU
 ncnXNIaZ5Jp6imN2EApO/NfRVUmSEj/+shcZn02JvBCXKPHXqz600XHvwsQcfhx1zoUl
 y4TrDqJwNJ94ujIMt84vXsPJNDkrC9H1aYj4HnO9sXlzIwK3UxuC2wqpWBSnuPEYr5d8
 eiW4g9OkpovTiyXBpbEGtCRaYQvBaCkXo07D/9HjM6b8RIGhR81LC/NzbwBHnlHKd2Ul
 joX5Ly56yDp3aZx5SxwkZBcl3xErikg/Ln7pYfX0KdY2il1SFYjTb0v8UBc/oMdh2ssJ
 EN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=JN2l6KPiqby+HzbOD7FAw8TGcZblDYLNZPDFeHZQmGk=;
 b=Ii/9V/YF1DYt2TNNXP5qt/kGMdtIjip1bDUTmN8PXAfy0I+EvVWnE+MYZmD0KADsir
 vhbmx+XruUfI5CJpKmSYS9BrjNT91h0ug7ZyyLBToIFGW34ZgksfY1EGzTgTmGNnH5tN
 Bb0mzPWInH7rvzzufEA4L1AzBn55VjqBnUStRVeXzqn+aNg6SS2LyJGAZ2Yo5zs9qKKX
 /pJgBmdUieQ1i4ZdEuuITwyYKfQ/Hu2aspafM5TKtIDhJ1fhy4y1ALPSv6tVBz30cdgR
 /JyTOTZ67YwpnVlT0c3HygS/kjFDNGuTlVYufl7ZEq8MtuUOdEjd/hxbSqBw2/3MM9ZA
 tHcQ==
X-Gm-Message-State: AKaTC02ixp3UQ4YHH3FDzexPeBcmrxPuJzz2a5T3POBK5ICVosGzK7nDKRTJwSazHWDbkQ==
X-Received: by 10.98.76.8 with SMTP id z8mr94295983pfa.167.1481515609656;
 Sun, 11 Dec 2016 20:06:49 -0800 (PST)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id q14sm72577318pfa.40.2016.12.11.20.06.46
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Dec 2016 20:06:49 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 12 Dec 2016 15:06:42 +1100
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] gpio: aspeed: Make names two characters
Date: Mon, 12 Dec 2016 15:06:38 +1100
Message-Id: <20161212040639.24467-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 12 Dec 2016 04:06:52 -0000

The ast2500 has more GPIOs than can be represented with A-Z, so they use
AA and BB. Mak the names strings to accommodate this.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpio/gpio-aspeed.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index e48bd1ea82d1..d7198536de13 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -30,39 +30,39 @@ struct aspeed_gpio {
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
-	const char	names[4];
+	const char	names[4][2];
 };
 
 static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
-		.names = { 'A', 'B', 'C', 'D' },
+		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
-		.names = { 'E', 'F', 'G', 'H' },
+		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
-		.names = { 'I', 'J', 'K', 'L' },
+		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
-		.names = { 'M', 'N', 'O', 'P' },
+		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
-		.names = { 'Q', 'R', 'S', 'T' },
+		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
-		.names = { 'U', 'V', 'W', 'X' },
+		.names = { "U", "V", "W", "X" },
 	},
 	/*
 	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
-- 
2.11.0
