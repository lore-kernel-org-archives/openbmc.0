Return-Path: <Avi.Fishman@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LwdC39rwzF1mt
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jul 2018 21:30:04 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w65BRqIS013586;
 Thu, 5 Jul 2018 14:27:52 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id 59F5562E17; Thu,  5 Jul 2018 14:27:52 +0300 (IDT)
From: avifishman70@gmail.com
To: davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org, akpm@linux-foundation.org
Cc: rdunlap@infradead.org, avifishman70@gmail.com, tmaimon77@gmail.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v3 1/1] MAINTAINERS: add subfolders for nuvoton *npcm*
Date: Thu,  5 Jul 2018 14:27:50 +0300
Message-Id: <20180705112750.197458-2-avifishman70@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180705112750.197458-1-avifishman70@gmail.com>
References: <20180705112750.197458-1-avifishman70@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 11:30:08 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Add several subfolders to look for *npcm* files under
ARM/NUVOTON NPCM ARCHITECTURE

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ce3c5f32e5..dbe3ce376dfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1727,7 +1727,9 @@ F:	arch/arm/mach-npcm/
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
 F:	drivers/*/*npcm*
-F:	Documentation/*/*npcm*
+F:	drivers/*/*/*npcm*
+F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/*/*/*npcm*
 
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
-- 
2.14.1
