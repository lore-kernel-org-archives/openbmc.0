Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0fN86Y2PzDrgh
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 22:44:54 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBIBR4RO025124;
 Mon, 18 Dec 2017 13:27:04 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8F8B15A927; Mon, 18 Dec 2017 13:44:42 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v3 0/4] arm: npcm: add basic support for
 Nuvoton BMCs
Date: Mon, 18 Dec 2017 13:44:36 +0200
Message-Id: <1513597480-2913-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 11:44:57 -0000

Changes since version 2:
 - Update GPL licence message
 - Creating defconfig with make tool and patch it with is own patch

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

Tomer Maimon (4):
  arm: npcm: add basic support for Nuvoton BMCs
  arm: npcm: add configuration for EVB based NPCM7xx BMC
  arm: dts: add Nuvoton NPCM750 device tree
  MAINTAINERS: Add entry for Nuvoton NPCM architecture

 .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |   42 +
 .../devicetree/bindings/arm/npcm/npcm.txt          |    6 +
 MAINTAINERS                                        |   13 +
 arch/arm/Kconfig                                   |    2 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  467 ++++++++
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi        |  876 ++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 1189 ++++++++++++++++++++
 arch/arm/configs/poleg_svb_defconfig               |  105 ++
 arch/arm/mach-npcm/Kconfig                         |   61 +
 arch/arm/mach-npcm/Makefile                        |    6 +
 arch/arm/mach-npcm/headsmp.S                       |   21 +
 arch/arm/mach-npcm/npcm7xx.c                       |   26 +
 arch/arm/mach-npcm/platsmp.c                       |   85 ++
 14 files changed, 2900 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
 create mode 100755 arch/arm/boot/dts/nuvoton-npcm750.dtsi
 create mode 100644 arch/arm/configs/poleg_svb_defconfig
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

-- 
2.14.1
