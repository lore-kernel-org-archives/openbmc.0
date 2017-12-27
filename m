Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6Dkx69cbzDqXs
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 00:50:29 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBRDWcsE027577;
 Wed, 27 Dec 2017 15:32:38 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id EBC525A647; Wed, 27 Dec 2017 15:50:20 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] hwmon: npcm: add NPCM7xx PWM and Fan
 Tacho driver
Date: Wed, 27 Dec 2017 15:50:17 +0200
Message-Id: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 27 Dec 2017 13:50:36 -0000

This patch set adds Pulse Width Modulation (PWM) and
Fan tachometer (Fan) support for the Nuvoton NPCM7xx 
Baseboard Management Controller (BMC).

Nuvoton NPCM7xx support upto 16 Fan tachometer inputs and
upto 8 PWM outputs.
Each PWM output module have watchdog.

Tomer Maimon (2):
  dt-binding: hwmon: document NPCM7xx sensors DT bindings
  hwmon: npcm: add NPCM7xx PWM and Fan driver

 .../devicetree/bindings/hwmon/npcm7xx-fan.txt      |  18 +
 .../devicetree/bindings/hwmon/npcm7xx-pwm.txt      |  16 +
 drivers/hwmon/Kconfig                              |   6 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/npcm7xx-fan.c                        | 722 +++++++++++++++++++++
 drivers/hwmon/npcm7xx-pwm.c                        | 534 +++++++++++++++
 6 files changed, 1297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
 create mode 100644 drivers/hwmon/npcm7xx-fan.c
 create mode 100644 drivers/hwmon/npcm7xx-pwm.c

-- 
2.14.1
