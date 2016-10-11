Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4s0TfLzDsrV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OoQt8kA3; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id d132so2259837oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=OoQt8kA3UHMoZ0BBNJMXbnzLflkHnhL6TijckoJDHlgVkqlsvqL4QDXQdcm3tS9/je
 7Dt1OPTQmjnjZGsTf7HWC+Mrk7qja4xU0yslGj+TIz0sJ3MHhGYAbNE7wt1MdMYOSXWn
 NHD8eKfGj+52rs8N/7FAu3veYkh/eCh/Mqh6pgOEZsu5/Ml3kB+jAIb9Bvs+sz62HZNJ
 biYDHNbk0XoUl9N7MSm322xt8w6JiW/pLvEwC4QUeduQ861h1s0ffBZjUhZj9XFR6wbc
 GHirQiV4vgR6cFO7BH+0U+0+ZC2EmbRiBRtZnJhXVhKc0FvPnJ29u8oqyVDGvMbP4Gz1
 b0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=iK0yRMJ+YMwWn9YvnW0kt7FbOuJVu8DqzfkbQDigtwWhCnqMxiOuSBVtqnxPLmjdd5
 nhtP/UCs+SwPH5isrE9p0BcHq9pBXoyFjOO70EGNm5RaxYZteBpP0VKvyDpwambxcsyt
 t46+k1T/WXPdhqttrceraE3V3ETxjYCjXWQctajRozjl8kNbb54IgR2J9RxCs9xqsvCn
 nB+qEWL9ct7FER3YjIfxyyVaN3v05CRPXS7XHVXK7ZDlCvICNVeR+lussabgLmCkTYso
 xLF6HziUoZdXFr25fjezfzM/vm7Zb/QocByfT9IkBofgDatZBqJlHbeuWJya4twstXG1
 zWxw==
X-Gm-Message-State: AA6/9RlVpeDAlXkUVPV5L/n/mCsFhRRGlvhZiYGFzQUDcxemNtg6PkCr2mromujPA/ibLQ==
X-Received: by 10.202.57.85 with SMTP id g82mr4428476oia.166.1476222011372;
 Tue, 11 Oct 2016 14:40:11 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:11 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 04/18] fsi: Add fsi master definition
Date: Tue, 11 Oct 2016 16:39:49 -0500
Message-Id: <1476222003-99697-5-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:13 -0000

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
