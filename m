Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC40q5328zDqvZ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 21:34:18 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w04AGKpN031380;
 Thu, 4 Jan 2018 12:16:20 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id E23745A950; Thu,  4 Jan 2018 12:34:07 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] net: npcm: add NPCM7xx EMC
Date: Thu,  4 Jan 2018 12:34:04 +0200
Message-Id: <1515062046-11944-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 10:34:20 -0000

This patch set adds Ethernet MAC controller support for the 
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

The NPCM750x contain two Ethernet MAC Controllers (10/100)
for WAN/LAN applications

Tomer Maimon (2):
  dt-binding: net: document NPCM7xx EMC DT bindings
  net: npcm: add NPCM7xx Ethernet MAC controller

 .../bindings/net/nuvoton,npcm7xx-emc.txt           |   24 +
 drivers/net/ethernet/nuvoton/Kconfig               |   23 +-
 drivers/net/ethernet/nuvoton/Makefile              |    2 +
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c         | 2248 ++++++++++++++++++++
 4 files changed, 2296 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
 create mode 100644 drivers/net/ethernet/nuvoton/npcm7xx_emc.c

-- 
2.14.1
