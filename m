Return-Path: <clg@kaod.org>
X-Greylist: delayed 372 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:31:07 AEDT
Received: from 11.mo7.mail-out.ovh.net (11.mo7.mail-out.ovh.net
 [87.98.173.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mC33h4zDw0M
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:07 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0C8712077C
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:24:51 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 0DF43480083;
 Fri, 18 Nov 2016 15:24:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 00/38] aspeed: going mainline
Date: Fri, 18 Nov 2016 15:21:40 +0100
Message-Id: <1479478938-13267-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1095219136627182338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:07 -0000

Hello,

This is rather large patchset which I intend to send to mainline qemu
in a couple of weeks when time permits. In there, you will find a lot
of littles fixes, some improvements on existing models and a couple of
new models which were never exposed to mainline yet. Feel free to scan
through the patches or just read the summary below and ask questions.

* SoC level 
  - an AST2400 A1 SoC for the Palmetto machine
  - a Romulus machine  
  - a SRAM region (which is used at early boot in U-Boot, serves as a
    stack, and by DRAM calibration)

* SMC (Flash controller) 
  - Command mode support. Flash contents is accessed directly on the
    AHB bus   
  - DMA support
  - dummy bytes
  - auto strapping of configuration for boot flash
  - use CS0 as a boot ROM. Today, qemu can not boot from a MMIO region.
    As this is complex to do (TCG layer modification), we use a ROM
    region in which we copy the flash contents. Hopefully, I got it 
    right this time.

* SDMC (DRAM controller) 
  - support for new registers to fake DRAM calibration (AST2400). This
    is a good start to understand what these 3000 lines of ARM
    assembly do in the lowlevel_init routine of U-Boot. What a mess ...
  
* I2C
  - a couple more devices 
  - the current model does not support the Linux driver sent to
    mailine. This is because the irq status handling is way too
    simplistic, or even broken. Anyone has some spare cycles for it ?
  
* Watchdog 
  - new model.  
  - not complete but reset under U-Boot and reboot under Linux now
    work so I think it is time to send the model upstream.
  - needs an upstream sponsor 
  
* Network 
  - new model of the ftgmac100 device
  - the ring buffer handling is imperfect and it does not support
    U-Boot (a pity) but we need feedback else this is going to bit rot
    for another 6 months
  - NSCI fake backend

For future work, please see the wiki : 

   https://github.com/openbmc/qemu/wiki

Cheers,

C.


Andrew Jeffery (1):
  wdt: aspeed: Fix failed reboot due to timer miscalculation

Cédric Le Goater (36):
  m25p80: add support for the mx66l1g45g
  aspeed: QOMify the CPU object and attach it to the SoC
  aspeed: attach the second SPI controller object to the SoC
  aspeed: extend the board configuration with flash models
  aspeed: add support for the romulus-bmc board
  aspeed: add a memory region for SRAM
  aspeed: add the definitions for the AST2400 A1 SoC
  aspeed: change SoC revision of the palmetto-bmc machine
  aspeed/scu: fix SCU region size
  aspeed/smc: improve segment register support
  aspeed/smc: get the number of flash modules from hw strapping
  aspeed/smc: rework the prototype of the AspeedSMCFlash helper routines
  aspeed/smc: introduce a aspeed_smc_flash_update_cs() helper
  aspeed/smc: autostrap CE0/1 configuration
  aspeed/smc: handle SPI flash Command mode
  aspeed/smc: add tests for Command mode
  aspeed/smc: unfold the AspeedSMCController array
  aspeed/smc: add a 'sdram_base' property
  aspeed/smc: add support for DMAs
  aspeed/smc: handle dummy bytes when doing fast reads
  aspeed/smc: adjust the size of the register region
  aspeed: use first SPI flash as a boot ROM
  block: add a model option for MTD devices
  aspeed/smc: use flash model option
  aspeed/sdmc: rework the locking register of the memory controller
  aspeed/sdmc: fake a few more registers to let DRAM calibration run
  hw/misc: add a TMP42{1,2,3} device model
  aspeed: add a temp sensor device on I2C bus 3
  aspeed: add a rtc device on I2C bus 0
  aspeed: add a watchdog controller
  wdt: aspeed: use scu to get clock freq
  net: add FTGMAC100 support
  net/ftgmac100: add a 'aspeed' property
  ast2400: add a FTGMAC100 nic
  slirp: add a fake NCSI backend
  target-arm: Add VBAR support to ARM1176 CPUs

Joel Stanley (1):
  wdt: Add Aspeed watchdog device model

 blockdev.c                       |  13 +
 default-configs/arm-softmmu.mak  |   2 +
 hw/arm/aspeed.c                  | 108 ++++-
 hw/arm/aspeed_soc.c              | 162 ++++++-
 hw/block/m25p80.c                |   1 +
 hw/misc/Makefile.objs            |   1 +
 hw/misc/aspeed_scu.c             |  18 +-
 hw/misc/aspeed_sdmc.c            | 219 +++++++++-
 hw/misc/tmp421.c                 | 400 +++++++++++++++++
 hw/net/Makefile.objs             |   1 +
 hw/net/ftgmac100.c               | 916 +++++++++++++++++++++++++++++++++++++++
 hw/ssi/aspeed_smc.c              | 660 ++++++++++++++++++++++++----
 hw/watchdog/Makefile.objs        |   1 +
 hw/watchdog/wdt_aspeed.c         | 223 ++++++++++
 include/hw/arm/aspeed_soc.h      |   8 +-
 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/misc/aspeed_sdmc.h    |   3 +-
 include/hw/net/ftgmac100.h       |  64 +++
 include/hw/ssi/aspeed_smc.h      |   8 +-
 include/hw/watchdog/wdt_aspeed.h |  43 ++
 include/net/eth.h                |   1 +
 include/sysemu/blockdev.h        |   1 +
 qemu-options.hx                  |   4 +-
 slirp/Makefile.objs              |   2 +-
 slirp/ncsi-pkt.h                 | 394 +++++++++++++++++
 slirp/ncsi.c                     |  95 ++++
 slirp/slirp.c                    |   4 +
 slirp/slirp.h                    |   3 +
 target-arm/cpu.c                 |   2 +
 target-arm/cpu.h                 |   1 +
 target-arm/helper.c              |  18 +-
 tests/m25p80-test.c              |  86 ++++
 32 files changed, 3334 insertions(+), 130 deletions(-)
 create mode 100644 hw/misc/tmp421.c
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 hw/watchdog/wdt_aspeed.c
 create mode 100644 include/hw/net/ftgmac100.h
 create mode 100644 include/hw/watchdog/wdt_aspeed.h
 create mode 100644 slirp/ncsi-pkt.h
 create mode 100644 slirp/ncsi.c

-- 
2.7.4
