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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqktP4J78zF1Dg
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 01:36:54 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w1QEI4wH002070;
 Mon, 26 Feb 2018 16:18:04 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 20AA45AA60; Mon, 26 Feb 2018 16:36:18 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
 tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com,
 joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v4 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Mon, 26 Feb 2018 16:36:07 +0200
Message-Id: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 26 Feb 2018 14:37:02 -0000

Addressed comments from:.
 - Brendan Higgins: https://www.spinics.net/lists/devicetree/msg202331.html

Changes since version 3:
 - Modify prefix to npcm7xx_
 - Modify licensing to SPDX license format

Changes since version 2:
 - The shutdown function called oneshot function that can cause a crash in the system,
   Modify shutdown call to unique shutdown function.
 - Adding support to resume function
 - Using timer-of.c API
 - Modify NPCM750 compatible name.

Changes since version 1:
 - Rename driver name
 - Removing unnecessary dependencies in configuration
 - Adding prefix to the macros
 - No changes to dt-binding documentation since v1
 
Modified driver have been tested on the NPCM750 evaluation board.
 
Tomer Maimon (2):
  dt-binding: timer: document NPCM7xx timer DT bindings
  clocksource: npcm: add NPCM7xx timer driver

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx-timer.c                | 237 +++++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx-timer.c

-- 
2.14.1
