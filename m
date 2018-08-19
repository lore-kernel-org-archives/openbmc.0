Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41tpXY05P8zF1S4
 for <openbmc@lists.ozlabs.org>; Mon, 20 Aug 2018 06:32:41 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w7JK1FL4000570;
 Sun, 19 Aug 2018 23:01:15 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 75FCB62CDB; Sun, 19 Aug 2018 23:31:14 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: tali.perry1@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com, brendanhiggins@google.com,
 robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net,
 mchehab+samsung@kernel.org, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, arnd@arndb.de, wsa@the-dreams.de,
 andriy.shevchenko@linux.intel.com, pierre-yves.mordret@st.com,
 cedric.madianga@gmail.com, baolin.wang@spreadtrum.com,
 jarkko.nikula@linux.intel.com, hdegoede@redhat.com,
 rmk+kernel@armlinux.org.uk, ard.biesheuvel@linaro.org,
 thor.thayer@linux.intel.com, geert@linux-m68k.org,
 heikki.krogerus@linux.intel.com, tglx@linutronix.de
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] i2c: npcm7xx: new driver for I2C controller
Date: Sun, 19 Aug 2018 23:30:42 +0300
Message-Id: <20180819203044.73286-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
X-Mailman-Approved-At: Mon, 20 Aug 2018 13:22:00 +1000
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
X-List-Received-Date: Sun, 19 Aug 2018 20:32:46 -0000

Nuvoton NPCM7XX I2C Controller
NPCM7xx includes 16 I2C controllers. This driver operates the controller.
This module also includes a slave mode, which will be submitted later on.

---
v4 -> v3:
	- typo on cover letter.

v3 -> v2:
	- fix dt binding: compatible name: omit "bus"

v2 -> v1:
	- run check patch in strict mode.
	- use linux crc.
	- define regs in constant offset without base.
	- remove debug prints.
	- no declarations for local functions.
	
v1: initial version

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Tali Perry (2):
  dt-bindings: i2c: npcm7xx: add binding for i2c controller
  i2c: npcm7xx: add i2c controller master mode only

 .../devicetree/bindings/i2c/i2c-npcm7xx.txt        |   29 +
 drivers/i2c/busses/Kconfig                         |   11 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c                   | 2017 ++++++++++++++++++++
 4 files changed, 2058 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

-- 
2.14.1
