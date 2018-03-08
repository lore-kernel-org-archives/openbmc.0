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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxvTx5c38zF1sM
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 02:25:36 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w28F6fCk031241;
 Thu, 8 Mar 2018 17:06:42 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 273105AA75; Thu,  8 Mar 2018 17:25:01 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
 tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v5 0/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
Date: Thu,  8 Mar 2018 17:24:56 +0200
Message-Id: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 08 Mar 2018 15:25:42 -0000

Addressed comments from:.
 - Daniel Lezcano: https://www.spinics.net/lists/kernel/msg2741546.html
				   https://www.spinics.net/lists/kernel/msg2741548.html
 - Joel Stanley:   https://www.spinics.net/lists/kernel/msg2736646.html					

Changes since version 4:
 - Remove clock-frequency option.
 - Rename driver name.
 - Enable TIMER_OF_CLOCK flag.
 - Modify register size in the dt-binding.
 
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
  clocksource/drivers/npcm: Add NPCM7xx timer driver

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  21 ++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-npcm7xx.c                | 215 +++++++++++++++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/timer-npcm7xx.c

-- 
2.14.1
