Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC3462BTQzDqnt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 20:52:00 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w049Y2DF030696;
 Thu, 4 Jan 2018 11:34:02 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id BCE785A954; Thu,  4 Jan 2018 11:51:48 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 0/2] hw_random: npcm: add NPCM7xx rng
Date: Thu,  4 Jan 2018 11:51:44 +0200
Message-Id: <1515059506-17818-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 09:52:07 -0000

This patch set adds random number generator support for the 
Nuvoton NPCM7xx Baseboard Management Controller (BMC).

Tomer Maimon (2):
  dt-binding: rng: document NPCM7xx rng DT bindings
  hw_random: npcm: add NPCM7xx random number generator

 .../bindings/rng/nuvoton,npcm7xx-rng.txt           |  16 ++
 drivers/char/hw_random/Kconfig                     |  13 ++
 drivers/char/hw_random/Makefile                    |   1 +
 drivers/char/hw_random/npcm7xx-rng.c               | 203 +++++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm7xx-rng.txt
 create mode 100644 drivers/char/hw_random/npcm7xx-rng.c

-- 
2.14.1
