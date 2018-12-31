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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43SsyV6nfCzDqDh
 for <openbmc@lists.ozlabs.org>; Mon, 31 Dec 2018 20:51:11 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBV9L2Rk000529;
 Mon, 31 Dec 2018 11:21:02 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 319BA62DA4; Mon, 31 Dec 2018 11:51:00 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 v1 0/4] dd NPCM7xx ADC patch to dev-4.19
Date: Mon, 31 Dec 2018 11:50:52 +0200
Message-Id: <20181231095056.86234-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2018 09:51:16 -0000

Add NPCM7xx ADC patch to dev-4.19.

please add the NPCM7xx ADC patch set after adding 
the following patch set:
https://patchwork.ozlabs.org/cover/1014101/

Tomer Maimon (4):
  dt-binding: iio: add NPCM ADC documentation
  iio: adc: add NPCM ADC driver
  dts: npcm7xx: Modify NPCM7xx device tree
  arm: configs: add NPCM7xx ADC and MMIO configuration

 .../bindings/iio/adc/nuvoton,npcm-adc.txt          |  35 +++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      | 182 +++++++----
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          | 157 +++++++---
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi        |   4 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             |   1 +
 arch/arm/configs/npcm7xx_defconfig                 |   5 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/npcm_adc.c                         | 336 +++++++++++++++++++++
 9 files changed, 627 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
 create mode 100644 drivers/iio/adc/npcm_adc.c

-- 
2.14.1
