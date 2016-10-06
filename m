Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBD1m1vzDrSK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D46BE1190C
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:26:58 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 37C5D2A006D;
 Thu,  6 Oct 2016 23:26:54 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 00/12] config cleanups and small fixes
Date: Thu,  6 Oct 2016 23:26:33 +0200
Message-Id: <1475789205-19618-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13952714598263524098
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 06 Oct 2016 21:34:12 -0000

Hello,

Here is a set of cleanups on the configuration. It should ease the
port on v2016.11 which is a little more strict on CONFIG_ defines.

I also included a couple of fixes on the timer and ramdisk relocation.


Thanks,

C.

Cédric Le Goater (12):
  aspeed: add CONFIG_AST_SPI_NOR
  aspeed: rework top level configuration of the Aspeed SoC
  aspeed: use CONFIG_TARGET_AST_G{4,5}
  aspeed: remove CONFIG_SYS_INIT_RAM_END
  aspeed: replace CONFIG_ASPEED_TIMER_CLK with CONFIG_TIMER_CLK_FREQ
  aspeed: timer cleanups
  aspeed: add configuration for the network devices
  aspeed: remove CONFIG_MAC_NUM
  aspeed: add CONFIG_DRAM_ECC
  aspeed: remove CONFIG_PHY_MAX_ADDR
  bootm: fix ramdisk relocation
  aspeed: remove hack loading ramdisk in memory

 arch/arm/Kconfig                             | 14 +++----
 arch/arm/include/asm/arch-aspeed/aspeed.h    | 29 --------------
 arch/arm/include/asm/arch-aspeed/ast-ahbc.h  |  2 +-
 arch/arm/include/asm/arch-aspeed/platform.h  | 10 +----
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h |  4 +-
 arch/arm/include/asm/arch-aspeed/regs-scu.h  | 56 ++++++++++++++--------------
 arch/arm/mach-aspeed/Kconfig                 | 50 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/Makefile                |  4 +-
 arch/arm/mach-aspeed/ast-ahbc.c              |  5 +--
 arch/arm/mach-aspeed/ast-scu.c               | 19 ++++++----
 arch/arm/mach-aspeed/cpuinfo.c               |  5 +--
 arch/arm/mach-aspeed/flash.c                 | 21 +----------
 arch/arm/mach-aspeed/timer.c                 | 27 ++++++++++----
 board/aspeed/Kconfig                         | 16 --------
 board/aspeed/ast-g4/Kconfig                  |  6 ---
 board/aspeed/ast-g4/ast-g4.c                 |  1 -
 board/aspeed/ast-g5/Kconfig                  | 15 +++++---
 cmd/bootm.c                                  |  3 ++
 common/image.c                               | 11 ------
 configs/ast_g4_ncsi_defconfig                |  3 ++
 configs/ast_g4_phy_defconfig                 |  4 ++
 configs/ast_g5_ncsi_defconfig                |  3 ++
 configs/ast_g5_phy_defconfig                 |  4 ++
 drivers/net/Kconfig                          | 19 +++++++++-
 drivers/net/ftgmac100.c                      | 15 ++++----
 include/configs/ast-common.h                 | 15 +++-----
 include/configs/ast-g4-ncsi.h                |  6 +--
 include/configs/ast-g4-phy.h                 |  9 ++---
 include/configs/ast-g5-ncsi.h                |  9 ++---
 include/configs/ast-g5-phy.h                 | 11 ++----
 30 files changed, 194 insertions(+), 202 deletions(-)
 delete mode 100644 arch/arm/include/asm/arch-aspeed/aspeed.h
 create mode 100644 arch/arm/mach-aspeed/Kconfig
 delete mode 100644 board/aspeed/Kconfig

-- 
2.7.4
