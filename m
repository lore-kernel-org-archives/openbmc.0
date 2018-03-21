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
 by lists.ozlabs.org (Postfix) with ESMTPS id 405v7n6H5BzF1r3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 02:37:38 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w2LFIFYd014470;
 Wed, 21 Mar 2018 17:18:16 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 686CE5A9FE; Wed, 21 Mar 2018 17:36:41 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] arm: dts: add Nuvoton NPCM750 device tree
Date: Wed, 21 Mar 2018 17:36:16 +0200
Message-Id: <1521646577-10773-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 15:37:42 -0000

The NPCM7xx are a family of BMC's that include several chips as:
NPCM750, NPCM730 etc.

All of the NPCM7xx BMC's have the common modules like Cortex-A9,
WDT, timers, etc, and there are a optional modules that can be added.

NPCM750 device tree already pushed to arm-soc.git:
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?h=for-next&id=d6bdd009c21db3f677dd1d1bbb8c20bc819074bc

After discussion with Rob Herring we have modified the structure
of the NPCM7xx device tree as follow:

nuvoton-common-npcm7xx device tree include all common modules
nuvoton-npcm750 device tree include specific npcm750 modules, 
the nuvoton-npcm750 device tree include nuvoton-common-npcm7xx device tree

In addition, the NPCM7xx device tree include the following changes:
	- watchdog module added 
	- clock module modification
	- serial module modification

I will like to replace the device tree that pushed to arm-soc.git with
this patch set.

Please review it, sorry if it cause more work after pushing 
NPCM750 device tree.

Thanks a lot,

Tomer

Tomer Maimon (1):
  arm: dts: add Nuvoton NPCM750 device tree

 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 187 ++++++++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |  39 ++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  45 +++++++
 4 files changed, 273 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi

-- 
2.14.1
