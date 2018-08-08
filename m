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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lmGK5q8nzDqxs
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 19:26:01 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w788tS2f032067;
 Wed, 8 Aug 2018 11:55:28 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7249862EDE; Wed,  8 Aug 2018 12:25:27 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v6 0/2] pinctrl: nuvoton: add driver for NPCM7xx
Date: Wed,  8 Aug 2018 12:25:24 +0300
Message-Id: <20180808092526.87405-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 08 Aug 2018 09:26:02 -0000

This patch set adds pinmux and GPIO controller for the Nuvoton
NPCM750/730/715/705 Baseboard Management Controller (BMC).

The Nuvoton BMC NPCM750/730/715/705 Pinmux functions accessible
only for pin groups and pinconf parameters available only for 
individual pins.

The Nuvoton BMC NPCM750/730/715/705 has eight identical GPIO 
modules, each module has 32 GPIO ports.

Most of the GPIO ports are multiplexed with other system functions.

The NPCM7xx pinctrl and GPIO driver tested on NPCM750 evaluation board.

Changes since version 5:
 - Remove link to unsupported GPIO_GENERIC free function.
 - Add child device node to each gpio chip.
 - dt-binding reviewed-by Rob Herring.
 
Changes since version 4:
 - Use direct access read and write functions.
 - Modify the probe GPIO and pinctrl order.
 - Remove unsupported BGPIOF_INVERTED_REG_DIR flag.
 - dt-binding documentation haven't changed.
 
Changes since version 3:
 - Remove Kconfig MFD_SYSCON dependency.
 - Add BGPIOF_INVERTED_REG_DIR flag.
 - dt-binding documentation haven't changed.

Changes since version 2:
 - Using GPIO_GENERIC (mmio).
 - Add Kconfig MFD_SYSCON dependency.
 - Remove unnecessary code from the direction output function.
 - dt-binding documentation haven't changed.
				  
Changes since version 1:
 - Remove Kconfig MFD_SYSCON dependency.
 - Modify setfunc function.
 - Modify dt-binding documentation according Rob comments. 

Tomer Maimon (2):
  dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO documentation
  pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver

 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |  216 ++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/nuvoton/Kconfig                    |   12 +
 drivers/pinctrl/nuvoton/Makefile                   |    4 +
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2072 ++++++++++++++++++++
 6 files changed, 2306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/nuvoton/Kconfig
 create mode 100644 drivers/pinctrl/nuvoton/Makefile
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

-- 
2.14.1
