Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 2968 seconds by postgrey-1.36 at bilbo;
 Fri, 18 May 2018 00:14:08 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mtb4387WzF281
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 00:14:07 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4HDOFYj004470;
 Thu, 17 May 2018 16:24:16 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 811AB5AB22; Thu, 17 May 2018 16:24:15 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 0/2] pinctrl: npcm: add NPCM7xx pinctrl
 driver
Date: Thu, 17 May 2018 16:24:08 +0300
Message-Id: <1526563450-20630-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 17 May 2018 14:14:10 -0000

Changes since version 1:
fixed comments from Andrew Jeffery<andrew@aj.id.au>:
https://patchwork.ozlabs.org/patch/853395/

This patch set adds pin controller support for the 
Nuvoton NPCM7xx Baseboard Management Controller (BMC).
 
The NPCM7XX Pin Controller multi-function routed
through the multiplexing block, Each pin supports
GPIO functionality (GPIOx) and multiple functions
that directly connect the pin to different hardware
blocks.

Tomer Maimon (2):
  dt-binding: pinctrl: document NPCM7xx pin controller DT bindings
  pinctrl: npcm: add NPCM7xx pin control driver

 .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |   70 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/nuvoton/Kconfig                    |   12 +
 drivers/pinctrl/nuvoton/Makefile                   |    1 +
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2133 ++++++++++++++++++++
 6 files changed, 2219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/nuvoton/Kconfig
 create mode 100644 drivers/pinctrl/nuvoton/Makefile
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

-- 
2.14.1
