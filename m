Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFqqV5y0rzF0bD
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 09:35:47 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w08MHkiS018896;
 Tue, 9 Jan 2018 00:17:46 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8EFC95A915; Tue,  9 Jan 2018 00:35:35 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1] include: clock: add NPCM7XX clock include
 file
Date: Tue,  9 Jan 2018 00:35:25 +0200
Message-Id: <1515450925-5202-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 08 Jan 2018 22:35:51 -0000

add NPCM7XX clock include file to building DTS

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h

diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
new file mode 100644
index 000000000000..c69d3bbf7e42
--- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright (C) 2016 Nuvoton Technologies,  tali.perry@nuvoton.com
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ */
+
+#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
+#define _DT_BINDINGS_CLK_NPCM7XX_H
+
+#define NPCM7XX_CLK_PLL0	0
+#define NPCM7XX_CLK_PLL1	1
+#define NPCM7XX_CLK_PLL2	2
+#define NPCM7XX_CLK_GFX		3
+#define NPCM7XX_CLK_APB1	4
+#define NPCM7XX_CLK_APB2	5
+#define NPCM7XX_CLK_APB3	6
+#define NPCM7XX_CLK_APB4	7
+#define NPCM7XX_CLK_APB5	8
+#define NPCM7XX_CLK_MC		9
+#define NPCM7XX_CLK_CPU		10
+#define NPCM7XX_CLK_SPI0	11
+#define NPCM7XX_CLK_SPI3	12
+#define NPCM7XX_CLK_SPIX	13
+#define NPCM7XX_CLK_UART_CORE	14
+#define NPCM7XX_CLK_TIMER	15
+#define NPCM7XX_CLK_HOST_UART	16
+#define NPCM7XX_CLK_MMC		17
+#define NPCM7XX_CLK_SDHC	18
+#define NPCM7XX_CLK_ADC		19
+#define NPCM7XX_CLK_GFX_MEM	20
+#define NPCM7XX_CLK_USB_BRIDGE	21
+#define NPCM7XX_CLK_AXI		22
+#define NPCM7XX_CLK_AHB		23
+#define NPCM7XX_CLK_EMC		24
+#define NPCM7XX_CLK_GMAC	25
+
+#endif
-- 
2.14.1
