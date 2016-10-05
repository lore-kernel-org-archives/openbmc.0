Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M230f4zDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jKMCHLYt; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id d132so3133067oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=jKMCHLYtV/mgMONz34mznYxsLI9Qwm8tBFw+T6mTNLabXIn0MR5780wJpzcnpplEzq
 WOK4RgPBm5a2dbCH738MemWuEIL30YlFMlzPQuwg17xJvbPaCiipqTS3eFKtFQAo3z5a
 MVUeNISMAph6Z3QOeNpVbMJDfRrzfUVCx2/jHjOTG+SE76GUYtKealwBqxJax2/xGRBZ
 qotarbW/ImxWWMyEQFcRN7kz2sBLhQLtE/YJV9GpkLqon2LJvBdTSOQAK7yYG5iGb6ax
 2WimeweNeAoS6ZblCua8Ya11YSM+zvs49mQCWNveYO8XJXXg5FAEDXygBjs/ZJsk2B41
 7ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=Yjo7k2fTHKR1yfWyW2lczDRTzkvqAy68M8NuhswCuBWFAn7LeZ4D3R1u8Y44ueUKfe
 JCT3TtVMxNtukaZX2YtnTXJQNGYQQVtqsWOl7Vbrnn730LqpUC3ikN5q0gxoH9gZ8KFk
 gwLvRXvgO55v0gZNsYCBJk3RGaks+b/gHSSbrrQlIIBrgcOpxUcYt/dF9EIHmN8oPzMZ
 WRm0OHNtXCIP8rm6BXQosnt8mpxlO2Y/RshSTYjpvFFcGnRXot38Zj+11TGyeUtTJNae
 D1R7rXIRr5eO1OVBtwJIeGNYpNLOHGfuHc3rprKIhU5BmxbwVrXWsFB1F+9HDZBMpAXx
 2yyg==
X-Gm-Message-State: AA6/9RnEhjA/AJx7sM5/H2ZVnOPuHFwmqXrlp7pNOVtjgfBa6c2j/NiSXGOLUKcEyA9vKQ==
X-Received: by 10.157.32.101 with SMTP id n92mr4216246ota.75.1475700876590;
 Wed, 05 Oct 2016 13:54:36 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.36
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:36 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 04/15] fsi: Add fsi master definition
Date: Wed,  5 Oct 2016 15:54:17 -0500
Message-Id: <1475700868-75737-5-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:38 -0000

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
