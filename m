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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LFgm4j6SzF1SC
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 19:14:58 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w649ESbZ017180;
 Wed, 4 Jul 2018 12:14:28 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 5EAD36307B; Wed,  4 Jul 2018 12:14:28 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arnd.de,
 gregkh@linuxfoundation.org, avifishman70@gmail.com, yuenn@google.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] misc: Add NPCM7xx LPC BPC driver support
Date: Wed,  4 Jul 2018 12:14:25 +0300
Message-Id: <20180704091427.409971-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 09:15:01 -0000

This patch set adds BIOS Post code (BPC) support for the
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.

NPCM7xx BPC can support capture double words.

I have created new folder (bmc) in the documentation/devicetree/binding
for BMC miscellaneous modules that are not represented in the
binding folder.

The NPCM7xx BPC driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: bmc: Add NPCM7xx LPC BPC documentation
  misc: npcm7xx: add NPCM7xx LPC BPC driver

 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    |  26 ++
 drivers/misc/Kconfig                               |   8 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/npcm7xx-lpc-bpc.c                     | 348 +++++++++++++++++++++
 4 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
 create mode 100644 drivers/misc/npcm7xx-lpc-bpc.c

-- 
2.14.1
