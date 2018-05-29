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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w8RZ34dZzDr4d
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 20:02:47 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w4TA2OlR031893;
 Tue, 29 May 2018 13:02:24 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id D59A35AA0B; Tue, 29 May 2018 13:02:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 linux@roeck-us.net, avifishman70@gmail.com, yuenn@google.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] hwmon: Add NPCM7xx PWM driver support
Date: Tue, 29 May 2018 13:02:19 +0300
Message-Id: <1527588141-18639-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 29 May 2018 10:02:51 -0000

This patch set adds Pulse Width Modulation (PWM) support 
for the Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM7xx PWM controller can support 8 PWM output ports.

The hwmon driver provides sysfs entries through which the user can 
configure and get the duty cycle between 0 (disable the specific PWM) 
to 255 of particular PWM output port.

The NPCM7xx PWM driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: hwmon: Add NPCM7xx PWM documentation
  hwmon: npcm-pwm: add NPCM7xx PWM driver

 .../devicetree/bindings/hwmon/npcm7xx-pwm.txt      |  25 ++
 drivers/hwmon/Kconfig                              |   6 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/npcm7xx-pwm.c                        | 363 +++++++++++++++++++++
 4 files changed, 395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
 create mode 100644 drivers/hwmon/npcm7xx-pwm.c

-- 
2.14.1
