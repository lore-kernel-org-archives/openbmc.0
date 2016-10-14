Return-Path: <clg@kaod.org>
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRwN4fKJzDt3S
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:38:27 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5D6C414AC8
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:23 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 98EFF2A006F;
 Fri, 14 Oct 2016 14:38:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 00/12] aspeed-smc: add support for AST2500 and
 DMA transfers
Date: Fri, 14 Oct 2016 14:37:52 +0200
Message-Id: <1476448684-6149-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15113517399622912770
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeigdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 14 Oct 2016 12:38:29 -0000

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

Cédric Le Goater (7):
  ARM: dts: aspeed-g5: update ast2500 evb with new spi-nor binding
  mtd: spi-nor: aspeed: make locking more explicit
  mtd: spi-nor: aspeed: introduce a device under aspeed_smc_controller
  mtd: spi-nor: aspeed: add DMA support to smc controller
  ARM: dts: aspeed: update SMC controller nodes supporting DMAs
  mtd: spi-nor: aspeed: use property "aspeed,fmc-has-dma"
  mtd: spi-nor: aspeed: use fast read when doing DMAs

Milton Miller (5):
  mtd: spi-nor: support for Aspeed AST2500 SoC
  mtd: spi-nor: aspeed: Manage the segment address registers
  mtd: spi-nor: Add Micronix mx66l1g45g spi flash
  ARM: dts: aspeed-g5: update for new spi-nor binding
  ARM: dts: aspeed-g5: update witherspoon for new spi-nor binding

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  32 +-
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  28 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   2 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  28 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  65 +++
 drivers/mtd/spi-nor/aspeed-smc.c                   | 449 +++++++++++++++++----
 drivers/mtd/spi-nor/spi-nor.c                      |   1 +
 7 files changed, 499 insertions(+), 106 deletions(-)

-- 
2.7.4
