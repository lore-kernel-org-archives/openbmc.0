Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2625C25B06
	for <openbmc@archiver.kernel.org>; Tue,  2 Aug 2022 14:17:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxxrj1ShFz3bc3
	for <openbmc@archiver.kernel.org>; Wed,  3 Aug 2022 00:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxxrD0JL2z2yMk
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 00:16:41 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 272EGYrv022662
	for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2022 17:16:34 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Aug
 2022 17:16:33 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Tue, 2 Aug 2022
 22:16:30 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 2 Aug 2022 22:16:29 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id EF39962EFD; Tue,  2 Aug 2022 17:16:28 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/2] mmc: add SDHCI driver for NPCM SoCs
Date: Tue, 2 Aug 2022 17:16:23 +0300
Message-ID: <20220802141625.238907-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
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

This patch set adds SDHCI NPCM Baseboard Management Controller(BMC) support.

The NPCM SDHCI driver were tested on NPCM750 and NPCM845 evaluation boards.

Tomer Maimon (2):
  dt-bindings: mmc: npcm: NPCM binding documentation
  mmc: host: Add support for NPCM SDHCI controller

 .../devicetree/bindings/mmc/sdhci-npcm.txt    | 22 +++++
 drivers/mmc/host/Kconfig                      |  8 ++
 drivers/mmc/host/Makefile                     |  1 +
 drivers/mmc/host/sdhci-npcm.c                 | 81 +++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-npcm.txt
 create mode 100644 drivers/mmc/host/sdhci-npcm.c

-- 
2.33.0

