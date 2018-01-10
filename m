Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH38n4M2szF0kj
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:09:58 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0ALpvbb005579;
 Wed, 10 Jan 2018 23:51:57 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id A41D35A958; Thu, 11 Jan 2018 00:09:47 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/3] clk: npcm: add NPCM7xx clock driver
Date: Thu, 11 Jan 2018 00:09:34 +0200
Message-Id: <1515622177-5018-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 10 Jan 2018 22:10:03 -0000

This patch set adds clock support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

Tomer Maimon (3):
  dt-binding: clock: document NPCM7xx clock DT bindings
  dt-binding: clock: add NPCM7XX clock include file
  clk: npcm: add NPCM7xx clock driver

 .../bindings/clock/nuvoton,npcm750-clk.txt         |  84 +++
 drivers/clk/Makefile                               |   2 +
 drivers/clk/clk-npcm7xx-pll.c                      | 102 +++
 drivers/clk/clk-npcm7xx-pll.h                      |  27 +
 drivers/clk/clk-npcm7xx.c                          | 704 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  46 ++
 include/linux/clk/nuvoton.h                        |  13 +
 7 files changed, 978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 mode change 100644 => 100755 drivers/clk/Makefile
 create mode 100644 drivers/clk/clk-npcm7xx-pll.c
 create mode 100644 drivers/clk/clk-npcm7xx-pll.h
 create mode 100644 drivers/clk/clk-npcm7xx.c
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 create mode 100644 include/linux/clk/nuvoton.h

-- 
2.14.1
