Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrk3dKTzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QQRIpqHL; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 62so5826479oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=QQRIpqHLLdLC/QhwoufCNFug1HD3GG/m+ceEtRuRHjTgUTdBcK2/j+en55WtaOUK+D
 fC0tZLKMLnLP16O7gABSxKxJ9MfcZOufbF4xBJ9dC79mM4fPxC6BIxE1q1Tnc+Tv8O63
 ICeewtMr8uKSiBvjLeZMWTul6uuD6AHCkyAuJhCJ26fosmLP1oQxZ2rEXP7lcc9meoI6
 bb0ktxjudtcI4w9n1qB1Cf2eFx1qMUmOOIpVgFk+k8q7Nf57CSLxwngg5/gGdqMOmJ87
 kyw3wDZlmPmQr3kWfH7uSnyJ0vSUc6E5hQcWop76KCC2s6EoS+GZRBRNCpBg7+U7x/QG
 l4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=gov5olZfYDf4A4URhFfCj1tYFaXqZMZMC5kYIFCwRpOahGXw1L4kpEOE4DDb9NbD2J
 kmnPaURhKGa1JKmpQd80Q0JAAy7uBcI6f/e7veMCUaSi7ac6SAa6myIRualNC7QX3NNh
 +uT85MWRZXCKUGg8oNJNKNAVc+n+OpUcYfUgjWC1qS+HFddylaOFdkwTwBwTuABH6qeK
 8MyfahRn4fQR9HzWE3EW/Byd4F7aQ/76lflUPiNexwyUI1/2xjkTy1uZlQQAZt1XwkU6
 QADnIYdunW0wYABLj6t9jjZXw1nVBzK+qlzv05wOSxZXfsXpoQbMnM29NH4fZdblNu+m
 ASCA==
X-Gm-Message-State: ABUngvcwbabtwh/sAFdHxdhH472WwA4sFVv/04l6MFuhYA6Dblh1unzFRn1pSAeV9E4/dg==
X-Received: by 10.202.80.202 with SMTP id e193mr24517604oib.65.1477865412781; 
 Sun, 30 Oct 2016 15:10:12 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.11
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:12 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 04/18] fsi: Add fsi master definition
Date: Sun, 30 Oct 2016 17:09:25 -0500
Message-Id: <1477865379-11566-24-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:15 -0000

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
