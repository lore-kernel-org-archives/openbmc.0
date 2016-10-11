Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str501kyrzDsss
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nAU7FcyT; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id e12so2264256oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vL8eKdUab2qsq/yXyGj94ztprnzLC8xLJve2iodNwr0=;
 b=nAU7FcyTBiUMmaUSFV3Eg811uWIIqInSSk6ZaywOsMCBQAR304NgqPdAQ3i6IBkF64
 utArPWwmCWxGjugDzcXJl0XQeqk5W+LaGjebvZguuhdusK/7WgrhywogBmrUJ2/hwCrG
 bCkGKyNU+AwOLVFK66TLiI57ADgicVrasuHC7vqrBlaZMYTUsqWZOLE/Z+pVwjoKcpZJ
 1KT6U4xtOedUUeY410gTiyLcmJFXDo0HIIVsE+nmxmy0VP/PH4YhmSNpraMpaoJ3iYtE
 6asczN8DuoYLTdrNCA2v2E9v0AioR/XmGvu1+fCOh9SaoVi9sTOKBtaazRkPa+kpZM6z
 l2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vL8eKdUab2qsq/yXyGj94ztprnzLC8xLJve2iodNwr0=;
 b=EyV7q8fcyh0m8YV9UN7aIncFDPBbuSAPXmOj1GKZOtQps7d1CAzPN07MW+ty8IX0Si
 NEv1UNpRoGvTcJ7It4wrLut4vLyoxWl0XnvoXRZ7FqLsCwAyOMk7pjzy9bO0JD15IOQw
 A22ubpOAxHXpm6dyk6TGWl2yAMlwrFFgKVB3hYjpZM6XjV4BUSISRpHpXxBQPG9xLLIH
 t01qTjYGNhlWiV+h4J1ti7ylD+3KMgv2s3oxZA08TbaBhSQMatJdLoGHFjoj+f1fPWu3
 OpTiE5lg+Pp2IvW9CVBly9hE11CLrjNYCCpl6VFGP68+cRvhafv6GP1TnDUGo0Hsc4tR
 fg8g==
X-Gm-Message-State: AA6/9Rl72HPEVL+eIqvu2ckxZCUvTFmHLsYPgIplnCbAeDqld0BUc5thGCARPq0FUgC2+Q==
X-Received: by 10.157.18.178 with SMTP id g47mr2919095otg.230.1476222018520;
 Tue, 11 Oct 2016 14:40:18 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:18 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 15/18] drivers/fsi: Revisions to existing patch set
Date: Tue, 11 Oct 2016 16:40:00 -0500
Message-Id: <1476222003-99697-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:20 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Changes recommended to the patch set so far as supplied by
Jeremy Kerr.   Moved some CFAM specific details to a new cfam header

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

Changes in V2:

- Removed the renaming of slave to cfam
---
 drivers/fsi/fsi-cfam.h | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-core.c | 22 ++++--------------
 2 files changed, 68 insertions(+), 17 deletions(-)
 create mode 100644 drivers/fsi/fsi-cfam.h

diff --git a/drivers/fsi/fsi-cfam.h b/drivers/fsi/fsi-cfam.h
new file mode 100644
index 0000000..ddb03cd
--- /dev/null
+++ b/drivers/fsi/fsi-cfam.h
@@ -0,0 +1,63 @@
+/*
+ * FSI CFAM definitions
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef DRIVERS_FSI_CFAM_H
+#define DRIVERS_FSI_CFAM_H
+
+#include <linux/device.h>
+
+#include "fsi-master.h"
+
+#define FSI_SLAVE_ENG_ID	2
+
+#define FSI_MAX_CFAMS_PER_LINK	4
+#define FSI_CFAM_SIZE		(FSI_LINK_SIZE / FSI_MAX_CFAMS_PER_LINK)
+#define FSI_PEEK_BASE		0x410
+#define FSI_SLAVE_BASE		0x800
+
+/* Config space decoding */
+#define FSI_CFG_NEXT_MASK	0x80000000
+#define FSI_CFG_SLOT_MASK	0x00ff0000
+#define FSI_CFG_SLOT_SHIFT	16
+#define FSI_CFG_VERS_MASK	0x0000f000
+#define FSI_CFG_VERS_SHIFT	12
+#define FSI_CFG_TYPE_MASK	0x00000ff0
+#define FSI_CFG_TYPE_SHIFT	4
+
+/*
+ * Return number of slots in the configuration word
+ */
+static inline uint8_t fsi_cfg_slot(uint32_t x)
+{
+	return (x & FSI_CFG_SLOT_MASK) >> FSI_CFG_SLOT_SHIFT;
+}
+
+/*
+ * Return version in the configuration word
+ */
+static inline uint8_t fsi_cfg_version(uint32_t x)
+{
+	return (x & FSI_CFG_VERS_MASK) >> FSI_CFG_VERS_SHIFT;
+}
+
+/*
+ * Return type field in the configuration word
+ */
+static inline uint8_t fsi_cfg_type(uint32_t x)
+{
+	return (x & FSI_CFG_TYPE_MASK) >> FSI_CFG_TYPE_SHIFT;
+}
+
+#endif /* DRIVERS_FSI_CFAM_H */
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a3a860a..0da8cf0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,19 +21,10 @@
 #include <linux/slab.h>
 
 #include "fsi-master.h"
+#include "fsi-cfam.h"
 
 #define FSI_N_SLAVES	4
 
-#define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
-#define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
-#define FSI_SLAVE_CONF_SLOTS_SHIFT	16
-#define FSI_SLAVE_CONF_VERSION_MASK	0x0000f000
-#define FSI_SLAVE_CONF_VERSION_SHIFT	12
-#define FSI_SLAVE_CONF_TYPE_MASK	0x00000ff0
-#define FSI_SLAVE_CONF_TYPE_SHIFT	4
-
-#define FSI_PEEK_BASE			0x410
-
 static const int engine_page_size = 0x400;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
@@ -179,12 +170,9 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			return -1;
 		}
 
-		slots = (conf & FSI_SLAVE_CONF_SLOTS_MASK)
-			>> FSI_SLAVE_CONF_SLOTS_SHIFT;
-		version = (conf & FSI_SLAVE_CONF_VERSION_MASK)
-			>> FSI_SLAVE_CONF_VERSION_SHIFT;
-		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
-			>> FSI_SLAVE_CONF_TYPE_SHIFT;
+		slots = fsi_cfg_slot(conf);
+		version = fsi_cfg_version(conf);
+		type = fsi_cfg_type(conf);
 
 		/*
 		 * Unused address areas are marked by a zero type value; this
@@ -222,7 +210,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 
 		engine_addr += slots * engine_page_size;
 
-		if (!(conf & FSI_SLAVE_CONF_NEXT_MASK))
+		if (!(conf & FSI_CFG_NEXT_MASK))
 			break;
 	}
 
-- 
1.8.2.2
