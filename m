Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6mXP5TdrzDqR5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 21:43:14 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBSAPL4d016513;
 Thu, 28 Dec 2017 12:25:21 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 93F925A1B9; Thu, 28 Dec 2017 12:43:04 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 0/2] pinctrl: npcm: add NPCM7xx pinctrl
 driver
Date: Thu, 28 Dec 2017 12:43:00 +0200
Message-Id: <1514457782-32018-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 28 Dec 2017 10:43:18 -0000

Changes since version 1:
 - Modify pinctrl source file name.
 - Modify Makefile and Knonfig to support
   modified pinctrl source file name.

This patch set adds pin controller support for the 
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM7XX Pin Controller multi-function routed
through the multiplexing block, Each pin supports
GPIO functionality (GPIOx) and multiple functions
that directly connect the pin to different hardware
blocks.

Tomer Maimon (2):
  dt-binding: pinctrl: document NPCM7xx pin controller DT bindings
  pinctrl: npcm: add NPCM7xx pin controller driver

 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |   70 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/nuvoton/Kconfig                    |    8 +
 drivers/pinctrl/nuvoton/Makefile                   |    1 +
 drivers/pinctrl/nuvoton/npcmreg.h                  |  249 +++
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2157 ++++++++++++++++++++
 7 files changed, 2488 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/nuvoton/Kconfig
 create mode 100644 drivers/pinctrl/nuvoton/Makefile
 create mode 100644 drivers/pinctrl/nuvoton/npcmreg.h
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

-- 
2.14.1
