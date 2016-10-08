Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt00WsfzDrWR
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xUfRFqpZ; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id h186so5451316oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=xUfRFqpZykk0RbE8dJBgK7Mvs5tK35hebjLG8q0SSBn4kmwPwiGVEqoXTkRgtBrpN9
 Y8gSQQVhwZyeOOsATLiJDyR0JczEBesmcbac16BvoIibAnnK4oP8ElAKCZG50HM36ZTN
 tjg4eJ6IHyoASDO880FZtk/TdgXJCImP5+7ng9AC4hVSxgPN+tU2A99Kyb1k7xW1uuCl
 QU7Tz8ah2XEP8CWgTdVx8++FEAJ7A9FLqvFqABCSneftgzQXaPpJLkhQ3xTqQoV0U41H
 OoyU/tgST/DyF0uRftnSWuFJZn9B80d8tPMCvgVvS+FcpLdcb9deitmGeEFNSDpizRNK
 ENvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3cqj/cVNWxmeJL8/wqWH8cDDUvvEFtiilAgKeBk7e2w=;
 b=SZpUXf75K9hyR8moVC+lCCPTDn26pHpHCGh8w7j+t53X839mBIOH9eH8rhYf/Iqr4I
 djFIHFWRe8OiWVawpeKACWk9aQeLlfKaF1U1JKaNHFAnzDeGorUVAQxlkEJ8UI6xHENj
 nW0oZfqVYMETYWh7uvxYNQFscwsX85k3lMqZ94vzvW7psbELBp5wxbtEB80BE2LbcLhc
 XoYLc5pLj4QOVICt3OCobiEh7xBMJctdCtTVep9mpGGPDdxOlANWndHdC0FbXhRHq2cy
 lqaEnimeVL9ikoGu9frqlZF/baP879Ec8f1xuGps89BgTpf/5+kaDM6n+eF/1SrfAqEV
 Oedw==
X-Gm-Message-State: AA6/9RmfF7d+fCsBQFsjl/EuEWc+QFQ6cMUVV3ve+BWI7INkPWYssDqaK1CluCtmw35Omg==
X-Received: by 10.157.1.112 with SMTP id 103mr14216527otu.26.1475948342321;
 Sat, 08 Oct 2016 10:39:02 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:02 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 04/17] fsi: Add fsi master definition
Date: Sat,  8 Oct 2016 12:38:40 -0500
Message-Id: <1475948333-55960-5-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:04 -0000

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
