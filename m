Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E1C19F2D
	for <openbmc@archiver.kernel.org>; Fri,  5 Aug 2022 01:13:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzSK36W3vz30Bl
	for <openbmc@archiver.kernel.org>; Fri,  5 Aug 2022 11:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyZrb5vBrz2xkh
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 01:04:12 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 273F41du020237
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 18:04:01 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 3 Aug
 2022 18:04:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 3 Aug 2022
 23:03:59 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 3 Aug 2022 23:03:59 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4055760365; Wed,  3 Aug 2022 18:03:58 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/2] spi: npcm-pspi: add Arbel NPCM8XX support 
Date: Wed, 3 Aug 2022 18:03:52 +0300
Message-ID: <20220803150354.91111-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 05 Aug 2022 11:13:04 +1000
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

This patch set adds Arbel NPCM8XX Peripheral SPI (PSPI) support to PSPI NPCM
driver.

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

This patchset is based on the Arbel NPCM8XX BMC 5.19 kernel patchsets
https://lore.kernel.org/lkml/20220722114136.251415-1-tmaimon77@gmail.com/T/

Tomer Maimon (2):
  dt-binding: spi: npcm-pspi: Add npcm845 compatible
  spi: npcm-pspi: Add NPCM845 peripheral SPI support

 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt | 3 ++-
 drivers/spi/spi-npcm-pspi.c                                 | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.33.0

