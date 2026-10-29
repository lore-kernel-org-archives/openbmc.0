Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FFC606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 05:09:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFXMQ1SK3z30NF;
	Thu, 29 Oct 2026 16:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793250545;
	cv=none; b=cycncCGsCqb1AHl1REMLGwR9oNLGwV6ojgqNydGqZyHS3hAqlArf1ULGqngGCnqzG4Nk/pEzHs4/TGMOYToL3gBd6uApc2CJw40DkvNMYy3rwtNA3HmmYkBP2ZyY3aiMQT1fmtuVqvFArhHc9Wr98kj6yDml4oUm3SWYe6lU9e4tc/n6ms3PVJoaTUPpSD2ZAdwF90MT94QZZUhgIC4GH0DuUfNaIBqpAt8ND02TCK07DGnTqXajFUrOTk0XgvNwBFVWCOgRQX0G9bxYWxeydnglm1Tye/UmPT0NOEzPmIc96ppEKVf4gaTsmhhu51x4OaCqGxG2rqLSDGl4fxcDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793250545; c=relaxed/relaxed;
	bh=UhiEJLNQqil8mFjDxBq48vB5MKFbwjQSfLcpdJlPPNI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j+lABBhibAVAv/11uKJndVRzQm9roeAvDTqmQcrMbrq7NGfKHv+90ZW677JHnUw2CM2HjVWV7Sasfe4yQ/xyr5l/ztVyQFHNchKnGEoVlO5RGJ3Cy6r8jJa8BM9GAn1wShYFHOA7TFx0bJczdbqIgg5Zdfelm1Xo3FWToP40ZASHlKjFLCB0lqRTf5cqWIwqaaC1GwpJczggJIeYUwKf0vtIG88DOfZmm4gKV1cu/LEYTnG/xNomhecFF+Gy8Z6wvPRXM8qKRX+4N2iPXU1CMBDuk0WdgPHQ0e2MHqhUsi90jQrqlQUWNizoCG3Bozsyh80zE1kv3meRcK8UUo08/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFXMM5Kkdz30C6
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:09:03 +1100 (AEDT)
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
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/4] Backport ASPEED AST2700 watchdog support
Date: Thu, 29 Oct 2026 13:08:41 +0800
Message-ID: <20261029050847.810331-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport four upstream Linux ASPEED watchdog commits to OpenBMC
dev-6.18 to provide AST2700 watchdog support, device-tree bindings
and reset-mask definitions, followed by the optional-IRQ error handling fix.

Chin-Ting Kuo (3):
  dt-bindings: watchdog: aspeed,ast2400-wdt: Add support for AST2700
  watchdog: aspeed: Support variable number of reset mask registers
  watchdog: aspeed: Add support for AST2700 platform

bui duc phuc (1):
  watchdog: aspeed: Propagate errors from optional IRQ lookup

 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
 drivers/watchdog/aspeed_wdt.c                 |  32 +++-
 include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
 3 files changed, 169 insertions(+), 9 deletions(-)

-- 
2.43.0


