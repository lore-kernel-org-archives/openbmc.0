Return-Path: <clg@kaod.org>
X-Greylist: delayed 606 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Sep 2016 16:50:03 AEST
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZTYl1tTmzDsXH
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 16:50:03 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id C41E31000EC5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 08:32:38 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 9781124006B;
 Thu, 15 Sep 2016 08:32:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH linux dev-4.7 0/6] iBT interface changes
Date: Thu, 15 Sep 2016 08:32:20 +0200
Message-Id: <1473921146-19509-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4649403666863786754
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeeggddutdekucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 06:50:03 -0000

Hello,

This patchset introduces a couple of changes on the driver for the iBT
interface on Aspeed SOCs. These were suggested by mainline and have
some conficts with the OpenBMC userspace. The most important are name
changes, which impact the btbridge daemon, but nothing is requiring a
redesign of the stack.

The previous driver is reverted and and reincluded in its mainline
form. So you should mostly check patch 4 and quickly 5,6. The merge
in openbmc kernel can wait mainline's green light I think. 

You can find the btbridge changes:

     https://github.com/legoater/btbridge

Thanks,

C.


Alistair Popple (1):
  misc: Add Aspeed BT IPMI BMC driver

Cédric Le Goater (5):
  Revert "misc: Add Aspeed BT IPMI host driver"
  ARM: aspeed: remove previous definitions in default config
  ARM: dts: aspeed: remove previous iBT definitions
  ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
  ARM: dts: aspeed: Enable BT IPMI BMC device

 .../bindings/char/ipmi/aspeed,bt-bmc.txt           |  19 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
 arch/arm/configs/aspeed_g4_defconfig               |   3 +-
 arch/arm/configs/aspeed_g5_defconfig               |   3 +-
 drivers/char/ipmi/Kconfig                          |   7 +
 drivers/char/ipmi/Makefile                         |   1 +
 drivers/char/ipmi/bt-bmc.c                         | 475 +++++++++++++++++++++
 drivers/misc/Kconfig                               |   5 -
 drivers/misc/Makefile                              |   1 -
 drivers/misc/bt-host.c                             | 427 ------------------
 include/uapi/linux/Kbuild                          |   2 +-
 include/uapi/linux/{bt-host.h => bt-bmc.h}         |  12 +-
 13 files changed, 515 insertions(+), 444 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,bt-bmc.txt
 create mode 100644 drivers/char/ipmi/bt-bmc.c
 delete mode 100644 drivers/misc/bt-host.c
 rename include/uapi/linux/{bt-host.h => bt-bmc.h} (55%)

-- 
2.7.4
