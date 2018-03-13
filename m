Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400wmm5sjHzDr2V
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 00:33:59 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w2DDDtd4000707;
 Tue, 13 Mar 2018 15:13:56 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 62C655AA77; Tue, 13 Mar 2018 15:32:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 brendanhiggins@google.com, avifishman70@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v12 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue, 13 Mar 2018 15:32:08 +0200
Message-Id: <1520947931-15426-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Tue, 13 Mar 2018 13:34:01 -0000

Addressed comments from:
 - Arnd: https://www.spinics.net/lists/arm-kernel/msg639249.html

Summary of changes since previous update:
 - Modify mach-npcm Kconfig to support all NPCM7XX family.
 - Modify mach-npcm Makefile.
 - Adding NPCM730 chip support.
 - Adding L2 Cache values to initialize the L2 Cache.

All changes tested on Nuvoton NPCM750 EVB.

Tomer Maimon (3):
  arm: npcm: add basic support for Nuvoton BMCs
  arm: dts: add Nuvoton NPCM750 device tree
  MAINTAINERS: Add entry for the Nuvoton NPCM architecture

 .../arm/cpu-enable-method/nuvoton,npcm750-smp      |  42 ++++++
 .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
 MAINTAINERS                                        |  14 ++
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  35 +++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 165 +++++++++++++++++++++
 arch/arm/mach-npcm/Kconfig                         |  30 ++++
 arch/arm/mach-npcm/Makefile                        |   6 +
 arch/arm/mach-npcm/headsmp.S                       |  17 +++
 arch/arm/mach-npcm/npcm7xx.c                       |  23 +++
 arch/arm/mach-npcm/platsmp.c                       |  81 ++++++++++
 13 files changed, 424 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
 create mode 100644 arch/arm/mach-npcm/Kconfig
 create mode 100644 arch/arm/mach-npcm/Makefile
 create mode 100644 arch/arm/mach-npcm/headsmp.S
 create mode 100644 arch/arm/mach-npcm/npcm7xx.c
 create mode 100644 arch/arm/mach-npcm/platsmp.c

-- 
2.14.1
