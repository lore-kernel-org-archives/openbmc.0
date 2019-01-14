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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dYfR6NLQzDqW4
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 00:07:25 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0ECbFTR018973;
 Mon, 14 Jan 2019 14:37:15 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 9F87B62DA6; Mon, 14 Jan 2019 15:07:13 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 01/15] clk: nuvoton: add npcm750 clock function
 prototype initialization
Date: Mon, 14 Jan 2019 15:06:56 +0200
Message-Id: <20190114130710.427600-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190114130710.427600-1-tmaimon77@gmail.com>
References: <20190114130710.427600-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 13:07:29 -0000

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 include/linux/clk/nuvoton.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 include/linux/clk/nuvoton.h

diff --git a/include/linux/clk/nuvoton.h b/include/linux/clk/nuvoton.h
new file mode 100644
index 000000000000..9a474d691786
--- /dev/null
+++ b/include/linux/clk/nuvoton.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2014-2019 Nuvoton Technology corporation. */
+
+#ifndef __LINUX_CLK_NUVOTON_H_
+#define __LINUX_CLK_NUVOTON_H_
+
+void nuvoton_npcm750_clock_init(void);
+
+#endif
-- 
2.14.1
