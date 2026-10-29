Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF28606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:16:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTs443Myz2ygg;
	Thu, 29 Oct 2026 14:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793243768;
	cv=none; b=dhWtkbL42XLl+gaHJ6TPLN2SLeBpaS8cWuAxaLXfppGFXStUn0F3iH1BxX3JnxWJjcqjswSrtgTjn84CMv8AWdT5LMbTtmekOraOVbnVGUomrKNUIyoYESS02AF+bLzILChs7NftjIYiJ4hSR1I7qW1uDPBzCvY0hADHzcud3kjVmWF6fnmWDdFmfdqQ5pVjnFiAqtVOvxWTVCMrU+uzPPNxE2yIf7wHOoeY/pwyn7WCXziHznAJDZrux+IN0EPss0l579SXqlRRrEJqgro2boihFyGofBQ1PRErSEtGhxSOg0LJNYmCMdeU5Vk1bnlTdVKboOqegY5S3imXMOjh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793243768; c=relaxed/relaxed;
	bh=vIxLLlBemoSlc9+uWjmSusCyYLAKzgpuvSb1/FdgbZg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cXJPwaRxHc9f0dLGkprgYS0ovoiUyVkTOhM+Khh4GrFEaQl4wjtSJLHpsq7/ZxN441k1nkrClqBLBsmNr/zDA1R0rKp3PqGP3Y1bf5owO/ACe1ZLA7pkzKGoN/BdjrAFbZ/Ht9D0LVXxIqHTJJH3jzzhQmoQ6TrU4Me2cflrl7tXzgA47hlYcVgCs57k+KEeRSvpDdRQB4FA+j9EAvdJf3vNuL9JVAlTzi+UOfzEzTy6ldMo9tVlHxL14G06czIV9B4LcAghtUV76f9SffmYXfxjKIfa65bCwKvejYH6GAnl73W7R2Ydgrni7i7LveAJzSDciNb+FcNK9IhEEUYCBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTs32dnbz2yDm
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:16:07 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:15:52 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:15:52 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/3] pinctrl: aspeed: backport AST2700 SoC0 support
Date: Thu, 29 Oct 2026 11:15:47 +0800
Message-ID: <20261029031552.515601-1-vince_chang@aspeedtech.com>
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

Backport three upstream Linux ASPEED pinctrl and SCU binding commits
to OpenBMC dev-6.18 to provide AST2700 SoC0 pin controller support.

Billy Tsai (3):
  dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
  dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
  pinctrl: aspeed: Add AST2700 SoC0 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 114 +++
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 188 +++++
 drivers/pinctrl/aspeed/Kconfig                |   9 +
 drivers/pinctrl/aspeed/Makefile               |   1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   | 749 ++++++++++++++++++
 5 files changed, 1061 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c

-- 
2.43.0


