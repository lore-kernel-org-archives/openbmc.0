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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KfRz2FK3zF1QL
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 19:47:40 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w639l3o2020998;
 Tue, 3 Jul 2018 12:47:04 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 83A8D63044; Tue,  3 Jul 2018 12:47:03 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 linux@roeck-us.net, avifishman70@gmail.com, yuenn@google.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v7 0/2] hwmon: Add NPCM7xx PWM and Fan driver support
Date: Tue,  3 Jul 2018 12:46:59 +0300
Message-Id: <20180703094701.255662-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 03 Jul 2018 09:47:44 -0000

This patch set adds Pulse Width Modulation (PWM) and Fan tacho
support for the Nuvoton NPCM750/730/715/705 Baseboard Management 
Controller (BMC).

The Nuvoton BMC NPCM750/730/715/705 has two identical PWM controller 
modules, each module has four PWM controller outputs and eight identical 
Fan controller modules, each module has two Fan controller inputs.

The hwmon driver provides sysfs entries through which the user can
configure and get the duty cycle between 0 (disable the specific PWM)
to 255 of particular PWM output port and read the fan rpm values.

The driver support cooling device creation, that could be bound
to a thermal zone for the thermal control.

The NPCM750 PWM and Fan driver tested on NPCM750 evaluation board.

Addressed comment from:.
 - Guenter Roeck: https://www.spinics.net/lists/kernel/msg2844266.html
 
Changes since version 6:
 - Kconfig, Makefile and definitions alphabetic order.
 - Error print prefix remove. 
 - dt-binding documentation haven't changed.
				  
Changes since version 5:
 - Removing unnececery lock.
 - Modify dt-binding documentation.
				  
Changes since version 4:
 - Releasing Mutex before return from set PWM function.
 - dt-binding documentation haven't changed.

Changes since version 3:
 - Fixing incorrect word spelling.
 - Removing npcm7xx_ in variable declarations.
 - All variable declarations in structure on a single line.
 - Removing variable unnecessary initialization.
 - dt-binding documentation haven't changed.
 
Changes since version 2:
 - Adding hwmon documentation
 - Using dev_function instead pr_function
 - Removing all typecast
 - Removing unused definitions
 - Adding () in macros parameters.
 - dt-binding documentation haven't changed
 
Changes since version 1:
 - Rename driver name
 - Adding Fan Controller support
 - Adding cooling device support
 - Modifying dt-binding documentation for Fan and cooling binding

Tomer Maimon (2):
  dt-binding: hwmon: Add NPCM7xx PWM and Fan controller documentation
  hwmon: npcm750: add NPCM7xx PWM and Fan driver

 .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  |   87 ++
 Documentation/hwmon/npcm750-pwm-fan                |   22 +
 drivers/hwmon/Kconfig                              |    7 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/npcm750-pwm-fan.c                    | 1057 ++++++++++++++++++++
 5 files changed, 1174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 Documentation/hwmon/npcm750-pwm-fan
 create mode 100644 drivers/hwmon/npcm750-pwm-fan.c

-- 
2.14.1
