Return-Path: <clg@kaod.org>
X-Greylist: delayed 1565 seconds by postgrey-1.35 at bilbo;
 Thu, 30 Jun 2016 02:27:42 AEST
Received: from 10.mo3.mail-out.ovh.net (10.mo3.mail-out.ovh.net
 [87.98.165.232])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfp4G4ft6zDqvv
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:27:41 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id B25B0FF908B
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:18 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 88B474400C6;
 Wed, 29 Jun 2016 18:10:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 0/9] aspeed: fixes and cleanups
Date: Wed, 29 Jun 2016 18:09:42 +0200
Message-Id: <1467216591-8616-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17503802901739047682
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 16:27:43 -0000

Hello,

The aspeednic driver has a couple of issues which are fixed by
Milton's patches. On top of that, I have included some kconfig
improvements and a *massive* cleanup of nearly all the Aspeed files.

Tested on palmetto and a ast2500 evb.

Thanks,

C. 

Cédric Le Goater (6):
  net/aspeednic: start mac after ring buffers are initialized
  aspeed/ast-g4: select the correct cpu
  aspeed/ast-g4: use literal defines in misc_init_r()
  aspeed: add a common Kconfig file for Aspeed boards.
  aspeed/ast-g4: add a force saveenv config
  ast-g4/g5: large cleanup

Milton D. Miller II (3):
  net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
  net: aspeednic: Do not start hardware in initialize
  net: aspeednic: Do not fill in a random MAC address

 arch/arm/Kconfig                                   |    6 +-
 arch/arm/include/asm/arch-aspeed/aspeed.h          |   16 +-
 arch/arm/include/asm/arch-aspeed/ast-ahbc.h        |   28 +-
 arch/arm/include/asm/arch-aspeed/ast-sdmc.h        |   49 +-
 .../arm/include/asm/arch-aspeed/ast2400_platform.h |  110 +-
 arch/arm/include/asm/arch-aspeed/ast_g5_platform.h |  291 ++-
 arch/arm/include/asm/arch-aspeed/ast_scu.h         |   70 +-
 arch/arm/include/asm/arch-aspeed/platform.h        |   26 +-
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h       |   23 +-
 arch/arm/include/asm/arch-aspeed/regs-scu.h        | 1392 ++++++-------
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h       |   20 +-
 arch/arm/include/asm/arch-aspeed/regs-spi.h        |   55 -
 arch/arm/mach-aspeed/ast-ahbc.c                    |  110 +-
 arch/arm/mach-aspeed/ast-scu.c                     | 2127 ++++++++++----------
 arch/arm/mach-aspeed/ast-sdmc.c                    |  179 +-
 arch/arm/mach-aspeed/cpuinfo.c                     |   19 +-
 arch/arm/mach-aspeed/timer.c                       |   50 +-
 board/aspeed/Kconfig                               |    9 +
 board/aspeed/ast-g4/ast-g4.c                       |   15 +-
 common/env_common.c                                |    3 +
 drivers/net/aspeednic.c                            |   17 +-
 include/configs/ast-g4.h                           |    1 +
 22 files changed, 2140 insertions(+), 2476 deletions(-)
 delete mode 100644 arch/arm/include/asm/arch-aspeed/regs-spi.h
 create mode 100644 board/aspeed/Kconfig

-- 
2.1.4
