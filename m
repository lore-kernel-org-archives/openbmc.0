Return-Path: <clg@kaod.org>
Received: from 5.mo69.mail-out.ovh.net (5.mo69.mail-out.ovh.net
 [46.105.43.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZYT2RtpzDsxR
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:51:25 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id AF5357E2E
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:44:59 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 70BF454006C;
 Fri, 21 Oct 2016 07:44:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev4.7 v2 0/9] aspeed-smc: add support for AST2500 and
 DMA transfers
Date: Fri, 21 Oct 2016 07:44:41 +0200
Message-Id: <1477028690-27239-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12347462804257540866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrheelgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2016 05:51:25 -0000

Hello,

This patchset adds to the current aspeed SMC driver the register
settings enabling support for the AST2500. Some initial work is done
on the segment registers to provide a better configuration of the
mapping windows on the flash modules but this area clearly needs more
work to be solid.

Also, a first version of DMA read/write is provided. But the speed
results are not very satisfying so they are disabled by default. You

Thanks,

C.

Changes since v1:

 - included a first revert of the current driver
 - merged all the difference in one patch to be sent to mainline
 - added a pinctrl fix for the witherspoon. 

Cédric Le Goater (6):
  Revert "mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs"
  mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
  ARM: dts: aspeed-g5: update ast2500 evb with new spi-nor binding
  mtd: spi-nor: aspeed: add DMA support to smc controller
  ARM: dts: aspeed: update SMC controller nodes supporting DMAs
  ARM: dts: witherspoon: use spi1debug pinctrl group

Milton Miller (3):
  mtd: spi-nor: Add Micronix mx66l1g45g spi flash
  ARM: dts: aspeed-g5: update for new spi-nor binding
  ARM: dts: aspeed-g5: update witherspoon for new spi-nor binding

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  37 +-
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  28 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   2 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  31 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  65 ++
 drivers/mtd/spi-nor/aspeed-smc.c                   | 655 +++++++++++++++++----
 drivers/mtd/spi-nor/spi-nor.c                      |   1 +
 7 files changed, 665 insertions(+), 154 deletions(-)

-- 
2.7.4
