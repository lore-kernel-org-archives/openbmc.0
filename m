Return-Path: <clg@kaod.org>
X-Greylist: delayed 516 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Oct 2016 18:06:38 AEDT
Received: from 4.mo68.mail-out.ovh.net (4.mo68.mail-out.ovh.net [46.105.59.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3gzy537wzDt2n
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 18:06:38 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 8C641942E
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 08:57:57 +0200 (CEST)
Received: from hermes.kaod.org.com (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 52F22180085;
 Wed, 26 Oct 2016 08:57:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 0/8] BT driver sync up
Date: Wed, 26 Oct 2016 08:57:39 +0200
Message-Id: <1477465067-19034-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6049741678081444610
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrieekgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Oct 2016 07:06:39 -0000

Hello,

Here is a serie syncing the OpenBMC kernel with the BT driver merged
in mainline linux. This kernel needs an updated version of btbridged :

     https://github.com/legoater/btbridge/commits/master

The last two patches add a request expiry list and some configuration
through sysfs. These are for review only as they need to be sent to
mainline first.

Thanks,

C.

Cédric Le Goater (8):
  Revert "misc: Add Aspeed BT IPMI host driver"
  ARM: aspeed: remove previous definitions in default config
  ARM: dts: aspeed: remove previous iBT definitions
  ipmi: add an Aspeed BT IPMI BMC driver
  ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
  ARM: dts: aspeed: Enable BT IPMI BMC device
  ipmi: maintain a request expiry list
  ipmi: add a sysfs file for configure maximum response time

 .../bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt   |  23 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
 arch/arm/configs/aspeed_g4_defconfig               |   2 +-
 arch/arm/configs/aspeed_g5_defconfig               |   2 +-
 drivers/Makefile                                   |   2 +-
 drivers/char/ipmi/Kconfig                          |   8 +
 drivers/char/ipmi/Makefile                         |   1 +
 drivers/char/ipmi/bt-bmc.c                         | 668 +++++++++++++++++++++
 drivers/misc/Kconfig                               |   5 -
 drivers/misc/Makefile                              |   1 -
 drivers/misc/bt-host.c                             | 427 -------------
 include/uapi/linux/Kbuild                          |   2 +-
 include/uapi/linux/{bt-host.h => bt-bmc.h}         |  12 +-
 14 files changed, 712 insertions(+), 445 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt
 create mode 100644 drivers/char/ipmi/bt-bmc.c
 delete mode 100644 drivers/misc/bt-host.c
 rename include/uapi/linux/{bt-host.h => bt-bmc.h} (55%)

-- 
2.7.4
