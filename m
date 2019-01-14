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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dYfS0mQQzDqWM
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 00:07:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0ECbFFX018971;
 Mon, 14 Jan 2019 14:37:15 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 0E3C762DA4; Mon, 14 Jan 2019 15:07:12 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 00/15] dd NPCM7xx patches to dev-4.19 
Date: Mon, 14 Jan 2019 15:06:55 +0200
Message-Id: <20190114130710.427600-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 13:07:29 -0000

Hi Joel, 

Please add the following NPCM7xx patches to dev-4.19:

1. NPCM FIU driver(SPI-NOR).
2. NPCM7xx I2C driver.
3. NPCM7xx BIOS post code driver.
4. NPCM7xx PCI mailbox driver.
5. NPCM7xx ETHERNET MAC Controller driver.
6. NPCM7xx defconfig.
7. NPCM7xx Device tree.
8. NPCM ADC driver.

The patch sets NPCM drivers tested on NPCM750 evaluation board.

Tomer Maimon (15):
  clk: nuvoton: add npcm750 clock function prototype initialization
  dt-binding: mtd: add NPCM FIU controller
  mtd: spi-nor: add NPCM FIU controller driver
  dt-bindings: i2c: npcm7xx: add binding for i2c controller
  i2c: npcm: driver for Poleg i2c controller
  dt-binding: bmc: Add NPCM7xx LPC BPC documentation
  misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver
  dt-binding: bmc: add npcm7xx pci mailbox document
  misc: mbox: add npcm7xx pci mailbox driver
  dt-binding: net: document NPCM7xx EMC DT bindings
  net: npcm: add NPCM7xx Ethernet MAC controller
  dt-binding: iio: add NPCM ADC documentation
  iio: adc: add NPCM ADC driver
  arm: npcm: add defconfig for Nuvoton NPCM7xx BMC
  dts: npcm7xx: Modify NPCM7xx device tree

 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    |   26 +
 .../devicetree/bindings/bmc/npcm7xx-pci-mbox.txt   |   19 +
 .../devicetree/bindings/i2c/i2c-npcm7xx.txt        |   29 +
 .../bindings/iio/adc/nuvoton,npcm-adc.txt          |   35 +
 Documentation/devicetree/bindings/mtd/npcm-fiu.txt |   64 +
 .../bindings/net/nuvoton,npcm7xx-emc.txt           |   36 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      |  199 +-
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  165 +-
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi        |   18 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             |   10 +-
 arch/arm/configs/npcm7xx_defconfig                 |  122 ++
 drivers/i2c/busses/Kconfig                         |   11 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c                   | 2017 +++++++++++++++++++
 drivers/iio/adc/Kconfig                            |   10 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/npcm_adc.c                         |  336 ++++
 drivers/misc/Kconfig                               |   15 +
 drivers/misc/Makefile                              |    2 +
 drivers/misc/npcm7xx-lpc-bpc.c                     |  394 ++++
 drivers/misc/npcm7xx-pci-mbox.c                    |  288 +++
 drivers/mtd/spi-nor/Kconfig                        |    8 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/npcm-fiu.c                     |  930 +++++++++
 drivers/net/ethernet/nuvoton/Kconfig               |   17 +-
 drivers/net/ethernet/nuvoton/Makefile              |    2 +
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c         | 2091 ++++++++++++++++++++
 include/linux/clk/nuvoton.h                        |    9 +
 28 files changed, 6712 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
 create mode 100644 arch/arm/configs/npcm7xx_defconfig
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c
 create mode 100644 drivers/iio/adc/npcm_adc.c
 create mode 100644 drivers/misc/npcm7xx-lpc-bpc.c
 create mode 100644 drivers/misc/npcm7xx-pci-mbox.c
 create mode 100644 drivers/mtd/spi-nor/npcm-fiu.c
 create mode 100644 drivers/net/ethernet/nuvoton/npcm7xx_emc.c
 create mode 100644 include/linux/clk/nuvoton.h

-- 
2.14.1
