Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0hXv2mv7zDrmv
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 00:22:36 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBID4mWV026782;
 Mon, 18 Dec 2017 15:04:48 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 894815A91D; Mon, 18 Dec 2017 15:22:26 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] watchdog: npcm: add NPCM7xx watchdog
 driver
Date: Mon, 18 Dec 2017 15:22:22 +0200
Message-Id: <1513603344-5700-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 13:22:41 -0000

This patch set adds watchdog support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

Nuvoton NPCM7xx have three watchdog timer modules, each watchdog timer
is a free-running timer with programmable timeout intervals.

The NPCM7xx watchdog interrupts connected Fast Interrupt reQuest (FIQ).

Tomer Maimon (2):
  dt-binding: watchdog: document NPCM7xx watchdog DT bindings
  watchdog: npcm: add NPCM7xx watchdog driver

 .../bindings/watchdog/nuvoton,npcm7xx-wdt.txt      |  23 ++
 drivers/watchdog/Kconfig                           |  11 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/npcm7xx_wdt.c                     | 369 +++++++++++++++++++++
 drivers/watchdog/npcm7xx_wdt_fiq_handler.S         |  68 ++++
 5 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm7xx-wdt.txt
 create mode 100644 drivers/watchdog/npcm7xx_wdt.c
 create mode 100644 drivers/watchdog/npcm7xx_wdt_fiq_handler.S

-- 
2.14.1
