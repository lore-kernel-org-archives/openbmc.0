Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 430 seconds by postgrey-1.36 at bilbo;
 Tue, 06 Nov 2018 03:19:44 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pdDc39gXzF1sC
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 03:19:43 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wA5Fftih023227;
 Mon, 5 Nov 2018 17:41:55 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 2B6F6630C9; Mon,  5 Nov 2018 18:11:54 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, yuenn@google.com,
 venture@google.com, benjaminfair@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: linux-watchdog@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] watchdog: npcm: Modify npcm watchdog kconfig arch parameter
Date: Mon,  5 Nov 2018 18:11:52 +0200
Message-Id: <20181105161152.205524-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Mon, 05 Nov 2018 16:19:45 -0000

Modify Nuvoton watchdog Kconfig default supported architecture
name to ARCH_NPCM7XX because ARCH_NPCM750 architecture name
is not supported.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 2d64333f4782..746759ec8960 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -538,7 +538,7 @@ config COH901327_WATCHDOG
 config NPCM7XX_WATCHDOG
 	bool "Nuvoton NPCM750 watchdog"
 	depends on ARCH_NPCM || COMPILE_TEST
-	default y if ARCH_NPCM750
+	default y if ARCH_NPCM7XX
 	select WATCHDOG_CORE
 	help
 	  Say Y here to include Watchdog timer support for the
-- 
2.14.1
