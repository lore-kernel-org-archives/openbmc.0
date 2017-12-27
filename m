Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6BX00GgtzDqHy
 for <openbmc@lists.ozlabs.org>; Wed, 27 Dec 2017 23:10:52 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBRBquoq025911;
 Wed, 27 Dec 2017 13:52:56 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 6656D5A634; Wed, 27 Dec 2017 14:10:39 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] mtd: npcm: add NPCM7xx spi-nor driver
Date: Wed, 27 Dec 2017 14:10:35 +0200
Message-Id: <1514376637-12328-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 27 Dec 2017 12:10:57 -0000

This patch set adds serial Peripheral interface (SPI)
Flash interface unit (FIU) support for the Nuvoton NPCM7xx 
Baseboard Management Controller (BMC).

Nuvoton NPCM7xx have two SPI nor modules,
first module support 2 chip select
second module support 4 chip select

Tomer Maimon (2):
  dt-binding: mtd: document NPCM7xx SPI DT bindings
  mtd: npcm: add NPCM7xx spi driver

 Documentation/devicetree/bindings/mtd/npcm-spi.txt |   31 +
 drivers/mtd/spi-nor/Kconfig                        |    7 +
 drivers/mtd/spi-nor/Makefile                       |    3 +-
 drivers/mtd/spi-nor/npcm-spi.c                     | 1203 ++++++++++++++++++++
 4 files changed, 1243 insertions(+), 1 deletion(-)
 create mode 100755 Documentation/devicetree/bindings/mtd/npcm-spi.txt
 create mode 100644 drivers/mtd/spi-nor/npcm-spi.c

-- 
2.14.1
