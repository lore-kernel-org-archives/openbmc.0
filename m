Return-Path: <arnd@arndb.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 360 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Dec 2018 09:18:06 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43GlL61ghkzDrPH;
 Sat, 15 Dec 2018 09:18:05 +1100 (AEDT)
Received: from wuerfel.lan ([109.192.41.194]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3sye-1hXhFg13ei-00zm3J; Fri, 14 Dec 2018 23:12:48 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Cc: stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] [stable-4.19] i2c: aspeed: fix build warning
Date: Fri, 14 Dec 2018 23:10:10 +0100
Message-Id: <20181214221023.3878670-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181214221023.3878670-1-arnd@arndb.de>
References: <20181214221023.3878670-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UkDh7AG484n7mftoFIvINl/KQAshkFrxhFrTWJuknl6fAci4RsD
 r2sYU/EayygD4/EPUGi7OUGgeEz8n2p/M+Tl6MGhPwME2fZB/wFT5SuwNsriCqXSOdTEcWW
 jp6L6hj5ezeETo5Wg1oJ1f7cUqzp7K8vXjVFXzRnaDopCPsED3a61Kzok8i7h1gei2g7Xcm
 6GiXNpZ+un4kJECeNifyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UZvVTYY6TOc=:a0SqgjbppiTuBKYUNbXYdt
 RS4aDVScyDX9sxhju+nt2hsnzyYRW3xpXYBQ/Hv7QG3y/GAy4ygBxfHgWUceULeDf5yoBDRGQ
 IjM/rzzy464vlko4OjMrKB8aC5tfHI2jpi9BR3+2S1nD2+YEsOe4e5jRP2Vwp0Es2BgPnlmP7
 8qmCpdjIupkKbhsPhKSVftTzvTKGawOZv2YDFnxFwW0fWQ6iPDsMYPucXcQFpGPvGwDpyYaJB
 ckqqFxf8e/4nlcklwMd/TlYKsPGDc0j4LzS1piVJ/3o4eN0UNGwSoTduhonYezL2xNRion2wM
 Q5ozoYodpQu89lg5KMtqpbiF81mRgdpQhddiEp2lyWZLgWCar5ZKoESER9h7aJ3XtQi2BGwBm
 fcQgs0zHefhoPo7ea0zu1tyHXiPa8bLgUZTM8wMyWWLSHdztI7ZZ7ooseLBdnFeruEaVkcfNL
 vymJQRIv157f0oK4fwjTG05wpA9CAZ8CKVOd10SF6gx/Lvg0iMxGfMA8k6v+gkGCyF+1fizoD
 LFIJcvB3LcelJIS3GVZ15v6+TuVEBqve0I/619tGvNtuQDUZcZkbb7eXqdFJKBp3TGWzgmN4A
 o1sB9lwZQ2jofsvV7r2wb4tmynHLuQv4rLe5OKoVj89OF2sMVV8nuSdZ/vkQNc0byJO2A2ejh
 lm1dOo0BJSZrRV6LwbGbW//x2A7GqULrykEv+l+CWrR6yKuvG/H4U/V9BN6FeYsH/9EVQzn8z
 yHu+2Cr6KVz0Nad+sKfGM6zPQ6/2jljKvGr1Fw==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 22:18:07 -0000

Upstream commit 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events
properly") reworked the interrupt handling and fixed a warning in the process:

drivers/i2c/busses/i2c-aspeed.c: In function 'aspeed_i2c_bus_irq':
drivers/i2c/busses/i2c-aspeed.c:567:1: error: label 'out' defined but not used [-Werror=unused-label]

The warning is still present in v4.19.8 and can be fixed either by applying
that original patch, or by adding a simple #ifdef.

Here, I choose the second simpler option as the original patch seems too
invasive for a stable backport.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/i2c-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a4f956c6d567..a19fbff16861 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -555,7 +555,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 	spin_lock(&bus->lock);
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	if (aspeed_i2c_slave_irq(bus)) {
+	if (IS_ENABLED(CONFIG_I2C_SLAVE) && aspeed_i2c_slave_irq(bus)) {
 		dev_dbg(bus->dev, "irq handled by slave.\n");
 		ret = true;
 		goto out;
@@ -564,7 +564,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	ret = aspeed_i2c_master_irq(bus);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
 out:
+#endif
 	spin_unlock(&bus->lock);
 	return ret ? IRQ_HANDLED : IRQ_NONE;
 }
-- 
2.20.0
