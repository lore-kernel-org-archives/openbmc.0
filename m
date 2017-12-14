Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yy8B15d3szDrZJ
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 20:57:29 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBE9dkFT017373;
 Thu, 14 Dec 2017 11:39:46 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 2591E5A932; Thu, 14 Dec 2017 11:57:22 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, joel.stan@gmail.com, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Thu, 14 Dec 2017 11:57:16 +0200
Message-Id: <1513245438-11003-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 14 Dec 2017 09:57:30 -0000

This patch set adds clocksource support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

The clocksource Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx BMC,
while TIMER0 serves as clockevent and TIMER1 serves as clocksource.

Tomer Maimon (2):
  dt-binding: timer: document NPCM7xx timer DT bindings
  clocksource: npcm: add NPCM7xx timer driver

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx-timer.c                | 239 +++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx-timer.c

-- 
2.14.1
