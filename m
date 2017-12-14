Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yy7nq6Gs9zDrXZ
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 20:39:56 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBE9M9am017050;
 Thu, 14 Dec 2017 11:22:09 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 156175A932; Thu, 14 Dec 2017 11:39:45 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, joel.stan@gmail.com, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 14 Dec 2017 11:39:28 +0200
Message-Id: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Thu, 14 Dec 2017 09:40:00 -0000

Changes since version 1:
 - Add dt-binding documentation to NPCM
 - Add dt-binding documentation to npcm7xx-smp

This patch set adds support for the Nuvoton NPCM Baseboard Management Controller
(BMC) SoC architecture as well as the NPCM750 variant. NPCM is an ARM based SoC
with external DDR RAM and supports a large set of peripherals.

The NPCM750 is based on Cortex A9 and comes in single core and dual core
flavors.

The device tree added in this patchset has a number of bindings for which the
corresponding drivers will be sent out later and thus do not yet have binding
documentation. Apologies in advance if you would like the bindings to be added
along with the corresponding drivers.

this patch set based on Brendan Higgins patcehs.
https://patchwork.kernel.org/project/linux-arm-kernel/list/?submitter=170155

Thanks!

Tomer Maimon (3):
  arm: npcm: add basic support for Nuvoton BMCs
  arm: dts: add Nuvoton NPCM750 device tree
  MAINTAINERS: Add entry for Nuvoton NPCM architecture

 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |   42 +
 .../devicetree/bindings/arm/npcm/npcm.txt          |    6 +
 MAINTAINERS                                        |   13 +
 arch/arm/Kconfig                                   |    2 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  468 ++++++++
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi        |  877 +++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 1189 ++++++++++++++++++++
 arch/arm/configs/PolegSVB_defconfig                |  428 +++++++
 arch/arm/mach-npcm/Kconfig                         |   61 +
 arch/arm/mach-npcm/Makefile                        |    6 +
 arch/arm/mach-npcm/headsmp.S                       |   22 +
 arch/arm/mach-npcm/npcm7xx.c                       |   27 +
 arch/arm/mach-npcm/platsmp.c                       |   86 ++
 14 files changed, 3228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
 create mode 100644 arch/arm/configs/PolegSVB_defconfig
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

-- 
2.14.1
