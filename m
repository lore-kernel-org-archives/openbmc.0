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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40JwCK5ZHczDrpW
 for <openbmc@lists.ozlabs.org>; Mon,  9 Apr 2018 00:03:55 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w38DiiRO003890;
 Sun, 8 Apr 2018 16:44:47 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id D3C645AA63; Sun,  8 Apr 2018 17:03:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: arm@kernel.org, linux@armlinux.org.uk, avifishman70@gmail.com,
 brendanhiggins@google.com, venture@google.com, yuenn@google.com,
 joel@jms.id.au
Cc: arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] arm: npcm: enable L2 cache in NPCM7xx architecture
Date: Sun,  8 Apr 2018 17:03:16 +0300
Message-Id: <1523196197-2072-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 08 Apr 2018 14:03:58 -0000

This patch Enable ARM L2 cache module in Nuvoton NPCM7xx BMC
by adding L2 cache parameters into NPCM7xx DT machine start structure.

At patch V7 arm: npcm: add basic support for Nuvoton BMCs we got comments
regarding the flags use in L2 cache module.
- https://www.spinics.net/lists/arm-kernel/msg613212.html

After checking again the L2 cache use in the NPCM7xx,
the only L2 cache flag we need to set is L2C_AUX_CTRL_SHARED_OVERRIDE 
and it is done in the device tree:
https://patchwork.kernel.org/patch/10063497/

L2 cache flag mask allowed all the flag option.

Tomer Maimon (1):
  arm: npcm: enable L2 cache in NPCM7xx architecture

 arch/arm/mach-npcm/npcm7xx.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.14.1
