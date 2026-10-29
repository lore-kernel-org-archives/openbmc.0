Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB05606A31C
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 02:02:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFSCy3r88z2yfs;
	Thu, 29 Oct 2026 13:02:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793239342;
	cv=none; b=HTFQmyRKLqbSkPz6xSTAVjyEnAbuVQLiupp96vAaxdV36VJEl2ybedwbnGSpLtN2a1D06NjKVqdWV1xuL6Ri1mFN6fdPjpsPDnhHG6om80Rvm9N+8eDzRTliK+FJTWNW94zIhluyFSVUsUnrfoWGP5LmCUaVoTsGFq0cWSroICSFa8QZGItuWkSSk1shljzSENHIR14Z59ouoJ5ysstwOyN1Zf3mkIjnZ09NghY9pjqqRWK306R1xf5/Z6c/ACIPv3FI+kGDTpEVrNgCKMKfkQpAiN50Bfx0K5yg2pyR9+0k0hqrDVEnMOCoOQzTMGrX7rQ7tjjmRt9aOeaRBVfO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793239342; c=relaxed/relaxed;
	bh=0I51PM7hU57hR02UyHg57dnvbKi855kp7MD5TKZSNhc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqZO6RRqVDDYYXgfvHntoDBc+d1rGH1KGfV3T0z55HrN7IF7sbrxR/3Rt1fFNE05cfivg0pjlT5ItY90CHQQaFHZhUkXO1LcGjfdzo1CCF9OJ1TyfZ6b5m2wZwKwTbzfryfjqI6M3pACzBP3xUe5Bvosa28qSjd+SHMg9eNbPHkAN8P4Hkk00PLwHHgD4UdC+cdfY5IcTwZLor+RqxcnNsRWNm5I+OVYN/MWiDQT1or+VNyNoEm+9hu+lnyUBns0T1hvJAlEQSNFW06oBohxmP7A7UvlY7yh5E8SBtWFBec2+yjveuLGna2MoSPCN/imaYY/pK478osOorBW0oNHdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFSCx0jMLz2xm5
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 13:02:20 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 10:02:06 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 10:02:05 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/4] spi: aspeed: backport AST2700 support
Date: Thu, 29 Oct 2026 10:01:59 +0800
Message-ID: <20261029020205.335352-1-vince_chang@aspeedtech.com>
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

This series backports four upstream Linux ASPEED SPI commits to OpenBMC
dev-6.18. It adds AST2700 controller support and bindings, Quad SPI page
programming, and 64-bit bus address support.

This series depends on:
https://lore.kernel.org/openbmc/20261029013428.277816-1-vince_chang@aspeedtech.com/

Chin-Ting Kuo (4):
  spi: dt-bindings: aspeed,ast2600-fmc: Add AST2700 SoC support
  spi: aspeed: Enable Quad SPI mode for page program
  spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit
    platforms
  spi: aspeed: Add support for the AST2700 SPI controller

 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   4 +-
 drivers/spi/spi-aspeed-smc.c                  | 107 +++++++++++++++---
 2 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.43.0


