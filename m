Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt80S7jzDrWy
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vx4i6l5y; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id i127so3748949oia.0
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vL8eKdUab2qsq/yXyGj94ztprnzLC8xLJve2iodNwr0=;
 b=vx4i6l5yuYyoWEglyyfX9+SSLkwSqTgZkQz0yz7RV50dIUsKVnm4UB/0oh7U9Y+yQ5
 tcJLCRN/b7YV3nfeFgqFl/TxYx74FfhGMwvSOi0qjWbKAL0W7S6Qa/gaiwgmWy17rVvj
 M+jTZt8r+MHKJ4dftsnc4wzbwchnHA8QdY2Vm6Pkau/kj5yE+SoEYgrPyMV3Fj24Oq/w
 UX7E2N/U+j8cLNnf+m88EkIVBIbmJ3t+tjU0/cPpbIWl/MSaeyPpwYxmH+T88AlU2w44
 eh7Ug8Yqhfu3qRi9ug/4aPdSENG0HwwWOf8ZIygwA5ZM5BJKcXYED2EDoXQ73lQ7A2DI
 Zgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vL8eKdUab2qsq/yXyGj94ztprnzLC8xLJve2iodNwr0=;
 b=jSSLjPZm8zBF/bn4prXZi7VPjzsSK4SOJ28Je1aJyMjnsL7Om1GYge7KSo/znupuxK
 XRnxKYfzLrN5t0FFds1oXA+1r6uTHVtY7mm0c0dEfdbeSvjhuNSMKJt7odbj17eozC+d
 YgA4yGpnOjhfwjUiByhcBl2urefzTK7peBKBsJ57+Pn68X62mGLpGpkIqxYbbAcv9IQL
 aCCuRAt8nsPxCV48I0/6X+EDXutJuyrHkGgQjkr9T+uYJ/zEc8jAKwyjcMdnRBhcuC+u
 cCp3eH8HliL2+ygM2p2jQi74WPqlnxO/gfajH5e+GTZYc1SsVska7DRZ4mpw8S7vsX8t
 2fgg==
X-Gm-Message-State: AA6/9Rmoxiw7jQsphSKSyGa2XMNJYHByUfi/zlj1F3AqIY9fGyF6EaUBLkeWOmZSBpq/HA==
X-Received: by 10.157.43.105 with SMTP id f38mr15309457otd.77.1475948350385;
 Sat, 08 Oct 2016 10:39:10 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:10 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v2 15/17] drivers/fsi: Revisions to existing patch set
Date: Sat,  8 Oct 2016 12:38:51 -0500
Message-Id: <1475948333-55960-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:12 -0000

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
