Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVygf5wfMzDrJm
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 03:29:13 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vA6GBMB8010515;
 Mon, 6 Nov 2017 18:11:22 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 238475A91C; Mon,  6 Nov 2017 18:28:38 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
 tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Mon,  6 Nov 2017 18:28:34 +0200
Message-Id: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 16:29:19 -0000

Addressed comments from:.
 - Daniel Lezcano: https://www.spinics.net/lists/devicetree/msg196683.html
 - Brendan Higgins: https://www.spinics.net/lists/devicetree/msg201038.html
		    https://www.spinics.net/lists/devicetree/msg201037.html

Changes since version 2:
 - The shutdown function called oneshot function that can cause a crash
   in the system.
   Modify shutdown call to unique shutdown function to solve it.
 - Adding support to resume function
 - Using timer-of.c API
 - Modify NPCM750 compatible name.

Asked Brendon to modify NPCM7xx device tree entry.
https://lkml.org/lkml/2017/11/6/335

Changes have been tested on the NPCM750 evaluation board.

Tomer Maimon (2):
  clocksource: npcm: add NPCM7xx timer driver
  dt-binding: timer: document NPCM7xx timer DT bindings

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx-timer.c                | 239 +++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx-timer.c

-- 
2.14.1
