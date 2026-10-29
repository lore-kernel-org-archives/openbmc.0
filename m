Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A8606A31D
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 05:09:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFXMT73Y4z30V4;
	Thu, 29 Oct 2026 16:09:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793250549;
	cv=none; b=fJbhxChAvOKzPB6DyeWDxgq6sK7HXdSAVEIA7R/WI1Sk9JGyS7Qzs5Bdc6umNGcRuTgEMlHvJuGfF2HSr4HdJCyY9XMLG+K/Q+CiuRaMtjtUdWEkQFzFR7RzFJM+Q2eIf2ilPueWDVSuwOdlWr4lGIze7rKjq7UlTIunTKJ5n+ZzSNItdpawM1QvG9lCccatVI+79D2MzGa7zM+2JvCvtpV4w2VrqmqSsKSGeSGqixJzsvJA5G8M9cTBao3sxZqwPOdz1k08l9+Ts8IJZ7gCa5zNhQb5ByUxdHAFUkSrZa2jI+gVdZKCoJ1ioxkE6hYs0wFQGE9HmcWsCeHENH1GIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793250549; c=relaxed/relaxed;
	bh=INhECbPu0+VMbgQczo2daxAp9AYTYASFnrt8zexY3Is=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ck1SukKQAtw+ytkY2QggKypwiNd4n18xYD63jU+NbhGy3QLqWbiJF1xHQm0eIeY+ULks/6XAxIVxAqNHXd5UwJu0wLv8tHsG2RjraGmeH7eWk0121pxYwoB3SkAoVTuTbfYJaZyYNWdX9FfXNW/vF/Mzu4/Zi2+u1HLx2a1XJpxfKmaaZgsZqHoKNz04JEoKacLuIu7Eoun7bIaw+zqDG0T3dtxKS33nOYlMzSd8J88XNyy3hDRlh9aYG+0QX3v1TQvPBQ68Ehxt64jE/6o8ItRD47vYjdet51Ew+fFzIpxEZf+Wa/WysQ3tKc5Awg/Z1a098f6El3p9dwaTg8qNDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFXMS65lWz30Tf
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:09:08 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 13:08:47 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 13:08:47 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, "Guenter
 Roeck" <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH linux dev-6.18 3/4] watchdog: aspeed: Add support for AST2700 platform
Date: Thu, 29 Oct 2026 13:08:44 +0800
Message-ID: <20261029050847.810331-4-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029050847.810331-1-vince_chang@aspeedtech.com>
References: <20261029050847.810331-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Add AST2700 platform support to the ASPEED watchdog driver. This includes
a new per-platform configuration with SCU reset status register at
SCU1_070 and support for 5 reset mask registers.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
(cherry picked from commit 13e86646710dd5e1ec68798ab44773e314612d83)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d23e565f30a8..c9e79851504c 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -83,10 +83,24 @@ static const struct aspeed_wdt_config ast2600_config = {
 	.num_reset_masks = 2,
 };
 
+static const struct aspeed_wdt_config ast2700_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 0,
+	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2700-scu0",
+		.reset_status_reg = 0x70,
+		.wdt_reset_mask = 0xf,
+		.wdt_reset_mask_shift = 0,
+	},
+	.num_reset_masks = 5,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
 	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
+	{ .compatible = "aspeed,ast2700-wdt", .data = &ast2700_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -483,7 +497,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt")) {
-		u32 reset_mask[2];
+		u32 reset_mask[5];
 		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 		int i;
-- 
2.43.0


