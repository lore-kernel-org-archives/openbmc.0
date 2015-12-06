Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A7B2D1A025E
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 02:40:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449416428813397.3543716396539;
 Sun, 6 Dec 2015 07:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 2/3] gpio/aspeed: Use handler_data in
 aspeed_gpio_irq_handler.
Date: Sun,  6 Dec 2015 10:40:25 -0500
Message-Id: <1449416426-1683-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449416426-1683-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449416426-1683-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Dec 2015 15:40:35 -0000

From: Jeremy Kerr <jk@ozlabs.org>

In the port to 4.3, we converted to the newer irq api, but used the
chip_data for the struct aspeed_gpio pointer, rather than the
handler_data.

We use irq_set_chaned_handler_and_data to establish this pointer, which
sets handler_data. This change uses the appropriate pointer in our
handler instead.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 87e159a..152b7d4 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -302,8 +302,8 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 
 static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 {
+	struct aspeed_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct aspeed_gpio *gpio = irq_desc_get_chip_data(desc);
 	unsigned int i, p, girq;
 	unsigned long reg;
 
-- 
2.6.3
