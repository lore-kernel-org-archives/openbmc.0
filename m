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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vgqr0m1szDqMS
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:21:59 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x2SMha3K032165;
 Fri, 29 Mar 2019 00:43:36 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 34E7C63000; Fri, 29 Mar 2019 01:13:33 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joe@perches.com, avifishman70@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, brendanhiggins@google.com,
 tali.perry1@gmail.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
Date: Fri, 29 Mar 2019 01:12:22 +0200
Message-Id: <20190328231317.330699-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Thu, 28 Mar 2019 23:22:01 -0000

In the process of upstreaming architecture support for ARM/NUVOTON NPCM
include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
of this file.

Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM architecture")
Reported-by: Joe Perches <joe@xxxxxxxxxxx>
Signed-off-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f29..8b305d2f2a8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1900,7 +1900,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm/mach-npcm/
 F:	arch/arm/boot/dts/nuvoton-npcm*
-F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	drivers/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*/*npcm*
-- 
2.14.1
