Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.44.50; helo=5.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo4.mail-out.ovh.net (5.mo4.mail-out.ovh.net [188.165.44.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9hHn1dnDzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 00:42:11 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 38AC4D9B84
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 15:42:07 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 2F7C0500081;
 Mon,  9 Oct 2017 15:42:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [linux dev-4.13 0/6] SMC driver updates
Date: Mon,  9 Oct 2017 15:41:02 +0200
Message-Id: <20171009134108.15860-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8984118308650453762
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleelgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 13:42:13 -0000

Hello,

Here is a series bringing the Aspeed SMC driver to the level of what
we had in openbmc kernel 4.10. There are a couple of changes :

 - the DMA support is gone. It is not used, it only works for
   kmalloc'ed buffers and UBIFS uses vmalloc'ed buffers for instance.

 - the driver was slightly adapted to take into account the new clk
   driver.

Tested on a palmetto and an ast2500 eval boards.

Thanks,

C.

Cédric Le Goater (6):
  ARM: dts: aspeed: import OpenBMC flash layout
  mtd: spi-nor: aspeed: use command mode for reads
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode
  ARM: dts: aspeed: add a AHB clock to the G4 SMC controllers
  mtd: spi-nor: aspeed: link controller with the ahb clock
  mtd: spi-nor: aspeed: optimize read mode

 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi |  26 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |   2 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +
 drivers/mtd/spi-nor/aspeed-smc.c                   | 283 ++++++++++++++++++++-
 6 files changed, 303 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi

-- 
2.13.6
