Return-Path: <clg@kaod.org>
Received: from 16.mo7.mail-out.ovh.net (16.mo7.mail-out.ovh.net
 [46.105.72.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqRKf4jwQzDqZn
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 01:55:01 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id ED00C4608F
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:44:56 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id CFBF71800B2;
 Fri, 24 Mar 2017 15:44:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 0/6] Aspeed SMC enhancements
Date: Fri, 24 Mar 2017 15:44:37 +0100
Message-Id: <1490366683-23401-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3524066710062336770
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 24 Mar 2017 14:55:03 -0000

Hi,

Here is a series providing a couple of fixes and enhancements on the
SMC driver, among which :

 - support of the segment registers which are needed to set the
   mapping windows of the chips on the AHB bus.
 - command mode support 
 - detection of the best HCLK settings for reads (adapted from pflash)

The full tree can be found here:

     https://github.com/legoater/linux/commits/openbmc-4.10

Tested on the palmetto, ast2500 evb and witherspoon platforms.

Thanks,

C. 

Cédric Le Goater (6):
  mtd: spi-nor: aspeed: fix the AST2400 SMC window size
  mtd: spi-nor: aspeed: fix physical base address of chip
  mtd: spi-nor: aspeed: configure chip window on AHB bus
  mtd: spi-nor: aspeed: use command mode for reads
  mtd: spi-nor: aspeed: link controller with the ahb clock
  mtd: spi-nor: aspeed: optimize read mode

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   4 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   6 +
 drivers/mtd/spi-nor/aspeed-smc.c              | 362 +++++++++++++++++++++++++-
 3 files changed, 358 insertions(+), 14 deletions(-)

-- 
2.7.4
