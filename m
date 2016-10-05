Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M01cHWzDrPK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Rx5I56qf; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r132so13010873oig.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K3fTJrdyzT7h+kStPLVUlg/ayQvOw8y3pGZvpxmcrrM=;
 b=Rx5I56qfY2LjEV5SgCiip9qs1Xb0Ui5YpM9nmeCP2C/vD8fLmH/2n1e3/l/lGplpFh
 wPNOknFGw3Jvm8YHqO4WS4L9HXv8pXv148LFjmjHxD8oZfjQaHa6vBU3nHVuha59VN9s
 A/eTt/opJFmOvn4s1nd99W4jwpK0Bf+GeYx8fnExnmJkCHllnjC16rXktn7h+q/iD5yc
 Ol8MwLvBzfMrtRKuQU0bgj5sVC7RtknxQQ1dqSaTRBqJZxJArQ+pXQje4XWHbJ3S5g5F
 KlTgfquUIoNPhHTbQYxuQ05vkNVfjYwIqQjIS4ltXDYeadVBWfuDoOCbWQouxQejdE7S
 sPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K3fTJrdyzT7h+kStPLVUlg/ayQvOw8y3pGZvpxmcrrM=;
 b=WC0ckIF4eaI3ybnOjQiwUMYT6912HsRMy6PTdyb7QgUZ+6/F8UkhiH5mFJFs2+fyyb
 U2mrGbOmt/Jeo1pkBQ1VXMyoBIG6ZEpE8ZTMyw0WFeUj246GCJDoEYVUtZg3eh664ajn
 TTXqBilYz7eglM1Vbno7oAnjfIc1FCpZl4S6DnQL98Gruyi3sjjvGwOByUp0w7bFUPr3
 JYd1gWPMmtYMt9ALZnNMwngpjUAMo6QLa3RFhnYEYs984NVluulS/vtINeGdNCApw1GN
 RBzSjC66tn9wctJQ3m2tRvVWWKiaqVrC35fyyWlixJiEssVK84cCGpEZLgZZQbLlZSq5
 kybA==
X-Gm-Message-State: AA6/9RkNGg4zmT9VRivuYq/Hceca/XqQMQLDqX0ZroBFT1AhPSAQa+SyKYteJu74btphKA==
X-Received: by 10.157.15.154 with SMTP id d26mr7196545otd.162.1475700874517;
 Wed, 05 Oct 2016 13:54:34 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.33
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:34 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 01/15] fsi: Add empty fsi bus definitions
Date: Wed,  5 Oct 2016 15:54:14 -0500
Message-Id: <1475700868-75737-2-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:36 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds the initial (empty) fsi bus definition, and introduces
drivers/fsi/.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/Kconfig        |  2 ++
 drivers/Makefile       |  1 +
 drivers/fsi/Kconfig    | 12 ++++++++++++
 drivers/fsi/Makefile   |  2 ++
 drivers/fsi/fsi-core.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    | 23 +++++++++++++++++++++++
 6 files changed, 78 insertions(+)
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 include/linux/fsi.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index e1e2066..117ca14c 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -202,4 +202,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/fpga/Kconfig"
 
+source "drivers/fsi/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 0b6f3d6..7a1c96f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -173,3 +173,4 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
+obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
new file mode 100644
index 0000000..04c1a0e
--- /dev/null
+++ b/drivers/fsi/Kconfig
@@ -0,0 +1,12 @@
+#
+# FSI subsystem
+#
+
+menu "FSI support"
+
+config FSI
+	tristate "FSI support"
+	---help---
+	  FSI - the FRU Support Interface - is a simple bus for low-level
+	  access to POWER-based hardware.
+endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
new file mode 100644
index 0000000..db0e5e7
--- /dev/null
+++ b/drivers/fsi/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_FSI) += fsi-core.o
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
new file mode 100644
index 0000000..3e45306
--- /dev/null
+++ b/drivers/fsi/fsi-core.c
@@ -0,0 +1,38 @@
+/*
+ * FSI core driver
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
+#include <linux/device.h>
+#include <linux/fsi.h>
+#include <linux/module.h>
+
+/* FSI core & Linux bus type definitions */
+
+struct bus_type fsi_bus_type = {
+	.name		= "fsi",
+};
+EXPORT_SYMBOL_GPL(fsi_bus_type);
+
+static int fsi_init(void)
+{
+	return bus_register(&fsi_bus_type);
+}
+
+static void fsi_exit(void)
+{
+	bus_unregister(&fsi_bus_type);
+}
+
+module_init(fsi_init);
+module_exit(fsi_exit);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
new file mode 100644
index 0000000..8e8bdea
--- /dev/null
+++ b/include/linux/fsi.h
@@ -0,0 +1,23 @@
+/*
+ * FSI device & driver interfaces
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
+#ifndef LINUX_FSI_H
+#define LINUX_FSI_H
+
+#include <linux/device.h>
+
+extern struct bus_type fsi_bus_type;
+
+#endif /* LINUX_FSI_H */
-- 
1.8.2.2
