Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcTn45KTTzDw1g
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 15:07:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a/FJdoaA"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 3so9502755pgd.0
 for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2016 20:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3UtMDVFsTCuidgwPetulgXcDHE9TZmXH1gwR2S9iKfk=;
 b=a/FJdoaAV2Drg/Q8pet0uStWp2kn/yy2944+yE6ZPtG22ZCO1hCdre4kw6SY06hzuo
 3jCn4PTuKTs/wUNs0EOOvhvuO1lEEYsERZ8fehfw7nGcfD3nno4EvLuqmMprR5Fz1JFi
 4US80BK2U1iXWqa7CqQajqKKo06pNpGLpeqocamPeco/K88KkOkpLZfkyj6kqJHGrPKy
 t5sv6RRQH8qcrmxO3RlWjuTraMNBHYDxeML623ikLwT7i0K2G9y80IAEnwEWGRg+Nbzs
 iEqoRs5ldRlDJQpG1z5DQ8JisJ9f+c9+all2FsJ9692blO4aGyZro+lB22qxFH/E3Cga
 NGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=3UtMDVFsTCuidgwPetulgXcDHE9TZmXH1gwR2S9iKfk=;
 b=Xn00aWf5auC/5YCFzKVNgfq1jzZvNr6CKn9Wuzf+oE17YrNdoZ9JXoLzziDVeMyO8t
 kHkbK9r6nh98yXxd2SPUPnNpWSvAyu3WHwklthXvGgYA8kXLWzrpRTwJjUaXbfhNo0FD
 Shp7f7yZiROM7ipvn36lRAuSFZBqfdHZu+1xv/h16dZ7vRvNiOU/SJaG2ph1U2n99Ms6
 /jU8k7yHZqFII5QgWtPzsGRpguTqaecegjFxOnanvaOYqZ3l0p0k9+WIhahyXTzk+by8
 RSrEFSrSKD8h7D3CQTU28Y2mQlYrTLTYCw3EN8QXhPHymXOi8w/2rMEwIqWNkqEGi8Fn
 hDvg==
X-Gm-Message-State: AKaTC00i2Qi3VUqR5S+6hTl3HWQCNMyTUx7yjNmTnsDqCdrwd6YnyIm4X26OsTlT2evlCg==
X-Received: by 10.84.197.1 with SMTP id m1mr182920120pld.159.1481515622750;
 Sun, 11 Dec 2016 20:07:02 -0800 (PST)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id w5sm72532254pfl.31.2016.12.11.20.06.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 11 Dec 2016 20:07:02 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 12 Dec 2016 15:06:55 +1100
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] gpio: aspeed: Support banks Y, Z, AA and BB
Date: Mon, 12 Dec 2016 15:06:39 +1100
Message-Id: <20161212040639.24467-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161212040639.24467-1-joel@jms.id.au>
References: <20161212040639.24467-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 12 Dec 2016 04:07:05 -0000

These banks have extra limitations compared to those currently
implemented. We must detect when these unique banks are being used and
special case their IRQ and input state.

TODO: Do what it says on the label

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpio/gpio-aspeed.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d7198536de13..c4d87a2a489f 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -65,10 +65,14 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.names = { "U", "V", "W", "X" },
 	},
 	/*
-	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
 	 * Only half of GPIOs Y support interrupt configuration, and none of Z,
 	 * AA or AB do as they are output only.
 	 */
+	{
+		.val_regs = 0x01E0,
+		.irq_regs = 0x0178,
+		.names = { "Y", "Z", "AA", "AB" },
+	},
 };
 
 #define GPIO_BANK(x)	((x) >> 5)
@@ -129,6 +133,9 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 
 	addr = bank_val_reg(gpio, bank, GPIO_DATA);
 
+	/* TODO: detect when we're dealing with GPIOs that cannot be set as
+	 * inputs */
+
 	reg = ioread32(addr);
 	if (val)
 		reg |= GPIO_BIT(offset);
@@ -158,6 +165,9 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 reg;
 
+	/* TODO: detect when we're dealing with GPIOs that cannot be set as
+	 * inputs */
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -233,6 +243,9 @@ static void __aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 	void __iomem *addr;
 	int rc;
 
+	/* TODO: Detect when a bank cannot be used as an IRQ source and return
+	 * error */
+
 	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
 	if (rc)
 		return;
-- 
2.11.0
