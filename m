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
 by lists.ozlabs.org (Postfix) with ESMTPS id 411pbT0f0VzF34F
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 00:59:12 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w57EwNCV019460;
 Thu, 7 Jun 2018 17:58:24 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id B12C762FF3; Thu,  7 Jun 2018 17:58:23 +0300 (IDT)
From: avifishman70@gmail.com
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com,
 mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org,
 jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com,
 tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org,
 digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, Avi Fishman <AviFishman70@gmail.com>
Subject: [PATCH v4 3/3] MAINTAINERS: add subfolders for nuvoton *npcm*
Date: Thu,  7 Jun 2018 17:58:21 +0300
Message-Id: <20180607145821.322979-4-avifishman70@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180607145821.322979-1-avifishman70@gmail.com>
References: <20180607145821.322979-1-avifishman70@gmail.com>
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
X-List-Received-Date: Thu, 07 Jun 2018 14:59:17 -0000

From: Avi Fishman <AviFishman70@gmail.com>

Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ce3c5f32e5..23c450adad44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1727,7 +1727,10 @@ F:	arch/arm/mach-npcm/
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
 F:	drivers/*/*npcm*
+F:	drivers/*/*/*npcm*
 F:	Documentation/*/*npcm*
+F:	Documentation/*/*/*npcm*
+F:	Documentation/*/*/*/*npcm*
 
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
-- 
2.14.1
