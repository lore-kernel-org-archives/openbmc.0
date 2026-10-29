Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093CD606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 01:34:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFRc71pP8z2yfs;
	Thu, 29 Oct 2026 12:34:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793237686;
	cv=none; b=EWb+pFy06qfftlMEO6+pBWo+SBNsA3EZQ/qDhovxm78eUZU3mYfyXv9jAxSFdpSXvMW325ts/pFAhPWd2rQtA7PCQHC/fQ2hHnGx0xa7Kv59n6r++KpDKLe9Ypv3HOdgY7JqnSi8AR+o0XVHuUKJtOMUAWEwNjJJDeTFm3/zB216Po3FQLQ7A146ZZdyUe05O6o1Aa8Dkk4nmuVejf931fwCWscZRBGXq2RRRN7Wk4Vx08EEJLsA0jEDYn0XOZcgj+jbk1fUmlpVoc73wmLmzUoHVWoeut3JFcVlYar0hRxohsIQamzwEqZ3ePk3/6QZPpnVS3GEHeF3B3oVix3+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793237686; c=relaxed/relaxed;
	bh=EvJTcsH1taYhQJdgfQ6MfmGk8EPaIswn9WGvtBGoVc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OokuGX4dub9mMHD6TAQ9QHYkRFYEjTGjvXQ3YviDUS8dnO506Cn+e/CmgFFinNpf21rjsgtPejNiZgKNOp48PbpCdfMO1JcqlbYzn58BK39HQg1KPetpErTnt+rYXuRQ025cR9P7xfPWun41vidF3Tv4wMBbh3tWvwMs4krCyDqfz0A8X26jpWAnQcF2olPIFEs+i8n9gzvYGCZ8hAgXSs3DoZh+LyIrN76Thmg0R+gV6+e2R9NtFx49Qip1leC85Jdio1fLqyP35fUBptSIZjSH0tpNCKf+B1yMjVMQlaUtAfT1ahW0ShNSVA/ZWGnmgP5B/BTJvJmhf0FiFZUrPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFRc551xJz2xm5
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 12:34:44 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 09:34:28 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 09:34:28 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/6] spi: aspeed: backport timing calibration improvements
Date: Thu, 29 Oct 2026 09:34:16 +0800
Message-ID: <20261029013428.277816-1-vince_chang@aspeedtech.com>
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

Backport six upstream Linux ASPEED SPI commits to OpenBMC dev-6.18
to improve clock selection, timing calibration and address-window
management.

Chin-Ting Kuo (6):
  spi: aspeed: Update clock selection strategy
  spi: aspeed: Improve timing calibration algorithm for AST2600 platform
  spi: aspeed: Force default address decoding range assignment for each
    CS
  spi: aspeed: Centralize address decoding region management
  spi: aspeed: Add per-platform adjust_window callback for decoding
    range
  spi: aspeed: Only map necessary address window region

 drivers/spi/spi-aspeed-smc.c | 644 ++++++++++++++++++++++++++---------
 1 file changed, 489 insertions(+), 155 deletions(-)

-- 
2.43.0


