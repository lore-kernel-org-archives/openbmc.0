Return-Path: <SRS0=oCxL=GQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D60C433DB
	for <openbmc@archiver.kernel.org>; Wed, 13 Jan 2021 22:41:39 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EAF23370
	for <openbmc@archiver.kernel.org>; Wed, 13 Jan 2021 22:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56EAF23370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGMr1257QzDrhp
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 09:41:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGMmK2PK9zDrgZ;
 Thu, 14 Jan 2021 09:38:24 +1100 (AEDT)
X-AuditID: ac1060b2-a7dff700000017ec-b8-5fff765d82bc
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 05.B8.06124.D567FFF5; Wed, 13 Jan 2021 17:38:21 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 13 Jan 2021 17:38:20 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
Date: Wed, 13 Jan 2021 17:38:08 -0500
Message-ID: <20210113223808.31626-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113223808.31626-1-hongweiz@ami.com>
References: <20210113223808.31626-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWyRiBhgm5s2f94g8dvdS12Xeaw+DL3FIvF
 7/N/mS2m/FnOZLHp8TVWi+bV55gtNs//w2hxedccNotTLS9YHDg9rrbvYvd4f6OV3ePix2PM
 Hneu7WHz2Lyk3uP8jIWMHp83yQWwR3HZpKTmZJalFunbJXBlnHs2lbmgi6tizwP9BsatHF2M
 HBwSAiYShzYldTFycQgJ7GKSeH+xnQnKYZQ4uOMBYxcjJwebgJrE3s1zwBIiAieZJGbt/sUE
 kmAWUJH4sfoaK4gtLOAisfrXezaQqSwCqhIn1uaDhHkFTCUapu9iAbElBOQlVm84wAxicwqY
 SbxquAY2XwioZkP7LHaIekGJkzOfsECMl5A4+OIFM0SNrMStQ4+ZIOYoSjz49Z11AqPALCQt
 s5C0LGBkWsUolFiSk5uYmZNebqiXmJupl5yfu4kREuibdjC2XDQ/xMjEwXiIUYKDWUmEt6j7
 b7wQb0piZVVqUX58UWlOavEhRmkOFiVx3lXuR+OFBNITS1KzU1MLUotgskwcnFINjA4Cfs/+
 h7F+/rd2tcJJtvVL9m3atPe+yN2rpdnXlraL57qlHaniva/hrXr8cd0KK5ltDd1X7pWtaayx
 jnz8kdNx27K/mdHJKdw7HjnUvN+151Pc3EChrgKWuYuXN9YxbZFrzDF/113F/n8HX1FJ0q1t
 x/S2Shyx+C0oeun8zYXXHyW9LVT690OJpTgj0VCLuag4EQBg8FzCYgIAAA==
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
Cc: Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add gpio base address reading in the driver; in old code, it just
returns -1 to gpio->chip.base.

Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/gpio/gpio-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d07bf2c3f136..4ebe4c40154c 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1140,7 +1140,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
 	int rc, i, banks, err;
-	u32 ngpio;
+	u32 ngpio, base;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -1179,7 +1179,10 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set = aspeed_gpio_set;
 	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
-	gpio->chip.base = -1;
+	err = of_property_read_u32(pdev->dev.of_node, "base", &base);
+	gpio->chip.base = (u16) base;
+	if (err)
+		gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
 	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
-- 
2.17.1

