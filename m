Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC6cN3m5hzDqxG
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 23:31:46 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w04CDnDo000928;
 Thu, 4 Jan 2018 14:13:49 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8A2AE5A954; Thu,  4 Jan 2018 14:31:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] i2c: npcm: add NPCM7xx I2C bus
Date: Thu,  4 Jan 2018 14:31:32 +0200
Message-Id: <1515069094-4161-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 12:31:50 -0000

This patch set adds I2C bus support for the 
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM750x includes sixteen I2C busses

The NPCM750x I2C bus driver support only master mode.

Tomer Maimon (2):
  dt-binding: i2c: document NPCM7xx I2C bus DT bindings
  i2c: npcm: add NPCM7xx I2C bus driver

 .../devicetree/bindings/i2c/i2c-npcm7xx.txt        |   23 +
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c                   | 3512 ++++++++++++++++++++
 4 files changed, 3546 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

-- 
2.14.1
