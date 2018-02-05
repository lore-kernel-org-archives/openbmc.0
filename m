Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZgb30PCQzDqsk
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 19:23:24 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w1584tdS030760;
 Mon, 5 Feb 2018 10:04:55 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 001125A908; Mon,  5 Feb 2018 10:22:58 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
 mark.rutland@arm.com, tali.perry1@gmail.com, avifishman70@gmail.com,
 brendanhiggins@google.com, joel@jms.id.au
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] clk: npcm: add NPCM7xx clock driver
Date: Mon,  5 Feb 2018 10:22:53 +0200
Message-Id: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 08:23:27 -0000

This patch set adds clock support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

The clock controller generates the clocks for the Graphics Core,
Memory interface, CPU, AMBA buses and all the engine modules. 
The NPCM7xx includes four PLL modules. 
The clock source is selectable from either PLL or the external clock input. 
Several clock signals have a configurable divide from the clock source

Tomer Maimon (2):
  dt-binding: clock: document NPCM7xx clock DT bindings
  clk: npcm: add NPCM7xx clock driver

 .../bindings/clock/nuvoton,npcm7xx-clk.txt         |  84 +++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-npcm7xx.c                          | 751 +++++++++++++++++++++
 3 files changed, 836 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
 create mode 100644 drivers/clk/clk-npcm7xx.c

-- 
2.14.1
