Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F241606A31F
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:54:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFVgj4bNbz30T2;
	Thu, 29 Oct 2026 14:53:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793245985;
	cv=none; b=glqCr7sDfQi/B2xIcGG2QmIFVrvjtuHqRU9Q6amv4OhBRp5bixeC6iuFhsPF0o3kYnMy9fZ0KcKPPhxXwNkMYkvgT1HL/+zaDoKsdB5biQMj2sERyA5NPyzsFZLil2ORiQOHkLVecE0kxo5ZUf2twFfQeJW93Mt04tMM+lDQkF6M2G3YpjgKQC0H/QUA4h7KCsteTqq4noPUzlFS2Z00jWu6edjC4y9Mdw/9D8FD9PktbgCH/fYb4qKJvhCURHDX7tKXqEdL5XxofBpBZCMBbvtgZercc7Igrp1gWck5QYrOA76+LLPReJUNcuBjmbY4Yc2mR603WyImFrd47s7jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793245985; c=relaxed/relaxed;
	bh=UKfSKELXBAM1A+V8olNgSp++nEVTT8PsAr9D4+g8hNE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjF8IFoYs736Rll1DMrYLNzVqWF0rx0cZ/x3Dn+ULzhDF1/MDBRKdMIlgK88eV/FagESmQV1jf4+xE2Ew9rHcFUkW+TguA+R7vAA08zRr/hv9yS0LuVTa6KYyHFCabiGrWkT/PiQF2jh6OqWweNUZtx1RBs2ptjFCD8QV/ekEE6Y4f1zZDsWljbZOYq9LISW9MR44VYMhkw7vuEilZrWP1ldPKUKf4noYjIJNVBPbsmZ+qSr+iDZ6wT7aSrBH3UZ1AI8pHWdwfJWrGIfz5/5qhBmYVBTAQY4oaLCAWu+hsEQQtHkXdRzwAbB+NBRERZV2nd+3Sb/GmimCq1xlEwdmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFVgh3YhMz30Qv
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:53:04 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:52:43 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:52:43 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.18 4/5] arm64: configs: Update defconfig for AST2700 platform support
Date: Thu, 29 Oct 2026 11:52:39 +0800
Message-ID: <20261029035242.651988-5-vince_chang@aspeedtech.com>
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

Enable options for ASPEED AST2700 SoC.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20260609-upstream_ast2700-v9-4-f631752f0cb1@aspeedtech.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 512cef2af615cf0a4c9b0529a2aa36390240ecb7)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 32861d08a3b8..dd96c5121a15 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -39,6 +39,7 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y
+CONFIG_ARCH_ASPEED=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
-- 
2.43.0


