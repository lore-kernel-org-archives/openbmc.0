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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jS7v4HBRzDqGS
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 22:13:11 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x3FBgerw019419;
 Mon, 15 Apr 2019 14:42:40 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id E698262FFF; Mon, 15 Apr 2019 15:12:36 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: gregkh@linuxfoundation.org, arnd@arnd.de, robh+dt@kernel.org,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] misc: Add NPCM LPC BPC driver support 
Date: Mon, 15 Apr 2019 15:12:33 +0300
Message-Id: <20190415121235.255028-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 15 Apr 2019 12:13:16 -0000

This patch set adds BIOS Post code (BPC) support for the
Nuvoton NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capture data stored in 128-word FIFO.

NPCM BPC can support capture double words.

I have created common lpc-snoop documentation for both 
Nuvoton and Aspeed drivers as Andrew suggested.
Andrew Jeffery: https://patchwork.kernel.org/patch/10506269/ 

I prefer to add the lpc-dnoop documentation to misc folder instead 
of creating new /devicetree/binding folder that named BMC
as been done in the last lpc-snoop patchset because I am not sure
is something that should be done for only 
one module for now. 
https://patchwork.kernel.org/patch/10506269/

The NPCM7xx BPC driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: misc: Add common LPC snoop documentation
  misc: npcm: add NPCM LPC BPC driver

 .../devicetree/bindings/misc/lpc-snoop.txt         |  27 ++
 drivers/misc/Kconfig                               |   8 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/npcm-lpc-bpc-snoop.c                  | 393 +++++++++++++++++++++
 4 files changed, 429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/lpc-snoop.txt
 create mode 100644 drivers/misc/npcm-lpc-bpc-snoop.c

-- 
2.14.1
