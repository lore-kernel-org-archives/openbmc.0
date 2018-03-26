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
 by lists.ozlabs.org (Postfix) with ESMTPS id 408qrB4tRrzF1pP
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 21:19:22 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w2QA0CRh008313;
 Mon, 26 Mar 2018 13:00:12 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 20088)
 id ED87E5A987; Mon, 26 Mar 2018 13:18:40 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: sboyd@kernel.org, brendanhiggins@google.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com,
 tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v12 0/2] clk: npcm750: Add NPCM7XX Clock driver and binding
Date: Mon, 26 Mar 2018 13:16:24 +0300
Message-Id: <1522059386-20601-1-git-send-email-tali.perry1@gmail.com>
X-Mailer: git-send-email 1.8.3.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 10:19:23 -0000


Nuvoton NPCM7XX Clock Controller

Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
generates and supplies clocks to all modules within the BMC.


11 ==> 12
Update review comments:
- remove all pr_debug
- eliminate static declerations of parameters.
- change lock name.
- remove double definition for compatible string.

10 ==> 11
update documentation. "eth" replaced with "ethernet" in use case eaxample.

2 ==> 10
update documentation. add external clocks as inputs to clk driver.
fix SPDX comment.

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

Tali Perry (2):
  dt-binding: clk: npcm750: add binding
  clk: npcm7xx: add clock controller

 .../bindings/clock/nuvoton,npcm750-clk.txt         | 100 +++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-npcm7xx.c                          | 722 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  44 ++
 4 files changed, 867 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644 drivers/clk/clk-npcm7xx.c
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

-- 
2.14.1
