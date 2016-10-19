Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhg6X5YzDt2h
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=h5yu60+z; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 139so3149791itm.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=h5yu60+zZj6cwns9evzMpgKTNnmL1l++tNet77m+WwTibrtbiV29TGeNNxksTwgbNm
 Y7rikNUcF3AtsJGNJrouFOl1MpDuk8+uKA6Ed9q7WHQPEf4XXebCCiDAtMGxIE8POwi1
 xx44+BZRi4vDFjhgwwUdyQwovIzo83nA6X5yDvyh/bvpy9k0nemJFQcSzQwyvYKGRvV9
 xKXlg/dM5EYUKXeUhtq6oqkw89V+qacmPDCj9ZhDqMd/R7N1js37I5tDBJuwq9NcYptu
 /k6PS2nfVLKJ232Qydbeptjk/TpeyVJgBoux1xurinvtmVyUb60NLd9suJ3S3JaVgZgI
 MbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=TSmDZ0Hv2Y5Eoh3rtjL3SGzdGNdx7SYA0fPbbdAObsSCtUabyXFMIpXAfbsjl1JIkn
 kAJ2x2p6LlhNGA6++wT06Q76vaLF2+ROn7i1sdJiriRb+CwBTgZndpAFDZRtoOrGRglV
 swh3cZQxNQ89pwMQsyKpBXDOWY1RYDXYCnDFVolDjuoAjppUQ5FSTF0ZMMnv7gi7c5vq
 i77Q6KDuS54S+qsqGDhSJtf6CBG6QlkdTVUrUOl8o3oOO7bV8CvHZagV4sBY47duYbZC
 DyaDGORnQc1VwjOAzV1j9KQUqCntMIDqgEe75OXir5q7vo/vbzbfCO32e3SnebBCbd4z
 VBhw==
X-Gm-Message-State: AA6/9RngHtSeKu9jwL3xNCs6uYR34f6VHu72dWy3neoZvRJ4MRTRWJQa45TjGAB35GiUoA==
X-Received: by 10.157.52.132 with SMTP id g4mr4911068otc.245.1476918594185;
 Wed, 19 Oct 2016 16:09:54 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.53
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:53 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 04/18] fsi: Add fsi master definition
Date: Wed, 19 Oct 2016 18:09:32 -0500
Message-Id: <1476918586-13475-5-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:56 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c   | 20 ++++++++++++++++++++
 drivers/fsi/fsi-master.h | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 drivers/fsi/fsi-master.h

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d55bd5..ce9428d 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -17,6 +17,26 @@
 #include <linux/fsi.h>
 #include <linux/module.h>
 
+#include "fsi-master.h"
+
+static atomic_t master_idx = ATOMIC_INIT(-1);
+
+/* FSI master support */
+
+int fsi_master_register(struct fsi_master *master)
+{
+	master->idx = atomic_inc_return(&master_idx);
+	get_device(master->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_master_register);
+
+void fsi_master_unregister(struct fsi_master *master)
+{
+	put_device(master->dev);
+}
+EXPORT_SYMBOL_GPL(fsi_master_unregister);
+
 /* FSI core & Linux bus type definitions */
 
 static int fsi_bus_match(struct device *dev, struct device_driver *drv)
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
new file mode 100644
index 0000000..e75a810
--- /dev/null
+++ b/drivers/fsi/fsi-master.h
@@ -0,0 +1,37 @@
+/*
+ * FSI master definitions. These comprise the core <--> master interface,
+ * to allow the core to interact with the (hardware-specific) masters.
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
+#ifndef DRIVERS_FSI_MASTER_H
+#define DRIVERS_FSI_MASTER_H
+
+#include <linux/device.h>
+
+struct fsi_master {
+	struct device	*dev;
+	int		idx;
+	int		n_links;
+	int		(*read)(struct fsi_master *, int link,
+				uint8_t slave, uint32_t addr,
+				void *val, size_t size);
+	int		(*write)(struct fsi_master *, int link,
+				uint8_t slave, uint32_t addr,
+				const void *val, size_t size);
+};
+
+extern int fsi_master_register(struct fsi_master *master);
+extern void fsi_master_unregister(struct fsi_master *master);
+
+#endif /* DRIVERS_FSI_MASTER_H */
-- 
1.8.2.2
