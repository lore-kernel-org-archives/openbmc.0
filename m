Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zDsbC1mNHzF0RZ
 for <openbmc@lists.ozlabs.org>; Sun,  7 Jan 2018 19:51:47 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w078Xjg4013077;
 Sun, 7 Jan 2018 10:33:45 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8ED455A907; Sun,  7 Jan 2018 10:51:33 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v2 0/2] ADC: npcm: add NPCM7xx ADC iio driver
Date: Sun,  7 Jan 2018 10:51:29 +0200
Message-Id: <1515315091-15381-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 07 Jan 2018 08:51:52 -0000

Changes since version 1:
 - Modify DT compatible name
 
This patch set adds Analog-to-digital converter (ADC) support
for the Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM7xx ADC is a 10-bit converter for eight channel
inputs, the ADC module includes an eight-to-one multiplexer.

Tomer Maimon (2):
  dt-binding: iio: document NPCM7xx ADC DT bindings
  ADC: npcm: add NPCM7xx ADC driver

 .../devicetree/bindings/iio/adc/npcm7xx-adc.txt    |  23 ++
 drivers/iio/adc/Kconfig                            |   9 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/npcm7xx-adc.c                      | 352 +++++++++++++++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/npcm7xx-adc.txt
 create mode 100644 drivers/iio/adc/npcm7xx-adc.c

-- 
2.14.1
