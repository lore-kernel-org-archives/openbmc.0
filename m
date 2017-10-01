Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
X-Greylist: delayed 3532 seconds by postgrey-1.36 at bilbo;
 Sun, 01 Oct 2017 21:11:09 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y4gzx0sdgzDqR8
 for <openbmc@lists.ozlabs.org>; Sun,  1 Oct 2017 21:11:08 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id v918siTR015596;
 Sun, 1 Oct 2017 11:54:44 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 7CC545A15C; Sun,  1 Oct 2017 12:11:41 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
 tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Sun,  1 Oct 2017 12:11:36 +0300
Message-Id: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 01 Oct 2017 10:11:10 -0000

This patch set adds clocksource support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

The clocksource Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx BMC,
while TIMER0 serves as clockevent and TIMER1 serves as clocksource.

clocksource patch set depand on approval of basic support for Nuvoton BMCs
and Nuvoton NPCM750 device tree patches.
https://patchwork.kernel.org/bundle/brendanhiggins/arm:%20npcm:%20add%20basic%20support%20for%20Nuvoton%20BMCs/

Tomer Maimon (2):
  clocksource: npcm: add NPCM7xx timer driver
  dt-binding: timer: document NPCM7xx timer DT bindings

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   9 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx_timer.c                | 205 +++++++++++++++++++++
 4 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx_timer.c

-- 
2.14.1
