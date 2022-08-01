Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA79C00144
	for <openbmc@archiver.kernel.org>; Mon,  1 Aug 2022 14:51:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLfR4ZfXz3bXn
	for <openbmc@archiver.kernel.org>; Tue,  2 Aug 2022 00:51:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLcc1CFlz2yn5
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 00:49:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271EnLGu024208
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 17:49:22 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 17:49:21 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Mon, 1 Aug 2022
 22:49:19 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 22:49:19 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 7FEA363A20; Mon,  1 Aug 2022 17:49:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 4/7] char: ipmi: modify NPCM KCS configuration
Date: Mon, 1 Aug 2022 17:49:11 +0300
Message-ID: <20220801144914.126075-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801144914.126075-1-tmaimon77@gmail.com>
References: <20220801144914.126075-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Modify NPCM IPMI KCS configuration to support all NPCM BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/ipmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 19f1efc0bc3d..644240d83809 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -110,7 +110,7 @@ config ASPEED_KCS_IPMI_BMC
 	  provides the access of KCS IO space for BMC side.
 
 config NPCM7XX_KCS_IPMI_BMC
-	depends on ARCH_NPCM7XX || COMPILE_TEST
+	depends on ARCH_NPCM || COMPILE_TEST
 	select IPMI_KCS_BMC
 	select REGMAP_MMIO
 	tristate "NPCM7xx KCS IPMI BMC driver"
-- 
2.33.0

