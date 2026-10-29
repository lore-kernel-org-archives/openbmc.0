Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589C606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 05:10:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFXMW0VT4z30VT;
	Thu, 29 Oct 2026 16:09:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793250550;
	cv=none; b=ioMBrRhIVsZbIt3hLKnj0WG14SX0eWX1/Ovnwo3eKT696vfirHSaB4kSneQ2asVbsVuZFxNSJ51feAU5TJrNEHVqRUAa9vqYYyphJK9uYh0xov4ty7B7MDQN3FI3yYctaLf3LneC7ybPvoRdT0lf6DCzpz0OF3i7mHunFPwO9epFUDmDn7Iilh95kGgvorIbOPC7uSbhwM6b3k1ONrq+1iRHVFLp42lLvZ/cNWpcWXcGWSM7T03G+YFWPX4upqCJbgoU94UpOMMzLjeAIOu/0UmSnVpeyub8SJ56ydHFVKcUY4XmYZxLnZc4Q/xyxFpvJwS1znTtF3/VZMBxPgKXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793250550; c=relaxed/relaxed;
	bh=4te+YnjNFpIp0QOhvRQ+HtCMclTk/q2Ai/UZ6krjGaM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fhpdbi0mRTGIpCDzOcc1xCcgy22LvwwvKg1K14T3KPVYg5fDHlTRNKjeHQFwTBnrvpofTuSz87kxU916Rd9KvTSucfp2nHo43KkIc1/1jB0E6/CAO0pu0RkA0XuuZ6gsQL70eBm7q8XiTtLsFNOdZxHityc5wHd3uDy37BzZlcq+21rN3uQSOQW2PMSqBu26KvOWXmaNegSh3NMvKbg8oAp3MbW+Mlg0tMO8exjYVz460yk7a2RzRBK67EFToxjZrU59r4LjCVtFSZHj8tpfV/NHpnd/Vym5zmvk/MU7Tf9aMJDxmwl7eYqFY7W94Fq4nqKWgWrRhB5qDPuYpc5A8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFXMV0DN2z30V6
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:09:10 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 13:08:48 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 13:08:48 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: bui duc phuc <phucduc.bui@gmail.com>, <joel@jms.id.au>, Guenter Roeck
	<linux@roeck-us.net>
Subject: [PATCH linux dev-6.18 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
Date: Thu, 29 Oct 2026 13:08:45 +0800
Message-ID: <20261029050847.810331-5-vince_chang@aspeedtech.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Link: https://lore.kernel.org/r/20260807081652.38692-4-phucduc.bui@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 1f3c3fa76ddbc2eb92b60c5d4db24d7f702a7811)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c9e79851504c..48454ac86074 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (wdt->cfg->irq_mask) {
 		int irq = platform_get_irq_optional(pdev, 0);
 
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
 		if (irq > 0) {
 			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
 					       IRQF_SHARED, dev_name(dev),
-- 
2.43.0


