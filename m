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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fvJK4MnrzDqdZ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 04:26:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0GGuJbf014235;
 Wed, 16 Jan 2019 18:56:19 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1847D62DA4; Wed, 16 Jan 2019 19:26:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 0/3] add NPCM7xx adc and dts patches to dev-4.19 
Date: Wed, 16 Jan 2019 19:26:12 +0200
Message-Id: <20190116172615.203952-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 17:26:26 -0000

Hi Joel,

I hope it is the last patch set

Please add the following NPCM7xx patches to dev-4.19:

1. Modification for NPCM7xx Device tree.
2. Modification for NPCM ADC driver.

The patch sets with GCC 8.2.0 version.

Appreciate your support!

Tomer

Tomer Maimon (3):
  dt-binding: iio: Modify NPCM ADC documentation
  iio: adc: Modify NPCM ADC driver
  dts: npcm7xx: Modify NPCM7xx device tree

 .../bindings/iio/adc/nuvoton,npcm-adc.txt          |  16 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi      | 199 ++++++++++++---------
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          | 165 ++++++++++++-----
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi        |  18 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi             |  10 +-
 drivers/iio/adc/npcm_adc.c                         | 133 +++++++-------
 6 files changed, 323 insertions(+), 218 deletions(-)

-- 
2.14.1
