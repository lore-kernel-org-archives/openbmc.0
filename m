Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E50606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFVgZ5zMLz2yps;
	Thu, 29 Oct 2026 14:52:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793245978;
	cv=none; b=XboGvvEKSBVwho3geAI24HQEtcSw3hXfHGh2lW11COEHj2VPFOfznNMbvDrLboC483vMma208SUXhVj1wfVZYveXN/YOVbK3JLQl8bxFdqD1QbW9DwoWpUG3suyqDop+3LzxiPlkqH346tVFTLLECikiqclTErfdy8Vj9S2Fwpt8lbOL65Qu81tv5QSifiyqcpw+2pZlApEQuikssdV2Z1ljggosBajr0DA6pEEQfaqS3PHnU9FiXFgGuIrX+FCY/8zQTnmok+tg0w58gZshug4IRJwX0sPs0/MAJJ/2RBS1xJ4RVethHgO6WfDvt2zA0dIOecb+a2582YduyX4cUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793245978; c=relaxed/relaxed;
	bh=s0aQ36du/FWj9wONPAAC648/a0gYzMyxu0MijdRVE3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SZ4fRjJZ4DJV7LUvBfGcaFTGOyiaR38h+iyW3GuRphvMKEzk++9SBvq0iIQ9RUNkZs5uvdhyJvcF7jw4/cmfLNO1HH8LFfG463vRVBFax5XLveNqBPZb5Geh2bcPwwkuCooteXi8ATEc9SbOiX6eVvw80UP0dlUVUxIbDFJu06JtoAqveD08Al3mh1yeO9RAODKCc9EdOPVTmWWI6hvDzA1Wf02zsVBwlL0IKQDDAyQ24M0IaJYY48h/6vRaVslJ/eHMidvB3u6XjwxSicDBJG7kmrH0wLOQ1Xt9lwFOF1LdyuvrN7wlXneaCwRa9P6SsDTCykWMTx/lQp40iY7TgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFVgY4xsSz2yjN
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:52:57 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:52:42 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:52:42 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/5] arm64: aspeed: backport AST2700 platform support
Date: Thu, 29 Oct 2026 11:52:35 +0800
Message-ID: <20261029035242.651988-1-vince_chang@aspeedtech.com>
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

Backport five upstream Linux ASPEED platform commits to OpenBMC
dev-6.18 to add AST2700 board bindings, Kconfig, initial device trees
and defconfig support, including the follow-up DTS correction for
duplicate pinctrl labels and the address scheme.

Ryan Chen (5):
  dt-bindings: arm: aspeed: Add AST2700 board compatible
  arm64: Kconfig: Add ASPEED SoC family Kconfig support
  arm64: dts: aspeed: Add initial AST27xx SoC device tree
  arm64: configs: Update defconfig for AST2700 platform support
  arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme

 .../bindings/arm/aspeed/aspeed.yaml           |    6 +
 MAINTAINERS                                   |    1 +
 arch/arm64/Kconfig.platforms                  |    6 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/aspeed/Makefile           |    4 +
 .../aspeed/aspeed-evb-flash-layout-128.dtsi   |   32 +
 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi |  194 ++++
 .../dts/aspeed/aspeed-g7-soc0-pinctrl.dtsi    |  225 ++++
 .../arm64/boot/dts/aspeed/aspeed-g7-soc0.dtsi |  230 ++++
 .../dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi    | 1011 +++++++++++++++++
 .../arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi |  557 +++++++++
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts    |   65 ++
 arch/arm64/configs/defconfig                  |    1 +
 13 files changed, 2333 insertions(+)
 create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc0-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc0.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
 create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts

-- 
2.43.0


