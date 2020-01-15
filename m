Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 2610 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Jan 2020 04:07:09 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yYf53xR1zDqPg
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:07:08 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 00FGN3te021572;
 Wed, 15 Jan 2020 18:23:03 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id DB60D60328; Wed, 15 Jan 2020 18:23:02 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/4] spi: npcm-pspi: improve preformance modify reset and
 fix issue
Date: Wed, 15 Jan 2020 18:22:57 +0200
Message-Id: <20200115162301.235926-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 15 Jan 2020 17:07:10 -0000

This patch set modify Perphiral SPI NPCM driver as follow:
	
	- Improve transfer performance.
	- Fix 16 bit send and receive support.
	- Modify dt-binding documentation to support reset controller driver.
	- Modify reset support to use reset controller driver
	  NPCM reset driver: https://lkml.org/lkml/2019/11/7/429.

Tomer Maimon (4):
  spi: npcm-pspi: fix 16 bit send and receive support
  spi: npcm-pspi: improve spi transfer performance
  dt-binding: spi: add NPCM PSPI reset binding
  spi: npcm-pspi: modify reset support

 .../bindings/spi/nuvoton,npcm-pspi.txt        | 12 +---
 drivers/spi/spi-npcm-pspi.c                   | 57 +++++++++----------
 2 files changed, 29 insertions(+), 40 deletions(-)

-- 
2.22.0
