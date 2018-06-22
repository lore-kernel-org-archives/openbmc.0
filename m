Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.38.119; helo=11.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Jun 2018 17:16:25 AEST
Received: from 11.mo6.mail-out.ovh.net (11.mo6.mail-out.ovh.net
 [188.165.38.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BqcT3cVnzF0x8
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 17:16:25 +1000 (AEST)
Received: from player738.ha.ovh.net (unknown [10.109.122.32])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id AA486166030
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 09:09:56 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: clg@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 2A00DA80;
 Fri, 22 Jun 2018 09:09:43 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.17 v2 0/2] mtd: spi-nor: aspeed: introduce a
 "spi-max-frequency" property
Date: Fri, 22 Jun 2018 09:09:35 +0200
Message-Id: <20180622070937.21498-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11584384142072449794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 07:16:25 -0000

Hello,

The "spi-max-frequency" property protects the driver from some
optimistic settings of the optimize read algo for certain chips (old
ones). It also makes the read access to the alternate FMC chip 3 times
faster.

Thanks,

C.

Changes since v1:

 - moved to the dev-4.17 branch
 - introduced the optimize read algo on the AST2400 SoC FMC controller.

Cédric Le Goater (2):
  ARM: dts: aspeed: Add "spi-max-frequency" property
  mtd: spi-nor: aspeed: limit the maximum SPI frequency

 drivers/mtd/spi-nor/aspeed-smc.c                 | 17 +++++++++++++----
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  2 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                 |  2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                 |  7 +++++++
 8 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.13.6
