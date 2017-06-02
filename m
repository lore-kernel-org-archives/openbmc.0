Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wfJXb2FXRzDqLt
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 19:18:06 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 2 Jun 2017 12:18:03 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v529I2uI002637;
 Fri, 2 Jun 2017 12:18:02 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Add ast-g5 ncsi 2nd boot
 config.
Date: Fri,  2 Jun 2017 12:18:00 +0300
Message-Id: <20170602091800.189904-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Jun 2017 09:18:08 -0000

Add ncsi 2nd boot aspeed g5 configuration header.
It based on ast-g5-ncsi.h extended with defines for memtest.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 include/configs/ast-g5-ncsi-2boot.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 include/configs/ast-g5-ncsi-2boot.h

diff --git a/include/configs/ast-g5-ncsi-2boot.h b/include/configs/ast-g5-ncsi-2boot.h
new file mode 100644
index 0000000000..8d4c960451
--- /dev/null
+++ b/include/configs/ast-g5-ncsi-2boot.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (C) 2017 Mellanox Technologies Ltd.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ */
+
+#ifndef __AST_G5_NCSI_2BOOT_CONFIG_H
+#define __AST_G5_NCSI_2BOOT_CONFIG_H
+
+#define CONFIG_ARCH_AST2500
+#define CONFIG_SYS_LOAD_ADDR		0x83000000
+
+#include <configs/ast-common.h>
+
+/* arm1176/start.S */
+#define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
+
+/* Ethernet */
+#define CONFIG_LIB_RAND
+#define CONFIG_ASPEEDNIC
+
+/* platform.S settings */
+#define	CONFIG_DRAM_ECC_SIZE		0x10000000
+
+#define CONFIG_SYS_MEMTEST_SIZE	128 * 1024 * 1024 /* 128MB */
+#define CONFIG_SYS_MEMTEST_START	CONFIG_SYS_SDRAM_BASE
+#define CONFIG_SYS_MEMTEST_END	(CONFIG_SYS_MEMTEST_START + CONFIG_SYS_MEMTEST_SIZE)
+
+#endif	/* __AST_G5_NCSI_2BOOT_CONFIG_H */
-- 
2.11.0
