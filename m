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
 by lists.ozlabs.org (Postfix) with ESMTPS id 437fW645tYzDqXr
 for <openbmc@lists.ozlabs.org>; Mon,  3 Dec 2018 20:16:16 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wB38ixbo010629;
 Mon, 3 Dec 2018 10:45:00 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id F13A062DA6; Mon,  3 Dec 2018 11:14:57 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 joel@jms.id.au
Cc: linux-mtd@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Date: Mon,  3 Dec 2018 11:14:54 +0200
Message-Id: <20181203091456.454030-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 03 Dec 2018 09:16:19 -0000

This patch set adds Flash Interface Unit(FIU) SPI-NOR
support for the Nuvoton NPCM Baseboard Management 
Controller (BMC).
    
The FIU supports single, dual or quad communication interface.
    
the FIU controller can operate in following modes:
- User Mode Access(UMA): provides flash access by using an
  indirect address/data mechanism.
- direct rd/wr mode: maps the flash memory into the core
  address space.
- SPI-X mode: used for an expansion bus to an ASIC or CPLD.

The NPCM750/730/715/710 supports up to three FIU devices:
- FIU0 supports two chip select.
- FIU3 supports four chip select.
- FIUX supports two chip select.

The NPCM FIU driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: mtd: add NPCM FIU controller
  mtd: spi-nor: add NPCM FIU controller driver

 Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
 drivers/mtd/spi-nor/Kconfig                        |   8 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/npcm-fiu.c                     | 930 +++++++++++++++++++++
 4 files changed, 1003 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
 create mode 100644 drivers/mtd/spi-nor/npcm-fiu.c

-- 
2.14.1
