Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF758606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:24:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFV2c2bZLz2ylj;
	Thu, 29 Oct 2026 14:24:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793244264;
	cv=none; b=Nq/ihw7W1/tgPf9SL1aU6M1Y0vCfkfjTb2Nu94OiWU6agEFIIwL7bcWSYLTrepNzTu6Ik7aaG6SX1nk8g1M2CLhC5wpn82pbTarS3wmg6uvX2Jz9ZemaJdjID1wHX1zHyuN/SBaB7LU58GR/0cHPafJtheAc/eusgKdZwebGNiQim8egHR47QC0WE1KCtAEaCMTBvmChRs7VLSAe+OQmzWsr6dleunVee11A0W9UuoNfRGrXqY55JrXl+5VU59GswTynQN8SYMcSHUTpOFGgV9+WKbCYog6YFoJ4FYV42/6vzbtQ1XQRmK3uk7sdZZxnKQGikYHdHhE+N0yaVOkxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793244264; c=relaxed/relaxed;
	bh=sSL8QLvHISCXa8sAvUzCLgbLZwK6OPO9NwVyUgghRmQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e8E+iK08CEqjzfHJaDEj7visdhL2aL7dYiDdytAHXTJhleQ6FkhkwWH/AzA78aeSQzsOvIYLCk4z9QoLaUSz+jETQxoq8YpLg2lHV2JTGURQO3cc8jU4h4FK49hyHINR/P0DjV+GKNspS0Arl4aE+bCww0iBNIWRV0XNTOKLVwMxei/ckK2gwvoHalte0un+sPd4C33+DjBC2EctiEpPJXWzsu+TYtCnbtJXaK2M8YVqe282DBjiIA+2Rz3Z0TPjSLvaUiDqe1aBBeLwjOwl3rUi3XYm0CiKjz4Twqfp1xhat/Hy2i1Q3y9gXp073F7w87U9yICxvqjNXScV+oofyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFV2Z6cqFz2ygg
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:24:22 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:24:07 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:24:07 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/3] pinctrl: aspeed: backport AST2700 SoC1 support
Date: Thu, 29 Oct 2026 11:24:01 +0800
Message-ID: <20261029032407.540714-1-vince_chang@aspeedtech.com>
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

This series backports three upstream Linux commits adding ASPEED
AST2700 SoC1 pin controller support to OpenBMC dev-6.18.

This series depends on:
https://lore.kernel.org/openbmc/20261029031552.515601-1-vince_chang@aspeedtech.com/

Billy Tsai (3):
  dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
  dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl
  pinctrl: aspeed: Add AST2700 SoC1 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    1 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  760 +++++++
 drivers/pinctrl/aspeed/Kconfig                |   14 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 1747 +++++++++++++++++
 5 files changed, 2523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

-- 
2.43.0


