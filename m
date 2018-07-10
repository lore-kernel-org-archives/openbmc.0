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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Q2Jy5tCTzDr2J
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:56:48 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w6ACu5kO025317;
 Tue, 10 Jul 2018 15:56:08 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 8B47E62ED5; Tue, 10 Jul 2018 15:56:05 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] pinctrl: nuvoton: add driver for NPCM7xx
Date: Tue, 10 Jul 2018 15:56:02 +0300
Message-Id: <20180710125604.14458-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 10 Jul 2018 12:56:51 -0000

This patch set adds pinmux and GPIO controller for the Nuvoton
NPCM750/730/715/705 Baseboard Management Controller (BMC).

The Nuvoton BMC NPCM750/730/715/705 Pinmux functions accessible
only for pin groups and pinconf parameters available only for 
individual pins.

The Nuvoton BMC NPCM750/730/715/705 has eight identical GPIO 
modules, each module has 32 GPIO ports.

Most of the GPIO ports are multiplexed with other system functions.

The NPCM7xx pinctrl and GPIO driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO documentation
  pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver

 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |  216 ++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/nuvoton/Kconfig                    |   13 +
 drivers/pinctrl/nuvoton/Makefile                   |    4 +
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2086 ++++++++++++++++++++
 6 files changed, 2321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/nuvoton/Kconfig
 create mode 100644 drivers/pinctrl/nuvoton/Makefile
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

-- 
2.14.1
