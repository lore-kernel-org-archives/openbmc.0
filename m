Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH38n4HL0zF0kZ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:09:58 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w0ALpwCf005585;
 Wed, 10 Jan 2018 23:51:58 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id AB6155A958; Thu, 11 Jan 2018 00:09:48 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1 2/3] dt-binding: clock: add NPCM7XX clock
 include file
Date: Thu, 11 Jan 2018 00:09:36 +0200
Message-Id: <1515622177-5018-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1515622177-5018-1-git-send-email-tmaimon77@gmail.com>
References: <1515622177-5018-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 10 Jan 2018 22:10:02 -0000

add NPCM7XX clock include file for DTS use.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
new file mode 100644
index 000000000000..38649ad341ba
--- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
@@ -0,0 +1,46 @@
+/*
+ * Nuvoton NPCM7xx Clock Generator
+ * All the clocks are initialized by the bootloader, so this driver allow only
+ * reading of current settings directly from the hardware.
+ *
+ * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
+ *
+ * Released under the GPLv2 only.
+ * SPDX-License-Identifier: GPL-2.0
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_NPCM7XX_H
+#define __DT_BINDINGS_CLOCK_NPCM7XX_H
+
+
+#define NPCM7XX_CLK_CPU 0
+#define NPCM7XX_CLK_GFX_PIXEL 1
+#define NPCM7XX_CLK_MC 2
+#define NPCM7XX_CLK_ADC 3
+#define NPCM7XX_CLK_AHB 4
+#define NPCM7XX_CLK_TIMER 5
+#define NPCM7XX_CLK_UART 6
+#define NPCM7XX_CLK_MMC  7
+#define NPCM7XX_CLK_SPI3 8
+#define NPCM7XX_CLK_PCI  9
+#define NPCM7XX_CLK_AXI 10
+#define NPCM7XX_CLK_APB4 11
+#define NPCM7XX_CLK_APB3 12
+#define NPCM7XX_CLK_APB2 13
+#define NPCM7XX_CLK_APB1 14
+#define NPCM7XX_CLK_APB5 15
+#define NPCM7XX_CLK_CLKOUT 16
+#define NPCM7XX_CLK_GFX  17
+#define NPCM7XX_CLK_SU   18
+#define NPCM7XX_CLK_SU48 19
+#define NPCM7XX_CLK_SDHC 20
+#define NPCM7XX_CLK_SPI0 21
+#define NPCM7XX_CLK_SPIX 22
+
+#define NPCM7XX_NUM_CLOCKS	 (NPCM7XX_CLK_SPIX+1)
+
+
+
+#endif
-- 
2.14.1
