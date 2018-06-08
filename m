Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.76.148; helo=9.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2398 seconds by postgrey-1.36 at bilbo;
 Sat, 09 Jun 2018 00:17:44 AEST
Received: from 9.mo179.mail-out.ovh.net (9.mo179.mail-out.ovh.net
 [46.105.76.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 412Pd406tWzF09h
 for <openbmc@lists.ozlabs.org>; Sat,  9 Jun 2018 00:17:43 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.109.122.15])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 63BA4CF3B4
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 15:00:11 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 8663954009C;
 Fri,  8 Jun 2018 15:00:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] mtd: spi-nor: aspeed: introduce a "spi-max-frequency"
 property
Date: Fri,  8 Jun 2018 14:59:58 +0200
Message-Id: <20180608130000.22627-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9068842278029921026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrjeelgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 08 Jun 2018 14:17:44 -0000

Hello,

The property protects some optimistic settings of optimize read algo
on certain chips (old ones). It also makes the read access to the
alternate FMC chip 3 times faster.

Thanks,

C.

Cédric Le Goater (2):
  ARM: dts: aspeed: Add "spi-max-frequency" property
  mtd: spi-nor: aspeed: limit the maximum SPI frequency

 drivers/mtd/spi-nor/aspeed-smc.c                 | 18 ++++++++++++++----
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  2 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                 |  2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                 |  7 +++++++
 8 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.13.6
