Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D63606A31F
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFVgd1KdKz30MZ;
	Thu, 29 Oct 2026 14:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793245980;
	cv=none; b=FcchZBn1ezlraI9JDVP2t9K+LTVdPq2Z3oBSbG3bYw78NB3sQfvVUsJOVJaIRytUGfjVGVHS3WvxRj1uV1qU3KSDsCHieiJxDWKAC1JEdYT6z/svZNCf8X9wsu3T23JVnumRLrFuI+WRA3r142MrqWSwBweMiOJvQJ/7G3abZMFpl/EoQWIR+CPM1CLEF9dhO61wMLWmhcTreB4se3akFXJ26Pw6BbSFzsHXtd2R6iyUdpeebEp+0a/4BNpKPlfsh7kh0ww0qrJdnVlsM15tULsVUtO1Yt72W31YBw6SSwB10dGqo9xz96AHTCipTs3F1ysRIm+4ctJVjmtm+r+GBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793245980; c=relaxed/relaxed;
	bh=D1v1AkiN79volyWwpouOPzsxdARyzPOFdwqlaL46ks0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iO7hFmpVEdtel7D1O5+SUUm0f4xNRwUPrbkksK8HaXHADlj6bBHJmli9h6330JMe1I/v7+CpBW8rSw2OVwMvqfeNXs7B/jKymppzHt/knC6wxjPdI7YtLL/xmL0fzjjZ31yynj0bFLNU5qkNdLRhATOv67lpgQnEGi0NRWqMM+W0nomlMJFRBMC9V/hafV6KEWlkMnOjOQdGuYHlE6kl3teRYh2rLDSaJ3420b8FUwG204FGZw+wsoMhfQAte0VA7oeDQGqu5oCzt3XY/KHdHOogJFdbD+7xj1eAks1VWh+9sOYPtZIvp//SSbTu15+Ht+4btvyuXEqgMtOyP3vYeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFVgb70FQz30Cj
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:52:59 +1100 (AEDT)
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
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH linux dev-6.18 2/5] arm64: Kconfig: Add ASPEED SoC family Kconfig support
Date: Thu, 29 Oct 2026 11:52:37 +0800
Message-ID: <20261029035242.651988-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029035242.651988-1-vince_chang@aspeedtech.com>
References: <20261029035242.651988-1-vince_chang@aspeedtech.com>
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

From: Ryan Chen <ryan_chen@aspeedtech.com>

Add support for ASPEED SoC family like ast27XX 8th
generation ASPEED BMCs.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Link: https://lore.kernel.org/r/20260609-upstream_ast2700-v9-2-f631752f0cb1@aspeedtech.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit df6f379eb4ac78e51d582aa7e8683bf8d5468dfe)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d..72cea0fe618a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -47,6 +47,12 @@ config ARCH_ARTPEC
 	help
 	   This enables support for the ARMv8 based ARTPEC SoC Family.
 
+config ARCH_ASPEED
+	bool "Aspeed SoC family"
+	help
+	  This enables support for ASPEED's SoC family, such as the
+	  ast27XX 8th generation Baseboard Management Controller (BMC).
+
 config ARCH_AXIADO
 	bool "Axiado SoC Family"
 	select GPIOLIB
-- 
2.43.0


