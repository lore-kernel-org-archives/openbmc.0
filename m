Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ECA606A31A
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 03:37:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDtMd6bvNz2y7r;
	Wed, 28 Oct 2026 14:37:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793158621;
	cv=none; b=NHKtj0vhoPrwbVBc9pEG8FwKYe3lZt4mNLodVYxf8ftgdqN1S0SOzUKxLHuotQmEFyt16UHR9YJt7Fd1dQPs1i+QafB1cNlw/szfcosbhmCZe2ouehUMrDZEb2Epj9+YN3+TWg631i24dzwsXe5jtPu2mcEPZZcarNHqGqVhSHdLr+E0aBCpy2bXp+eBcgNIYO46TlWpNsCuDrZNp7WUos7M87Wy3Z0ASvh3mbG+8QoeJtqpq06ytVUy9MSeA8SVvBndMyRaDu5QE2U+cT6yrM1/bbXDaz9UA0pZRCtg3blmtP88i0KT+yRXkoiakivBsn0JLsrNnvYXRACgDURGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793158621; c=relaxed/relaxed;
	bh=WE1ku1/YUpecr8Q297Qu6WIBKXPobo+loAqf3kdg6Cg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CHAisOo9DknhDqPuEHBQv9m2m90HqrilOgN7RlkD0O15F1izYRrWVngdQo6c/3MDxJ+ggdfEZPFG/bFETFDvTT1hJRNBUHl+dhIriumGBTdEKWY31aSZ1BQuyX5coFp5OWRLBEDaucvOzCu9SXaCu7om+AJcPd500wL91DSr5RQXrVVA2xNyD37aZijVsb+RCvm4tZn3P2T5qBsq9LAXl0TwieJmZnN6rUgT/wJYvZFYpVCXHgCWI0+2q0CZ9MvB9V65bv4OXkJUyi1SmcO8OhnjaulaCWjkD8ndf1vZtxBHJnXgUfd2NKq/zTLYUh5ZsGR5NVk7ZmaT5HDlcERHRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDtMc53J6z2xnv
	for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 14:37:00 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 28 Oct
 2026 11:36:44 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 28 Oct 2026 11:36:44 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/3] clk: aspeed: backport AST2700 support
Date: Wed, 28 Oct 2026 11:36:39 +0800
Message-ID: <20261028033644.355247-1-vince_chang@aspeedtech.com>
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

Backport three upstream Linux ASPEED clock commits to OpenBMC dev-6.18
to provide AST2700 clock controller support.

Ryan Chen (3):
  clk: aspeed: Move the existing ASPEED clk drivers into aspeed
    subdirectory.
  MAINTAINERS: Add entry for ASPEED clock drivers.
  clk: aspeed: add AST2700 clock driver

 MAINTAINERS                            |    9 +
 drivers/clk/Kconfig                    |   13 +-
 drivers/clk/Makefile                   |    3 +-
 drivers/clk/aspeed/Kconfig             |   21 +
 drivers/clk/aspeed/Makefile            |    4 +
 drivers/clk/{ => aspeed}/clk-aspeed.c  |    0
 drivers/clk/{ => aspeed}/clk-aspeed.h  |    0
 drivers/clk/{ => aspeed}/clk-ast2600.c |    0
 drivers/clk/aspeed/clk-ast2700.c       | 1055 ++++++++++++++++++++++++
 9 files changed, 1091 insertions(+), 14 deletions(-)
 create mode 100644 drivers/clk/aspeed/Kconfig
 create mode 100644 drivers/clk/aspeed/Makefile
 rename drivers/clk/{ => aspeed}/clk-aspeed.c (100%)
 rename drivers/clk/{ => aspeed}/clk-aspeed.h (100%)
 rename drivers/clk/{ => aspeed}/clk-ast2600.c (100%)
 create mode 100644 drivers/clk/aspeed/clk-ast2700.c

-- 
2.43.0


