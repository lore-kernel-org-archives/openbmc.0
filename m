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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42txQY4cDXzF3Tl
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 03:43:17 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wACGCioU030400;
 Mon, 12 Nov 2018 18:12:44 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 8F09362EDE; Mon, 12 Nov 2018 18:42:42 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] spi: npcm: add NPCM Peripheral SPI driver 
Date: Mon, 12 Nov 2018 18:42:30 +0200
Message-Id: <20181112164232.435629-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 12 Nov 2018 16:43:18 -0000

This patch set adds Peripheral SPI (PSPI) support for the
Nuvoton NPCM Baseboard Management Controller (BMC).

The NPCM PSPI operates in master mode.

The NPCM750/730/715/710 supports up to two PSPI devices.

The NPCM PSPI driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: spi: add NPCM PSPI controller documentation
  spi: npcm: add NPCM PSPI controller driver

 .../devicetree/bindings/spi/nuvoton,npcm-pspi.txt  |  35 ++
 drivers/spi/Kconfig                                |   7 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-npcm-pspi.c                        | 480 +++++++++++++++++++++
 4 files changed, 523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
 create mode 100644 drivers/spi/spi-npcm-pspi.c

-- 
2.14.1
