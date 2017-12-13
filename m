Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1568 seconds by postgrey-1.36 at bilbo;
 Thu, 14 Dec 2017 01:12:02 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxdtB3j23zDrcw
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 01:12:02 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBDDRtQe029631;
 Wed, 13 Dec 2017 15:27:55 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 5A8C95A918; Wed, 13 Dec 2017 15:45:31 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 3/3] MAINTAINERS: Add entry for Nuvoton NPCM architecture
Date: Wed, 13 Dec 2017 15:45:28 +0200
Message-Id: <1513172728-20998-4-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513172728-20998-1-git-send-email-tmaimon77@gmail.com>
References: <1513172728-20998-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 13 Dec 2017 14:12:03 -0000

Add maintainers and reviewers for Nuvoton NPCM architecture

Based on [v8,3/3] MAINTAINERS: Add entry for Nuvoton NPCM architecture patch:
Brendan Higgins : - https://patchwork.kernel.org/patch/10063413/

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3feffb1c1c..9b90748b729d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1598,6 +1598,19 @@ F:	drivers/pinctrl/nomadik/
 F:	drivers/i2c/busses/i2c-nomadik.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70@gmail.com>
+M:	Tomer Maimon <tmaimon77@gmail.com>
+R:	Brendan Higgins <brendanhiggins@google.com>
+R:	Rick Altherr <raltherr@google.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-npcm/
+F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	drivers/*/*npcm*
+F:	Documentation/*/*npcm*
+
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.14.1
