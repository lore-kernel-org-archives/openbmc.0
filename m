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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ftTg1Y3mzDqmR
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 03:49:23 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0GGIxUE013485;
 Wed, 16 Jan 2019 18:18:59 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id B429962DA4; Wed, 16 Jan 2019 18:48:56 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
 robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com,
 joel@jms.id.au
Cc: linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 0/2] iio: adc: npcm: add NPCM ADC driver
Date: Wed, 16 Jan 2019 18:48:53 +0200
Message-Id: <20190116164855.200357-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 16:49:28 -0000

This patch set adds Analog-to-Digital Converter (ADC) support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

The NPCM ADC is a 10-bit converter for eight channel inputs.

The NPCM ADC driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Jonathan Cameron: https://lore.kernel.org/patchwork/patch/1030483/

Changes since version 2:
 - Return error if clock have not found in the device tree ADC node.
 - Modify regulator order for avoid mixing devm and non-devm path.
 - Modify probe and remove function to have relative ordering.
 				  
Changes since version 1:
 - Add NPCM prefix.
 - Remove unnecessary parameter initialization.
 - Modify read function to avoid racy condition.
 - Reading the reference voltage when needed.
 - Modify dt-binding documentation according Jonathan comments.

Tomer Maimon (2):
  dt-binding: iio: add NPCM ADC documentation
  iio: adc: add NPCM ADC driver

 .../bindings/iio/adc/nuvoton,npcm-adc.txt          |  35 +++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/npcm_adc.c                         | 335 +++++++++++++++++++++
 4 files changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
 create mode 100644 drivers/iio/adc/npcm_adc.c

-- 
2.14.1
